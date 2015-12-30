/*
 * Option.swift
 * Copyright (c) 2014 Ben Gollmer.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

public enum PositionalType {
  case Bool
  case Int
  case String
}

public enum PositionalCount {
  case ZeroOrMore
  case OneOrMore
  case One
  case Optional
}

/**
 * The base class for a command-line option.
 */
public class Positional {
  public let title: String?
  public let metavar: String?
  public let type: PositionalType
  public let count: PositionalCount
  // public let required: Bool
  public let helpMessage: String
  
  public var value: Any?

  /** True if the option was set when parsing command-line arguments */
  public var wasSet: Bool {
    return false
  }
  
  public var positionalDescription: String {
      return "[...]"
  }
  
  private init(_ title: String?, _ metavar: String?, _ type: PositionalType, _ count: PositionalCount, _ helpMessage: String) {
    if let mv = metavar {
      assert(mv.characters.count == 1, "Metavar must be a single character")
      assert(Int(mv) == nil && mv.toDouble() == nil, "Metavar cannot be a numeric value")
    }
    
    self.title = title
    self.metavar = metavar
    self.type = type
    self.count = count
    self.helpMessage = helpMessage
    // self.required = required
  }
  
  /* The optional casts in these initalizers force them to call the private initializer. Without
   * the casts, they recursively call themselves.
   */
  
  // /** Initializes a new Option that has both long and short flags. */
  // public convenience init(shortFlag: String, longFlag: String, required: Bool = false, helpMessage: String) {
  //   self.init(shortFlag as String?, longFlag, required, helpMessage)
  // }
  //
  // /** Initializes a new Option that has only a short flag. */
  // public convenience init(shortFlag: String, required: Bool = false, helpMessage: String) {
  //   self.init(shortFlag as String?, nil, required, helpMessage)
  // }
  //
  // /** Initializes a new Option that has only a long flag. */
  // public convenience init(longFlag: String, required: Bool = false, helpMessage: String) {
  //   self.init(nil, longFlag as String?, required, helpMessage)
  // }
  
  /** Initializes a new Positional that has only a long flag. */
  public convenience init(title: String, metavar: String?, type: PositionalType = .String, count: PositionalCount = .One, helpMessage: String) {
    self.init(title as String?, metavar as String?, type, count, helpMessage)
  }
  
  // func flagMatch(flag: String) -> Bool {
  //   return flag == shortFlag || flag == longFlag
  // }
  
  func setValue(values: [String]) -> Bool {
    return false
  }
}
