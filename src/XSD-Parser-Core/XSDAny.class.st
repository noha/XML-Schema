Class {
	#name : #XSDAny,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDAny class >> xsdElementName [ 
	^ 'any'
]

{ #category : #visiting }
XSDAny >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitAny: self
]
