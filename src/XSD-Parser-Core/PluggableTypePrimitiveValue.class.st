Class {
	#name : #PluggableTypePrimitiveValue,
	#superclass : #PluggableTypeValue,
	#instVars : [
		'value'
	],
	#category : #'XSD-Parser-Core-PluggableType'
}

{ #category : #visiting }
PluggableTypePrimitiveValue >> acceptPluggableVisitor: aVisitor [
	^ aVisitor visitPrimitive: self 
]

{ #category : #accessing }
PluggableTypePrimitiveValue >> contents [
	^ value
]

{ #category : #accessing }
PluggableTypePrimitiveValue >> contents: anObject [
	value := anObject
]

{ #category : #'as yet unclassified' }
PluggableTypePrimitiveValue >> supportTreeView [
	^ false
]

{ #category : #'as yet unclassified' }
PluggableTypePrimitiveValue >> supportsTreeView [
	^ false
]

{ #category : #'as yet unclassified' }
PluggableTypePrimitiveValue >> treeViewChildren [
	^ #()
]

{ #category : #'as yet unclassified' }
PluggableTypePrimitiveValue >> treeViewLabelText [
	^ value  asString
]
