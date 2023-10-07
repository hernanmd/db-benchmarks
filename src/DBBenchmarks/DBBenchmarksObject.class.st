Class {
	#name : 'DBBenchmarksObject',
	#superclass : 'Object',
	#instVars : [
		'db',
		'txn',
		'root'
	],
	#category : 'DBBenchmarks',
	#package : 'DBBenchmarks'
}

{ #category : 'benchmarking' }
DBBenchmarksObject >> benchCommitOneThousandElementArray [

	txn := db newTransaction.
	root := txn root: (1 to: 100) asArray.
	txn commit
]

{ #category : 'benchmarking' }
DBBenchmarksObject >> benchCommitThousandsOfObjectsAtOnce [

	self newDatabase.
	txn := db newTransaction.
	root := txn root: (1 to: 100) asArray.
	txn commit
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

	self newDatabase.
	txn := db newTransaction.
	root := txn root: Object new.
	txn commit
]

{ #category : 'benchmarking' }
DBBenchmarksObject >> benchWriteThousandsOfObjectsOneHundredAtATime [

	^ self shouldBeImplemented
]

{ #category : 'benchmarking' }
DBBenchmarksObject >> benchWriteThousandsOfObjectsTenAtATime [

	^ self shouldBeImplemented
]

{ #category : 'benchmarking' }
DBBenchmarksObject >> benchWriteaOneMillionObjectPointerCommit [

	^ self shouldBeImplemented
]

{ #category : 'instance creation' }
DBBenchmarksObject >> databaseName [

	^ 'soil-prueba'
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
