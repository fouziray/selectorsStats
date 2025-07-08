Class {
	#name : 'SelectorStatsTest',
	#superclass : 'TestCase',
	#instVars : [
		'stats'
	],
	#category : 'SelectorStats',
	#package : 'SelectorStats'
}

{ #category : 'running' }
SelectorStatsTest >> setUp [

	stats := SelectorsStats new
]

{ #category : 'tests' }
SelectorStatsTest >> testUniqueImplementationFindBySelector [

	| method |
	method := stats findUniqueMethodBySelector: 'x10:'.
	self assert: method equals: UnicornARMv8Simulator >> #x10:
]
