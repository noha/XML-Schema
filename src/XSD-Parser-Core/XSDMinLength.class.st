Class {
	#name : #XSDMinLength,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDMinLength class >> xsdElementName [ 
	^ 'minLength'
]

{ #category : #visiting }
XSDMinLength >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitMinLength: self
]
