//
//  ClearSkyDay.swift
//  WeatherApp
//
//  Created by Андрей Гузанов on 11.04.2022.
//

import SpriteKit
import GameplayKit

class ClearSkyDay: SKScene {
    
    private lazy var sunTexture = SKTexture()
    private lazy var sunSpriteNode = SKSpriteNode()
    private lazy var sunNode = SKNode()
    
    override func sceneDidLoad() {
        configBackground()
        createMoon()
        createObject()
    }
    
    private func createObject() {
        self.addChild(sunNode)
    }
    
    private func configBackground() {
        backgroundColor = .systemBlue
    }
    
    private func createMoon() {
        sunTexture = SKTexture(imageNamed: "Sun")
        sunSpriteNode = SKSpriteNode(texture: sunTexture)
        sunSpriteNode.size = CGSize(width: 200, height: 200)
        sunSpriteNode.anchorPoint = CGPoint(x: 0, y: 0)
        sunSpriteNode.position = CGPoint(x: UIScreen.main.bounds.width / 2,
                                         y: UIScreen.main.bounds.height - sunSpriteNode.size.height)
        sunSpriteNode.zPosition = 1
        sunNode.addChild(sunSpriteNode)
    }
}
