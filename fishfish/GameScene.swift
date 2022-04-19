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
    var water = SKSpriteNode()
    var sky = SKSpriteNode()
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    var playLabel = SKLabelNode()
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        resetGame()
        createTitleScreen()
        createWater()
        createSky()
        makeFishingPole()
    }
    
    func createWater() {
        water = SKSpriteNode(color: .blue, size: CGSize(width: frame.width, height: frame.height))
        water.position = CGPoint(x: frame.midX, y: frame.midY)
        water.name = "water"
        water.physicsBody = SKPhysicsBody(rectangleOf: water.size)
        water.physicsBody?.isDynamic = false
        addChild(water)
    }
    
    func createSky() {
        sky = SKSpriteNode(color: .lightGray, size: CGSize(width: frame.width, height: frame.height))
        sky.position = CGPoint(x: frame.midX, y: frame.midY + 1000)
        sky.name = "sky"
        sky.physicsBody = SKPhysicsBody(rectangleOf: sky.size)
        sky.physicsBody?.isDynamic = false
        addChild(sky)
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

