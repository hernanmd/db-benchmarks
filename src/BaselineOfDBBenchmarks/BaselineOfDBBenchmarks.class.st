Class {
	#name : 'BaselineOfDBBenchmarks',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfDBBenchmarks',
	#package : 'BaselineOfDBBenchmarks'
}

{ #category : 'baselines' }
BaselineOfDBBenchmarks >> baseline: spec [
  <baseline>
	spec
		for: #(common)
		do: [ 
			spec 
				baseline: 'SMark'    with: [ spec repository: 'github://guillep/SMark/repository' ];
				package: 'DBBenchmarks'        with: [ spec requires: #(SMark) ];
				package: 'DBBenchmarks-Tests'	with: [ spec requires: #(DBBenchmarks) ].
			spec 
				group: 'Core' 						with: #('DBBenchmarks');
				group: 'Tests' 						with: #('DBBenchmarks' 'DBBenchmarks-Tests');
				group: 'default' 					with: #('Core' 'Tests') ]
]
