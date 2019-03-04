"
Test case for currencies
"
Class {
	#name : #CurrencyTest,
	#superclass : #TestCase,
	#category : #'Money-Core-Tests-Model'
}

{ #category : #tests }
CurrencyTest >> testComparision [

	self 
		assert: (Currency code: 'EUR') equals: (Currency code: 'EUR');
		assert: (Currency code: 'EUR') equals: (Currency code: #'EUR')
]

{ #category : #tests }
CurrencyTest >> testInstanceCreationFromString [

	|instance|
	instance := 'EUR' asCurrency.
	self assert: instance code == #'EUR'
	

]

{ #category : #tests }
CurrencyTest >> testInstanceCreationFromSymbols [

	|instance|
	instance := #'EUR' asCurrency.
	self assert: instance code == #'EUR'
	

]

{ #category : #tests }
CurrencyTest >> testKeepIdentity [

	self assert: (Currency code: 'EUR') == (Currency code: 'EUR')
]
