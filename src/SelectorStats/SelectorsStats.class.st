Class {
	#name : 'SelectorsStats',
	#superclass : 'Object',
	#category : 'SelectorStats',
	#package : 'SelectorStats'
}

{ #category : 'query' }
SelectorsStats >> methods [
	"self new methods size"
	
	^ SystemNavigation default allMethods
]

{ #category : 'query' }
SelectorsStats >> reportString [ 


	String streamContents: [ :s |
		s nextPutAll: '#selectors: '.
		s nextPutAll: self selectors size.
		s cr.
		]
]

{ #category : 'query' }
SelectorsStats >> selectorImplementation [
	"Returns a dictionary with the number of implementation of a given selector"

	"self new selectorImplementation"

	| dictionary |
	dictionary := Dictionary new.
	self methods do: [ :e |
		dictionary at: e selector update: [ :v | v + 1 ] initial: 1 ].
	^ dictionary
]

{ #category : 'query' }
SelectorsStats >> selectors [
	"self new selectors size 
	
	62423 method names
	"

	^ Set newFrom: self methods
]

{ #category : 'query' }
SelectorsStats >> uniquelyImplementedSelectors [
	"self new uniquelyImplementedSelectors size"
	
	| res |
	res := OrderedCollection new. 
	self selectorImplementation keysAndValuesDo: [ :k :v |
		v = 1 ifTrue: [ res add: k ]
		 ].
	^ res
]
