Class {
	#name : #XSDTypeElementFinderVisitor,
	#superclass : #XSDVisitor,
	#instVars : [
		'elementName',
		'element',
		'foundBlock'
	],
	#category : #'XSD-Parser-Core-Visitor'
}

{ #category : #accessing }
XSDTypeElementFinderVisitor >> element [
	^ element
]

{ #category : #accessing }
XSDTypeElementFinderVisitor >> elementName: aString [ 
	elementName := aString 
]

{ #category : #visiting }
XSDTypeElementFinderVisitor >> visitChoice: aXSDChoice [ 
	^ self visitElement: aXSDChoice 
]

{ #category : #visiting }
XSDTypeElementFinderVisitor >> visitComplexContent: aXSDComplexContent [ 
	^ super visitComplexContent: aXSDComplexContent 
]

{ #category : #visiting }
XSDTypeElementFinderVisitor >> visitComplexType: aXSDComplexType [ 
	^ super visitComplexType: aXSDComplexType 
]

{ #category : #visitng }
XSDTypeElementFinderVisitor >> visitExtension: aXSDExtension [ 

	| base |
	base := aXSDExtension resolveElement: (aXSDExtension attributeAt: #base).
	base acceptNodeVisitor: self.
	^ super visitExtension: aXSDExtension 

]

{ #category : #visiting }
XSDTypeElementFinderVisitor >> visitGroup: aGroup [ 
	| el |
	el := (aGroup includesAttribute: #ref) 
		ifTrue: [ aGroup document root resolveElement: (aGroup attributeAt: #ref) ]
		ifFalse: [ aGroup ].
	^ self visitElement: el 
]

{ #category : #visiting }
XSDTypeElementFinderVisitor >> visitSchemaElement: aSchemaElement [
	((aSchemaElement attributeAt: #name) = elementName) ifTrue: [ 
		foundBlock value: aSchemaElement  ].
	
	^ (aSchemaElement includesAttribute: #ref)
		ifTrue: [ aSchemaElement resolveReference acceptNodeVisitor: self ]
		"ifFalse: [ super visitSchemaElement: aSchemaElement ]"
]

{ #category : #visiting }
XSDTypeElementFinderVisitor >> visitSchemaElement: aSchemaElement ifFound: aBlock [
	foundBlock := aBlock.
	^ super visitSchemaElement: aSchemaElement  
]
