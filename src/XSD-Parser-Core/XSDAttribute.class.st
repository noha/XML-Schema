Class {
	#name : #XSDAttribute,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDAttribute class >> xsdElementName [ 
	^ 'attribute'
]

{ #category : #visiting }
XSDAttribute >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitAttribute: self
]
