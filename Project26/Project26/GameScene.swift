//
//  GameScene.swift
//  Project26
//
//  Created by Екатерина К on 4/9/24.
//

import SpriteKit

enum CollisionType: UInt32 {
    case player = 1
    case wall = 2
    case star = 4
    case vortex = 8
    case finish = 16
}

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        
        loadLevel()
    }
    
    func loadLevel() {
        guard let levelURl = Bundle.main.url(forResource: "level1", withExtension: "txt") else {
            fatalError("Couldn't find level1.txt file in app bundle.")
    }
        guard let levelString = try? String(contentsOf: levelURl) else {
            fatalError("Could not load level1.txt file from app bundle.")
        }
        
        let lines = levelString.components(separatedBy: "\n")
        
        for (row, line) in lines.reversed().enumerated() {
            for (column, letter) in line.enumerated() {
                let position = CGPoint(x: (64 * column) + 32, y: (64 * row) + 32)
                
                if letter == "x" {
                    //block
                    let node = SKSpriteNode(imageNamed: "block")
                    node.position = position
                    
                    node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
                    node.physicsBody?.categoryBitMask = CollisionType.wall.rawValue //2
                    node.physicsBody?.isDynamic = false
                    
                    addChild(node)
                    
                } else if letter == "s" {
                    let node = SKSpriteNode(imageNamed: "star")
                    node.name = "star"
                    node.position = position
                    
                    node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                    node.physicsBody?.isDynamic = false
                    
                    node.physicsBody?.categoryBitMask = CollisionType.star.rawValue // 4
                    node.physicsBody?.contactTestBitMask = CollisionType.player.rawValue
                    node.physicsBody?.collisionBitMask = 0
                    
                    addChild(node)
                    
                } else if letter == "v" {
                    let node = SKSpriteNode(imageNamed: "vortex")
                    node.name = "vortex"
                    node.position = position
                    node.run(SKAction.repeatForever(SKAction.rotate(byAngle: .pi, duration: 1)))
                    
                    node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                    node.physicsBody?.isDynamic = false
                    
                    node.physicsBody?.categoryBitMask = CollisionType.vortex.rawValue // 8
                    node.physicsBody?.contactTestBitMask = CollisionType.player.rawValue // 1
                    node.physicsBody?.collisionBitMask = 0
                    
                    addChild(node)
                    
                } else if letter == "f" {
                    let node = SKSpriteNode(imageNamed: "finish")
                    node.name = "finish"
                    node.position = position
                    
                    node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2)
                    node.physicsBody?.isDynamic = false

                    node.physicsBody?.categoryBitMask = CollisionType.finish.rawValue // 16
                    node.physicsBody?.contactTestBitMask = CollisionType.player.rawValue // 1
                    node.physicsBody?.collisionBitMask = 0

                    addChild(node)
                    
                } else if letter == " " {
                    //this is an empty space - do nothing
                } else {
                    fatalError("Unlnown letter: \(letter)")
                }
            }
        }
    }
}
