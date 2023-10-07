Class {
	#name : 'DBBSoilSMarkHarness',
	#superclass : 'ReBenchHarness',
	#category : 'DBBenchmarks',
	#package : 'DBBenchmarks'
}

{ #category : 'defaults' }
DBBSoilSMarkHarness class >> defaultOutputDestination [
	"Answer a <Stream> used to output receiver's contents"

	^ self defaultReporter defaultOutputDestination
]

{ #category : 'defaults' }
DBBSoilSMarkHarness class >> defaultReporter [

	^ DBBSoilSMarkReporter
]
