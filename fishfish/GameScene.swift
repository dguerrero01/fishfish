//
//  GameScene.swift
//  fishfish
//
//  Created by Student on 3/29/22.
//

import SpriteKit
import GameplayKit
import SwiftUI

class GameScene: SKScene, SKPhysicsContactDelegate {
    var fish = 1
    var fishingPole = SKSpriteNode()
    var water = SKSpriteNode()
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    var playLabel = SKLabelNode()
    var playingGame = false
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        resetGame()
        createTitleScreen()
        createWater()
        makeFishingPole()
    }
    
    func createWater() {
        water = SKSpriteNode(color: .blue, size: CGSize(width: frame.width, height: frame.height))
        water.position = CGPoint(x: frame.midX, y: frame.midY)
        water.name = "background"
        water.physicsBody = SKPhysicsBody(rectangleOf: water.size)
        water.physicsBody?.isDynamic = false
        addChild(water)
    }
    
    func createSky() {
        
    }
    
    func makeFishingPole() {
        fishingPole = SKSpriteNode(color: .orange, size: CGSize(width: 10, height: frame.height))
        fishingPole.position = CGPoint(x: frame.minX, y: frame.minY + 1750)
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
        playLabel.position = CGPoint(x: frame.midX, y: frame.midY + 0)
        playLabel.name = "title"
        addChild(playLabel)
    }
    
    func removeTitleScreen() {
        playLabel.run(SKAction.fadeOut(withDuration: 3))
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if let child = self.childNode(withName: "playLabel") as? SKSpriteNode {
                child.removeFromParent()
            }
        }
    }
    
    func resetGame() {
        makeFishingPole()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if playingGame {
                fishingPole.position.y = location.y - 450
            }
            else {
                for node in nodes(at: location) {
                    if node.name == "title" {
                        playingGame = true
                        node.alpha = 0
                    }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if playingGame {
                fishingPole.position.y = location.y - 450
            }
        }
    }
}

