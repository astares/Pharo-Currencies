"
Unit test for amounts
"
Class {
	#name : #MoneyTest,
	#superclass : #TestCase,
	#category : #'Money-Core-Tests-Model'
}

{ #category : #'tests - accessing' }
MoneyTest >> testAccessingCurrency [

	self assert: 6 EUR currency code equals: #'EUR'
]

{ #category : #'tests - arithmetic' }
MoneyTest >> testAddition [

	self assert: 10 EUR + 20 EUR equals: 30 EUR 
]

{ #category : #'tests - arithmetic compatible' }
MoneyTest >> testAdditionStartingWithAmount [

	self assert: 6 EUR + 2 equals: 8 EUR
]

{ #category : #'tests - arithmetic compatible' }
MoneyTest >> testAdditionStartingWithNumber [

	self assert: 2 + 6 EUR equals: 8 EUR
]

{ #category : #'tests - intervals' }
MoneyTest >> testInterval [

	self assert: (1 EUR to: 8 EUR) size equals: 8
]

{ #category : #'tests - intervals' }
MoneyTest >> testIntervalByCurrency [

	self assert: (1 EUR to: 8 EUR by: 2 EUR) size equals: 4 
]

{ #category : #'tests - arithmetic' }
MoneyTest >> testKeep [

	self assert: 1 EUR / 3 * 3 equals: 1 EUR
]

{ #category : #'tests - arithmetic' }
MoneyTest >> testMultiply [

	self assert: 30 EUR * 2 equals: 60 EUR 
]

{ #category : #'tests - arithmetic compatible' }
MoneyTest >> testMultiplyStartingWithAmount [

	self assert: 6 EUR * 2 equals: 12 EUR
]

{ #category : #'tests - arithmetic compatible' }
MoneyTest >> testMultiplyStartingWithNumber [

	self assert: 2 * 6 EUR equals: 12 EUR
]

{ #category : #tests }
MoneyTest >> testPrinting [

	self 
		assert: 10 EUR printString equals: '10.00 EUR';
		assert: 10.5 EUR printString equals: '10.50 EUR' 
]

{ #category : #'tests - arithmetic' }
MoneyTest >> testSubtraction [

	self assert: 30 EUR - 20 EUR equals: 10 EUR 
]
