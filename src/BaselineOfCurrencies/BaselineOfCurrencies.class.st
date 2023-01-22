"
Dealing with Currencies in Pharo

See [https://github.com/astares/Pharo-Currencies](https://github.com/astares/Pharo-Currencies)
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
				package: #'Currencies-Core';
				package: #'Currencies-Core-Tests' with: [ spec requires: #(#'Currencies-Core') ].

			spec
				group: 'Core' with: #(#'Currencies-Core');
				group: 'Tests' with: #(#'Currencies-Core-Tests');
				group: 'CI' with: #('Tests');
				group: 'all' with: #('Core' 'Tests');
				group: 'default' with: #('all') ]
]
