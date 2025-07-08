"
```
SelectorsStats2 new
	analyze;
	computeUniquelyImplementedSelectors;
	computeUniquelyImplementedSenders;
	inspect
```
"
Class {
	#name : 'SelectorsStats2',
	#superclass : 'Object',
	#instVars : [
		'rawDictionary',
		'uniqueDictionary'
	],
	#category : 'SelectorStats',
	#package : 'SelectorStats'
}

{ #category : 'query' }
SelectorsStats2 >> analyze [

	self selectorImplementation.
]

{ #category : 'query' }
SelectorsStats2 >> computeUniquelyImplementedSelectors [
	"self new analyze; computeUniquelyImplementedSelectors"

	rawDictionary keysAndValuesDo: [ :k :v |
		v implemented = 1 ifTrue: [ uniqueDictionary at: k put: v] ].

]

{ #category : 'query' }
SelectorsStats2 >> computeUniquelyImplementedSenders [
	"self new computeUniquelyImplementedSenders"

	self class environment allClassesDo: [ :each |
			self computeUniquelyImplementedSendersOfClass: each.
			self computeUniquelyImplementedSendersOfClass: each class ]
]

{ #category : 'query' }
SelectorsStats2 >> computeUniquelyImplementedSendersOfClass: aClass [
	"self new computeUniquelyImplementedSenders2"

	aClass methods do: [ :cm |
			| calls |
			calls := OrderedCollection new.
			cm literalsDo: [ :lit |
					lit isSymbol ifTrue: [ "if the call is for one method part of the uniquely defined method 
					count it."
							uniqueDictionary
								at: lit
								ifPresent: [ :info | info called: info called + 1 ] ] ] ]
]

{ #category : 'query' }
SelectorsStats2 >> deadSlowComputeUniquelyImplementedSenders [
	"self new analyze; computeUniquelyImplementedSelectors; computeUniquelyImplementedSenders"

	uniqueDictionary keysAndValuesDo: [ :k :v |
			(SystemNavigation default allCallsOn: k) ifNotEmpty: [ :s |
				(uniqueDictionary at: k) called: s size ] ]
]

{ #category : 'query' }
SelectorsStats2 >> initialize [

	super initialize.
	rawDictionary := Dictionary new.
	uniqueDictionary := Dictionary new
]

{ #category : 'query' }
SelectorsStats2 >> methods [
	"self new methods size"
	
	^ SystemNavigation default allMethods
]

{ #category : 'query' }
SelectorsStats2 >> reportString [ 


	String streamContents: [ :s |
		s nextPutAll: '#selectors: '.
		s nextPutAll: self selectors size.
		s cr.
		]
]

{ #category : 'query' }
SelectorsStats2 >> selectorImplementation [
	"Returns a dictionary with the number of implementation of a given selector"

	"self new selectorImplementation"

	self methods do: [ :e |
			rawDictionary
				at: e selector
				ifPresent: [ :i | i increaseImplemented ]
				ifAbsentPut: [
						SelectorInfo new
							selector: e selector;
							implemented: 1;
							yourself ] ]
]

{ #category : 'query' }
SelectorsStats2 >> selectors [
	"self new selectors size 
	
	62423 method names
	"

	^ Set newFrom: self methods
]

{ #category : 'query' }
SelectorsStats2 >> uniquelyImplementedSelectors [
	"(self new analyze; computeUniquelyImplementedSelectors; uniquelyImplementedSelectors) size"

	| res |
	res := OrderedCollection new.
	uniqueDictionary keysAndValuesDo: [ :k :v |
		v implemented = 1 ifTrue: [ res add: k ] ].
	^ res
]

{ #category : 'query' }
SelectorsStats2 >> xp1 [
	"self new computeUniquelyImplementedSenders2"

	| calls |
	calls := Set new.
	OrderedCollection >> #add:afterIndex: literalsDo: [ :lit |
		lit isSymbol ifTrue: [ calls add: lit ] ].
	^ calls
]

{ #category : 'query' }
SelectorsStats2 >> xp2 [
	"self new computeUniquelyImplementedSenders2"

	OrderedCollection methods do: [ :cm |
			| calls |
			calls := OrderedCollection new.
			cm literalsDo: [ :lit |
					lit isSymbol ifTrue: [ "if the call is for one method part of the uniquely defined method 
					count it."
							uniqueDictionary
								at: lit
								ifPresent: [ :info | info called: info called + 1 ] ] ] ]
]
