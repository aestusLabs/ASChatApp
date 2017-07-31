//
//  ChatNavigationExtension.swift
//  ChatAppOrigionalFiles
//
//  Created by Ian Kohlert on 2017-07-27.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

enum VCName {
    case content, settings
}

extension ChatViewController {
    func navigateTo(vc: VCName) {
        if vc == .content {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "ContentVC") as! ContentViewController
            //                        newViewController.screenTap()
            self.present(newViewController, animated: true, completion: nil)
        }
    }
}
