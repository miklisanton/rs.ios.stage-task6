//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        if hand == nil{
            return false
        }
        for cardIn in hand! {
            if cardIn.value == card.value {
                return true
            }
        }
        return false
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        for cardIn in hand! {
                    for cardOnTable in table {
                        if cardIn.value == cardOnTable.value.value || cardIn.value == cardOnTable.key.value{
                            return true
                        }
                    }
                }
                return false
            }
    }
