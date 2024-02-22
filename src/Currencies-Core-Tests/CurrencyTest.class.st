"
Test case for currencies
"
Class {
	#name : 'CurrencyTest',
	#superclass : 'TestCase',
	#category : 'Currencies-Core-Tests-Model',
	#package : 'Currencies-Core-Tests',
	#tag : 'Model'
}

{ #category : 'tests' }
CurrencyTest >> testComparision [

	self
		assert: (Currency code: 'EUR') equals: (Currency code: 'EUR');
		assert: (Currency code: 'EUR') equals: (Currency code: #'EUR')
]

{ #category : 'tests' }
CurrencyTest >> testInstanceCreationFromString [

	| instance |
	instance := 'EUR' asCurrency.
	self assert: instance code identicalTo: #'EUR'
]

{ #category : 'tests' }
CurrencyTest >> testInstanceCreationFromSymbols [

	| instance |
	instance := #EUR asCurrency.
	self assert: instance code identicalTo: #EUR
]

{ #category : 'tests' }
CurrencyTest >> testKeepIdentity [

	self assert: (Currency code: 'EUR') == (Currency code: 'EUR')
]

{ #category : 'tests' }
CurrencyTest >> testTimes [

	self assert: (2 times: 5 EUR) equals: 10 EUR.
	self assert: (5 EUR times: 2) equals: 10 EUR.
	self assert: (5 times * 2 EUR) equals: 10 EUR
	
]
