//
//  ClearSkyNight.swift
//  WeatherApp
//
//  Created by Андрей Гузанов on 11.04.2022.
//

import SpriteKit
import GameplayKit


class ClearSkyNight: SKScene {
    
    private lazy var starrySky = SKEmitterNode()
    private lazy var moonTexture = SKTexture()
    private lazy var moonSpriteNode = SKSpriteNode()
    private lazy var moonNode = SKNode()
    
    override func sceneDidLoad() {
        configBackground()
        createStarrySky()
        createMoon()
        createObject()
    }
    
    private func createObject() {
        self.addChild(moonNode)
    }
    
    private func configBackground() {
        backgroundColor = UIColor(red: 20/255, green: 13/255, blue: 64/255, alpha: 1)
    }
    
    private func createStarrySky() {
        starrySky = SKEmitterNode(fileNamed: "StarrySky.sks") ?? SKEmitterNode()
        starrySky.zPosition = 0
        starrySky.particlePositionRange = CGVector(dx: size.width, dy: size.height)
        size = UIScreen.main.bounds.size
        addChild(starrySky)
    }
    
    private func createMoon() {
        moonTexture = SKTexture(imageNamed: "moon")
        moonSpriteNode = SKSpriteNode(texture: moonTexture)
        moonSpriteNode.size = CGSize(width: 100, height: 100)
        moonSpriteNode.anchorPoint = CGPoint(x: 0, y: 0)
        moonSpriteNode.position = CGPoint(x: UIScreen.main.bounds.width / 2,
                                          y: UIScreen.main.bounds.height - moonSpriteNode.size.height)
        moonSpriteNode.zPosition = 1
        moonNode.addChild(moonSpriteNode)
    }
}
