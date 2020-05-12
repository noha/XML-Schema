Class {
	#name : #XSDMaxLength,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDMaxLength class >> xsdElementName [ 
	^ 'maxLength'
]

{ #category : #visiting }
XSDMaxLength >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitMaxLength: self
]
