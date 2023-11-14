"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestCurrenciesCoreTests',
	#superclass : 'PackageManifest',
	#category : 'Currencies-Core-Tests-Manifest',
	#package : 'Currencies-Core-Tests',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestCurrenciesCoreTests class >> ruleAssertEqualSignIntoAssertEqualsV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#CurrencyTest #testKeepIdentity #false)) #'2023-11-14T15:09:34.316+01:00') )
]

{ #category : 'code-critics' }
ManifestCurrenciesCoreTests class >> ruleUncommonMessageSendRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#PriceTest)) #'2023-01-22T02:14:22.035432+01:00') )
]
