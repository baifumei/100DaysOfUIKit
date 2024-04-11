//
//  GameScene.swift
//  Project26
//
//  Created by Екатерина К on 4/9/24.
//

import CoreMotion
import SpriteKit

enum CollisionType: UInt32 {
    case player = 1
    case wall = 2
    case star = 4
    case vortex = 8
    case finish = 16
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    var player: SKSpriteNode!
    var isGameOver = false
    var level = 1
    
    //a hack that lets us simulate the experience of moving the ball using touch
    var lastTouchPosition: CGPoint?
    
    var motionManager: CMMotionManager?
    
    var scoreLable: SKLabelNode!
    var score = 0 {
        didSet {
            scoreLable.text = "Score: \(score)"
        }
    }
    
    override func didMove(to view: SKView) {
        loadLevel(of: "level1")
        
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        
        motionManager = CMMotionManager()
        motionManager?.startAccelerometerUpdates()
    }
    
    func showScore() {
        scoreLable = SKLabelNode(fontNamed: "Chalkduster")
        scoreLable.text = "Score: \(score)"
        scoreLable.horizontalAlignmentMode = .left
        scoreLable.fontSize = 30
        scoreLable.position = CGPoint(x: 16, y: 16)
        scoreLable.zPosition = 2
        addChild(scoreLable)
    }
    
    func loadLevel(of number: String) {
        createPlayer()
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        
        showScore()
        
        guard let levelURl = Bundle.main.url(forResource: number, withExtension: "txt") else {
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
                    createEntity(of: "block", position: position, number: CollisionType.wall.rawValue)
                    
                } else if letter == "s" {
                    createEntity(of: "star", position: position, number: CollisionType.star.rawValue)
                    
                } else if letter == "v" {
                    createEntity(of: "vortex", position: position, number: CollisionType.vortex.rawValue)
                    
                } else if letter == "f" {
                    createEntity(of: "finish", position: position, number: CollisionType.finish.rawValue)
                    
                } else if letter == " " {
                    //this is an empty space - do nothing
                } else {
                    fatalError("Unlnown letter: \(letter)")
                }
            }
        }
    }
    
    func createEntity(of name: String, position at: CGPoint, number caseRaw: UInt32) {
        let node = SKSpriteNode(imageNamed: name)
        node.name = name
        node.position = at
        
        if name == "vortex" { node.run(SKAction.repeatForever(SKAction.rotate(byAngle: .pi, duration: 1)))}
        
        name == "block" ? (node.physicsBody = SKPhysicsBody(rectangleOf: node.size)) : (node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2))
        node.physicsBody?.isDynamic = false

        node.physicsBody?.categoryBitMask = caseRaw
        node.physicsBody?.contactTestBitMask = CollisionType.player.rawValue
        node.physicsBody?.collisionBitMask = 0

        addChild(node)
    }
    
    func createPlayer() {
        player = SKSpriteNode(imageNamed: "player")
        player.position = CGPoint(x: 96, y: 672)
        player.zPosition = 1
        
        player.physicsBody = SKPhysicsBody(circleOfRadius: player.size.width / 2)
        player.physicsBody?.allowsRotation = false
        player.physicsBody?.linearDamping = 0.5
        
        player.physicsBody?.categoryBitMask = CollisionType.player.rawValue
        player.physicsBody?.contactTestBitMask = CollisionType.star.rawValue | CollisionType.vortex.rawValue | CollisionType.finish.rawValue
        player.physicsBody?.collisionBitMask = CollisionType.wall.rawValue
        
        addChild(player)
    }
     
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        lastTouchPosition = location
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        lastTouchPosition = location
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastTouchPosition = nil
    }
    
    override func update(_ currentTime: TimeInterval) {
        guard isGameOver  == false else { return }
        
        #if targetEnvironment(simulator)
        if let lastTouchPosition = lastTouchPosition {
            let diff = CGPoint(x: lastTouchPosition.x - player.position.x, y: lastTouchPosition.y - player.position.y)
            physicsWorld.gravity = CGVector(dx: diff.x / 100, dy: diff.y / 100)
        }
        #else
        if let accelerometerData = motionManager?.accelerometerData {
            physicsWorld.gravity = CGVector(dx: accelerometerData.acceleration.y * -50, dy: accelerometerData.acceleration.x * -50)
        }
        #endif
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        
        if nodeA == player {
            playerCollided(with: nodeB)
        } else if nodeB == player {
            playerCollided(with: nodeA)
        }
    }
    
    func playerCollided(with node: SKNode) {
        if node.name == "vortex" {
            player.physicsBody?.isDynamic = false
            isGameOver = true
            score -= 1
            
            let move = SKAction.move(to: node.position, duration: 0.25)
            let scale = SKAction.scale(to: 0.0001, duration: 0.25)
            let remove = SKAction.removeFromParent()
            let seq = SKAction.sequence([move, scale, remove])
            
            player.run(seq) { [weak self] in
                self?.createPlayer()
                self?.isGameOver = false
            }
        } else if node.name == "star" {
            node.removeFromParent()
            score += 1
        } else if node.name == "finish" {
            removeAllChildren()
            level += 1
            
            if level <= 3 {
                loadLevel(of: "level" + "\(level)")
            } else {
                isGameOver = true
                player.physicsBody?.isDynamic = false
                
                let gameOver = SKSpriteNode(imageNamed: "gameOver")
                gameOver.position = CGPoint(x: 512, y: 384)
                gameOver.zPosition = 4
                addChild(gameOver)
            }
        }
    }
}
