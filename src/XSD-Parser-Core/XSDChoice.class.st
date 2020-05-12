Class {
	#name : #XSDChoice,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDChoice class >> xsdElementName [ 
	^ 'choice'
]

{ #category : #visiting }
XSDChoice >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitChoice: self
]

{ #category : #'as yet unclassified' }
XSDChoice >> elementMatchesName: aString [
	self elements do: [ :element |
		(element elementMatchesName: aString) ifNotNil: [ :el |
			^ el ] ].
	^ nil
]
