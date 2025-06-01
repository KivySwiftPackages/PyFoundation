
import UIKit
import PySerializing
import PythonCore
import PySwiftObject
import PySwiftKit
import PySwiftWrapper

@PyClassByExtension(expr: """
    open var totalUnitCount: Int64

    open var completedUnitCount: Int64

    open var localizedDescription: String?

    open var localizedAdditionalDescription: String?

    open var isCancellable: Bool

    open var isPausable: Bool

    open var isCancelled: Bool { get }

    open var isPaused: Bool { get }

    open var isIndeterminate: Bool { get }

    open var fractionCompleted: Double { get }

    open var isFinished: Bool { get }

    open func cancel()

    open func pause()

    @available(iOS 9.0, *)
    open func resume()

    open var fileURL: URL?

    @available(macOS 10.13, iOS 11.0, watchOS 4.0, tvOS 11.0, *)
    public var estimatedTimeRemaining: TimeInterval?

    @available(macOS 10.13, iOS 11.0, watchOS 4.0, tvOS 11.0, *)
    public var throughput: Int?

    @available(macOS 10.13, iOS 11.0, watchOS 4.0, tvOS 11.0, *)
    public var fileTotalCount: Int?

    @available(macOS 10.13, iOS 11.0, watchOS 4.0, tvOS 11.0, *)
    public var fileCompletedCount: Int?
""")
extension Progress: PySerializing.PySerialize {
    
    
    
    public var pyPointer: PyPointer {
        return .None
    }
}

@PyClassByExtension(expr: """
    open var registeredTypeIdentifiers: [String] { get }
    open func hasItemConformingToTypeIdentifier(_ typeIdentifier: String) -> Bool
    open var suggestedName: String?

""")
extension NSItemProvider: PySerializing.PySerialize {
    
    @PyMethod
    func loadDataRepresentation(typeIdentifier: String, completionHandler: @escaping (Data?, (any Error)?) -> Void) -> Progress {
        loadDataRepresentation(forTypeIdentifier: typeIdentifier, completionHandler: completionHandler)
    }
    
    @PyMethod
    func loadFileRepresentation(typeIdentifier: String, completionHandler: @escaping (URL?, (any Error)?) -> Void) -> Progress {
        loadFileRepresentation(forTypeIdentifier: typeIdentifier, completionHandler: completionHandler)
    }
    
    @PyMethod
    func loadInPlaceFileRepresentation(typeIdentifier: String, completionHandler: @escaping (URL?, Bool, (any Error)?) -> Void) -> Progress {
        loadInPlaceFileRepresentation(forTypeIdentifier: typeIdentifier, completionHandler: completionHandler)
    }
    
    func registerDataRepresentation(typeIdentifier: String, visibility: NSItemProviderRepresentationVisibility, loader: @escaping @Sendable (@escaping (Data?, (any Error)?) -> Void) -> Progress?) {
        registerDataRepresentation(forTypeIdentifier: typeIdentifier, visibility: visibility, loadHandler: loader)
    }
    
    public var pyPointer: PyPointer {
        Self.asPyPointer(self)
    }
}
