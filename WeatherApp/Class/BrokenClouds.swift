//
//  BrokenClouds.swift
//  weatherAnimation
//
//  Created by Андрей Гузанов on 20.04.2022.
//

import SpriteKit
import GameplayKit


class BrokenClouds: SKScene {
    
    private lazy var whiteClouds = SKEmitterNode()
    private lazy var blackClouds = SKEmitterNode()
    
    override func sceneDidLoad() {
        configBackground()
        createWhiteClouds()
        createBlackClouds()
    }
    
    private func configBackground() {
        backgroundColor = UIColor(red: 163/255, green: 163/255, blue: 163/255, alpha: 1)
    }
    
    private func createWhiteClouds() {
        whiteClouds = SKEmitterNode(fileNamed: "WhiteClouds.sks") ?? SKEmitterNode()
        whiteClouds.zPosition = 0
        whiteClouds.particleSize = CGSize(width: 150,
                                          height: 100)
        whiteClouds.particlePosition = CGPoint(x: UIScreen.main.bounds.width + whiteClouds.frame.width,
                                               y: UIScreen.main.bounds.height - whiteClouds.frame.size.height)
        addChild(whiteClouds)
    }
    
    private func createBlackClouds() {
        blackClouds = SKEmitterNode(fileNamed: "BlackClouds.sks") ?? SKEmitterNode()
        blackClouds.zPosition = 1
        blackClouds.particleSize = CGSize(width: 130,
                                          height: 80)
        blackClouds.particlePosition = CGPoint(x: UIScreen.main.bounds.width + blackClouds.frame.width,
                                               y: UIScreen.main.bounds.height - blackClouds.frame.size.height)
        addChild(blackClouds)
    }
}
