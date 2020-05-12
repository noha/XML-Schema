Class {
	#name : #PluggableTypeCollection,
	#superclass : #PluggableTypeValue,
	#instVars : [
		'elements'
	],
	#category : #'XSD-Parser-Core-PluggableType'
}

{ #category : #visiting }
PluggableTypeCollection >> acceptPluggableVisitor: aVisitor [
	self halt.
]

{ #category : #accessing }
PluggableTypeCollection >> add: anObject [
	elements add: anObject. 
]

{ #category : #'as yet unclassified' }
PluggableTypeCollection >> addAll: aCollection [
	elements addAll: aCollection. 
]

{ #category : #accessing }
PluggableTypeCollection >> addUsing: aBlock [
	"create a new object of the nested type and hand it over
	to the given block for initialization. Add the return value in
	the internal collection."
	| newValue |
	newValue := type basicType type newValue.
	aBlock value: newValue.
	^ self add: newValue
]

{ #category : #finding }
PluggableTypeCollection >> basicFind: aKey [
	^ self find: aKey in: elements
]

{ #category : #iterating }
PluggableTypeCollection >> collect: aBlock [
	^ elements collect: aBlock
]

{ #category : #accessing }
PluggableTypeCollection >> elements [
	^ elements
]

{ #category : #accessing }
PluggableTypeCollection >> first [
	^ elements first
]

{ #category : #initialization }
PluggableTypeCollection >> initialize [
	super initialize.
	elements := OrderedCollection new
]

{ #category : #initialize }
PluggableTypeCollection >> initializeFrom: anObject [ 
	
]

{ #category : #testing }
PluggableTypeCollection >> isEmpty [
	^ elements isEmpty
]

{ #category : #testing }
PluggableTypeCollection >> isEmptyOrNil [
	^ elements isEmptyOrNil 
]

{ #category : #accessing }
PluggableTypeCollection >> size [
	^ elements size
]

{ #category : #accessing }
PluggableTypeCollection >> value: aCollection [
	elements := aCollection asOrderedCollection
]
