"
An amount of money
"
Class {
	#name : #Money,
	#superclass : #Object,
	#instVars : [
		'amount',
		'currencyCode'
	],
	#classVars : [
		'KnownCurrencies'
	],
	#category : #'Money-Core-Model'
}

{ #category : #'instance creation' }
Money class >> amount: aNumber currency: aCurrency [ 
	"Return a new instance of the receiver with the given amount and currency."
	
	^self amount: aNumber currencyCode: aCurrency currencyCode
]

{ #category : #'instance creation' }
Money class >> amount: aNumber currencyCode: aCurrencyCode [ 
	"Return a new instance of the receiver with the given amount and currency code."
	
	^(self new)
		amount: aNumber;
		currencyCode: aCurrencyCode;
		yourself 
		
]

{ #category : #arithmetic }
Money >> * other [
	other isMoney ifTrue: [self error: 'Cannot multiply two money values'].
	^ Money amount: amount * other currencyCode: currencyCode
]

{ #category : #arithmetic }
Money >> + other [
	other = 0 ifTrue: [^ self].
	other isNumber ifTrue: [ ^self + (self class amount: other currencyCode: currencyCode ) ].
	other isMoney ifFalse: [ self errorNotMoney ].
	other currency = self currency ifTrue: [ 
	^self class amount: amount + other amount currencyCode: currencyCode ].
self error: 'no money bag support yet'
]

{ #category : #arithmetic }
Money >> - other [
	other = 0 ifTrue: [ ^self ].
	other isMoney ifFalse: [ self errorNotMoney ].
	other currencyCode = self currencyCode ifTrue:
	  [  ^self class amount: amount - other amount currencyCode: currencyCode ].
	^self + (other * -1)
]

{ #category : #arithmetic }
Money >> / other [
	other isMoney ifTrue: [ self error: 'Can not divide two money values' ].
	 
	^self class 
		amount: amount / other  
		currencyCode: currencyCode
]

{ #category : #arithmetic }
Money >> // anInteger [ 
	^self amount // anInteger 
]

{ #category : #comparing }
Money >> < other [

	^self amount < other amount
]

{ #category : #comparision }
Money >> = anObject [
	"Return true if the code matches"
	
	(self species == anObject species
		and: [self currencyCode = anObject currencyCode])
		ifFalse: [^ false].
		
	^self amount = anObject amount
]

{ #category : #other }
Money >> adaptToNumber: aNumber andSend: selector [ 
	
	^ self perform: selector with: aNumber
]

{ #category : #accessing }
Money >> amount [
	^amount
]

{ #category : #accessing }
Money >> amount: aNumber [
	amount := aNumber
]

{ #category : #accessing }
Money >> currency [
	"Return the currency"
	
	^Currency code: self currencyCode 
]

{ #category : #accessing }
Money >> currencyCode [

	^currencyCode 
]

{ #category : #accessing }
Money >> currencyCode: aCode [

	currencyCode := aCode 
]

{ #category : #private }
Money >> errorNotMoney [
	 
	self error: 'Invalid arithmetic operation between money and non-money value'
]

{ #category : #testing }
Money >> isMoney [

	^ true
]

{ #category : #testing }
Money >> isZero [

	^amount = 0
]

{ #category : #printing }
Money >> printOn: aStream [

	self amount printOn: aStream showingDecimalPlaces: self amount scale.
	aStream space.
	aStream nextPutAll: currencyCode asString
	
]

{ #category : #intervals }
Money >> to: stop [
	"Answer an Interval from the receiver up to the argument, stop, 
	incrementing by 1."

	^Interval from: self to: stop by: 1
]

{ #category : #intervals }
Money >> to: stop by: step [
	"Answer an Interval from the receiver up to the argument, stop, 
	incrementing by step."

	^Interval from: self to: stop by: step amount
]
