"
I am an interpreter for programs written in the Jauburn language.  My principle API methods are:

	interpret: anAST -- given an abstract syntax tree, interpret it
	run: aString -- parse and interpret the supplied string
"
Class {
	#name : #JbInterpreter,
	#superclass : #Object,
	#instVars : [
		'environment'
	],
	#category : #'Jauburn-Interpreter-Core'
}

{ #category : #primitives }
JbInterpreter >> absBinding [

^#abs -> [ :x | x abs]
]

{ #category : #primitives }
JbInterpreter >> concatBinding [

^#concat -> [ :x1 :x2 | (x1 asString, x2 asString)]
]

{ #category : #accessing }
JbInterpreter >> environment [ 

	^environment
]

{ #category : #initialization }
JbInterpreter >> initialize [ 

	super initialize.
	environment := JbEnvironment new.
	
	(self class selectors select: [ :binding | binding endsWith: 'Binding' ])
		do: [ :x | | bind | 
						bind := self perform: x.
						environment at: bind key put: (JbPrimitive new block: bind value) ]
]

{ #category : #primitives }
JbInterpreter >> inputBinding [

^#input -> [ :x | UIManager default request: x]
]

{ #category : #api }
JbInterpreter >> interpret: ast [

	^ast executeIn: environment 
]

{ #category : #primitives }
JbInterpreter >> lengthBinding [

^#length -> [ :x | x size]
]

{ #category : #primitives }
JbInterpreter >> modBinding [

^#mod -> [ :x1 :x2 | x1 \\ x2]
]

{ #category : #primitives }
JbInterpreter >> notBinding [

^#not -> [ :x | x not]
]

{ #category : #primitives }
JbInterpreter >> printBinding [
	^#print -> [ :value | Transcript show: value printString ]
]

{ #category : #primitives }
JbInterpreter >> printlnBinding [

^#println -> [ :x | Transcript show: x printString; cr]
]

{ #category : #api }
JbInterpreter >> run: programString [

	| parser |
	parser := JbParser new.
	self interpret: (parser parse: programString)
]
