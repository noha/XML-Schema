Class {
	#name : #XSDRestriction,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDRestriction class >> xsdElementName [ 
	^ 'restriction'
]

{ #category : #visiting }
XSDRestriction >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitRestriction: self
]
