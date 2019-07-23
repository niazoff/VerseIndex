public struct VerseIndex {
  public let chapter: Int
  public let verse: Int
}

extension VerseIndex: Equatable {}
extension VerseIndex: Hashable {}
extension VerseIndex: Codable {}

extension VerseIndex: Comparable {
  public static func < (lhs: VerseIndex, rhs: VerseIndex) -> Bool {
    lhs.chapter < rhs.chapter && lhs.verse < rhs.verse
  }
}

extension VerseIndex: ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: Int...) {
    guard elements.count == 2 else { fatalError() }
    chapter = elements[0]; verse = elements[1]
  }
}
