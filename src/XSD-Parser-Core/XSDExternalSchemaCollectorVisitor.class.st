Class {
	#name : #XSDExternalSchemaCollectorVisitor,
	#superclass : #XSDVisitor,
	#instVars : [
		'schema',
		'basePath',
		'includedDocuments',
		'importedDocuments'
	],
	#category : #'XSD-Parser-Core-Visitor'
}

{ #category : #accessing }
XSDExternalSchemaCollectorVisitor >> basePath [
	^ basePath
]

{ #category : #accessing }
XSDExternalSchemaCollectorVisitor >> basePath: anObject [
	basePath := anObject
]

{ #category : #visiting }
XSDExternalSchemaCollectorVisitor >> collectExternalsFrom: aDocument path: aPath [ 
	| visitor |
	visitor := self class new 
		schema: schema;
		basePath: (basePath / aPath) asFileReference parent;
		visitDocument: aDocument;
		yourself.
	self copyExternals: visitor
]

{ #category : #visiting }
XSDExternalSchemaCollectorVisitor >> copyExternals: visitor [

	visitor importedDocuments keysAndValuesDo: [ :import :doc |
		importedDocuments at: import put: doc ].
			
	visitor includedDocuments keysAndValuesDo: [ :include :doc |
		includedDocuments at: include put: doc ]
]

{ #category : #accessing }
XSDExternalSchemaCollectorVisitor >> importedDocuments [
	^ importedDocuments
]

{ #category : #accessing }
XSDExternalSchemaCollectorVisitor >> includedDocuments [
	^ includedDocuments
]

{ #category : #initialization }
XSDExternalSchemaCollectorVisitor >> initialize [
	super initialize.
	includedDocuments := Dictionary new.
	importedDocuments := Dictionary new
]

{ #category : #visiting }
XSDExternalSchemaCollectorVisitor >> readSchemaFrom: aPath [
	^ schema readSchemaFromRelativeFile: (basePath / aPath) pathString
]

{ #category : #accessing }
XSDExternalSchemaCollectorVisitor >> schema: anObject [
	schema := anObject
]

{ #category : #visiting }
XSDExternalSchemaCollectorVisitor >> visitImport: aXSDImport [ 

	(self readSchemaFrom: aXSDImport schemaLocation) ifNotNil: [ :document | 
		self collectExternalsFrom: document path: aXSDImport schemaLocation. 
		importedDocuments at: aXSDImport put: document ].
	
	^ aXSDImport 
]

{ #category : #visiting }
XSDExternalSchemaCollectorVisitor >> visitInclude: aXSDInclude [ 
	(self readSchemaFrom: aXSDInclude schemaLocation) ifNotNil: [ :document | 
		self collectExternalsFrom: document path: aXSDInclude schemaLocation. 
		includedDocuments at: aXSDInclude put: document ].
	
	^ aXSDInclude 
]
