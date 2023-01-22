"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCurrenciesCore,
	#superclass : #PackageManifest,
	#category : #'Currencies-Core-Manifest'
}

{ #category : #'code-critics' }
ManifestCurrenciesCore class >> ruleBadMessageRule2V1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Price #adaptToNumber:andSend: #false)) #'2023-01-22T02:17:40.892983+01:00') )
]

{ #category : #'code-critics' }
ManifestCurrenciesCore class >> ruleLiteralArrayContainsSuspiciousTrueFalseOrNilRuleV1FalsePositive [
	^ #(#(#(#RGMetaclassDefinition #(#'ManifestCurrenciesCore class' #ManifestCurrenciesCore)) #'2023-01-22T02:17:52.513743+01:00') )
]
