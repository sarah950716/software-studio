//
//  Anagram.swift
//  Anagram
//
//  Created by Jiwon Shin on 2017. 3. 24..
//  Copyright © 2017년 CodersHigh. All rights reserved.
//

import Foundation

class Anagram {
    var word = ""
    
    init(word: String) {
        self.word = word
    }
    
    //char의 ascii값을 리턴하는 함수
    func getAsciiVal(char: Character) -> Int {
        let s = String(char).unicodeScalars
        return Int(s[s.startIndex].value)
    }
    
    //word에 쓰인 알파벳의 등장횟수를 int array로 만들어서 리턴하는 함수
    //alphaCount[i]: ascii값이 i+'a'인 알파벳의 등장횟수
    func countAlphabets(word: String) -> [Int] {
        var alphaCount: [Int] = []
        
        //소문자는 a-z까지 26개가 있으므로 26칸을 잡아줌
        for _ in 0...25 {
            alphaCount.append(0)
        }
        
        let asciiOfa: Int = getAsciiVal(char: "a")
        
        for ch in word.characters {
            //'a'의 등장횟수를 alphaCount[0]에 저장하기 위해 'a'의 ascii값을 빼줌
            let pos: Int = getAsciiVal(char: ch) - asciiOfa
            alphaCount[pos] += 1
        }
        
        return alphaCount
    }
    
    //a와 b가 서로의 anagram이면 true를, 아니면 false를 리턴하는 함수
    func isAnagram(_ a: String, _ b: String) -> Bool {
        let lowerA: String = a.lowercased()
        let lowerB: String = b.lowercased()
        
        //두 string의 길이가 다르면 anagram일 수 없음
        if a.characters.count != b.characters.count {
            return false
        }
        
        //둘이 같은 string이면 anagram이 아님
        if lowerA == lowerB {
            return false
        }
        
        let infoOfA: [Int] = countAlphabets(word: lowerA)
        let infoOfB: [Int] = countAlphabets(word: lowerB)

        //두 string의 모든 알파벳 등장횟수가 같으면 anagram
        //하나라도 등장횟수가 다른 알파벳이 있으면 바로 false를 리턴
        for i in 0..<infoOfA.count {
            if infoOfA[i] != infoOfB[i] {
                return false
            }
        }
        return true
    }
    
    //words중 self.word와 anagram관계인 string들을 배열로 만들어서 리턴하는 함수
    func match(words: [String]) -> [String] {
        var matched: [String] = []
        
        for word in words {
            if isAnagram(word, self.word) {
                matched.append(word)
            }
        }
        
        return matched
    }
}
