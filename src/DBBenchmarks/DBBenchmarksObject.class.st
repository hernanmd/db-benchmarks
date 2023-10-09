"
Prefix each benchmark selector with ""bench"" so it can be included as part of the suite to benchmark.
"
Class {
	#name : 'DBBenchmarksObject',
	#superclass : 'Object',
	#instVars : [
		'db',
		'txn',
		'root',
		'databaseName'
	],
	#category : 'DBBenchmarks',
	#package : 'DBBenchmarks'
}

{ #category : 'benchmarking' }
DBBenchmarksObject >> benchCommitOneHundredOfSmallIntegersAtATime [

	[
		db open.
		txn := db newTransaction.
		txn root: (Array new: 100).
		1 to: 100 do: [ : index |
			txn at: index put: index.
			txn commit ].
	] ensure: [ db close ].
]

{ #category : 'benchmarking' }
DBBenchmarksObject >> benchCommitOneHundredOfSmallIntegersTenAtATime [

	[
		db open.
		txn := db newTransaction.
		txn root: (Array new: 100).
		1 to: 10 do: [ : index |
			1 to: 10 do: [ : innerIndex | 
				txn at: innerIndex put: innerIndex ].
			txn commit ].
	] ensure: [ db close ].
]

{ #category : 'benchmarking' }
DBBenchmarksObject >> benchCommitOneMillionObjectPointerCommit [

	^ self shouldBeImplemented
]

{ #category : 'benchmarking' }
DBBenchmarksObject >> benchCommitOneThousandSmallIntegerElementArrayAtOnce [

	txn := db newTransaction.
	root := txn root: (1 to: 100) asArray.
	txn commit
]

{ #category : 'benchmarking' }
DBBenchmarksObject >> benchCommitThousandsOfSmallIntegerOneHundredAtATime [

	[
		db open.
		txn := db newTransaction.
		txn root: (Array new: 100).
		1 to: 100 do: [ : index |
			txn at: index put: index.
			txn commit ].
	] ensure: [ db close ].
]

{ #category : 'benchmarking' }
DBBenchmarksObject >> benchOneThousandElementArrayRead [

	^ self shouldBeImplemented
]

{ #category : 'benchmarking' }
DBBenchmarksObject >> benchReadOneMillionObjectPointerCommit [

	self shouldBeImplemented
	
]

{ #category : 'benchmarking' }
DBBenchmarksObject >> benchReadOneThousandElementArrayOfObjectsRead [


]

{ #category : 'benchmarking' }
DBBenchmarksObject >> benchReadOneThousandLevelsDeepRead [

	^ self shouldBeImplemented
]

{ #category : 'benchmarking' }
DBBenchmarksObject >> benchReadSingleObject [

	txn := db newTransaction.
	root := txn root: Object new.
	txn commit
]

{ #category : 'instance creation' }
DBBenchmarksObject >> databaseName [

	^ databaseName
		ifNil: [ databaseName := 'soil-' , UUID new asString36 ]
]

{ #category : 'accessing' }
DBBenchmarksObject >> databaseName: anObject [

	databaseName := anObject
]

{ #category : 'accessing' }
DBBenchmarksObject >> db [

	^ db
]

{ #category : 'accessing' }
DBBenchmarksObject >> db: anObject [

	db := anObject
]

{ #category : 'initialization' }
DBBenchmarksObject >> initialize [ 
	"Create a new database each time the receiver is instantiated"

	super initialize.
	self newDatabase.
]

{ #category : 'instance creation' }
DBBenchmarksObject >> newDatabase [
	"Initialize the receiver's benchmarked database"

	db := (Soil path: self databaseName)
	    destroy;
	    initializeFilesystem.

]

{ #category : 'accessing' }
DBBenchmarksObject >> root [

	^ root
]

{ #category : 'accessing' }
DBBenchmarksObject >> root: anObject [

	root := anObject
]

{ #category : 'accessing' }
DBBenchmarksObject >> txn [

	^ txn
]

{ #category : 'accessing' }
DBBenchmarksObject >> txn: anObject [

	txn := anObject
]
