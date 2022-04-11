//
//  RainNight.swift
//  WeatherApp
//
//  Created by Андрей Гузанов on 11.04.2022.
//

import SpriteKit
import GameplayKit


class RainSceneNight: SKScene {
    
    private lazy var clouds = SKEmitterNode()
    private lazy var rain = SKEmitterNode()
    
    override func sceneDidLoad() {
        configBackground()
        createClouds()
        createRain()
    }
    
    private func configBackground() {
        backgroundColor = .black
    }
    
    private func createClouds() {
        clouds = SKEmitterNode(fileNamed: "Сlouds.sks") ?? SKEmitterNode()
        clouds.zPosition = 1
        clouds.particleSize = CGSize(width: frame.width,
                                     height: 150)
        clouds.particlePosition = CGPoint(x: UIScreen.main.bounds.width / 2,
                                          y: UIScreen.main.bounds.height - clouds.frame.size.height)
        addChild(clouds)
    }
    
    private func createRain() {
        rain = SKEmitterNode(fileNamed: "Rain.sks") ?? SKEmitterNode()
        rain.zPosition = 0
        rain.particlePositionRange = CGVector(dx: 1000, dy: 2000)
        rain.particlePosition = CGPoint(x: UIScreen.main.bounds.width / 2,
                                        y: UIScreen.main.bounds.height - rain.frame.size.height)
        addChild(rain)
    }
}
