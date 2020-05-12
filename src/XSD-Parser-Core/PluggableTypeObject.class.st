Class {
	#name : #PluggableTypeObject,
	#superclass : #PluggableTypeValue,
	#instVars : [
		'parent',
		'map',
		'selfExpanding'
	],
	#category : #'XSD-Parser-Core-PluggableType'
}

{ #category : #visiting }
PluggableTypeObject >> acceptPluggableVisitor: aVisitor [
	^ aVisitor visitObject: self
]

{ #category : #accessing }
PluggableTypeObject >> at: aKey [
	^ self 
		at: aKey 
		ifAbsent: [ KeyNotFound signalFor: aKey ]
]

{ #category : #accessing }
PluggableTypeObject >> at: aKey ifAbsent: aBlock [
	"a value can be one of three types: primitive, adaptive type or encoded value. In the
	first case we want to return the unwrapped value. This is to deliver a convenient API
	where reading values is easy. In the latter two type cases we just deliver themselves.
	If it is a adaptive type we return it so we can have message chaining while accessing
	the structure. If it is an encoded value we need to return it as a intact whole"
	| fieldType  |
	map at: aKey ifPresent: [ : value |
		^ value ].  
	
	"lookup field type to trigger an early exception if a field is not defined
	for this type"
	fieldType := self basicTypeAt: aKey.
	
	^ selfExpanding 
		ifTrue: [ 
			"(fieldType isAsn1Primitive and: [ fieldType isAsn1ExternalType not ]) ifTrue: [ ^ nil ]."
			self expandFieldNamed: aKey type: fieldType ] 
		ifFalse: [ aBlock value] 

]

{ #category : #accessing }
PluggableTypeObject >> at: aKey put: anObject [
	| typeForKey |

	typeForKey := type 
		elementAt: aKey 
		ifNone: [ NotFound signal: 'no field ', aKey asString,' found' ].
	(aKey = 'contents') ifTrue: [  self halt ].
	(self expandFieldNamed: aKey type: typeForKey) contents: anObject.
	
	^ anObject
]

{ #category : #accessing }
PluggableTypeObject >> baseValueAt: aString [
	^ ( self privAt: aString ) baseValue
]

{ #category : #accessing }
PluggableTypeObject >> baseValueAt: aString put: anObject [
	^ self 
		expandFieldNamed: aString
		type: (self basicTypeAt: aString)
		baseValue: anObject
]

{ #category : #finding }
PluggableTypeObject >> basicFind: aKey [
	map 
		at: aKey 
		ifPresent: [:elem| ^ elem ].
	^ self find: aKey in: map values  
]

{ #category : #accessing }
PluggableTypeObject >> basicTypeAt: aKey [
	^ self 
		basicTypeAt: aKey
		ifAbsent: [ PluggableTypeInvalidFieldName signal: 'cannot find field ', aKey asString ]
]

{ #category : #accessing }
PluggableTypeObject >> basicTypeAt: aKey ifAbsent: aBlock [
	^ type 
		elementAt: aKey 
		ifNone: aBlock
]

{ #category : #accessing }
PluggableTypeObject >> beSelfExpanding [
	selfExpanding := true
]

{ #category : #accessing }
PluggableTypeObject >> beStrict [
	selfExpanding := false
]

{ #category : #accessing }
PluggableTypeObject >> contents [
	^ self
]

{ #category : #copying }
PluggableTypeObject >> copyContentTo: anObject [ 
	anObject setMap: map
]

{ #category : #accessing }
PluggableTypeObject >> doesNotUnderstand: aMessage [
	(aMessage arguments size = 0) ifTrue: [ 
		^ self 
			at: (self mapKeyForMessage: aMessage) 
			ifAbsent: [ nil ] ].
	(aMessage arguments size = 1) ifTrue: [ 
		self 
			at: (self mapKeyForMessage: aMessage) allButLast 
			put: aMessage arguments first.
		^ self  ].
	^ super doesNotUnderstand: aMessage
]

{ #category : #accessing }
PluggableTypeObject >> expandAt: aString using: aBlock [
	aBlock value: (self expandFieldNamed: aString)
]

{ #category : #accessing }
PluggableTypeObject >> expandFieldNamed: aFieldName [
	^ self 
		expandFieldNamed: aFieldName 
		type: (self basicTypeAt: aFieldName) 
]

{ #category : #accessing }
PluggableTypeObject >> expandFieldNamed: aFieldName type: aFieldType [

	"if a value for the given fieldName is present just return it"
	map at: aFieldName ifPresent: [ :v | ^ v ].

	"create a value from the determined type and set the field with value"	
	^ map at: aFieldName put: (
		aFieldType newValue
			initializeFrom: self )
]

{ #category : #accessing }
PluggableTypeObject >> expandFieldNamed: aFieldName type: aFieldType baseValue: aValue [

	"if a value for the given fieldName is present just return it"
	map at: aFieldName ifPresent: [ :v | ^ v ].

	"create a value from the determined type and set the field with value"	
	^ map at: aFieldName put: (
		(aFieldType newBaseValue: aValue)
			initializeFrom: self )
]

{ #category : #accessing }
PluggableTypeObject >> expandParent [
	self halt.
]

{ #category : #testing }
PluggableTypeObject >> hasSameType: aType [ 
	^ aType == type 
]

{ #category : #testing }
PluggableTypeObject >> includesKey: anObject [
	^ map includesKey: anObject
]

{ #category : #initialization }
PluggableTypeObject >> initialize [
	super initialize.
	map := SmallDictionary new.
	selfExpanding := false
]

{ #category : #initialize }
PluggableTypeObject >> initializeFrom: anObject [
	parent := anObject.
	selfExpanding := anObject isSelfExpanding
]

{ #category : #testing }
PluggableTypeObject >> isSelfExpanding [
	^ selfExpanding 
]

{ #category : #accessing }
PluggableTypeObject >> keys [
	^ map keys
]

{ #category : #accessing }
PluggableTypeObject >> keysAndValuesDo: aBlock [
	type keys do: [ :key |
		map at: key ifPresent: [:value| aBlock value: key value: value ] ]
]

{ #category : #accessing }
PluggableTypeObject >> map [
	^ map
]

{ #category : #testing }
PluggableTypeObject >> matchesType: aType [
	^ { ASN1SequenceType . ASN1ChoiceType } includes: aType class
]

{ #category : #'as yet unclassified' }
PluggableTypeObject >> nameOf: anObject [
	^ map keyAtValue: anObject
]

{ #category : #accessing }
PluggableTypeObject >> parent [
	^ parent ifNil: [ 
			self isSelfExpanding ifTrue: [ 
				self expandParent ] ]
]

{ #category : #accessing }
PluggableTypeObject >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
PluggableTypeObject >> privAt: aKey [ 
	^ map at: aKey
]

{ #category : #accessing }
PluggableTypeObject >> privAt: aKey ifAbsent: aBlock [
	^ map at: aKey ifAbsent: aBlock
]

{ #category : #accessing }
PluggableTypeObject >> privAt: aKey put: anObject [

 	^ map at: aKey put: anObject.

]

{ #category : #removing }
PluggableTypeObject >> removeKey: anObject [
	^ map removeKey: anObject
]

{ #category : #'as yet unclassified' }
PluggableTypeObject >> removeKey: anObject ifAbsent: aBlock [ 
	^ map removeKey: anObject ifAbsent: aBlock
]

{ #category : #replacing }
PluggableTypeObject >> replaceContentAt: key with: anObject [
	self removeKey: key ifAbsent: [].
	(self expandFieldNamed: key) replaceContentFrom: anObject
]

{ #category : #replacing }
PluggableTypeObject >> replaceContentFrom: anObject [
	(anObject hasSameType: type) ifFalse: [ Error signal: 'cannot exchange content from different types' ].
	anObject copyContentTo: self.
]

{ #category : #'class membership' }
PluggableTypeObject >> respondsTo: aSymbol [
	(aSymbol isUnary and: [ map includesKey: aSymbol asString ]) ifTrue: [ ^ true ].
	^ super respondsTo: aSymbol 
]

{ #category : #accessing }
PluggableTypeObject >> selfExpanding: aBoolean [
	selfExpanding := aBoolean 
]

{ #category : #accessing }
PluggableTypeObject >> setMap: aDictionary [
	map := aDictionary
]

{ #category : #accessing }
PluggableTypeObject >> size [
	^ map size
]

{ #category : #accessing }
PluggableTypeObject >> soleValue [
	^ map values first
]

{ #category : #'as yet unclassified' }
PluggableTypeObject >> supportsTreeView [ 
	^ true
]

{ #category : #'as yet unclassified' }
PluggableTypeObject >> treeViewChildren [ 
	^ map values
]

{ #category : #'as yet unclassified' }
PluggableTypeObject >> treeViewLabelText [
	parent ifNil: [ ^ type attributeAt: #name ].
	^ parent nameOf: self

]
