Class {
	#name : 'DBBSoilSMarkReporter',
	#superclass : 'ReBenchReporter',
	#category : 'DBBenchmarks-',
	#package : 'DBBenchmarks',
	#tag : ''
}

{ #category : 'defaults' }
DBBSoilSMarkReporter class >> defaultOutputDestination [
	"Answer a <Stream> used to output receiver's contents"

	^ self defaultOutputFilename asFileReference writeStream
]

{ #category : 'defaults' }
DBBSoilSMarkReporter class >> defaultOutputFilename [

	^ String streamContents: [ : stream | 
		stream
			<< 	DateAndTime current asFileNameCompatibleString;
			<< '.csv' ]
]
