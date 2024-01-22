//
//  ChallengeOneView.swift
//  GoiTrafficLight
//
//  Created by Guilherme Delfino on 19/12/23.
//

import Foundation
import UIKit

class ChallengeOneView: UIView {
    
    var states = TrafficLightStates.green
    var timer = Timer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViewsAndConstraints()
        TrafficLightsChanges()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    // abaixo eu comecei construindo e configurando as views que irei utilizar no semáforo
    
    lazy var primeiraView: UIView = {
        let fundo = UIView()
        fundo.backgroundColor = .darkGray
        fundo.translatesAutoresizingMaskIntoConstraints = false
        fundo.layer.cornerRadius = 15
        return fundo
    }()
    
    lazy var redLightView: UIView = {
        let redLight = UIView()
        redLight.backgroundColor = .red
        redLight.layer.cornerRadius = 25
        redLight.translatesAutoresizingMaskIntoConstraints = false
        return redLight
    }()
    
    lazy var greenLightView: UIView = {
        let greenLight = UIView()
        greenLight.backgroundColor = .green
        greenLight.layer.cornerRadius = 25
        greenLight.translatesAutoresizingMaskIntoConstraints = false
        return greenLight
    }()
    
    lazy var yellowLightView: UIView = {
        let yellowLight = UIView()
        yellowLight.backgroundColor = .yellow
        yellowLight.layer.cornerRadius = 25
        yellowLight.translatesAutoresizingMaskIntoConstraints = false
        return yellowLight
    }()
    
    lazy var intermittentPressed: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(intermittentTimer), for: .touchUpInside)
        button.backgroundColor = .lightGray
        button.titleLabel?.text = "Intermittent"
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var redButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(redButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var yellowButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(yellowButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var greenButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(greenButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // criei as funções de cada botão
    
    @objc
    func redButtonPressed() {
        states = TrafficLightStates.red
        TrafficLightsChanges()
    }
    @objc
    func yellowButtonPressed() {
        states = TrafficLightStates.yellow
        TrafficLightsChanges()
    }
    @objc
    func greenButtonPressed() {
        states = TrafficLightStates.green
        TrafficLightsChanges()
    }

    @objc
    func intermittentTimer() {
 
            timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
                self.pisque()
            }
 
        


    }
    
    
    
    // criei a função que vai trabalhar a troca de cores do sinal intermitente
    
    
    func pisque() {
        let color = yellowLightView.backgroundColor
        redLightView.backgroundColor = .lightGray
        yellowLightView.backgroundColor = .lightGray
        greenLightView.backgroundColor = .lightGray
        
        if color == .yellow {
            yellowLightView.backgroundColor = .lightGray

        } else {
            yellowLightView.backgroundColor = .yellow

        }
        
        /* passo 0: desligar outras luzes 
         passo 1: começar o timer
         passo 2: toda vez que o timer disparar, trocar a cor do amarelo */
           
    }
    
    
    


    
    func addViewsAndConstraints() {
        
// add as views na função que vou por no init pra chamar geral pra festa        

        addSubview(primeiraView)
        addSubview(redLightView)
        addSubview(yellowLightView)
        addSubview(greenLightView)
        addSubview(intermittentPressed)
        addSubview(redButton)
        addSubview(yellowButton)
        addSubview(greenButton)
        

        
//  setando minhas constraints
        
        NSLayoutConstraint.activate([
            
            primeiraView.topAnchor.constraint(equalTo: self.topAnchor, constant: 249),
            primeiraView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            primeiraView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            primeiraView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            intermittentPressed.topAnchor.constraint(equalTo: primeiraView.bottomAnchor, constant: 50),
            intermittentPressed.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 140),
            
            redButton.topAnchor.constraint(equalTo: primeiraView.bottomAnchor, constant: 50),
            redButton.leadingAnchor.constraint(equalTo: intermittentPressed.leadingAnchor, constant: 30),
            
            yellowButton.topAnchor.constraint(equalTo: primeiraView.bottomAnchor, constant: 50),
            yellowButton.leadingAnchor.constraint(equalTo: redButton.leadingAnchor, constant: 30),
            
            greenButton.topAnchor.constraint(equalTo: primeiraView.bottomAnchor, constant: 50),
            greenButton.leadingAnchor.constraint(equalTo: yellowButton.leadingAnchor, constant: 30),
            
            
            redLightView.topAnchor.constraint(equalTo: primeiraView.topAnchor, constant: 85),
            redLightView.bottomAnchor.constraint(equalTo: primeiraView.topAnchor, constant: 135),
            redLightView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            redLightView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            redLightView.heightAnchor.constraint(equalToConstant: 50),
            redLightView.widthAnchor.constraint(equalToConstant: 50),
            
            yellowLightView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            yellowLightView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            yellowLightView.heightAnchor.constraint(equalToConstant: 50),
            yellowLightView.widthAnchor.constraint(equalToConstant: 50),
            
            greenLightView.topAnchor.constraint(equalTo: primeiraView.topAnchor, constant: 220),
            greenLightView.bottomAnchor.constraint(equalTo: primeiraView.topAnchor, constant: 270),
            greenLightView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            greenLightView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            greenLightView.heightAnchor.constraint(equalToConstant: 50),
            greenLightView.widthAnchor.constraint(equalToConstant: 50),
        
        ])
        
        
    }
    
    // aqui eu crio uma função onde altera o estado do semáforo com as N situações dele
    
    func TrafficLightsChanges() {
        switch states {
        case .red:
            redLightView.backgroundColor = .red
            yellowLightView.backgroundColor = .lightGray
            greenLightView.backgroundColor = .lightGray
            timer.invalidate()
            
        case .green:
            redLightView.backgroundColor = .lightGray
            yellowLightView.backgroundColor = .lightGray
            greenLightView.backgroundColor = .green
            timer.invalidate()
            
        case .yellow:
            redLightView.backgroundColor = .lightGray
            yellowLightView.backgroundColor = .yellow
            greenLightView.backgroundColor = .lightGray
            timer.invalidate()
            
        case .intermittent:
            redLightView.backgroundColor = .lightGray
            yellowLightView.backgroundColor = .yellow
            greenLightView.backgroundColor = .lightGray
            intermittentTimer()

        }
    }
    

}
    
// aqui eu crio meu enum com os casos possíveis em um semáforo (ainda não bolei o intermitente)


enum TrafficLightStates {
    case red, yellow, green, intermittent
}
