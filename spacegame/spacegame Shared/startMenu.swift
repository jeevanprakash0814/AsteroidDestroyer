//
//  startMenu.swift
//  spacegame iOS
//
//  Created by Jeevan Prakash on 2/21/23.
//

import UIKit
import SpriteKit
import GameplayKit

class startMenu: SKScene {
    var starfield:SKEmitterNode!
    
    var startLabel = SKLabelNode(text: "Start Game")
    
    var scoreLabel:SKLabelNode!
    
    let defaults = UserDefaults()
    lazy var highscoreNumber = defaults.integer(forKey: "highScoreSaved")
    
    override func didMove(to view: SKView) {
        starfield = self.childNode(withName: "Starfield") as! SKEmitterNode
        starfield.advanceSimulationTime(10)
        
        startLabel.fontSize = 50
        startLabel.fontColor = SKColor.white
        startLabel.zPosition = 1
        startLabel.position = CGPoint(x: 0, y: 0)
        addChild(startLabel)
        
        scoreLabel = SKLabelNode(text: "High Score: \(highscoreNumber)")
        scoreLabel.position = CGPoint(x: 0, y: 100)
        scoreLabel.fontSize = 60
        scoreLabel.fontColor = UIColor.white
        self.addChild(scoreLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let pointOfTouch = touch.location(in: self)
            
            if startLabel.contains(pointOfTouch){
                if let view = self.view as! SKView? {
                    if let scene = SKScene(fileNamed: "GameScene") {
                        scene.scaleMode = .aspectFill
                        view.presentScene(scene)
                    }
                    
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true
                    view.showsPhysics = true
                }
            }
        }
    }
}
