//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        var op : String = ""
        if Int(args[args.count - 1]) == nil {
            op = args[args.count - 1]
        } else {
            op = args[args.count - 2]
        }
        switch op {
        case "+":
            return Int(args[0])! + Int(args[2])!
        case "-":
            return Int(args[0])! - Int(args[2])!
        case "*":
            return Int(args[0])! * Int(args[2])!
        case "/":
            return Int(args[0])! / Int(args[2])!
        case "%":
            return Int(args[0])! % Int(args[2])!
        case "count":
            if args.count > 1 {
                return args.count - 1
            }
        case "avg":
            if args.count > 1 {
                var sum = 0;
                for index in 0..<args.count - 1 {
                    sum += Int(args[index])!
                }
                return sum / (args.count - 1)
            }
        case "fact":
            if args[0] == "1" || args[0] == "0" {
                return 1
            } else if args.count > 1 {
                var fact = 1
                for x in 1...Int(args[0])! {
                    fact *= x
                }
                return fact
            }
        default:
            print("Unexpected error occured")
        }
        return 0
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

