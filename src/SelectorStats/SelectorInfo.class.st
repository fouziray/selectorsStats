Class {
	#name : 'SelectorInfo',
	#superclass : 'Object',
	#instVars : [
		'implemented',
		'called'
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

	super printOn: aStream.
	aStream nextPutAll: ' imp: ' , implemented asString.
	called ifNotNil: [ :c | aStream nextPutAll: 'called: ' , c asString ]
]
