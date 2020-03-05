//
//  MarkdownFile.swift
//  MarkdownLiteralExample
//
//  Created by Danilo Campos on 3/5/20.
//  Copyright © 2020 Danilo Campos. All rights reserved.
//

import Foundation
import Ink

struct MarkdownFile: ExpressibleByStringLiteral {
    
    let bundleName: String
    let rawMarkdown: String?
    
var htmlRepresentation: String? {
    if let raw = rawMarkdown {
        return MarkdownParser().html(from: raw)
    } else {
        return nil
    }
}
    
    init(stringLiteral: String) {
        
        bundleName = stringLiteral
        
        var loadedMarkdown: String? = nil
                
        if let filepath = Bundle.main.path(forResource: bundleName, ofType: nil) {
        //By skipping the ofType argument above, we'll match to the first file whose name
        //exactly matches bundleName
            do {
                let loadedString = try String(contentsOfFile: filepath)
                loadedMarkdown = loadedString
            } catch {
                print("Could not load string: \(error)")
            }
        } else {
            print("Could not find file: \(bundleName)")
        }
        
        rawMarkdown = loadedMarkdown
    }
}
