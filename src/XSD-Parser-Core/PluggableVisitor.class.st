Class {
	#name : #PluggableVisitor,
	#superclass : #Object,
	#category : #'XSD-Parser-Core-PluggableType'
}

{ #category : #'as yet unclassified' }
PluggableVisitor >> visit: anObject [ 
	^ anObject acceptPluggableVisitor: self
]

{ #category : #visiting }
PluggableVisitor >> visitObject: anObject [
	^ anObject
]

{ #category : #visiting }
PluggableVisitor >> visitPrimitive: anObject [
	^ anObject
]
