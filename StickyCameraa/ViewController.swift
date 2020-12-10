//
//  ViewController.swift
//  StickyCameraa
//
//  Created by Kumbirai Tanekha on 10/12/2020.
//  Copyright © 2020 Kumbirai Tanekha. All rights reserved.
//

import Cocoa
import AVFoundation

class ViewController: NSViewController {

    let session: AVCaptureSession = AVCaptureSession()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.black.cgColor
        session.sessionPreset = AVCaptureSession.Preset.low
        let input: AVCaptureInput = try! AVCaptureDeviceInput(device: AVCaptureDevice.default(for: .video)!)
        session.addInput(input)
        let previewLayer: AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = self.view.bounds
        previewLayer.videoGravity = .resizeAspectFill

        self.view.layer = previewLayer

        NSApplication.shared.mainWindow?.contentAspectRatio = self.view.layer?.preferredFrameSize() ?? NSApplication.shared.mainWindow!.aspectRatio
    }

    override func viewDidAppear() {
        session.startRunning()
        
        view.window?.level = .floating

        view.window?.contentAspectRatio = (self.view.layer?.preferredFrameSize())!
    }

    override func viewDidDisappear() {
        session.stopRunning()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

