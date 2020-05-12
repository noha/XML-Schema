Class {
	#name : #XSDNormalizedStringType,
	#superclass : #XSDStringType,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDNormalizedStringType class >> xsdName [
	^ 'normalizedString'
]

{ #category : #'tests-as yet unclassified' }
XSDNormalizedStringType >> acceptNodeVisitor: aVisitor [ 
	^ aVisitor visitNormalizedString: self
]
