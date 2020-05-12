Class {
	#name : #PluggableXMLVisitor,
	#superclass : #PluggableVisitor,
	#instVars : [
		'document',
		'currentElement'
	],
	#category : #'XSD-Parser-Core-PluggableType'
}

{ #category : #'as yet unclassified' }
PluggableXMLVisitor >> document [
	^ document
]

{ #category : #initialization }
PluggableXMLVisitor >> initialize [
	super initialize.
	document := XSDDocument new
]

{ #category : #visiting }
PluggableXMLVisitor >> processElement: anElement [
	| previous |
	previous := currentElement.
	[ self visit: anElement ]
		ensure: [ currentElement := previous ]
	
]

{ #category : #visiting }
PluggableXMLVisitor >> visit: anObject name: aString [
	document root: (anObject newElement name: aString; yourself).
	currentElement := document root.
	^ self visit: anObject  
]

{ #category : #visiting }
PluggableXMLVisitor >> visitObject: anObject [
	
	| newElement previous |
	anObject map keysAndValuesDo: [ :name :object |
		newElement := object newElement
			name: name;
			yourself.
		currentElement addNode: newElement.
		previous := currentElement.
		currentElement := newElement.
		[ self visit: object ]
			ensure: [ currentElement := previous ] ]
]

{ #category : #visiting }
PluggableXMLVisitor >> visitPrimitive: anObject [
	currentElement addNode: (XMLString string: anObject contents)
]
