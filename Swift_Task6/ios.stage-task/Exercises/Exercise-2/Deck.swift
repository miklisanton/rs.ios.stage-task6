
import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {
    
    //MARK: - Properties
    
    var cards = [Card]()
    var type: DeckType
    var trump: Suit?
    
    var total:Int {
        return type.rawValue
    }
}

extension Deck {
    
    init(with type: DeckType) {
        self.type = type
        cards = createDeck(suits: Suit.allCases, values: Value.allCases)
    }
    
    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        
        let cards = suits.reduce([] as [Card], { result, suit in
            let cards = values.map() {  Card(suit: suit, value: $0) }
            return result + cards
        })
        
        return cards;
    }
    
    public mutating func shuffle() {
        cards = cards.shuffled()
    }
    
    public mutating func defineTrump() {
        if let topCard = cards.first {
            trump = topCard.suit
            setTrumpCards(for: topCard.suit)
        }
    }
    
    public mutating func initialCardsDealForPlayers(players: [Player]) {
        if players.count < 7 {
            for player in players {
                player.hand = Array(cards[0..<6])
                cards.removeFirst(6)
            }
        }
    }
    
    public mutating func setTrumpCards(for suit:Suit) {
        for i in 0..<cards.count {
            cards[i].isTrump = cards[i].suit == suit
        }
    }
}

