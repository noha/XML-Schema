Class {
	#name : #XSDDecimalType,
	#superclass : #XSDAnySimpleType,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDDecimalType class >> xsdName [
	^ 'decimal'
]

{ #category : #'as yet unclassified' }
XSDDecimalType >> acceptNodeVisitor: aVisitor [ 
	^ aVisitor visitDecimal: self
]
