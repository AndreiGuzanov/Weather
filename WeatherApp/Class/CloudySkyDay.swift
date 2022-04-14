//
//  CloudySkyDay.swift
//  WeatherApp
//
//  Created by Андрей Гузанов on 11.04.2022.
//

import SpriteKit
import GameplayKit


class CloudySkyDay: SKScene {
    
    private lazy var skyTexture = SKTexture()
    private lazy var skySpriteNode = SKSpriteNode()
    private lazy var skyNode = SKNode()
    private lazy var liteSkyTexture = SKTexture()
    private lazy var liteSkySpriteNode = SKSpriteNode()
    private lazy var liteSkyNode = SKNode()
    private lazy var sunTexture = SKTexture()
    private lazy var sunSpriteNode = SKSpriteNode()
    private lazy var sunNode = SKNode()
    
    override func didMove(to view: SKView) {
        configBackground()
        createObject()
        createSky()
        createLiteSky()
        createSun()
    }
    
    private func configBackground() {
        backgroundColor = .systemBlue
    }
    
    private func createObject() {
        self.addChild(skyNode)
        self.addChild(liteSkyNode)
        self.addChild(sunNode)
    }
    
    private func createSun() {
        sunTexture = SKTexture(imageNamed: "Sun")
        sunSpriteNode = SKSpriteNode(texture: sunTexture)
        sunSpriteNode.size = CGSize(width: 200, height: 200)
        sunSpriteNode.anchorPoint = CGPoint(x: 0, y: 0)
        sunSpriteNode.position = CGPoint(x: size.width / 2,
                                         y: size.height - sunSpriteNode.size.height)
        sunSpriteNode.zPosition = -1
        sunNode.addChild(sunSpriteNode)
    }
    
    private func createSky() {
        skyTexture = SKTexture(imageNamed: "Cloud")
        skySpriteNode = SKSpriteNode(texture: skyTexture)
        skySpriteNode.size = CGSize(width: 300, height: 200)
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
        liteSkySpriteNode.size = CGSize(width: 300, height: 200)
        liteSkySpriteNode.anchorPoint = CGPoint(x: 0, y: 0)
        liteSkySpriteNode.position = CGPoint(x: UIScreen.main.bounds.width / 2,
                                             y: UIScreen.main.bounds.height - liteSkySpriteNode.size.height)
        let move = SKAction.move(to: CGPoint(x: frame.minX - liteSkySpriteNode.size.width,
                                             y: frame.maxY - liteSkySpriteNode.size.height), duration: 60)
        let repeatMove = SKAction.moveBy(x: frame.width + liteSkySpriteNode.size.width,
                                         y: 0,
                                         duration: 0)
        let moveForever = SKAction.repeatForever(SKAction.sequence([move, repeatMove]))
        liteSkySpriteNode.zPosition = 0
        liteSkySpriteNode.run(moveForever)
        liteSkyNode.addChild(liteSkySpriteNode)
    }
}
