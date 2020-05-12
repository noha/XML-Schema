Class {
	#name : #XSDElement,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDElement class >> xsdElementName [ 
	^ 'element'
]

{ #category : #visiting }
XSDElement >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitSchemaElement: self
]

{ #category : #'as yet unclassified' }
XSDElement >> createElement [
	^ XMLElement new
		setNamespaceScope: self namespaceScope copy 
]

{ #category : #'as yet unclassified' }
XSDElement >> findType [
	XSDDetectElementTypeVisitor new
		onFound: [ :type | ^ type ];
		visitSchemaElement: self.
	Error signal: 'cannot find type'
	
]

{ #category : #'as yet unclassified' }
XSDElement >> newValue [
	^ self findType newValue
		type: self;
		yourself
]

{ #category : #'as yet unclassified' }
XSDElement >> pluggableType [
	self halt.
	^ self document root resolveElement: self typeName
]

{ #category : #accessing }
XSDElement >> reference [
	^ self attributeAt: #ref
]

{ #category : #'as yet unclassified' }
XSDElement >> resolveReference [
	^ self schema resolveElement: self reference
]

{ #category : #'as yet unclassified' }
XSDElement >> targetNamespace [
	^ self attributeAt: #targetNamespace
]

{ #category : #'as yet unclassified' }
XSDElement >> targetNamespace: aUri [
	^ self attributeAt: #targetNamespace put: aUri
]

{ #category : #accessing }
XSDElement >> typeName [
	^ self attributeAt: #type
]
