
import UIKit
import PySerializing
import PythonCore

extension NSItemProvider: PySerializing.PySerialize {
    public var pyPointer: PyPointer {
        Self.asPyPointer(self)
    }
}
