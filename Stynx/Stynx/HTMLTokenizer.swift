//
//  HTMLTokenizer.swift
//  Stynx
//
//  Created by Samuel Atkins on 15/09/2024.
//

import Foundation

enum Token {
    case Thing
}

class Tokenizer {
    
    var stream: CharStream
    var tokens: [Token]
    
    enum State {
        case Data
    }
    var state = State.Data
    
    init(input: String) {
        stream = CharStream(of: normalize_newlines(of: input))
        tokens = []
    }
    
    func tokenize() -> [Token] {
        while !stream.isDone {
            processNext()
        }
        
        return tokens
    }
    
    func next() -> Character? {
        // Before the tokenization stage, the input stream must be preprocessed by normalizing newlines.
        // NOTE: We just normalize each character as we retrieve it, to avoid copying the input data.
        
        guard let c = stream.next() else {
            return nil
        }
        
        // https://infra.spec.whatwg.org/#normalize-newlines
        // To normalize newlines in a string, replace every U+000D CR U+000A LF code point pair with a single U+000A LF code point,
        // and then replace every remaining U+000D CR code point with a U+000A LF code point.
        if c == "\r" {
            if stream.peek() == "\n" {
                return stream.next()
            }
            return "\n"
        }
        
        return c
    }
    
    func reconsume() {}
    
    
    func emitToken(_ token: Token) {
        tokens.append(token)
    }
    
    func processNext() {
        switch state {
        case .Data:
            
        }
        return
    }
}


func normalize_newlines(of input: String) -> String {
    
    return input.replacingOccurrences(of: "\r\n", with: "\n")
                .replacingOccurrences(of: "\r", with: "\n")
}

func tokenize_html(input: String) -> [Token] {
    
    let stream = CharStream(of: normalize_newlines(of: input))
    
    var tokens: [Token] = []
    
    
    
    return tokens
}
