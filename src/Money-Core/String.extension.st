Extension { #name : #String }

{ #category : #'*Money-Core-Currencies' }
String >> asCurrency [
	"Return the currency represented by the receiver as currency code"
	
	^Currency code: self
]
