Class {
	#name : #XSDSequence,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDSequence class >> xsdElementName [ 
	^ 'sequence'
]

{ #category : #visiting }
XSDSequence >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitSequence: self
]

{ #category : #testing }
XSDSequence >> elementMatchesName: aString [
	self elements do: [ :element |
		(element elementMatchesName: aString) ifNotNil: [ :el |
			^ el ] ].
	^ nil
]
