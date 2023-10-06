Class {
	#name : 'DummyDBBenchmarksObject',
	#superclass : 'Object',
	#category : 'DBBenchmarks',
	#package : 'DBBenchmarks'
}

{ #category : 'benchmarking' }
DummyDBBenchmarksObject >> benchOneMillionObjectPointerCommit [

]

{ #category : 'benchmarking' }
DummyDBBenchmarksObject >> benchSingleObjectRead [

	^ self singleObjectFixture
]
