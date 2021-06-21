import Foundation

class CoronaClass {
 
     var seats = [Int]()
     let n: Int
    
     init(n: Int) {
        self.n = n
     }
     
     func seat() -> Int {
        if seats.count == 0 {
            seats.append(0)
            return 0
        }
        if seats.count == 1 {
            seats.append(n - 1)
            return n - 1
        }
        var length = 0
        var maxLengthIndex = 0
        for index in 0...seats.count - 2 {
            if length  + 1 < seats[index + 1] - seats[index] {
                length = seats[index + 1] - seats[index]
                maxLengthIndex = index
            }
        }
        let out = seats[maxLengthIndex] + (seats[maxLengthIndex + 1] - seats[maxLengthIndex]) / 2
        seats.append(out)
        seats.sort()
        return out
     }
     
     func leave(_ p: Int) {
        seats.remove(at: seats.firstIndex(of: p)!)
     }
}
