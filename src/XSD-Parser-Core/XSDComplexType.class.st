Class {
	#name : #XSDComplexType,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDComplexType class >> xsdElementName [ 
	^ 'complexType'
]

{ #category : #visiting }
XSDComplexType >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitComplexType: self
]

{ #category : #testing }
XSDComplexType >> isGlobal [
	^ self attributes includesKey: #name
]

{ #category : #'as yet unclassified' }
XSDComplexType >> newValue [
	^ PluggableTypeObject new 
		type: self
]
