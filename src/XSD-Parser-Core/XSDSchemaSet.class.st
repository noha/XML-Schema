Class {
	#name : #XSDSchemaSet,
	#superclass : #Object,
	#instVars : [
		'schemas'
	],
	#category : #'XSD-Parser-Core-Base'
}

{ #category : #adding }
XSDSchemaSet >> add: aSchema [
	aSchema global: self.
	schemas add: aSchema
]

{ #category : #'as yet unclassified' }
XSDSchemaSet >> findElementNamed: aString [ 
	schemas do: [ :schema |
		(schema resolveElement: aString) ifNotNil: [ :element |
			^ element ] ].
	NotFound signal: 'no element found for ', aString asString 
]

{ #category : #enumerating }
XSDSchemaSet >> flatCollect: aBlock [ 
	^ schemas flatCollect: aBlock
]

{ #category : #initialization }
XSDSchemaSet >> initialize [
	super initialize.
	schemas := OrderedCollection new
]

{ #category : #'as yet unclassified' }
XSDSchemaSet >> resolveElement: aName namespace: aNamespace [
	| candidated |
	candidated := schemas select: [ :each | each defaultNamespace = aNamespace ].
	self halt.
]

{ #category : #'as yet unclassified' }
XSDSchemaSet >> resolveElement: aName namespace: aNamespace schema: aSchema [
	| candidated |
	(aName includes: $:) ifTrue: [ self halt ].
	candidated := schemas select: [ :each | each defaultNamespace = aNamespace ].
	candidated remove: aSchema ifAbsent: [].
	candidated do: [ :schema |
		(schema resolveLocalElement: aName ifAbsent: [ nil ]) ifNotNil: [ :element |
			^ element ] ].
	self halt.
]
