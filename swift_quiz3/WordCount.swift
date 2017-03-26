//
//  WordCount.swift
//  WordCount
//
//  Created by Jiwon Shin on 2017. 3. 24..
//  Copyright © 2017년 CodersHigh. All rights reserved.
//

import Foundation

class WordCount {
    var words: String
   
    init(words: String) {
        self.words = words
    }
    
    //char가 알파벳 소문자나 한자리 숫자이면 true를 아니면 false를 리턴하는 함수
    func isLetter(_ char: Character) -> Bool {
        if char >= "0" && char <= "9" {
            return true
        } else if char >= "a" && char <= "z" {
            return true
        } else {
            return false
        }
    }
    
    func count() -> [String:Int] {
        var word: String = ""
        var wordsDic: [String:Int] = [:]
        
        //단어를 띄어쓰기 기준으로 파싱하며 해당단어의 등장횟수를 wordsDic에 저장
        for char in  words.characters {
            let lowerCh = String(char).lowercased()
            
            if lowerCh == " " && word != "" {
                //등장한 적이 있는 단어인 경우 등장횟수를 1 늘려줌
                if let wordCnt = wordsDic[word]  {
                    wordsDic[word] = wordCnt + 1
                } else {
                    wordsDic[word] = 1
                }
                //파싱 중인 단어 초기화
                word = ""
            //문자가 한자리 숫자이거나 소문자 알파벳인 경우에만 단어에 포함
            } else if isLetter(Character(lowerCh)){
                word.append(lowerCh)
            }
        }
        
        //마지막이 띄어쓰기로 끝나지 않은 문자열이라면 최종적으로 파싱된 단어의 등장횟수는 wordsDic에 포함돼있지 않기 때문에
        //따로 처리해줘야 함
        if word != "" {
            if wordsDic[word] != nil {
                wordsDic[word]! += 1
            } else {
                wordsDic[word] = 1
            }
        }
        
        return wordsDic
    }
}
