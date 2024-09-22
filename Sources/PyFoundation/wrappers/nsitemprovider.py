from swift_tools.swift_types import * # type: ignore
#from typing import Optional,  Generic

@wrapper(py_init=False)


class NSItemProvider:

    #suggestedName = WrappedProperty(str | None)
    suggestedName: str | None
    #suggestedName = property(str)
#     #preferredPresentationSize = property(list[float])

    registeredTypeIdentifiers = WrappedProperty(list[str], readonly=True) 
    
    def loadFileRepresentation(self,forTypeIdentifier: str, completionHandler: CallableOnce[ [Optional[URL], Optional[Error]], None ]): ...

    @no_labels(id=True)
    def hasItemConformingToTypeIdentifier(self, id: str) -> bool: ...

    def loadInPlaceFileRepresentation(self, forTypeIdentifier: str, completionHandler: CallableOnce[ [URL | None, bool, Error | None], None]): ...

    def loadDataRepresentation(self, forTypeIdentifier: str, completionHandler: CallableOnce[[Optional[data],Optional[Error]], None]): ...
