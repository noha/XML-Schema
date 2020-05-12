Class {
	#name : #XSDComplexContent,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDComplexContent class >> xsdElementName [ 
	^ 'complexContent'
]

{ #category : #visiting }
XSDComplexContent >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitComplexContent: self
]
