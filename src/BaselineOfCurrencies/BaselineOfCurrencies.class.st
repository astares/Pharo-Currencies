"
Baseline for currencies project https://github.com/astares/Pharo-Currencies
"
Class {
	#name : #BaselineOfCurrencies,
	#superclass : #BaselineOf,
	#category : #BaselineOfCurrencies
}

{ #category : #baselines }
BaselineOfCurrencies >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec
				package: #'Money-Core';
				package: #'Money-Core-Tests' with: [ spec requires: #(#'Money-Core') ].
				
			spec
				group: 'Core' with: #(#'Money-Core');
				group: 'Tests' with: #(#'Money-Core-Tests');
				group: 'all' with: #('Core' 'Tests');
				group: 'default' with: #('all') ]
]
