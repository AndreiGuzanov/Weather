//
//  CloudySkyNight.swift
//  WeatherApp
//
//  Created by Андрей Гузанов on 11.04.2022.
//

import SpriteKit
import GameplayKit


class CloudySkyNight: SKScene {
    
    private lazy var skyTexture = SKTexture()
    private lazy var skySpriteNode = SKSpriteNode()
    private lazy var skyNode = SKNode()
    private lazy var liteSkyTexture = SKTexture()
    private lazy var liteSkySpriteNode = SKSpriteNode()
    private lazy var liteSkyNode = SKNode()
    private lazy var moonTexture = SKTexture()
    private lazy var moonSpriteNode = SKSpriteNode()
    private lazy var moonNode = SKNode()
    private lazy var starrySky = SKEmitterNode()
    
    override func didMove(to view: SKView) {
        configBackground()
        createObject()
        createSky()
        createLiteSky()
        createMoon()
        createStarrySky()
    }
    
    private func configBackground() {
        backgroundColor = UIColor(red: 20/255, green: 13/255, blue: 64/255, alpha: 1)
    }
    
    private func createObject() {
        self.addChild(skyNode)
        self.addChild(liteSkyNode)
        self.addChild(moonNode)
    }
    
    private func createMoon() {
        moonTexture = SKTexture(imageNamed: "moon")
        moonSpriteNode = SKSpriteNode(texture: moonTexture)
        moonSpriteNode.size = CGSize(width: 100, height: 100)
        moonSpriteNode.anchorPoint = CGPoint(x: 0, y: 0)
        moonSpriteNode.position = CGPoint(x: UIScreen.main.bounds.width / 2,
                                          y: UIScreen.main.bounds.height - moonSpriteNode.size.height)
        moonSpriteNode.zPosition = -1
        moonNode.addChild(moonSpriteNode)
    }
    
    private func createSky() {
        skyTexture = SKTexture(imageNamed: "Cloud")
        skySpriteNode = SKSpriteNode(texture: skyTexture)
        skySpriteNode.size = CGSize(width: 200, height: 100)
        skySpriteNode.anchorPoint = CGPoint(x: 0, y: 0)
        skySpriteNode.position = CGPoint(x: UIScreen.main.bounds.width,
                                         y: UIScreen.main.bounds.height - skySpriteNode.size.height)
        let move = SKAction.move(to: CGPoint(x: frame.minX - skySpriteNode.size.width,
                                             y: frame.maxY - skySpriteNode.size.height),
                                 duration: 40)
        let repeatMove = SKAction.moveBy(x: frame.width + skySpriteNode.size.width,
                                         y: 0,
                                         duration: 0)
        let moveForever = SKAction.repeatForever(SKAction.sequence([move, repeatMove]))
        skySpriteNode.zPosition = 1
        skySpriteNode.run(moveForever)
        skyNode.addChild(skySpriteNode)
    }
    
    private func createLiteSky() {
        liteSkyTexture = SKTexture(imageNamed: "LiteSky")
        liteSkySpriteNode = SKSpriteNode(texture: liteSkyTexture)
        liteSkySpriteNode.size = CGSize(width: 200, height: 100)
        liteSkySpriteNode.anchorPoint = CGPoint(x: 0, y: 0)
        liteSkySpriteNode.position = CGPoint(x: UIScreen.main.bounds.width / 2,
                                             y: UIScreen.main.bounds.height - liteSkySpriteNode.size.height)
        let move = SKAction.move(to: CGPoint(x: frame.minX - liteSkySpriteNode.size.width,
                                             y: frame.maxY - liteSkySpriteNode.size.height),
                                 duration: 60)
        let repeatMove = SKAction.moveBy(x: frame.width + liteSkySpriteNode.size.width,
                                         y: 0,
                                         duration: 0)
        let moveForever = SKAction.repeatForever(SKAction.sequence([move, repeatMove]))
        liteSkySpriteNode.zPosition = 0
        liteSkySpriteNode.run(moveForever)
        liteSkyNode.addChild(liteSkySpriteNode)
    }
    
    private func createStarrySky() {
        starrySky = SKEmitterNode(fileNamed: "StarrySky.sks") ?? SKEmitterNode()
        starrySky.zPosition = -1
        starrySky.particlePositionRange = CGVector(dx: 1000, dy: 2000)
        starrySky.particlePosition = CGPoint(x: UIScreen.main.bounds.width / 2,
                                             y: UIScreen.main.bounds.height - starrySky.frame.size.height)
        addChild(starrySky)
    }
}
