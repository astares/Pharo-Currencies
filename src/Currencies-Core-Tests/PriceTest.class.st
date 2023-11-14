"
Unit test for amounts
"
Class {
	#name : 'PriceTest',
	#superclass : 'TestCase',
	#category : 'Currencies-Core-Tests-Model',
	#package : 'Currencies-Core-Tests',
	#tag : 'Model'
}

{ #category : 'tests - accessing' }
PriceTest >> testAccessingCurrency [

	self assert: 6 EUR currency code equals: #'EUR'
]

{ #category : 'tests - arithmetic' }
PriceTest >> testAddition [

	self assert: 10 EUR + 20 EUR equals: 30 EUR
]

{ #category : 'tests - arithmetic compatible' }
PriceTest >> testAdditionStartingWithAmount [

	self assert: 6 EUR + 2 equals: 8 EUR
]

{ #category : 'tests - arithmetic compatible' }
PriceTest >> testAdditionStartingWithNumber [

	self assert: 2 + 6 EUR equals: 8 EUR
]

{ #category : 'tests - arithmetic compatible' }
PriceTest >> testDivideByFloat [
	self assert: 12.00 EUR / 0.1 equals: 120 EUR
]

{ #category : 'tests - arithmetic compatible' }
PriceTest >> testDivideByInteger [
	self assert: 12.00 EUR / 2 equals: 6 EUR
]

{ #category : 'tests - currency specific' }
PriceTest >> testEuro [

	self assert: 10 EUR currencyCode equals: #EUR
]

{ #category : 'tests - currency specific' }
PriceTest >> testEurocent [

	self
		assert: 10 Eurocent currencyCode identicalTo: #EUR;
		assert: 10 Eurocent amount equals: 0.1000s4
]

{ #category : 'tests - intervals' }
PriceTest >> testInterval [

	self assert: (1 EUR to: 8 EUR) size equals: 8
]

{ #category : 'tests - intervals' }
PriceTest >> testIntervalByCurrency [

	self assert: (1 EUR to: 8 EUR by: 2 EUR) size equals: 4
]

{ #category : 'tests - arithmetic' }
PriceTest >> testKeep [

	self assert: 1 EUR / 3 * 3 equals: 1 EUR
]

{ #category : 'tests - arithmetic' }
PriceTest >> testMultiply [

	self assert: 30 EUR * 2 equals: 60 EUR
]

{ #category : 'tests - arithmetic compatible' }
PriceTest >> testMultiplyStartingWithAmount [

	self assert: 6 EUR * 2 equals: 12 EUR
]

{ #category : 'tests - arithmetic compatible' }
PriceTest >> testMultiplyStartingWithNumber [

	self assert: 2 * 6 EUR equals: 12 EUR
]

{ #category : 'tests - arithmetic compatible' }
PriceTest >> testMultiplyWithFloat [
	self assert: 12.00 EUR * 0.01 equals: 0.12 EUR
]

{ #category : 'tests - printing' }
PriceTest >> testPrecisePrintString [
	self
		assert: 1.12 EUR printString equals: '1.12 EUR';
		assert: 9.888 EUR printString equals: '9.888 EUR'
]

{ #category : 'tests' }
PriceTest >> testPrinting [

	self
		assert: 10 EUR printString equals: '10 EUR';
		assert: 10.5 EUR printString equals: '10.5 EUR'
]

{ #category : 'tests - printing' }
PriceTest >> testRegularPrintString [
	self
		assert: 1 EUR printString equals: '1 EUR';
		assert: 12 EUR printString equals: '12 EUR';
		assert: 120 EUR printString equals: '120 EUR';
		assert: (12.00 EUR + 14.00 EUR) printString equals: '26 EUR'
]

{ #category : 'tests - arithmetic' }
PriceTest >> testSubtraction [

	self assert: 30 EUR - 20 EUR equals: 10 EUR
]

{ #category : 'tests - printing' }
PriceTest >> testTrimmedPrintString [
	self
		assert: 1.00 EUR printString equals: '1 EUR'
]
