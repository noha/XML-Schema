Class {
	#name : #XSDImport,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDImport class >> xsdElementName [ 
	^ 'import'
]

{ #category : #visiting }
XSDImport >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitImport: self
]

{ #category : #accessing }
XSDImport >> namespace [
	^ self attributeAt: #namespace 
]

{ #category : #accessing }
XSDImport >> schemaLocation [
	^ self attributeAt: #schemaLocation
]
