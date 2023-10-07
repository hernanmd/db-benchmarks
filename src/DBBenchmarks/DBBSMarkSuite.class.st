Class {
	#name : 'DBBSMarkSuite',
	#superclass : 'SMarkSuite',
	#instVars : [
		'benchmarkOperation',
		'dbbObject'
	],
	#category : 'DBBenchmarks-',
	#package : 'DBBenchmarks',
	#tag : ''
}

{ #category : 'examples' }
DBBSMarkSuite class >> benchmarkParameters [

	| parameterMatrix |
	parameterMatrix := super benchmarkParameters.
	parameterMatrix
		forSelector: #benchmarkOperation addOptions: DBBenchmarksObject selectors.
	^ parameterMatrix
]

{ #category : 'examples' }
DBBSMarkSuite class >> example [

	CSVSMarkHarness run: { 
	    'SoilSMarkHarness'. 
	    'SoilSMarkSuite.benchAll' . 
	    1 . "The number of iterations"
	    1 . "The number of processes"
	    5   "The problem size"
	    }.
]

{ #category : 'benchmarking' }
DBBSMarkSuite >> benchAll [
	"Benchmark all operations in the receiver"

	self problemSize timesRepeat: [ 
		dbbObject perform: benchmarkOperation ]

]

{ #category : 'running' }
DBBSMarkSuite >> setUp [

	super setUp.
	dbbObject := DBBenchmarksObject new.
]
