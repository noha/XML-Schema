Class {
	#name : #XSDPattern,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDPattern class >> xsdElementName [ 
	^ 'pattern'
]

{ #category : #visiting }
XSDPattern >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitPattern: self
]
