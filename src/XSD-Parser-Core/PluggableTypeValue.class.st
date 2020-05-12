Class {
	#name : #PluggableTypeValue,
	#superclass : #Object,
	#instVars : [
		'type'
	],
	#category : #'XSD-Parser-Core-PluggableType'
}

{ #category : #'instance-creation' }
PluggableTypeValue class >> type: aType [
	^ self new
		type: aType
]

{ #category : #accessing }
PluggableTypeValue >> baseValue [
	^ self
]

{ #category : #finding }
PluggableTypeValue >> find: aKey [
	^ self basicFind: aKey
]

{ #category : #finding }
PluggableTypeValue >> find: aKey in: aCollection [
	aCollection do: [:each|
		each isAsn1Composite ifTrue: [
			(each basicFind: aKey) ifNotNil: [:elem|
				^ elem ]]].
	^ nil
]

{ #category : #'as yet unclassified' }
PluggableTypeValue >> gtInspectorTreeIn: aComposite inContext: aGTInspector [
	<gtInspectorPresentationOrder: 1>

	| treeView |

	treeView :=
		aComposite tree
			title: 'Tree';
			display: [{self}];
			children: [:each | each treeViewChildren]; 
			format: [:each | each treeViewLabelText];
			when: [self supportsTreeView];
			rootsExpanded;
			allExpanded;
			shouldExpandToLevel: 10
			"rootsExpanded"
]

{ #category : #initialize }
PluggableTypeValue >> initializeFrom: anObject [ 
	
]

{ #category : #accessing }
PluggableTypeValue >> mapKeyForMessage: aMessage [
	^ aMessage selector asString
]

{ #category : #testing }
PluggableTypeValue >> matchesType: aType [
	^ self isKindOf: aType 
]

{ #category : #'as yet unclassified' }
PluggableTypeValue >> newElement [
	^ type createElement
]

{ #category : #accessing }
PluggableTypeValue >> selfExpanding: aBoolean [
]

{ #category : #accessing }
PluggableTypeValue >> type [
	^ type
]

{ #category : #accessing }
PluggableTypeValue >> type: anObject [
	anObject ifNil: [ self halt ].
	type := anObject
]

{ #category : #validating }
PluggableTypeValue >> validate [
	type ifNil: [ Error signal: 'type is nil' ].
	type validate: self
]
