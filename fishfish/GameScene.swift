//
//  GameScene.swift
//  fishfish
//
//  Created by Student on 3/29/22.
//

import SpriteKit
import GameplayKit
import SwiftUI
import UIKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var fish = 1
    var fishingPole = SKSpriteNode()
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    var playLabel = SKLabelNode()
    var playingGame = false
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        createBackground()
        resetGame()
        createTitleScreen()
        makeFish()
    }
    
    func createBackground() {
        let background = SKSpriteNode(imageNamed: "fishfish3")
        background.size = frame.size
        background.zPosition = -1
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(background)
    }
    
    func makeFishingPole() {
        fishingPole = SKSpriteNode(color: .orange, size: CGSize(width: 10, height: frame.height))
        fishingPole.position = CGPoint(x: frame.minX, y: frame.minY + 1750)
        fishingPole.name = "fishing pole"
        fishingPole.physicsBody = SKPhysicsBody(rectangleOf: fishingPole.size)
        fishingPole.physicsBody?.isDynamic = false
        addChild(fishingPole)
    }
    
    func moveFishingPole() {
        let moveRight = SKAction.moveBy(x: frame.width, y: 0, duration: 2)
        let moveLeft = SKAction.moveBy(x: -frame.width, y: 0, duration: 2)
        let moveBackAndForth = SKAction.repeatForever(SKAction.sequence([moveRight, moveLeft]))
        fishingPole.run(moveBackAndForth)
    }
    
    func moveFishingPoleUp() {
        let moveUp = SKAction.moveTo(y: frame.minY + 1750, duration: 2)
        fishingPole.run(moveUp)
    }
    
    func createTitleScreen() {
        let title = SKSpriteNode(imageNamed: "fishfish.")
        title.position = CGPoint(x: frame.midX, y: frame.midY + 0)
        title.zPosition = 1
        title.name = "title"
        addChild(title)
    }
    
    func removeTitleScreen() {
        if let child = self.childNode(withName: "title") as? SKSpriteNode {
            child.removeFromParent()
        }
    }
    
    func makeFish() {
        let fish = SKSpriteNode(imageNamed: "Green Fish")
        fish.position = CGPoint(x: -200, y: -200)
        let movePositive = SKAction.moveBy(x: 100, y: 0, duration: 3)
        let moveNegative = SKAction.moveBy(x: -100, y: 0, duration: 3)
        let moveBackAndForth = SKAction.repeatForever(SKAction.sequence([movePositive, moveNegative]))
        fish.run(moveBackAndForth)
        self.addChild(fish)
    }
    
    
    func resetGame() {
        makeFishingPole()
        moveFishingPole()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if playingGame {
                fishingPole.position.y = location.y - 450
                fishingPole.removeAllActions()
                moveFishingPoleUp()
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

