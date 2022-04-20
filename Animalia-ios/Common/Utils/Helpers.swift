//
//  Helpers.swift
//  Animalia-ios
//
//  Created by Sebastian Soto Varas on 18/04/22.
//

import Foundation
import UIKit

func validatePassword(_ textField: UITextField) -> (Bool, String?) {
    guard let text = textField.text else { return (false, nil) }
    
    if text.count < 6 && text.count > 0 { return (false, "Tu contraseña es muy corta (min 6)") }
    if text.count == 0 { return (false, "Este campo no puede estar vacio") }
    
    return (true, nil)
}

func validateRepeatPassword(_ password: UITextField, _ repeatPassword: UITextField) -> (Bool, String?) {
    guard let passwordText = password.text else { return (false, nil) }
    guard let repeatPasswordText = repeatPassword.text else { return (false, nil) }
    
    if repeatPasswordText.count < 6 && repeatPasswordText.count > 0 { return (false, "Tu contraseña es muy corta (min 6).") }
    if repeatPasswordText.isEmpty { return (false, "Este campo no puede estar vacio.") }
    if passwordText != repeatPasswordText { return (false, "Las contraseñas deben coincidir.") }
    
    return (true, nil)
}

func validateEmail(_ textField: UITextField) -> (Bool, String?) {
    guard let text = textField.text else { return (false, nil) }
    
    let emailPattern = #"^\S+@\S+\.\S+$"#
    let result = text.range(of: emailPattern, options: .regularExpression)
    
    if result == nil { return (false, "Ingrese un email valido.") }
    
    return (true, nil)
}
