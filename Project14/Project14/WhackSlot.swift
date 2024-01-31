//
//  WhackSlot.swift
//  Project14
//
//  Created by Екатерина К on 1/31/24.
//
import SpriteKit
import UIKit

class WhackSlot: SKNode {
    func configure(at position: CGPoint) {
        self.position = position
        
        let sprite = SKSpriteNode(imageNamed: "whackHole")
        addChild(sprite)
    }
}
