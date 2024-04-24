//
//  GameScene.swift
//  Project29
//
//  Created by Екатерина К on 4/22/24.
//

import SpriteKit

enum CollisionTypes: UInt32 {
    case banana = 1
    case building = 2
    case player = 4

}

class GameScene: SKScene {
    var buildings = [BuildingNode]()
    weak var viewController: GameViewController?
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(hue: 0.676, saturation: 0.76, brightness: 0.76, alpha: 1)
        
        createBuildings()
    }
    
    func createBuildings() {
        var currentX: CGFloat = -15
        
        while currentX < 1024 {
            let size = CGSize(width: Int.random(in: 2...4) * 40, height: Int.random(in: 300...600))
            currentX += size.width + 2
            
            let building = BuildingNode(color: .black, size: size)
            building.position = CGPoint(x: currentX - (size.width / 2), y: size.height / 2)
            building.setup()
            buildings.append(building)
            addChild(building)
        }
    }
    
    func launch(angle: Int, velocity: Int) {
        
    }
}
