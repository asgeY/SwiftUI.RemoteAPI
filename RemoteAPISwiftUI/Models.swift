import Foundation
import SwiftUI

struct Todo : Codable, Identifiable {
    var id: Int
    var userId: Int
    var title: String
    var completed: Bool
}
