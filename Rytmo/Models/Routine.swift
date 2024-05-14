import Foundation

struct Routine: Identifiable, Hashable, Comparable {
    var id = UUID()
    var name: String
    var duration: TimeInterval

    // Hashable protokolüne uyması için gerekli
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Routine, rhs: Routine) -> Bool {
        return lhs.id == rhs.id
    }

    // Comparable protokolüne uyması için gerekli
    static func < (lhs: Routine, rhs: Routine) -> Bool {
        return lhs.name < rhs.name
    }
}
