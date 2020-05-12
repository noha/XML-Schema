Class {
	#name : #XSDDocumentation,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDDocumentation class >> xsdElementName [ 
	^ 'documentation'
]

{ #category : #visiting }
XSDDocumentation >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitDocumentation: self
]
