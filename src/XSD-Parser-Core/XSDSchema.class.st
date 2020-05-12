Class {
	#name : #XSDSchema,
	#superclass : #XSDBasicElement,
	#instVars : [
		'global'
	],
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDSchema class >> xsdElementName [
	^ 'schema'
]

{ #category : #visiting }
XSDSchema >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitSchema: self
]

{ #category : #'as yet unclassified' }
XSDSchema >> findXSDElementNamed: aName [

	^ self 
		allElementsDetect: [:each | (each attributeAt: #name) endsWith: aName ]
		ifNone: [ 
			global 
				resolveElement: (self localNameForName: aName) 
				namespace: (self namespaceForName: aName)
				schema: self  ]
]

{ #category : #accessing }
XSDSchema >> global [
	^ global
]

{ #category : #accessing }
XSDSchema >> global: anObject [
	global := anObject
]

{ #category : #'as yet unclassified' }
XSDSchema >> includesNamespace: aString [ 
	(aString = self namespaceScope xmlNamespaceURI) ifTrue: [ 
		^ true ].
	self halt. 
]

{ #category : #'as yet unclassified' }
XSDSchema >> localNameForName: aString [ 
	^ (aString includes: $:) 
		ifTrue: [ ($: split: aString) second ]
		ifFalse: [ aString ]
]

{ #category : #'as yet unclassified' }
XSDSchema >> namespaceForName: aString [ 
	^ (aString includes: $:) 
		ifTrue: [ 
			self resolvePrefix: ($: split: aString) first ]
		ifFalse: [ self defaultNamespace ]
]

{ #category : #'as yet unclassified' }
XSDSchema >> resolveElement: aString [ 
	| prefix ns |
	(aString includes: $:) ifTrue: [ 
		prefix := (aString xmlPrefixBeforeLocalName).
		ns := self 
			resolvePrefix: prefix 
			ifUnresolvable: [ Error signal: 'cannot resolve tag prefix ', prefix asString  ].
		 (ns = self xsdNamespace) ifTrue: [
			^ (XSDAnyType withName: aString) new ] ]. 
	^ self findXSDElementNamed: aString
]

{ #category : #'as yet unclassified' }
XSDSchema >> resolveLocalElement: aString [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
XSDSchema >> resolveLocalElement: aString ifAbsent: aBlock [
	
	^ self 
		allElementsDetect: [:each | (each attributeAt: #name) = aString ]
		ifNone: aBlock
]

{ #category : #accessing }
XSDSchema >> targetNamespace [
	^ self attributeAt: #targetNamespace
]

{ #category : #accessing }
XSDSchema >> targetNamespace: aUri [
	^ self attributeAt: #targetNamespace put: aUri
]

{ #category : #'as yet unclassified' }
XSDSchema >> xsdElements [
	^ self elements select: [ :element | 
		element name = 'xs:element' ] 
]
