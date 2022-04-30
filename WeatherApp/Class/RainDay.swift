//
//  RainDay.swift
//  WeatherApp
//
//  Created by Андрей Гузанов on 11.04.2022.
//

import SpriteKit
import GameplayKit


class RainDay: SKScene {
    
    private lazy var whiteClouds = SKEmitterNode()
    private lazy var blackClouds = SKEmitterNode()
    private lazy var rain = SKEmitterNode()
    
    override func sceneDidLoad() {
        configBackground()
        createWhiteClouds()
        createBlackClouds()
        createRain()
    }
    
    private func configBackground() {
        backgroundColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1)
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
    
    private func createBlackClouds() {
        blackClouds = SKEmitterNode(fileNamed: "BlackClouds.sks") ?? SKEmitterNode()
        blackClouds.zPosition = 2
        blackClouds.particleSize = CGSize(width: 130,
                                          height: 80)
        blackClouds.particlePosition = CGPoint(x: UIScreen.main.bounds.width + blackClouds.frame.width,
                                               y: UIScreen.main.bounds.height - blackClouds.frame.size.height)
        addChild(blackClouds)
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
