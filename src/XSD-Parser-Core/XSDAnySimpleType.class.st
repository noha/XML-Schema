Class {
	#name : #XSDAnySimpleType,
	#superclass : #XSDAnyType,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDAnySimpleType class >> newValue [
	^ PluggableTypePrimitiveValue new
]

{ #category : #testing }
XSDAnySimpleType >> isXSDPrimitive [ 
	^ true
]

{ #category : #'as yet unclassified' }
XSDAnySimpleType >> newValue [
	^ PluggableTypePrimitiveValue new
]

{ #category : #'as yet unclassified' }
XSDAnySimpleType >> treeViewChildren [
	^ #()
]

{ #category : #'as yet unclassified' }
XSDAnySimpleType >> treeViewLabelText [
	^ self class name
]
