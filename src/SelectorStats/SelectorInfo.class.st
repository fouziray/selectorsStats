Class {
	#name : 'SelectorInfo',
	#superclass : 'Object',
	#instVars : [
		'implemented',
		'called',
		'selector'
	],
	#category : 'SelectorStats',
	#package : 'SelectorStats'
}

{ #category : 'accessing' }
SelectorInfo >> called [

	^ called
]

{ #category : 'accessing' }
SelectorInfo >> called: anObject [

	called := anObject
]

{ #category : 'accessing' }
SelectorInfo >> implemented [

	^ implemented
]

{ #category : 'accessing' }
SelectorInfo >> implemented: anObject [

	implemented := anObject
]

{ #category : 'as yet unclassified' }
SelectorInfo >> increaseImplemented [


	implemented := implemented + 1
]

{ #category : 'as yet unclassified' }
SelectorInfo >> initialize [

	super initialize.
	implemented := 0.
	called := 0
]

{ #category : 'printing' }
SelectorInfo >> printOn: aStream [

	aStream
		nextPutAll: selector;
		space.
	aStream nextPutAll: ' imp: ' , implemented asString; space.
	called ifNotNil: [ :c | aStream nextPutAll: 'called: ' , c asString ]
]

{ #category : 'accessing' }
SelectorInfo >> selector [

	^ selector
]

{ #category : 'accessing' }
SelectorInfo >> selector: aSymbol [

	selector := aSymbol
]
