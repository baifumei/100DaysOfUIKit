//
//  GameScene.swift
//  Project26
//
//  Created by Екатерина К on 4/9/24.
//

import SpriteKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        
    }
    
    func loadLevel() {
        guard let levelURl = Bundle.main.url(forResource: "level1", withExtension: "txt") else {
            fatalError("Couldn't find level1.txt file in app bundle.")
    }
        guard let levelString = try? String(contentsOf: levelURl) else {
            fatalError("Could not load level1.txt file from app bundle.")
        }
        
        let lines = levelString.components(separatedBy: "/n")
        
        for (row, line) in lines.reversed().enumerated() {
            for (column, letter) in line.enumerated() {
                let position = CGPoint(x: (64 * column) + 32, y: (64 * row) + 32)
                if letter == "x" {
                    //block
                } else if letter == "s" {
                    //star
                } else if letter == "v" {
                    //vortex
                } else if letter == "f" {
                    //finish
                } else if letter == " " {
                    // для пробела
                } else {
                    fatalError("Unlnown letter: \(letter)")
                }
            }
        }
    }
}
