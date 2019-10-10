Class {
	#name : #JbArity1OperatorNode,
	#superclass : #Object,
	#instVars : [
		'operator',
		'operand'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #'as yet unclassified' }
JbArity1OperatorNode >> evaluateIn: environment [

	| operandValue |
	operandValue := self operand evaluateIn: environment.
	
	self operator = $-
		ifTrue: [ ^ operandValue negated ]
	


]

{ #category : #accessing }
JbArity1OperatorNode >> operand [
	^ operand
]

{ #category : #accessing }
JbArity1OperatorNode >> operand: anObject [
	operand := anObject
]

{ #category : #accessing }
JbArity1OperatorNode >> operator [
	^ operator
]

{ #category : #accessing }
JbArity1OperatorNode >> operator: anObject [
	operator := anObject
]
