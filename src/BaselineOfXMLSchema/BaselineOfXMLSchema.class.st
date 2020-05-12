Class {
	#name : #BaselineOfXMLSchema,
	#superclass : #BaselineOf,
	#category : #BaselineOfXMLSchema
}

{ #category : #baselines }
BaselineOfXMLSchema >> baseline: spec [
	<baseline>
	spec for: #common do: [
   		spec
			package: 'XSD-Parser-Core' with: [ spec requires: #('XMLParser') ].

		spec
			group: 'default' with: #('XSD-Parser-Core');
			group: 'Core' with: #('XSD-Parser-Core').
			

		self
			xmlParser: spec ]

]

{ #category : #dependencies }
BaselineOfXMLSchema >> xmlParser: spec [

	spec
		baseline: 'XMLParser' with: [ 
			spec 
				repository: 'github://pharo-contributions/XML-XMLParser:3.5.0/src'].
			
	
]
