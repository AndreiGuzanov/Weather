//
//  SnowDay.swift
//  WeatherApp
//
//  Created by Андрей Гузанов on 11.04.2022.
//

import SpriteKit
import GameplayKit


class SnowDay: SKScene {
    
    private lazy var whiteClouds = SKEmitterNode()
    private lazy var snow = SKEmitterNode()
    
    override func sceneDidLoad() {
        configBackground()
        createWhiteClouds()
        createSnow()
    }
    
    private func configBackground() {
        backgroundColor = UIColor(red: 163/255, green: 163/255, blue: 163/255, alpha: 1)
    }
    
    private func createWhiteClouds() {
        whiteClouds = SKEmitterNode(fileNamed: "WhiteClouds.sks") ?? SKEmitterNode()
        whiteClouds.zPosition = 1
        whiteClouds.particleSize = CGSize(width: 150,
                                          height: 100)
        whiteClouds.particlePosition = CGPoint(x: UIScreen.main.bounds.width + whiteClouds.frame.width,
                                               y: UIScreen.main.bounds.height - whiteClouds.frame.size.height)
        addChild(whiteClouds)
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
