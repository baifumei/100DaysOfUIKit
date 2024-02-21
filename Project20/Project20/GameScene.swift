//
//  GameScene.swift
//  Project20
//
//  Created by Екатерина К on 2/21/24.
//

import SpriteKit

class GameScene: SKScene {
    var gameTimer: Timer?
    var fireworks = [SKNode]()
    
    var leftEdge = -22
    var bottomEdge = -22
    var rightEdge = 1024 + 33
    
    var score: Int = 0 {
        didSet {
            
        }
    }
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        
        gameTimer = Timer.scheduledTimer(timeInterval: 6, target: self, selector: #selector(launchFireworks), userInfo: nil, repeats: true)
    }
    
    @objc func launchFireworks() {
        
    }
    func createFirework(xMovement: CGFloat, x: Int, y: Int) {
        let node = SKNode()
        node.position = CGPoint(x: x, y: y)
        
        let firework = SKSpriteNode(imageNamed: "rocket")
        firework.colorBlendFactor = 1
        firework.name = "firework"
        firework.zPosition = 1
        node.addChild(firework)
        
        switch Int.random(in: 0...2) {
        case 0:
            firework.color = .cyan
        case 1:
            firework.color = .red
        default:
            firework.color = .green
        }
    }
}
