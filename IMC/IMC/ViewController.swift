//
//  ViewController.swift
//  IMC
//
//  Created by Tiago & Karina on 19/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pesoTextField: UITextField!
    
    @IBOutlet weak var alturaTextField: UITextField!
    
    @IBOutlet weak var resultadoLabel: UILabel!
    
    @IBOutlet weak var viResultado: UIView!
    
    
    
    @IBOutlet weak var resultadoImageView: UIImageView!
    
    
    
    var imc:Double = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }  // metodo chamado qd tocar em qualquer ponto da tela,exceto nos que recebem foco para si como textField.
     //entao eu digo pra view finalizar (view.endEnditing)  qualquer edicao q esteja ocorrendo, que nao seja os que tem foco.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func calcularButton(_ sender: UIButton) {
        let formatter = NumberFormatter()
        let peso = formatter.number(from: pesoTextField.text!)!.doubleValue
        let altura = formatter.number(from: alturaTextField.text!)!.doubleValue
        imc = peso / pow(altura, 2) // ou isso qé a mesma coisa(altura * altura)
        resultado()
    }
    func resultado() {
        var result: String = ""
        var image: String = ""
            
            switch imc {
            case 0..<16:
                result = "Magreza"
                image = "abaixo"
            case 0..<18,5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18,5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobre Peso"
                image = "sobre"
                
            default:
                result = "Obesidade"
                image = "obesidade"
                
            }
            resultadoLabel.text = result
            resultadoImageView.image = UIImage(named:image)
            viResultado.isHidden = false // propriedade isHidden, qd true esconde o elemento, qd false o elemento view torna visivel no caso aqui foi depois de ter os resultados.
            view.endEditing(true) // para qd nao estiver nenhum textField sendo  selecionado o teclado nao APARECER.
        }
    
}

    

