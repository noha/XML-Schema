Class {
	#name : #XSDBasicElement,
	#superclass : #XMLElement,
	#category : #'XSD-Parser-Core-Model'
}

{ #category : #'as yet unclassified' }
XSDBasicElement >> elementAt: aString ifNone: aBlock [
	
	| type |
	^ (self includesAttribute: #type)
		ifTrue: [ 
			type := self document root resolveElement: self typeName.
			(type elementAt: aString ifNone: [ nil ])
				ifNotNil: [ :el | ^ el ] 
				ifNil: [ ^ (self findTypeNamed: aString)
					ifNil: [ aBlock value ] ] ]
		ifFalse: [ self findTypeNamed: aString ]
]

{ #category : #'as yet unclassified' }
XSDBasicElement >> findTypeNamed: aString [ 
	| type |
	type := XSDTypeElementFinderVisitor new
		elementName: aString;
		visitSchemaElement: self ifFound: [ :element | ^ element ].
	Error signal: 'not expected'.
	^ type
]

{ #category : #'as yet unclassified' }
XSDBasicElement >> gtInspectorTreeIn: aComposite inContext: aGTInspector [
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
			shouldExpandToLevel: 3
			"rootsExpanded"
]

{ #category : #testing }
XSDBasicElement >> isXSDPrimitive [
	^ false
]

{ #category : #'as yet unclassified' }
XSDBasicElement >> resolveElement: aString [ 
	^ self schema resolveElement: aString
]

{ #category : #accessing }
XSDBasicElement >> schema [
	^ self document root
]

{ #category : #'as yet unclassified' }
XSDBasicElement >> supportsTreeView [ 
	^ true
]

{ #category : #'as yet unclassified' }
XSDBasicElement >> treeViewChildren [ 
	| children |
	children := super treeViewChildren.
	(self includesAttribute: #ref) ifTrue: [ 
		^ children copyWith: (self resolveElement: (self attributeAt: #ref)) ].
	(self includesAttribute: #type) ifTrue: [ 
		^ children copyWith: (self resolveElement: (self attributeAt: #type)) ].
	^ children
	
]

{ #category : #'as yet unclassified' }
XSDBasicElement >> xsdNamespace [
	^ 'http://www.w3.org/2001/XMLSchema'
]
