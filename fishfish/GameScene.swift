//
//  GameScene.swift
//  fishfish
//
//  Created by Student on 3/29/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var fish = 1
    var fishingPole = SKSpriteNode()
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    var playLabel = SKLabelNode()
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        resetGame()
        createTitleScreen()
    }
    
    func makeFishingPole() {
        fishingPole = SKSpriteNode(color: .white, size: CGSize(width: 10, height: frame.height))
        fishingPole.position = CGPoint(x: frame.midX, y: frame.minY + 1750)
        fishingPole.name = "fishing pole"
        fishingPole.physicsBody = SKPhysicsBody(rectangleOf: fishingPole.size)
        fishingPole.physicsBody?.isDynamic = false
        addChild(fishingPole)
    }
    
    func createTitleScreen() {
        playLabel.fontSize = 100
        playLabel.text = "fishfish"
        playLabel.fontName = "Al Bayan Bold"
        playLabel.position = CGPoint(x: frame.midX, y: frame.midY + 450)
        playLabel.name = "title"
        addChild(playLabel)
    }
    
    func resetGame() {
        makeFishingPole()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            fishingPole.position.x = location.x
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            fishingPole.position.x = location.x
        }
    }
}

