Extension { #name : #XMLElement }

{ #category : #'*XSD-Parser-Core' }
XMLElement >> matchesName: aString [ 
	^ (self attributeAt: #name) = aString
]
