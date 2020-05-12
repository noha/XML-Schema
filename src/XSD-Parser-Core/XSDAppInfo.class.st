Class {
	#name : #XSDAppInfo,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDAppInfo class >> xsdElementName [ 
	^ 'appinfo'
]

{ #category : #visiting }
XSDAppInfo >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitAppInfo: self
]
