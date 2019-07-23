public struct VerseIndexCollection {
  private let verseIndices: [VerseIndex]
  private let verseIndicesIndexDictionary: [VerseIndex: Int]
  
  public init(_ verseRangeDictionary: [Int: ClosedRange<Int>]) {
    verseIndices = verseRangeDictionary.sorted { $0.0 < $1.0 }
      .flatMap { chapter, verseRange in verseRange.map { [chapter, $0] } }
    verseIndicesIndexDictionary = .init(uniqueKeysWithValues:
      verseIndices.enumerated().map { ($1, $0) })
  }
}

extension VerseIndexCollection: Collection {
  public var startIndex: Int { verseIndices.startIndex }
  public var endIndex: Int { verseIndices.endIndex }
  
  public subscript(position: Int) -> VerseIndex { verseIndices[position] }
  
  public func index(after i: Int) -> Int { verseIndices.index(after: i) }
}

extension VerseIndexCollection: ExpressibleByDictionaryLiteral {
  public init(dictionaryLiteral elements: (Int, ClosedRange<Int>)...) {
    self.init(.init(uniqueKeysWithValues: elements))
  }
}

public extension VerseIndexCollection {
  subscript(verseIndexRange: ClosedRange<VerseIndex>) -> Slice<VerseIndexCollection> {
    guard let lowerBoundPosition = verseIndicesIndexDictionary[verseIndexRange.lowerBound],
      let upperBoundPosition = verseIndicesIndexDictionary[verseIndexRange.upperBound]
      else { fatalError() }
    return self[lowerBoundPosition...upperBoundPosition]
  }
}
