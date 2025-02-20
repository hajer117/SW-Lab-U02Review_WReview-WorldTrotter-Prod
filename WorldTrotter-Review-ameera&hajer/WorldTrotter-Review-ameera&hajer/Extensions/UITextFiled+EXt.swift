//
//  UITextFiled+EXt.swift
//  WorldTrotter-Review-ameera&hajer
//
//  Created by hajer . on 25/04/1443 AH.
//

import UIKit

extension ConversionVC: UITextFieldDelegate{
    
    public func textField(_ textField: UITextField,
                          shouldChangeCharactersIn range: NSRange,
                          replacementString string: String) -> Bool {
        
        guard let text = textField.text else { return false }
        
        return hasConcatenationOnlyDecimalNumbersAndDecimalSeparator (string1: text, string2: string)
    }
    
    func hasConcatenationOnlyDecimalNumbersAndDecimalSeparator(string1: String, string2: String) -> Bool {
        print("\n\n \(#function)")
        print(" - string1: \(string1)")
        print(" - string2: \(string2)")
        
        if hasConcatenationMoreThanOneDecimalSeparator(string1, string2){
            return false
        }
        
        let  allowedCharacters = CharacterSet.decimalDigits.union(["."])
        let forbiddenCharacters = allowedCharacters.inverted
        let foundForbiddenCharacters = string2.rangeOfCharacter(from: forbiddenCharacters)
        
        print("foundForbiddenCharacters: \(String(describing: foundForbiddenCharacters))")
        
        if foundForbiddenCharacters != nil {
            return false
        } else {
            return true
        }
    }
    
    
    func hasConcatenationMoreThanOneDecimalSeparator(_ string1: String,
                                                     _ string2: String) -> Bool{
        let string1HasDecimalSeparator = string1.range(of: ".")
        let string2HasDecimalSeparator = string2.range(of: ".")
        
        print("\n \(#function)")
        print("string1HasDecimalSeparator: \(String(describing: string1HasDecimalSeparator))")
        print("string2HasDecimalSeparator: \(String(describing: string2HasDecimalSeparator))")
        
        if string1HasDecimalSeparator != nil,
           string2HasDecimalSeparator != nil {
            return true
        }else{
            return false
        }
    }
}
