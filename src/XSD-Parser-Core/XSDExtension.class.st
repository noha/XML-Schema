Class {
	#name : #XSDExtension,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDExtension class >> xsdElementName [ 
	^ 'extension'
]

{ #category : #visiting }
XSDExtension >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitExtension: self
]
