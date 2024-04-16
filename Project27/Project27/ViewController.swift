//
//  ViewController.swift
//  Project27
//
//  Created by Екатерина К on 4/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var currentDrawType = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawbomb()
    }

    @IBAction func redrawTapped(_ sender: Any) {
        currentDrawType += 1
        
        if currentDrawType > 6 {
            currentDrawType = 0
        }
        
        switch currentDrawType {
        case 0:
            drawRectangle()
        
        case 1:
            drawCicle()
            
        case 2:
            drawCheckerBoard()
            
        case 3:
            drawRotatedSquares()
        
        case 4:
            drawLines()
            
        case 5:
            drawImagesAndText()
            
        case 6:
            drawEmoji()
            
        default:
            break
        }
    }
    
    func drawRectangle() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in
            let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512).insetBy(dx: 10, dy: 10)
            ctx.cgContext.setFillColor(UIColor.green.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(1)
            
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        imageView.image = image
    }
    
    func drawCicle() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in
            let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512).insetBy(dx: 10, dy: 10)
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(6)
            
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        imageView.image = image
    }
    
    func drawCheckerBoard() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in
            for row in 0..<8 {
                for col in 0..<8 {
                    if (row + col).isMultiple(of: 2) {
                        ctx.cgContext.fill(CGRect(x: (row * 64), y: (col * 64), width: 64, height: 64))
                    }
                }
            }
        }
        
        imageView.image = image
    }
    
    func drawRotatedSquares() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in
            ctx.cgContext.translateBy(x: 256, y: 256)
            
            let rotation = 16
            let amount = Double.pi / Double(rotation)
            
            for _ in 0..<rotation {
                ctx.cgContext.rotate(by: CGFloat(amount))
                ctx.cgContext.addRect(CGRect(x: -128, y: -128, width: 256, height: 256))
            }
            
            ctx.cgContext.setStrokeColor(UIColor.purple.cgColor)
            ctx.cgContext.strokePath()
        }
        
        imageView.image = image
    }
    
    func drawLines() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in
            ctx.cgContext.translateBy(x: 256, y: 256)
        
            var first = true
            var length: CGFloat = 256
            
            for _ in 0..<256 {
                ctx.cgContext.rotate(by: .pi / 2)
                
                if first {
                    ctx.cgContext.move(to: CGPoint(x: length, y: 50))
                    first = false
                } else {
                    ctx.cgContext.addLine(to: CGPoint(x: length, y: 50))
                }
                length *= 0.99
            }
            ctx.cgContext.setStrokeColor(UIColor.blue.cgColor)
            ctx.cgContext.strokePath()
        }
        imageView.image = image
    }
    
    func drawImagesAndText() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 36),
                .paragraphStyle: paragraphStyle
            ]
            
            let string = "The best-laid schemes o'\nmice an' men gang aft agley"
            
            let attributedString = NSAttributedString(string: string, attributes: attrs)
            attributedString.draw(with: CGRect(x: 32, y: 32, width: 448, height: 448), options: .usesLineFragmentOrigin, context: nil)
            
            let mouse = UIImage(named: "mouse")
            mouse?.draw(at: CGPoint(x: 300, y: 150))
        }
        imageView.image = image
    }
    
//🙂
    func drawEmoji() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in
            ctx.cgContext.translateBy(x: 256, y: 256)
            
            // Face
            let faceRect = CGRect(x: -200, y: -200, width: 400, height: 400)
            ctx.cgContext.setFillColor(UIColor.yellow.cgColor)
            ctx.cgContext.addEllipse(in: faceRect)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.drawPath(using: .fillStroke)
            
            // Eyes
            let rightEyeRect = CGRect(x: -100, y: -50, width: 40, height: 70)
            let leftEyeRect = CGRect(x: 70, y: -50, width: 40, height: 70)
            ctx.cgContext.setFillColor(UIColor.brown.cgColor)
            ctx.cgContext.addEllipse(in: rightEyeRect)
            ctx.cgContext.addEllipse(in: leftEyeRect)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.drawPath(using: .fillStroke)
            
            // Smile
            let smile = CGRect(x: -80, y: 50, width: 160, height: 70)
            ctx.cgContext.setFillColor(UIColor.brown.cgColor)
            ctx.cgContext.addEllipse(in: smile)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.drawPath(using: .fillStroke)
            
            let smile2 = CGRect(x: -90, y: 40, width: 180, height: 70)
            ctx.cgContext.setFillColor(UIColor.yellow.cgColor)
            ctx.cgContext.addEllipse(in: smile2)
            ctx.cgContext.drawPath(using: .fill)
        }
        imageView.image = image
    }
    
//💥
    func drawbomb() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in
            ctx.cgContext.translateBy(x: 256, y: 256)
            
            //first red bomb
            
            ctx.cgContext.move(to: CGPoint(x: 246, y: 246))
            ctx.cgContext.addLine(to: CGPoint(x: 120, y: 12))
            ctx.cgContext.addLine(to: CGPoint(x: 224, y: -17))
            ctx.cgContext.addLine(to: CGPoint(x: 135, y: -60))
            ctx.cgContext.addLine(to: CGPoint(x: 205, y: -225))
            ctx.cgContext.addLine(to: CGPoint(x: 78, y: -118))
            ctx.cgContext.addLine(to: CGPoint(x: 54, y: -218))
            ctx.cgContext.addLine(to: CGPoint(x: 34, y: -123))
            ctx.cgContext.addLine(to: CGPoint(x: -84, y: -246))
            ctx.cgContext.addLine(to: CGPoint(x: -38, y: -122))
            ctx.cgContext.addLine(to: CGPoint(x: -120, y: -158))
            ctx.cgContext.addLine(to: CGPoint(x: -68, y: -84))
            ctx.cgContext.addLine(to: CGPoint(x: -240, y: -112))
            ctx.cgContext.addLine(to: CGPoint(x: -95, y: -13))
            ctx.cgContext.addLine(to: CGPoint(x: -235, y: 15))
            ctx.cgContext.addLine(to: CGPoint(x: -90, y: 40))
            ctx.cgContext.addLine(to: CGPoint(x: -230, y: 136))
            ctx.cgContext.addLine(to: CGPoint(x: -47, y: 70))
            ctx.cgContext.addLine(to: CGPoint(x: -67, y: 235))
            ctx.cgContext.addLine(to: CGPoint(x: 50, y: 62))
            ctx.cgContext.addLine(to: CGPoint(x: 246, y: 246))

            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.drawPath(using: .fillStroke)
            
            
            //second orange bomb
            ctx.cgContext.move(to: CGPoint(x: 180, y: 164))
            ctx.cgContext.addLine(to: CGPoint(x: 90, y: 2))
            ctx.cgContext.addLine(to: CGPoint(x: 179, y: -19))
            ctx.cgContext.addLine(to: CGPoint(x: 100, y: -50))
            ctx.cgContext.addLine(to: CGPoint(x: 149, y: -160))
            ctx.cgContext.addLine(to: CGPoint(x: 72, y: -78))
            ctx.cgContext.addLine(to: CGPoint(x: 56, y: -145))
            ctx.cgContext.addLine(to: CGPoint(x: 42, y: -82))
            ctx.cgContext.addLine(to: CGPoint(x: -26, y: -164))
            ctx.cgContext.addLine(to: CGPoint(x: -5, y: -91))
            ctx.cgContext.addLine(to: CGPoint(x: -70, y: -120))
            ctx.cgContext.addLine(to: CGPoint(x: -50, y: -66))
            ctx.cgContext.addLine(to: CGPoint(x: -160, y: -78))
            ctx.cgContext.addLine(to: CGPoint(x: -63, y: -8))
            ctx.cgContext.addLine(to: CGPoint(x: -156, y: 15))
            ctx.cgContext.addLine(to: CGPoint(x: -60, y: 26))
            ctx.cgContext.addLine(to: CGPoint(x: -133, y: 90))
            ctx.cgContext.addLine(to: CGPoint(x: -31, y: 46))
            ctx.cgContext.addLine(to: CGPoint(x: -44, y: 156))
            ctx.cgContext.addLine(to: CGPoint(x: 50, y: 38))
            ctx.cgContext.addLine(to: CGPoint(x: 180, y: 164))
            
            ctx.cgContext.setFillColor(UIColor.orange.cgColor)
            ctx.cgContext.drawPath(using: .fill)
        }
        imageView.image = image
    }
}
