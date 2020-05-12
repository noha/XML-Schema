Class {
	#name : #XSDMinInclusive,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDMinInclusive class >> xsdElementName [ 
	^ 'minInclusive'
]

{ #category : #visiting }
XSDMinInclusive >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitMinInclusive: self
]
