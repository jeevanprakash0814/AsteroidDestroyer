//
//  GameScene.swift
//  spacegame Shared
//
//  Created by Jeevan Prakash on 2/7/23.
//

import SpriteKit

class GameScene: SKScene {
    var starfield:SKEmitterNode!
    var player:SKSpriteNode!
    
    var touchLocation = CGPoint()
    
    override func didMove(to view: SKView) {
        starfield = SKEmitterNode(fileNamed: "Starfield")
        starfield.position = CGPoint(x: 0, y: 700)
        starfield.advanceSimulationTime(40)
        starfield.zPosition = -1
        self.addChild(starfield)
        print(self.frame.size.width)
        
        player = SKSpriteNode(imageNamed: "rocket")
        player.position = CGPoint(x: 0, y: 0)
        self.addChild(player)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
