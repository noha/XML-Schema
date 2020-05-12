Class {
	#name : #XSDModelGeneratorVisitor,
	#superclass : #XSDVisitor,
	#instVars : [
		'document'
	],
	#category : #'XSD-Parser-Core-Base'
}

{ #category : #accessing }
XSDModelGeneratorVisitor >> document: aXMLDocument [ 
	document := aXMLDocument
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> generate: aString [ 
	| element |
	element := self resolveElement: aString.
	element acceptNodeVisitor: self
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitAnnotation: anObject [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitAny: anObject [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitAppInfo: anObject [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitAttribute: anObject [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitAttributeGroup: anObject [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitChoice: anObject [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitComplexContent: anObject [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitComplexType: anObject [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitDocumentation: anObject [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitEnumeration: anObject [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitExtension: anObject [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitGroup: anObject [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitImport: anObject [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitInclude: anObject [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitMaxExclusive: anObject [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitMaxInclusive: anObject [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitMaxLength: anObject [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitMinExclusive: anObject [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitMinInclusive: anObject [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitMinLength: anObject [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitPattern: anObject [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitRestriction: anObject [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitSchema: anObject [
	self shouldNotImplement
]

{ #category : #visiting }
XSDModelGeneratorVisitor >> visitSchemaElement: aSchemaElement [
	| type |
	type := self resolveElement: aSchemaElement type.
	self halt
	
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitSequence: anObject [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitSimpleContent: anObject [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
XSDModelGeneratorVisitor >> visitSimpleType: anObject [
	self shouldNotImplement
]
