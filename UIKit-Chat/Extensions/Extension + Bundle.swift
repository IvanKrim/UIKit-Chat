//
//  Extension + Bundle.swift
//  UIKit-Chat
//
//  Created by Kalabishka Ivan on 24.12.2021.
//

import Foundation

extension Bundle {
    // декодируем полученный объект json в нашу модель данных <T> - где <T> это любой объект который подписан под протокол decodable
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        
        // проверяем что по даному пути действительно есть файл
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in boundle.")
        }
        
        // проверяем действительно ли есть какая-то информация
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from boundle.")
        }
        
        let decoder = JSONDecoder()
        
        // конвертируем данные в файле в нашу модель данных 
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from boundle.")
        }
        
        return loaded
    }
}
