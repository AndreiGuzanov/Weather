//
//  SnowNight.swift
//  WeatherApp
//
//  Created by Андрей Гузанов on 11.04.2022.
//

import SpriteKit
import GameplayKit


class SnowNight: SKScene {
    
    private lazy var clouds = SKEmitterNode()
    private lazy var snow = SKEmitterNode()
    
    override func sceneDidLoad() {
        configBackground()
        createClouds()
        createSnow()
    }
    
    private func configBackground() {
        backgroundColor = UIColor(red: 52/255, green: 46/255, blue: 87/255, alpha: 1)
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
    
    private func createSnow() {
        snow = SKEmitterNode(fileNamed: "Snow.sks") ?? SKEmitterNode()
        snow.zPosition = 0
        snow.particlePositionRange = CGVector(dx: 1000, dy: 2000)
        snow.particlePosition = CGPoint(x: UIScreen.main.bounds.width / 2,
                                        y: UIScreen.main.bounds.height - snow.frame.size.height)
        addChild(snow)
    }
}
