Class {
	#name : #XSDSimpleContent,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDSimpleContent class >> xsdElementName [ 
	^ 'simpleContent'
]

{ #category : #visiting }
XSDSimpleContent >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitSimpleContent: self
]
