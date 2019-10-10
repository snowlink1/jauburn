"
Just a place to house a few sample programs
"
Class {
	#name : #JbSamplePrograms,
	#superclass : #Object,
	#category : #'Jauburn-Interpreter-SamplePrograms'
}

{ #category : #'sample programs' }
JbSamplePrograms class >> newtonSquare [

| x  y  z|
"
Smalltalk Version
x := UIManager default request: 'Enter Number'.
y := 10.

z := y - (((y squared) - x) / (2.0 * y)).
Transcript show: z; cr.
10 timesRepeat: [ 
	z := z - (((z squared) - x) / (2.0 * z)).
	Transcript show: z; cr.
	 ].
"

"Jauburn Version (if my bindings worked)
x := input 'Enter Number'.
y := 10.

z := y - (((y squared) - x) / (2.0 * y)).
pintln z.
10 timesRepeat: [ 
	z := z - (((z squared) - x) / (2.0 * z)).
	println z.
	 ].
"
^z
]

{ #category : #'sample programs' }
JbSamplePrograms class >> noFunctions [
	"self run: #noFunctions"

	^'var x = 1;
var y = 10 * x - 1;
if (y == 9) { 
   x = 16;
}
'
]

{ #category : #utilities }
JbSamplePrograms class >> run: method [
	"Look at sample programs for examples of using this method."

	^JbInterpreter new run: (self perform: method)
]
