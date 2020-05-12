Class {
	#name : #XSDDetectElementTypeVisitor,
	#superclass : #XSDVisitor,
	#instVars : [
		'foundBlock',
		'startElement'
	],
	#category : #'XSD-Parser-Core-Visitor'
}

{ #category : #'as yet unclassified' }
XSDDetectElementTypeVisitor >> isAComplexType [
	foundBlock value: XSDAnyComplexType 
]

{ #category : #'as yet unclassified' }
XSDDetectElementTypeVisitor >> isASimpleType [
	foundBlock value: XSDAnySimpleType 
]

{ #category : #'as yet unclassified' }
XSDDetectElementTypeVisitor >> onFound: aBlock [ 
	foundBlock := aBlock
]

{ #category : #'as yet unclassified' }
XSDDetectElementTypeVisitor >> visitAnyType: anAnyType [ 
	self isASimpleType 
]

{ #category : #visiting }
XSDDetectElementTypeVisitor >> visitAttribute: aXSDAttribute [ 
	self isAComplexType 
]

{ #category : #visiting }
XSDDetectElementTypeVisitor >> visitChoice: aXSDChoice [ 
	^ self visitElement: aXSDChoice 
]

{ #category : #visiting }
XSDDetectElementTypeVisitor >> visitComplexContent: aXSDComplexContent [ 
	self isAComplexType 
]

{ #category : #visiting }
XSDDetectElementTypeVisitor >> visitSchemaElement: aSchemaElement [
	startElement ifNotNil: [ self isAComplexType ].
	startElement := aSchemaElement.
	(aSchemaElement includesAttribute: #ref)
		ifTrue: [
			^ (aSchemaElement resolveElement: aSchemaElement reference) acceptNodeVisitor: self ].
	(aSchemaElement includesAttribute: #type)
		ifTrue: [
			^ (aSchemaElement resolveElement: aSchemaElement typeName) acceptNodeVisitor: self ].
	^ self visitElement: aSchemaElement 
]

{ #category : #'as yet unclassified' }
XSDDetectElementTypeVisitor >> visitSequence: aXSDSequence [ 
	self isAComplexType
]

{ #category : #visiting }
XSDDetectElementTypeVisitor >> visitSimpleContent: aXSDSimpleContent [ 
	self isASimpleType
]

{ #category : #'as yet unclassified' }
XSDDetectElementTypeVisitor >> visitSimpleType: aXSDSimpleType [ 
	self isASimpleType 
]
