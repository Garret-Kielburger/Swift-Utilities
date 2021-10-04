//
//  ViewController.swift
//  VPNConnect
//
//  Created by Garret Kielburger on 2021-09-30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // To connect to VPN:
        VPNHandler.connectVPN()
        
        // To check status:
        switch VPNHandler.checkStatus() {
        case .connected:
            print("VPN Connected")
        case .invalid, .disconnected:
            print("VPN Disconnected")
        case .connecting, .reasserting, .disconnecting:
            print("VPN dis/connecting")
        default:
            print("Something unexpected happened. Must be a new response type.")
        }
        
        // To disconnect from VPN:
        VPNHandler.disconnectVPN()
        
    }


}

