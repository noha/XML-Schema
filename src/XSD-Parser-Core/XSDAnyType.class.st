Class {
	#name : #XSDAnyType,
	#superclass : #Object,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #testing }
XSDAnyType class >> isAbstract [ 
	^ self == XSDAnyType 
]

{ #category : #'instance creation' }
XSDAnyType class >> withLocalName: aString [
	^ (self withAllSubclasses reject: #isAbstract)
		detect: [ :each | each xsdName = aString ]
]

{ #category : #'instance creation' }
XSDAnyType class >> withName: aString [
Transcript show: 'resolving ', aString; cr.
	^ self withLocalName: ($: split: aString) second
]

{ #category : #'as yet unclassified' }
XSDAnyType class >> xsdName [
	^ 'anyType'
]

{ #category : #'as yet unclassified' }
XSDAnyType >> acceptNodeVisitor: aVisitor [ 
	^ aVisitor visitAnyType: self
]

{ #category : #testing }
XSDAnyType >> isXSDPrimitive [ 
	^ false
]

{ #category : #'as yet unclassified' }
XSDAnyType >> xsdName [
	self subclassResponsibility 
]
