//
//  VPN Handler.swift
//  VPNConnect
//
//  Created by Garret Kielburger on 2021-09-30.
//

import Foundation
import NetworkExtension

final class VPNHandler {
    
    let vpnManager = NEVPNManager.shared()

        func initVPNTunnelProviderManager() {

            print("CALL LOAD TO PREFERENCES...")
            self.vpnManager.loadFromPreferences { (error) -> Void in

                if((error) != nil) {
                    print("VPN starting loadFromPreferences error: \(error.debugDescription)")
                } else {

                    let IKEv2Protocol = NEVPNProtocolIKEv2()

                    IKEv2Protocol.username = vpnUser().username
                    IKEv2Protocol.serverAddress = vpnServer().serverAddress
                    IKEv2Protocol.remoteIdentifier = vpnServer().remoteId
                    IKEv2Protocol.useExtendedAuthentication = true
                    
                    //Set IKE SA (Security Association) Params...
                    IKEv2Protocol.ikeSecurityAssociationParameters.encryptionAlgorithm = .algorithmAES256GCM
                    IKEv2Protocol.ikeSecurityAssociationParameters.integrityAlgorithm = .SHA256
                    IKEv2Protocol.ikeSecurityAssociationParameters.diffieHellmanGroup = .group21
                    IKEv2Protocol.ikeSecurityAssociationParameters.lifetimeMinutes = 1440

                    //Set CHILD SA (Security Association) Params...
                    IKEv2Protocol.childSecurityAssociationParameters.encryptionAlgorithm = .algorithmAES256GCM
                    IKEv2Protocol.childSecurityAssociationParameters.integrityAlgorithm = .SHA256
                    IKEv2Protocol.childSecurityAssociationParameters.diffieHellmanGroup = .group21
                    IKEv2Protocol.childSecurityAssociationParameters.lifetimeMinutes = 1440

                    let kcs = KeychainService()
                    kcs.save(key: "vpn_password", value: vpnUser().password)
                    IKEv2Protocol.passwordReference = kcs.load(key: "vpn_password")

                    self.vpnManager.protocolConfiguration = IKEv2Protocol
                    self.vpnManager.localizedDescription = "Safe Login Configuration"
                    self.vpnManager.isEnabled = true
                    self.vpnManager.isOnDemandEnabled = true

                    print("SAVE TO PREFERENCES...")
                    
                    self.vpnManager.saveToPreferences(completionHandler: { (error) -> Void in
                        if((error) != nil) {
                            print("VPN saveToPreferences error: \(error.debugDescription)")
                        } else {
                            //CALL LOAD TO PREFERENCES AGAIN...
                            self.vpnManager.loadFromPreferences(completionHandler: { (error) in
                                if ((error) != nil) {
                                    print("VPN loadFromPreferences after save error: \(error.debugDescription) ")
                                } else {
                                    var startError: NSError?
                                    do {
                                        //START THE CONNECTION...
                                        try self.vpnManager.connection.startVPNTunnel()
                                    } catch let error as NSError {
                                        startError = error
                                        print(startError.debugDescription)
                                    } catch {
                                        print("Fatal Error")
                                        fatalError()
                                    }
                                    if ((startError) != nil) {
                                        print("VPN startVPNTunnel error: \(startError.debugDescription)")
                                        print(startError.debugDescription)
                                    } else {
                                        //self.VPNStatusDidChange(nil)
                                        print("Starting VPN...")
                                    }
                                }
                            })
                        }
                    })
                }
            }

        }

        static func connectVPN() {
            VPNHandler().initVPNTunnelProviderManager()
        }

        static func disconnectVPN() {
            VPNHandler().vpnManager.connection.stopVPNTunnel()
        }

        static func checkStatus() -> NEVPNStatus {
            let status = VPNHandler().vpnManager.connection.status
            return status
        }
}
