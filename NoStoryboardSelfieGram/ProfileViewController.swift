//
//  ProfileViewController.swift
//  Selfiegram
//
//  Created by Jeremy Petter on 2016-01-13.
//  Copyright © 2016 Jeremy Petter. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var profileImageView: UIImageView!
    var userNameLabel: UILabel!
    var cameraButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()

        profileImageView = UIImageView()
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.image = UIImage(named: "Profile")

        userNameLabel = UILabel()
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.text = "yourName"

        cameraButton = UIButton()
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        cameraButton.setTitle("Camera", forState: .Normal)
        cameraButton.setTitleColor(UIColor.purpleColor(), forState: .Normal)
        cameraButton.addTarget(self, action: "cameraButtonPressed:", forControlEvents: .TouchUpInside)

        view.addSubview(profileImageView)
        view.addSubview(userNameLabel)
        view.addSubview(cameraButton)

        let margins = view.layoutMarginsGuide
        profileImageView.topAnchor.constraintEqualToAnchor(margins.topAnchor, constant:46.0).active = true
        profileImageView.centerXAnchor.constraintEqualToAnchor(margins.centerXAnchor).active = true
        profileImageView.widthAnchor.constraintEqualToConstant(185.0).active = true
        profileImageView.heightAnchor.constraintEqualToConstant(185.0).active = true

        cameraButton.leftAnchor.constraintEqualToAnchor(profileImageView.leftAnchor).active = true
        cameraButton.centerYAnchor.constraintEqualToAnchor(profileImageView.bottomAnchor).active = true

        userNameLabel.topAnchor.constraintEqualToAnchor(profileImageView.bottomAnchor, constant:30).active = true
        userNameLabel.centerXAnchor.constraintEqualToAnchor(margins.centerXAnchor).active = true
    }

    func cameraButtonPressed(sender: UIButton) {
        print("camera button pressed")
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        if TARGET_OS_SIMULATOR == 1 {
            imagePicker.sourceType = .PhotoLibrary
        } else {
            imagePicker.sourceType = .Camera
            imagePicker.cameraDevice = .Front
            imagePicker.cameraCaptureMode = .Photo
        }
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profileImageView.image = image
        }
        dismissViewControllerAnimated(true, completion: nil)

    }
}