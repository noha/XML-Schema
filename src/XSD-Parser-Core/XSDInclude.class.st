Class {
	#name : #XSDInclude,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDInclude class >> xsdElementName [ 
	^ 'include'
]

{ #category : #visiting }
XSDInclude >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitInclude: self
]

{ #category : #accessing }
XSDInclude >> schemaLocation [
	^ self attributeAt: #schemaLocation
]
