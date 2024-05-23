//
//  ScannerVC.swift
//  SwiftUI-BarcodeScanner
//
//  Created by Gerard on 5/23/24.
//

import Foundation
import UIKit
import AVFoundation

protocol ScannerVCDelegate: AnyObject {
    func didFind(barcode: String)
    func didSurface(error: CameraError)
}

enum CameraError: String {
    case invalidDeviceInput     = "Something is wrong with the camera. We are unable to capture the input"
    case invalidScannedValue    = "The value scanned is not valid. This app scans EAN-8 and EAN-18"
}

final class ScannerVC: UIViewController {
    
    let captureSession = AVCaptureSession()
    var perviewLayer: AVCaptureVideoPreviewLayer?
    weak var delegate: ScannerVCDelegate?
    
    init(scannerDelegate: ScannerVCDelegate){
        super.init(nibName: nil, bundle: nil)
        self.delegate = scannerDelegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCaptureSession()
        
        guard let perviewLayer = perviewLayer else {
            delegate?.didSurface(error: .invalidDeviceInput)
            return
        }
        
        perviewLayer.frame = view.layer.bounds
    }
    
    private func setupCaptureSession() {
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        
        let videoInput: AVCaptureDeviceInput
        
        do {
            try videoInput = AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            delegate?.didSurface(error: .invalidDeviceInput)
            return
        }
        
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            delegate?.didSurface(error: .invalidDeviceInput)
            return
        }
        
        let metaDataOutput = AVCaptureMetadataOutput()
        
        if captureSession.canAddOutput(metaDataOutput) {
            captureSession.addOutput(metaDataOutput)
            metaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metaDataOutput.metadataObjectTypes = [.ean8, .ean13]
        } else {
            delegate?.didSurface(error: .invalidDeviceInput)
            return
        }
        
        perviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        perviewLayer?.videoGravity = .resizeAspectFill
        view.layer.addSublayer(perviewLayer!)
        
        captureSession.startRunning()
    }
}

extension ScannerVC: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let object = metadataObjects.first,
              let machineReadableObject = object as? AVMetadataMachineReadableCodeObject,
              let barCode = machineReadableObject.stringValue
        else {
            delegate?.didSurface(error: .invalidScannedValue)
            return
        }
        delegate?.didFind(barcode: barCode)
    }
}

