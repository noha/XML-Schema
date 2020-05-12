Class {
	#name : #XSDSimpleType,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDSimpleType class >> xsdElementName [ 
	^ 'simpleType'
]

{ #category : #visiting }
XSDSimpleType >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitSimpleType: self
]
