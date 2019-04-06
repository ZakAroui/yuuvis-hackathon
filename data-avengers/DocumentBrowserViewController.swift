//
//  DocumentBrowserViewController.swift
//  data-avengers
//
//  Created by Zack Aroui on 4/6/19.
//  Copyright © 2019 Zack Aroui. All rights reserved.
//

import UIKit
import SwiftGoogleTranslate

class DocumentBrowserViewController: UIDocumentBrowserViewController, UIDocumentBrowserViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        
        allowsDocumentCreation = true
        allowsPickingMultipleItems = false
        
        SwiftGoogleTranslate.shared.start(with: "-----BEGIN PRIVATE KEY-----\nMIIEugIBADANBgkqhkiG9w0BAQEFAASCBKQwggSgAgEAAoIBAQDbRoAt4Xx9xa23\n5hehxjt/PQi/P3+XHRHweJ6+rHfwGo0ItFGN4dybsJ/p9mcYS9Y6kzMBt7MCGKlk\nEikaVedB7VtGdF00GYtgs/2oYmZdbmy74macJT6TPukNgCn4lK4gxVFsXkPGG90+\nfsoW2jsNnd7EJ5aZeLSII3DvxYRyrTgpw+nV0tiu3i1YiRAq2Vu/5OUbE8BV2ktf\nWYglljHLYZQi3lPren4czcpruusPu+U5gIXxeEpUHgVfjl3JQpX+n6vsLBb0gblU\nQl7SO7bdfPwkzY+gmW/+e1URkulfaXQInivdtKSc8ULeq9LEA61sxAMilpTlU4Xc\nYnlwaZ+pAgMBAAECggEALcHshaaEQAq8UZ/mVo/zYn3uEVrC2VnroG7LUabT8HrZ\n63MVgbIcQzD8bepJYTySG+8TucwHwuw6jPNtOF2swIkzfuRRfsnF2Aw3ZqgCDIU6\nk4qPNw5enIOIRpT0LTd5jsUeVKrnIbQ22w/CRDqOEC1dizlnp+cUZURgEOj61qME\nLxw09/PPfhOZbFpg5unEx3Jvj5g2XRY6t/3yFs4CFA2Nf0hWtWKTyx92mkn6SnFD\nVi50+0QbkXkZxN05T5f9RmtWnrJdCVvZljp5whxX/3swNo2zVOQiFLoTiHLMEl2O\nk75S452EhNOgMzu3CrkPEnuc7sZhOrh+uoOlAaXtwQKBgQDtPwStvn7RCdE9SCGq\nxxCf5mi2gsPIWAijknSrlb1/lIsVrx+w3SbT7eB1qfmubD+Bf8/CbL54rqbcmChx\nLnbt+60Ty4orPmkhcUaJ4PIl6FRJhc2y7xPdtV2cic1koVXg5Qybw6x6KdFwoC0P\njgKdnGw5cNhsSG3LAs+Q8wIJRQKBgQDsm9IaGDZQidASu3+h3XtkmLt4dZMFS4dh\n5lbbuWaRrfjVN6j16T1BQCmS3vILgyXf9FwFJvYKcomXyGPvzxv7TZZT89ajYveq\n8OjQSgzzy/4ZZI+DZKJq9bOd+iNT+gV7AS8NVRnoqjroND0g/AxoxlWNcxWwMTGg\nb/RnwRy5FQJ/DPllSBsi1Eu1JaTMMoqwXg47q7969Xna/xcDSl7l/hQhhw4MrZ9q\ngCyCGe0xulgxIOPceMV5pR/oAChSDd58oocg7/QxmivPlASd1ux2UZxi/6JRnXd1\nnqpMdEMU+GvaRnJAPkR1KjkfOwmHbVJW0ke7o2iIbWOInZGJyGOBuQKBgEATYq6W\nZ/8fky2/gS0Aoe34Pqy8inggoCUvD86pQtGo334+eI8//sqw6ZFQtxPPDG696j2q\n826Y3hIwvn+vAtDnjhJmMnZE0vWEEEh4BVHwqHuP9B2NHz8AEwhxOSgAyYMqKufd\naArOLu27V+Ka33FwZLLNu83fRKVCLFn8vh6RAoGAFzVIJtWZgCpA8r4BSC31QnTg\nyegt6TrzrnBSBlnbkR3SS13jTkLWL4llu9iGlJsz4MsStXGAftY+kd+OJNVieLjr\nigktVx+ydra7MbLPTpCxoQh8TRkfTwMpKZuvgnRWj4dZDzeSuAAVFoDr74XknbWE\nYTqDMlxVrlKzagB6Un4=\n-----END PRIVATE KEY-----\n")
        
        SwiftGoogleTranslate.shared.translate("Hello!", "es", "en") { (text, error) in
            print("blah")
            if let t = text {
                print(t)
            }
        }
        
        // Update the style of the UIDocumentBrowserViewController
        // browserUserInterfaceStyle = .dark
        // view.tintColor = .white
        
        // Specify the allowed content types of your application via the Info.plist.
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    // MARK: UIDocumentBrowserViewControllerDelegate
    
    func documentBrowser(_ controller: UIDocumentBrowserViewController, didRequestDocumentCreationWithHandler importHandler: @escaping (URL?, UIDocumentBrowserViewController.ImportMode) -> Void) {
        let newDocumentURL: URL? = nil
        
        // Set the URL for the new document here. Optionally, you can present a template chooser before calling the importHandler.
        // Make sure the importHandler is always called, even if the user cancels the creation request.
        if newDocumentURL != nil {
            importHandler(newDocumentURL, .move)
        } else {
            importHandler(nil, .none)
        }
    }
    
    func documentBrowser(_ controller: UIDocumentBrowserViewController, didPickDocumentsAt documentURLs: [URL]) {
        guard let sourceURL = documentURLs.first else { return }
        
        // Present the Document View Controller for the first document that was picked.
        // If you support picking multiple items, make sure you handle them all.
        presentDocument(at: sourceURL)
    }
    
    func documentBrowser(_ controller: UIDocumentBrowserViewController, didImportDocumentAt sourceURL: URL, toDestinationURL destinationURL: URL) {
        // Present the Document View Controller for the new newly created document
        presentDocument(at: destinationURL)
    }
    
    func documentBrowser(_ controller: UIDocumentBrowserViewController, failedToImportDocumentAt documentURL: URL, error: Error?) {
        // Make sure to handle the failed import appropriately, e.g., by presenting an error message to the user.
    }
    
    // MARK: Document Presentation
    
    func presentDocument(at documentURL: URL) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let documentViewController = storyBoard.instantiateViewController(withIdentifier: "DocumentViewController") as! DocumentViewController
        documentViewController.document = Document(fileURL: documentURL)
        
        present(documentViewController, animated: true, completion: nil)
    }
}

