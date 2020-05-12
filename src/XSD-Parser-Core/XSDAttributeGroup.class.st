Class {
	#name : #XSDAttributeGroup,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDAttributeGroup class >> xsdElementName [ 
	^ 'attributeGroup'
]

{ #category : #visiting }
XSDAttributeGroup >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitAttributeGroup: self
]
