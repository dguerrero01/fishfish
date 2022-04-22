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
        fishingPole = SKSpriteNode(color: .orange, size: CGSize(width: 10, height: frame.height/4))
        fishingPole.position = CGPoint(x: frame.minX, y: frame.minY + 1150)
        fishingPole.name = "fishing pole"
        fishingPole.physicsBody = SKPhysicsBody(rectangleOf: fishingPole.size)
        fishingPole.physicsBody?.isDynamic = false
        addChild(fishingPole)
        let moveRight = SKAction.moveBy(x: frame.width, y: 0, duration: 2)
        let moveLeft = SKAction.moveBy(x: -frame.width, y: 0, duration: 2)
        let moveBackAndForth = SKAction.repeatForever(SKAction.sequence([moveRight, moveLeft]))
        fishingPole.run(moveBackAndForth)
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
            fishingPole.position.y = location.y
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            fishingPole.position.y = location.y
        }
    }
}

