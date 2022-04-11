//
//  Mist.swift
//  WeatherApp
//
//  Created by Андрей Гузанов on 11.04.2022.
//

import SpriteKit
import GameplayKit


class Mist: SKScene {
    
    private lazy var mist = SKEmitterNode()
    
    override func sceneDidLoad() {
        configBackground()
        createMist()
    }
    
    private func configBackground() {
        backgroundColor = .black
    }
    
    private func createMist() {
        mist = SKEmitterNode(fileNamed: "Mist2.sks") ?? SKEmitterNode()
        mist.zPosition = 0
        mist.particlePositionRange = CGVector(dx: 1000, dy: 400)
        mist.particlePosition = CGPoint(x: UIScreen.main.bounds.width / 2,
                                        y: UIScreen.main.bounds.height + 200)
        addChild(mist)
    }
}
