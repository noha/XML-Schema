Class {
	#name : #XSDEnumeration,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDEnumeration class >> xsdElementName [ 
	^ 'enumeration'
]

{ #category : #visiting }
XSDEnumeration >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitEnumeration: self
]
