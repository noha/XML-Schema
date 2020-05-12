Class {
	#name : #XSDNodeFactory,
	#superclass : #XMLNodeFactory,
	#category : #'XSD-Parser-Core-Base'
}

{ #category : #accessing }
XSDNodeFactory >> classForElement: anElement [
	^ super classForElement: anElement
]

{ #category : #accessing }
XSDNodeFactory >> classForElement: aQualifiedName attributes: anAssociationCollection [
self halt.
	^ self elementClass
]

{ #category : #accessing }
XSDNodeFactory >> classForElement: aQualifiedName namespaceURI: aURI [
	self halt.
	^ self elementClass
]

{ #category : #accessing }
XSDNodeFactory >> classForElement: aQualifiedName namespaceURI: aURI attributes: anAssociationCollection [
	self halt.
	^ self elementClass
]

{ #category : #accessing }
XSDNodeFactory >> classForElement: aQualifiedName namespaceURI: aURI localName: aLocalName attributes: anAssociationCollection [
	^ (aURI = 'http://www.w3.org/2001/XMLSchema')
		ifTrue: [ self classForElementNamed: aLocalName "attributes: anAssociationCollection" ]
		ifFalse: [ self elementClass ]
]

{ #category : #'as yet unclassified' }
XSDNodeFactory >> classForElementNamed: aString [ 
	^ XMLElement allSubclasses 
		detect: [ :each | (each respondsTo: #xsdElementName) and: [ each xsdElementName = aString ] ]
		ifNone: [ Error signal: 'Cannot find element class for ', aString ]
]

{ #category : #accessing }
XSDNodeFactory >> documentClass [

	^ XSDDocument
]
