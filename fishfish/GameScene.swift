//
//  GameScene.swift
//  fishfish
//
//  Created by Student on 3/29/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var fish = 1
    var fishingPole = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        resetGame()
    }
    
    func makeFishingPole() {
        fishingPole = SKSpriteNode(color: .white, size: CGSize(width: 10, height: frame.height/4))
        fishingPole.position = CGPoint(x: frame.midX, y: frame.minY + 1250)
        fishingPole.name = "fishing pole"
        fishingPole.physicsBody = SKPhysicsBody(rectangleOf: fishingPole.size)
        fishingPole.physicsBody?.isDynamic = false
        addChild(fishingPole)
    }
    
    func resetGame() {
        makeFishingPole()
    }
}

