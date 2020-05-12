Class {
	#name : #XSDMaxExclusive,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDMaxExclusive class >> xsdElementName [ 
	^ 'maxExclusive'
]

{ #category : #visiting }
XSDMaxExclusive >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitMaxExclusive: self
]
