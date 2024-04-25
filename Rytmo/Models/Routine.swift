import Foundation

struct Routine: Identifiable {  // Make it conform to Identifiable
    let id = UUID()
    let name: String
    let segments: [RoutineSegment]
}

struct RoutineSegment {
    let duration: TimeInterval  // Duration in seconds
    let segmentType: SegmentType
}

enum SegmentType {
    case work, rest
}


extension Routine {
    static let sampleRoutines: [Routine] = [
        Routine(name: "Quick Focus", segments: [
            RoutineSegment(duration: 1500, segmentType: .work), // 25 minutes
            RoutineSegment(duration: 300, segmentType: .rest)  // 5 minutes
        ]),
        // ... Add 1-2 more sample routines if you like
    ]
}
