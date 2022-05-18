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
    var score = 0
    var scoreLabel = SKLabelNode()
    let Gfish = SKSpriteNode(imageNamed: "Green Fish")
    let Bfish = SKSpriteNode(imageNamed: "blueFish")
    let Rfish = SKSpriteNode(imageNamed: "redFish")
    let Ofish = SKSpriteNode(imageNamed: "orangeFish")
    let GREfish = SKSpriteNode(imageNamed: "greFish")
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        createBackground()
        resetGame()
        createTitleScreen()
        makeFishes()
        createResetButton()
        makeLabel()
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
        fishingPole.zPosition = 1
        fishingPole.name = "fishing pole"
        fishingPole.physicsBody = SKPhysicsBody(rectangleOf: fishingPole.size)
        fishingPole.physicsBody?.isDynamic = false
        fishingPole.physicsBody?.friction = 0
        fishingPole.physicsBody?.linearDamping = 0
        fishingPole.physicsBody?.contactTestBitMask = (fishingPole.physicsBody?.collisionBitMask)!
        addChild(fishingPole)
    }
    
    func moveFishingPole() {
        let moveRight = SKAction.moveTo(x: 250, duration: 2)
        let moveLeft = SKAction.moveTo(x: -250, duration: 2)
        let moveBackAndForth = SKAction.repeatForever(SKAction.sequence([moveRight, moveLeft]))
        fishingPole.run(moveBackAndForth)
    }
    
    func moveFishingPoleUp() {
        let moveUp = SKAction.moveTo(y: frame.minY + 1750, duration: 1)
        fishingPole.run(moveUp)
        moveFishingPole()
    }
    
    func createTitleScreen() {
        let title = SKSpriteNode(imageNamed: "fishfish.")
        title.position = CGPoint(x: frame.midX, y: frame.midY + 0)
        title.zPosition = 5
        title.name = "title"
        addChild(title)
    }
    
    func removeTitleScreen() {
        if let child = self.childNode(withName: "title") as? SKSpriteNode {
            child.removeFromParent()
        }
    }
    
    func createResetButton() {
        let button = SKSpriteNode(imageNamed: "reset")
        button.position = CGPoint(x: frame.midX - 215, y: -620)
        button.size = CGSize(width: button.size.width / 13, height: button.size.height / 13)
        button.zPosition = 4
        button.name = "button"
        addChild(button)
    }
    
    func makeFishes() {
        makeGreenFish()
        makeBlueFish()
        makeRedFish()
        makeOrangeFish()
        makeGreFish()
    }
    
    func makeGreenFish() {
        let Gfish = SKSpriteNode(imageNamed: "Green Fish")
        Gfish.position = CGPoint(x: 0, y: 300)
        let movePositive = SKAction.moveBy(x: 225, y: 0, duration: 5.5)
        let moveNegative = SKAction.moveBy(x: -225, y: 0, duration: 5.5)
        //        let hide = SKAction.(hide)
        let Gfishh = SKTexture(imageNamed: "Green Fish.")
        let gfishh = SKTexture(imageNamed: "Green Fish")
        let switchFish = SKAction.setTexture(Gfishh)
        let switchFishBack = SKAction.setTexture(gfishh)
        let moveBackAndForth = SKAction.repeatForever(SKAction.sequence([movePositive, switchFish, moveNegative, moveNegative, switchFishBack, movePositive]))
        Gfish.run(moveBackAndForth)
        Gfish.physicsBody = SKPhysicsBody(rectangleOf: Gfish.size)
        Gfish.name = "Green Fish"
        Gfish.physicsBody?.isDynamic = false
        self.addChild(Gfish)
    }
    
    func makeBlueFish() {
        let Bfish = SKSpriteNode(imageNamed: "blueFish")
        Bfish.position = CGPoint(x: 0, y: -100)
        let movePositive = SKAction.moveBy(x: 250, y: 0, duration: 1.5)
        let moveNegative = SKAction.moveBy(x: -250, y: 0, duration: 1.5)
        let Bfishh = SKTexture(imageNamed: "blueFish.")
        let bfishh = SKTexture(imageNamed: "blueFish")
        let switchFish = SKAction.setTexture(Bfishh)
        let switchFishBack = SKAction.setTexture(bfishh)
        let moveBackAndForth = SKAction.repeatForever(SKAction.sequence([moveNegative, switchFish, movePositive, movePositive, switchFishBack, moveNegative]))
        Bfish.run(moveBackAndForth)
        Bfish.physicsBody = SKPhysicsBody(rectangleOf: Bfish.size)
        Bfish.name = "Blue Fish"
        Bfish.physicsBody?.isDynamic = false
        self.addChild(Bfish)
    }
    
    func makeRedFish() {
        let Rfish = SKSpriteNode(imageNamed: "redFish")
        Rfish.position = CGPoint(x: 0, y: -425)
        let movePositive = SKAction.moveBy(x: 250, y: 0, duration: 3)
        let moveNegative = SKAction.moveBy(x: -250, y: 0, duration: 3)
        let Rfishh = SKTexture(imageNamed: "redFish.")
        let rfishh = SKTexture(imageNamed: "redFish")
        let switchFish = SKAction.setTexture(Rfishh)
        let switchFishBack = SKAction.setTexture(rfishh)
        let moveBackAndForth = SKAction.repeatForever(SKAction.sequence([moveNegative, switchFish, movePositive, movePositive, switchFishBack, moveNegative]))
        Rfish.run(moveBackAndForth)
        Rfish.physicsBody = SKPhysicsBody(rectangleOf: Rfish.size)
        Rfish.name = "Red Fish"
        Rfish.physicsBody?.isDynamic = false
        self.addChild(Rfish)
    }
    
    func makeOrangeFish() {
        let Ofish = SKSpriteNode(imageNamed: "orangeFish")
        Ofish.position = CGPoint(x: 0, y: 125)
        let movePositive = SKAction.moveBy(x: 250, y: 0, duration: 2)
        let moveNegative = SKAction.moveBy(x: -250, y: 0, duration: 2)
        let Ofishh = SKTexture(imageNamed: "orangeFish.")
        let ofishh = SKTexture(imageNamed: "orangeFish")
        let switchFish = SKAction.setTexture(Ofishh)
        let switchFishBack = SKAction.setTexture(ofishh)
        let moveBackAndForth = SKAction.repeatForever(SKAction.sequence([moveNegative, switchFish, movePositive, movePositive, switchFishBack, moveNegative]))
        Ofish.run(moveBackAndForth)
        Ofish.physicsBody = SKPhysicsBody(rectangleOf: Ofish.size)
        Ofish.name = "Orange Fish"
        Ofish.physicsBody?.isDynamic = false
        self.addChild(Ofish)
    }
    
    func makeGreFish() {
        let GREfish = SKSpriteNode(imageNamed: "greFish")
        GREfish.position = CGPoint(x: 0, y: -250)
        let movePositive = SKAction.moveBy(x: 250, y: 0, duration: 1)
        let moveNegative = SKAction.moveBy(x: -250, y: 0, duration: 1)
        let GREfishh = SKTexture(imageNamed: "greFish.")
        let grefishh = SKTexture(imageNamed: "greFish")
        let switchFish = SKAction.setTexture(GREfishh)
        let switchFishBack = SKAction.setTexture(grefishh)
        let moveBackAndForth = SKAction.repeatForever(SKAction.sequence([moveNegative, switchFish, movePositive, movePositive, switchFishBack, moveNegative]))
        GREfish.run(moveBackAndForth)
        GREfish.physicsBody = SKPhysicsBody(rectangleOf: GREfish.size)
        GREfish.name = "GRE Fish"
        GREfish.physicsBody?.isDynamic = false
        self.addChild(GREfish)
    }
    
    func resetGame() {
        makeFishingPole()
        moveFishingPole()
        updateLabel()
    }
    
    func removeFishes() {
        removeAllChildren()
        makeFishingPole()
        moveFishingPole()
        createBackground()
        createResetButton()
        makeLabel()
    }
    
    func resetFishes() {
        score = 0
        removeFishes()
        makeFishes()
    }
    
    func checkCollisions() {
        let hitGFish:  [SKSpriteNode] = []
        enumerateChildNodes(withName: "Green Fish") {  node, _ in
            let Gfish = node as! SKSpriteNode
            if Gfish.frame.intersects(self.fishingPole.frame) {
                Gfish.removeFromParent()
                self.score += 1
            }
        }
        for Gfish in hitGFish {
            Gfish.removeFromParent()
        }
        
        let hitBFish:  [SKSpriteNode] = []
        enumerateChildNodes(withName: "Blue Fish") {  node, _ in
            let Bfish = node as! SKSpriteNode
            if Bfish.frame.intersects(self.fishingPole.frame) {
                Bfish.removeFromParent()
                self.score += 1
            }
        }
        for Bfish in hitBFish {
            Bfish.removeFromParent()
        }
        
        let hitRFish:  [SKSpriteNode] = []
        enumerateChildNodes(withName: "Red Fish") {  node, _ in
            let Rfish = node as! SKSpriteNode
            if Rfish.frame.intersects(self.fishingPole.frame) {
                Rfish.removeFromParent()
                self.score += 1
            }
        }
        for Rfish in hitRFish {
            Rfish.removeFromParent()
        }
        
        let hitOFish:  [SKSpriteNode] = []
        enumerateChildNodes(withName: "Orange Fish") {  node, _ in
            let Ofish = node as! SKSpriteNode
            if Ofish.frame.intersects(self.fishingPole.frame) {
                Ofish.removeFromParent()
                self.score += 1
            }
        }
        for Ofish in hitOFish {
            Ofish.removeFromParent()
        }
        
        let hitGREFish:  [SKSpriteNode] = []
        enumerateChildNodes(withName: "GRE Fish") {  node, _ in
            let GREfish = node as! SKSpriteNode
            if GREfish.frame.intersects(self.fishingPole.frame) {
                GREfish.removeFromParent()
                self.score += 1
            }
        }
        for GREfish in hitGREFish {
            GREfish.removeFromParent()
        }
        updateLabel()
    }
    
    func makeLabel() {
        scoreLabel.fontSize = 30
        scoreLabel.fontColor = .black
        scoreLabel.fontName = "Arial"
        scoreLabel.position = CGPoint(x: frame.midX + 215, y: -625)
        scoreLabel.zPosition = 4
        addChild(scoreLabel)
    }
    
    func updateLabel() {
        scoreLabel.text = "Score: \(score)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if playingGame {
                fishingPole.position.y = 0
                fishingPole.removeAllActions()
                checkCollisions()
                moveFishingPoleUp()
            }
            else {
                for node in nodes(at: location) {
                    if node.name == "title" {
                        playingGame = true
                        node.alpha = 0
                        updateLabel()
                    }
                }
            }
            for node in nodes(at: location) {
                                if node.name == "button" {
                                    resetFishes()
                                    updateLabel()
                                }
                            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if playingGame {
                fishingPole.position.y = 0
            }
        }
    }
}

