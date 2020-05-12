Class {
	#name : #XSDSchemaReader,
	#superclass : #Object,
	#instVars : [
		'stream',
		'basePath',
		'types',
		'importedFiles',
		'schemas'
	],
	#category : #'XSD-Parser-Core-Base'
}

{ #category : #'instance creation' }
XSDSchemaReader class >> file: aFileReference [
	^ self 
		on: aFileReference readStream
		basePath: aFileReference parent
]

{ #category : #'instance creation' }
XSDSchemaReader class >> on: aStream basePath: aString [
	^ self new
		stream: aStream basePath: aString asFileReference 
]

{ #category : #accessing }
XSDSchemaReader >> basePath [
	^ basePath
]

{ #category : #actions }
XSDSchemaReader >> collectExternal: aDocument [

	^ XSDExternalSchemaCollectorVisitor new 
		schema: self;
		basePath: self basePath;
		visitDocument: aDocument;
		yourself.

]

{ #category : #initialization }
XSDSchemaReader >> initialize [ 
	super initialize.
	importedFiles := Set new.
]

{ #category : #'as yet unclassified' }
XSDSchemaReader >> parseSchemas [
	| mainSchema visitor s |
	s := XSDSchemaSet new.
	mainSchema := self readSchema.
	s add: mainSchema root.
	visitor := self collectExternal: mainSchema.
	visitor includedDocuments keysAndValuesDo: [ :include :includeDocument |
		includeDocument ifNotNil: [ 
			s add: includeDocument root ].
		"mainSchema removeNode: include" ].
	
	visitor importedDocuments keysAndValuesDo: [ :import :importDocument |
		importDocument ifNotNil: [  
			s add: importDocument root ].
		"mainSchema removeNode: import" ].
	^ s
]

{ #category : #'as yet unclassified' }
XSDSchemaReader >> readSchema [
	^ self readSchemaFrom: stream
]

{ #category : #'as yet unclassified' }
XSDSchemaReader >> readSchemaFrom: aStream [
	^ (XMLDOMParser on: aStream)  
		nodeFactory: XSDNodeFactory new;
		parseDocument
]

{ #category : #'as yet unclassified' }
XSDSchemaReader >> readSchemaFromRelativeFile: aString [
	(importedFiles includes: aString) ifTrue: [ ^ nil ].
	importedFiles add: aString.
	^ self readSchemaFrom: (basePath / aString) readStream 
]

{ #category : #accessing }
XSDSchemaReader >> schemas [
	^ schemas ifNil: [ 
		schemas := self parseSchemas  ]
]

{ #category : #accessing }
XSDSchemaReader >> stream: aStream basePath: aFileReference [
	stream := aStream.
	basePath := aFileReference 
]
