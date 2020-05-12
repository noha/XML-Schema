Class {
	#name : #XSDGroup,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDGroup class >> xsdElementName [ 
	^ 'group'
]

{ #category : #visiting }
XSDGroup >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitGroup: self
]

{ #category : #'as yet unclassified' }
XSDGroup >> treeViewChildren [
	"(self includesAttribute: #ref) ifTrue: [ 
		^ (self resolveElement: (self attributeAt: #ref)) treeViewChildren ].
	(self includesAttribute: #type) ifTrue: [ 
		^ (self resolveElement: (self attributeAt: #type)) treeViewChildren ]."
	^ super treeViewChildren
	
]
