Class {
	#name : #XSDTypeCombinatorVisitor,
	#superclass : #XSDVisitor,
	#category : #'XSD-Parser-Core-Visitor'
}

{ #category : #visiting }
XSDTypeCombinatorVisitor >> visitAnnotation: aXSDAnnotation [ 
	^ nil
]

{ #category : #visiting }
XSDTypeCombinatorVisitor >> visitAny: aXSDAny [ 
	self halt.
	^ self visitElement: aXSDAny 
]

{ #category : #visiting }
XSDTypeCombinatorVisitor >> visitChoice: aXSDChoice [ 
| choice |
	choice := self visitElement: aXSDChoice.
	self halt.
	^ choice
	
]

{ #category : #visiting }
XSDTypeCombinatorVisitor >> visitComplexContent: aXSDComplexContent [ 
	self halt.
	^ self visitElement: aXSDComplexContent 
]

{ #category : #visiting }
XSDTypeCombinatorVisitor >> visitComplexType: aXSDComplexType [ 
	
	^ (self visitElement: aXSDComplexType) first
]

{ #category : #'as yet unclassified' }
XSDTypeCombinatorVisitor >> visitDecimal: aXSDDecimal [ 
	^ aXSDDecimal 
]

{ #category : #visiting }
XSDTypeCombinatorVisitor >> visitEnumeration: aXSDEnumeration [ 
	self halt.
	^ self visitElement: aXSDEnumeration 
]

{ #category : #visitng }
XSDTypeCombinatorVisitor >> visitExtension: aXSDExtension [ 
	| t |
	t := aXSDExtension resolveElement: (aXSDExtension attributeAt: #base).
	^ (self visitElement: t) first
	
]

{ #category : #visiting }
XSDTypeCombinatorVisitor >> visitGroup: aXSDGroup [ 
	self halt.
	^ self visitElement: aXSDGroup 
]

{ #category : #visiting }
XSDTypeCombinatorVisitor >> visitNodeWithElements: aNodeWithElements [
	^ aNodeWithElements hasChildren
		ifTrue: [
			(aNodeWithElements nodes collect: [:each |
				each acceptNodeVisitor: self]) reject: #isNil ]
		ifFalse: [ #() ]
]

{ #category : #'as yet unclassified' }
XSDTypeCombinatorVisitor >> visitNormalizedString: aXSDNormalizedString [ 
	^ aXSDNormalizedString 
]

{ #category : #visiting }
XSDTypeCombinatorVisitor >> visitRestriction: aXSDRestriction [ 
	| restriction t | 
	t := aXSDRestriction resolveElement: (aXSDRestriction attributeAt: #base).
	t acceptNodeVisitor: self.
	restriction := self visitElement: aXSDRestriction.
	restriction isEmpty ifFalse: [ self halt ].
	^ t
]

{ #category : #visiting }
XSDTypeCombinatorVisitor >> visitSchemaElement: aSchemaElement [
	| type |
	(aSchemaElement includesAttribute: #ref)
		ifTrue: [ | reference |
			reference := (aSchemaElement resolveElement: aSchemaElement reference).
			self assert: (reference includesAttribute: #name).
			type := reference acceptNodeVisitor: self.
			super visitSchemaElement: aSchemaElement.
			^ type ].
	(aSchemaElement includesAttribute: #type)
		ifTrue: [ | name |
			(aSchemaElement includesAttribute: #name) 
				ifTrue: [ name := aSchemaElement attributeAt: #name ]
				ifFalse: [  self halt ].
			type := (aSchemaElement resolveElement: aSchemaElement typeName).
			name ifNil: [  
				(type includesAttribute: #name)
					ifTrue: [ name := type attributeAt: #name ] ].
			type := type acceptNodeVisitor: self. 
			name ifNil: [  
				self assert: (type includesAttribute: #name).
				name := type attributeAt: #name ].
			super visitSchemaElement: aSchemaElement.
			^ name -> type].
	self halt.
]

{ #category : #'as yet unclassified' }
XSDTypeCombinatorVisitor >> visitSequence: aXSDSequence [ 
	
	^ (self visitElement: aXSDSequence) asDictionary
]

{ #category : #visiting }
XSDTypeCombinatorVisitor >> visitSimpleContent: aXSDSimpleContent [ 
	^ (self visitElement: aXSDSimpleContent) first 
]

{ #category : #'as yet unclassified' }
XSDTypeCombinatorVisitor >> visitSimpleType: aXSDSimpleType [ 
	^ (self visitElement: aXSDSimpleType) first
]

{ #category : #visiting }
XSDTypeCombinatorVisitor >> visitStringNode: aNode [
	^ nil
]
