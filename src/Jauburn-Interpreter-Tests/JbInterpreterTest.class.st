Class {
	#name : #JbInterpreterTest,
	#superclass : #TestCase,
	#instVars : [
		'interpreter',
		'parser'
	],
	#category : #'Jauburn-Interpreter-Tests'
}

{ #category : #utilities }
JbInterpreterTest >> interpret: aString [

	| ast |
	ast :=  parser parse: aString.
	^interpreter interpret: ast.
	
]

{ #category : #running }
JbInterpreterTest >> setUp [ 

	parser := JbParser new.
	interpreter := JbInterpreter new
]

{ #category : #running }
JbInterpreterTest >> testDeclarationBindsVariableToExpressionValue [

	self interpret: 'var x = 3 + 2 * 8;'.
	self assert: (interpreter environment at: 'x') equals: 19.
	
	self interpret: 'var x = 6;var y = 2*x;'.
	self assert: (interpreter environment at: 'y') equals: 12.
	
	self interpret: 'var x = 8 - 2;'.
	self assert: (interpreter environment at: 'x') equals: 6.
	
	self interpret: 'var x = 8 / 2;'.
	self assert: (interpreter environment at: 'x') equals: 4.
	
	self interpret: 'var x = 8 == 2;'.
	self assert: (interpreter environment at: 'x') equals: false.
	
	self interpret: 'var x = 8 < 2;'.
	self assert: (interpreter environment at: 'x') equals: false.
	
	self interpret: 'var x = 8 <= 2;'.
	self assert: (interpreter environment at: 'x') equals: false.
	
	self interpret: 'var x = 8 > 2;'.
	self assert: (interpreter environment at: 'x') equals: true.
	
	self interpret: 'var x = 8 >= 2;'.
	self assert: (interpreter environment at: 'x') equals: true.
	
	self interpret: 'var x = 8 != 2;'.
	self assert: (interpreter environment at: 'x') equals: true.
	
	self interpret: 'var x = -(-2);'.
	self assert: (interpreter environment at: 'x') equals: 2.
	
	self interpret: 'var x = abs -2'.
	self assert: (interpreter environment at: 'x') equals: 2. 

	self interpret: 'var x = concat 2 2'.
	self assert: (interpreter environment at: 'x') equals: '22'.
	
	self interpret: 'var x = length #(1, 2, 3)'.
	self assert: (interpreter environment at: 'x') equals: 5.
	
	self interpret: 'var x = mod 6 5'.
	self assert: (interpreter environment at: 'x') equals: 1.

	self interpret: 'var x = not true'.
	self assert: (interpreter environment at: 'x') equals: false.
]

{ #category : #running }
JbInterpreterTest >> testDeclarationCreatesVariable [

	self interpret: 'var x = 99;'.
	self assert: (interpreter environment includesKey: 'x')
]
