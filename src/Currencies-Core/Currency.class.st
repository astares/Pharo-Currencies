"
A system of money (monetary units) in common use, especially in a nation.

A currency is represented by a three letters code following ISO 4217 uniquely identifiying the currency. 




"
Class {
	#name : 'Currency',
	#superclass : 'Object',
	#instVars : [
		'code'
	],
	#classVars : [
		'KnownCurrencies'
	],
	#category : 'Currencies-Core-Model',
	#package : 'Currencies-Core',
	#tag : 'Model'
}

{ #category : 'instance creation' }
Currency class >> code: aSymbol [
	"Returns an instance of the receiver represented by the given symbol code"

	^ self knownCurrencies at: aSymbol asSymbol ifAbsentPut: [
		  self new
			  code: aSymbol;
			  yourself ]
]

{ #category : 'private accessing' }
Currency class >> knownCurrencies [
	"Return the already known currencies"

	^ KnownCurrencies ifNil: [ KnownCurrencies := IdentityDictionary new ]
]

{ #category : 'initialization' }
Currency class >> reset [
	<script>

	KnownCurrencies := nil
]

{ #category : 'comparing' }
Currency >> = otherCurrency [
	"Return true if the code matches"

	^code = otherCurrency code
]

{ #category : 'conversion' }
Currency >> asCurrency [
	^self
]

{ #category : 'accessing' }
Currency >> code [
	"Return the currency code"

	^ code
]

{ #category : 'accessing' }
Currency >> code: aString [
	"Sets the currency code which has to be a symbol"

	code := aString asSymbol
]

{ #category : 'comparing' }
Currency >> hash [
	^self code hash
]

{ #category : 'printing' }
Currency >> printOn: aStream [

	aStream nextPutAll: self code asString
]
