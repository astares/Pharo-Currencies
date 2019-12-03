"
An amount of money
"
Class {
	#name : #Price,
	#superclass : #Magnitude,
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
Price class >> amount: aNumber currency: aCurrency [ 
	"Return a new instance of the receiver with the given amount and currency."
	
	^self amount: aNumber currencyCode: aCurrency currencyCode
]

{ #category : #'instance creation' }
Price class >> amount: aNumber currencyCode: aCurrencyCode [ 
	"Return a new instance of the receiver with the given amount and currency code."
	
	^(self new)
		amount: aNumber;
		currencyCode: aCurrencyCode;
		yourself 
		
]

{ #category : #arithmetic }
Price >> * other [
	other isMoney ifTrue: [self error: 'Cannot multiply two money values'].
	^ Price amount: amount * other currencyCode: currencyCode
]

{ #category : #arithmetic }
Price >> + other [
	other = 0 ifTrue: [^ self].
	other isNumber ifTrue: [ ^self + (self class amount: other currencyCode: currencyCode ) ].
	other isMoney ifFalse: [ self errorNotMoney ].
	other currency = self currency ifTrue: [ 
	^self class amount: amount + other amount currencyCode: currencyCode ].
self error: 'no money bag support yet'
]

{ #category : #arithmetic }
Price >> - other [
	other = 0 ifTrue: [ ^self ].
	other isMoney ifFalse: [ self errorNotMoney ].
	other currencyCode = self currencyCode ifTrue:
	  [  ^self class amount: amount - other amount currencyCode: currencyCode ].
	^self + (other * -1)
]

{ #category : #arithmetic }
Price >> / other [
	other isMoney ifTrue: [ self error: 'Can not divide two money values' ].
	 
	^self class 
		amount: amount / other  
		currencyCode: currencyCode
]

{ #category : #arithmetic }
Price >> // anInteger [ 
	^self amount // anInteger 
]

{ #category : #comparing }
Price >> < other [

	^self amount < other amount
]

{ #category : #comparision }
Price >> = anObject [
	"Return true if the code matches"
	
	(self species == anObject species
		and: [self currencyCode = anObject currencyCode])
		ifFalse: [^ false].
		
	^self amount = anObject amount
]

{ #category : #other }
Price >> adaptToNumber: aNumber andSend: selector [ 
	
	^ self perform: selector with: aNumber
]

{ #category : #accessing }
Price >> amount [
	^amount
]

{ #category : #accessing }
Price >> amount: aNumber [
	amount := aNumber asScaledDecimal: 4
]

{ #category : #accessing }
Price >> currency [
	"Return the currency"
	
	^Currency code: self currencyCode 
]

{ #category : #accessing }
Price >> currencyCode [

	^currencyCode 
]

{ #category : #accessing }
Price >> currencyCode: aCode [

	currencyCode := aCode 
]

{ #category : #private }
Price >> errorNotMoney [
	 
	self error: 'Invalid arithmetic operation between money and non-money value'
]

{ #category : #comparing }
Price >> hash [
	^ amount hash bitXor: currencyCode hash
]

{ #category : #testing }
Price >> isMoney [

	^ true
]

{ #category : #testing }
Price >> isZero [

	^amount = 0
]

{ #category : #printing }
Price >> printOn: aStream [

	| amountString |
	amountString := String streamContents: [:s |
		self amount printOn: s showingDecimalPlaces: self amount scale ].
	(amountString indexOf: $.) > 0
		ifTrue: [ amountString := amountString trimRight: [:each | each = $0 ].
					 amountString := amountString trimRight: [:each | each = $. ] ].
	aStream nextPutAll: amountString.
	aStream space.
	aStream nextPutAll: currencyCode asString
	
]

{ #category : #intervals }
Price >> to: stop [
	"Answer an Interval from the receiver up to the argument, stop, 
	incrementing by 1."

	^Interval from: self to: stop by: 1
]

{ #category : #intervals }
Price >> to: stop by: step [
	"Answer an Interval from the receiver up to the argument, stop, 
	incrementing by step."
	| inc |
	inc := step isMoney ifTrue: [ step amount ]
							  ifFalse: [ step asScaledDecimal: 4 ].
	^Interval from: self to: stop by: inc
]
