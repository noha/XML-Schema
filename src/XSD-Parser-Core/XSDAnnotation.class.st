Class {
	#name : #XSDAnnotation,
	#superclass : #XSDBasicElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDAnnotation class >> xsdElementName [ 
	^ 'annotation'
]

{ #category : #visiting }
XSDAnnotation >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitAnnotation: self
]

{ #category : #'as yet unclassified' }
XSDAnnotation >> elementAt: aString ifNone: aBlockClosure [ 
	^ nil
]
