Class {
	#name : #XSDMaxInclusive,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDMaxInclusive class >> xsdElementName [ 
	^ 'maxInclusive'
]

{ #category : #visiting }
XSDMaxInclusive >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitMaxInclusive: self
]
