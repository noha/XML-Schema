Class {
	#name : #XSDAnyComplexType,
	#superclass : #XSDAnyType,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #testing }
XSDAnyComplexType class >> isAbstract [
	^ self == XSDAnyComplexType 
]

{ #category : #'instance creation' }
XSDAnyComplexType class >> newValue [
	^ PluggableTypeObject new
]
