Class {
	#name : #XSDVisitor,
	#superclass : #XMLNodeVisitor,
	#category : #'XSD-Parser-Core-Visitor'
}

{ #category : #visiting }
XSDVisitor >> visitAnnotation: aXSDAnnotation [ 
	^ self visitElement: aXSDAnnotation 
]

{ #category : #visiting }
XSDVisitor >> visitAny: aXSDAny [ 
	^ self visitElement: aXSDAny 
]

{ #category : #'as yet unclassified' }
XSDVisitor >> visitAnyType: anAnyType [ 
	^ anAnyType
]

{ #category : #visiting }
XSDVisitor >> visitAppInfo: aXSDAppInfo [ 
	^ self visitElement: aXSDAppInfo 
]

{ #category : #visiting }
XSDVisitor >> visitAttribute: aXSDAttribute [ 
	^ self visitElement: aXSDAttribute 
]

{ #category : #visiting }
XSDVisitor >> visitAttributeGroup: aXSDAttributeGroup [ 
	^ self visitElement: aXSDAttributeGroup 
]

{ #category : #visiting }
XSDVisitor >> visitChoice: aXSDChoice [ 
	^ self visitElement: aXSDChoice 
]

{ #category : #visiting }
XSDVisitor >> visitComplexContent: aXSDComplexContent [ 
	^ self visitElement: aXSDComplexContent 
]

{ #category : #visiting }
XSDVisitor >> visitComplexType: aXSDComplexType [ 
	^ self visitElement: aXSDComplexType 
]

{ #category : #visiting }
XSDVisitor >> visitDocumentation: aXSDDocumentation [ 
	^ self visitElement: aXSDDocumentation 
]

{ #category : #visiting }
XSDVisitor >> visitEnumeration: aXSDEnumeration [ 
	^ self visitElement: aXSDEnumeration 
]

{ #category : #visitng }
XSDVisitor >> visitExtension: aXSDExtension [ 
	^ self visitElement: aXSDExtension 
]

{ #category : #visiting }
XSDVisitor >> visitGroup: aXSDGroup [ 
	^ self visitElement: aXSDGroup 
]

{ #category : #visiting }
XSDVisitor >> visitImport: anImport [
	^ self visitElement: anImport
]

{ #category : #visiting }
XSDVisitor >> visitInclude: aXSDInclude [ 
	^ self visitElement: aXSDInclude 
]

{ #category : #visiting }
XSDVisitor >> visitMaxExclusive: aXSDMaxExclusive [ 
	^ self visitElement: aXSDMaxExclusive 
]

{ #category : #visiting }
XSDVisitor >> visitMaxInclusive: aXSDMaxInclusive [ 
	^ self visitElement: aXSDMaxInclusive 
]

{ #category : #visiting }
XSDVisitor >> visitMaxLength: aXSDMaxLength [ 
	^ self visitElement: aXSDMaxLength 
]

{ #category : #visiting }
XSDVisitor >> visitMinExclusive: aXSDMinExclusive [ 
	^ self visitElement: aXSDMinExclusive 
]

{ #category : #visiting }
XSDVisitor >> visitMinInclusive: aXSDMinInclusive [ 
	^ self visitElement: aXSDMinInclusive 
]

{ #category : #visiting }
XSDVisitor >> visitMinLength: aXSDMinLength [ 
	^ self visitElement: aXSDMinLength 
]

{ #category : #visiting }
XSDVisitor >> visitPattern: aXSDPattern [ 
	^ self visitElement: aXSDPattern 
]

{ #category : #visiting }
XSDVisitor >> visitRestriction: aXSDRestriction [ 
	^ self visitElement: aXSDRestriction 
]

{ #category : #visiting }
XSDVisitor >> visitSchema: aXSDSchema [ 
	^ self visitElement: aXSDSchema 
]

{ #category : #visiting }
XSDVisitor >> visitSchemaElement: aSchemaElement [
	^ self visitElement: aSchemaElement 
]

{ #category : #'as yet unclassified' }
XSDVisitor >> visitSequence: aXSDSequence [ 
	^ self visitElement: aXSDSequence 
]

{ #category : #visiting }
XSDVisitor >> visitSimpleContent: aXSDSimpleContent [ 
	^ self visitElement: aXSDSimpleContent 
]

{ #category : #'as yet unclassified' }
XSDVisitor >> visitSimpleType: aXSDSimpleType [ 
	^ self visitElement: aXSDSimpleType 
]
