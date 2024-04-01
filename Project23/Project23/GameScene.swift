//
//  GameScene.swift
//  Project23
//
//  Created by Екатерина К on 3/31/24.
//

import SpriteKit

class GameScene: SKScene {
    
    var gameScore: SKLabelNode!
    var score = 0 {
        didSet {
            gameScore.text = "Score: \(score)"
        }
    }
    
    var imageLives = [SKSpriteNode]()
    var lives = 3
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "sliceBackground")
        background.position = CGPoint(x: 512, y: 384)
        background.zPosition = -1
        background.blendMode = .replace
        addChild(background)
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -6)
        physicsWorld.speed = 0.85
        
        createScore()
        createLives()
        createSlices()
    }
    
    func createScore() {
        gameScore = SKLabelNode(fontNamed: "Chalkduster")
        gameScore.horizontalAlignmentMode = .left
        gameScore.fontSize = 40
        
        addChild(gameScore)
        
        gameScore.position = CGPoint(x: 10, y: 10)
        score = 0
    }
    
    func createSlices() {
        
    }
    
    func createLives() {
        for i in 0..<3 {
            let imageLive = SKSpriteNode(imageNamed: "sliceLife")
            imageLive.position = CGPoint(x: 834 + (i * 70), y: 720)
            imageLives.append(imageLive)
            addChild(imageLive)
        }
    }
}
