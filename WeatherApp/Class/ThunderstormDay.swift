//
//  ThunderstormDay.swift
//  WeatherApp
//
//  Created by Андрей Гузанов on 11.04.2022.
//

import SpriteKit
import GameplayKit


class ThunderstormDay: SKScene {
    
    private lazy var clouds = SKEmitterNode()
    private lazy var thunderstorm = SKEmitterNode()
    
    override func sceneDidLoad() {
        configBackground()
        createClouds()
        createThunderstorm()
    }
    
    private func configBackground() {
        backgroundColor = UIColor(red: 49/255, green: 48/255, blue: 54/255, alpha: 1)
    }
    
    private func createClouds() {
        clouds = SKEmitterNode(fileNamed: "Сlouds.sks") ?? SKEmitterNode()
        clouds.zPosition = 0
        clouds.particleSize = CGSize(width: frame.width, height: 200)
        clouds.particlePosition = CGPoint(x: UIScreen.main.bounds.width / 2,
                                          y: UIScreen.main.bounds.height - clouds.frame.size.height)
        addChild(clouds)
    }
    
    private func createThunderstorm() {
        thunderstorm = SKEmitterNode(fileNamed: "Thunderstorm.sks") ?? SKEmitterNode()
        thunderstorm.zPosition = 1
        thunderstorm.particleSize = CGSize(width: frame.width,
                                     height: 150)
        thunderstorm.particlePosition = CGPoint(x: UIScreen.main.bounds.width / 2,
                                                y: UIScreen.main.bounds.height - thunderstorm.frame.size.height)
        addChild(thunderstorm)
    }
}
