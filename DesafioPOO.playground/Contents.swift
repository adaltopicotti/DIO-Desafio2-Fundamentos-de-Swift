import Cocoa

class Room {
    var number: Int
    var beds: Int
    var occupied: Bool
    
    init(number: Int, beds: Int, occupied: Bool) {
        self.number = number
        self.beds = beds
        self.occupied = occupied
        
    }
    
    func fill() {
       occupied = true
    }
   
    func vacate() {
       occupied = false
    }
}

class Hotel {
    var rooms: [Room] = [
        Room(number: 101, beds: 2, occupied: true),
        Room(number: 102, beds: 3, occupied: false),
        Room(number: 103, beds: 1, occupied: false),
        Room(number: 201, beds: 2, occupied: false),
        Room(number: 202, beds: 3, occupied: true),
        Room(number: 203, beds: 1, occupied: false),
    ]
        
    func emptyRooms() async {
        print("Verificando quartos livres...")
        let empties = rooms.filter { $0.occupied == false }
        
        try? await Task.sleep(nanoseconds: 3_000_000_000)
        
        print("Os quartos livres são: \(empties.map { $0.number })")
    }
    
    func fill(room roomNumber: Int) async {
        print("Aguarde enquanto o check-in é realizado...")
        try? await Task.sleep(nanoseconds: 3_000_000_000)
        if let room = rooms.first(where: { $0.number == roomNumber }) {
            room.fill()
        }
        print("Check-in do quarto \(roomNumber) realizada.")
    }
    
    func vacate(room roomNumber: Int) async {
        print("Aguarde enquanto check-out é realizado...")
        try? await Task.sleep(nanoseconds: 3_000_000_000)
        if let room = rooms.first(where: { $0.number == roomNumber }) {
            room.vacate()
        }
        print("Check-out do quarto \(roomNumber) realizado.")
    }
    
}

var hotel = Hotel()
await hotel.emptyRooms()
await hotel.fill(room: 102)
await hotel.vacate(room: 202)
await hotel.emptyRooms()
