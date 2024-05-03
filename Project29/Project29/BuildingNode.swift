//
//  BuildingNode.swift
//  Project29
//
//  Created by Екатерина К on 4/22/24.
//

import SpriteKit
import UIKit


class BuildingNode: SKSpriteNode {
    var currentImage: UIImage!
    
    func setup() {
        name = "building"
        
        currentImage = drawBuilding(size: size)
        texture = SKTexture(image: currentImage)
        
        configurePhysics()
    }
    
    func configurePhysics() {
        physicsBody = SKPhysicsBody(texture: texture!, size: size)
        physicsBody?.isDynamic = false
        physicsBody?.categoryBitMask = CollisionTypes.building.rawValue
        physicsBody?.contactTestBitMask = CollisionTypes.banana.rawValue
    }
    
    func drawBuilding(size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        
        let image = renderer.image { ctx in
            let rectangle = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            
            let color: UIColor
            
            switch Int.random(in: 0...2) {
            case 0: 
                color = UIColor(hue: 0.062, saturation: 0.79, brightness: 0.53, alpha: 1)
            case 1:
                color = UIColor(hue: 0.559, saturation: 0.13, brightness: 0.63, alpha: 1)
            default:
                color = UIColor(hue: 0.029, saturation: 0.76, brightness: 0.87, alpha: 1)
            }
            
            color.setFill()
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fill)
            
            let lightOnColor = UIColor(hue: 0.168, saturation: 0.69, brightness: 0.98, alpha: 1)
            let lightOffColor = UIColor(hue: 0.558, saturation: 0.69, brightness: 0.18, alpha: 1)
            
            for row in stride(from: 10, to: (size.height - 10), by: 40) {
                for col in stride(from: 10, to: (size.width - 10), by: 40) {
                    if Bool.random() {
                        lightOnColor.setFill()
                    } else {
                        lightOffColor.setFill()
                    }
                    ctx.cgContext.fill(CGRect(x: col, y: row, width: 15, height: 20))
                }
            }
        }
        return image
    }
    
    func hit(at point: CGPoint) {
        let convertedPoint = CGPoint(x: point.x + size.width / 2, y: abs(point.y - size.height / 2))
        
        let renderer = UIGraphicsImageRenderer(size: size)
        let img = renderer.image { ctx in
            currentImage.draw(at: .zero)
            
            ctx.cgContext.addEllipse(in: CGRect(x: convertedPoint.x - 32, y: convertedPoint.y - 32, width: 64, height: 64))
            ctx.cgContext.setBlendMode(.clear)
            ctx.cgContext.drawPath(using: .fill)
        }
        texture = SKTexture(image: img)
        currentImage = img
        configurePhysics()
    }
}
