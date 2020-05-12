Class {
	#name : #XSDDocument,
	#superclass : #XMLDocument,
	#category : #'XSD-Parser-Core-Base'
}

{ #category : #'as yet unclassified' }
XSDDocument >> resolveElement: aString [ 
	^ self root resolveElement: aString
]

{ #category : #accessing }
XSDDocument >> targetNamespace [
	self shouldBeImplemented.
]
