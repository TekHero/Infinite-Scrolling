//
//  GameScene.swift
//  Infinite Scrolling Background Test
//
//  Created by Brian Lim on 4/6/16.
//  Copyright (c) 2016 codebluapps. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let backgroundImg = SKSpriteNode(imageNamed: "SpaceBackground3")
    let backgroundImg2 = SKSpriteNode(imageNamed: "SpaceBackground3")
    let backgroundImg3 = SKSpriteNode(imageNamed: "SpaceBackground3")
    let backgroundImg4 = SKSpriteNode(imageNamed: "SpaceBackground3")
    
    let backgroundVelocity: CGFloat = 7.0
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.backgroundColor = SKColor.whiteColor()
        self.initializingScrollingBackground()
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        self.moveBackground()
    }
    
    func initializingScrollingBackground() {
        for var index = 0; index < 3; ++index {
            let bg = SKSpriteNode(imageNamed: "SpaceBackground3")
            bg.position = CGPoint(x: 0, y: index * Int(bg.size.width))
            bg.anchorPoint = CGPointZero
            bg.name = "background"
            self.addChild(bg)
        }
    }
    
    func moveBackground() {
        self.enumerateChildNodesWithName("background", usingBlock: { (node, stop) -> Void in
            if let bg = node as? SKSpriteNode {
                bg.position = CGPoint(x: bg.position.x, y: bg.position.y - self.backgroundVelocity)
                
                // Checks if bg node is completely scrolled off the screen, if yes, then puts it at the end of the other node.
                if bg.position.y <= -bg.size.height {
                    bg.position = CGPointMake(bg.position.x , bg.position.y + bg.size.height * 2)
                }
            }
        })
    }
}
