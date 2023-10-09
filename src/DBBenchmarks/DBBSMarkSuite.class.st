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
DBBSMarkSuite class >> benchmarkOperations [
	"Answer a <Collection> of <Symbol> representing each a selector which implements a benchmark operation "
	
	^ DBBenchmarksObject selectors select: [ : selector | selector beginsWith: #bench ]
]

{ #category : 'examples' }
DBBSMarkSuite class >> benchmarkParameters [

	| parameterMatrix |
	parameterMatrix := super benchmarkParameters.
	parameterMatrix
		forSelector: #benchmarkOperation addOptions: self benchmarkOperations.
	^ parameterMatrix
]

{ #category : 'examples' }
DBBSMarkSuite class >> example [

	CSVSMarkHarness run: { 
	    'DBBSoilSMarkHarness'. 
	    'DBBSMarkSuite.benchAll' . 
	    1 . "The number of iterations"
	    1 . "The number of processes"
	    5   "The problem size"
	    }.
]

{ #category : 'examples' }
DBBSMarkSuite class >> exampleRead [

	CSVSMarkHarness run: { 
	    'DBBSoilSMarkHarness'. 
	    'DBBSoilSMarkSuite.benchRead' . 
	    1 . "The number of iterations"
	    1 . "The number of processes"
	    5   "The problem size"
	    }.
]

{ #category : 'examples' }
DBBSMarkSuite class >> exampleWrite [

	CSVSMarkHarness run: { 
	    'DBBSoilSMarkHarness'. 
	    'DBBSoilSMarkSuite.benchWrite' . 
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

{ #category : 'running' }
DBBSMarkSuite >> tearDown [ 

	dbbObject close.
	super tearDown.
]
