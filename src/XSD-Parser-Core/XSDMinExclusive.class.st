Class {
	#name : #XSDMinExclusive,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDMinExclusive class >> xsdElementName [ 
	^ 'minExclusive'
]

{ #category : #visiting }
XSDMinExclusive >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitMinExclusive: self
]
