grammar python3_parser;
//import test;



variableName: IDENTIFIER;
variableType:
    number
	| string
	| bool
	| nullvalue
	| floatvalue
	| set
	| list
	| dict;
string : STRING ;
number: INT | INTEGER_NUMBER | NON_ZERO_DIGIT | MINUS INTEGER_NUMBER;
bool: BOOL;
nullvalue: 'None';//TODO: what is this?
floatvalue: NUMBER;

set: LPAREN variableType (DELIM variableType)* RPAREN | LPAREN RPAREN;
list: BRACKET variableType (DELIM variableType)* BRACKET | BRACKET BRACKET;

dict: BRACKET ( keyValuePair (DELIM keyValuePair)*)? BRACKET;
keyValuePair: string COLON (variableType | dict);

operation: INTEGER_NUMBER+ arithmeticOperands INTEGER_NUMBER+ NEWLINE;

// primitive : string | bool ;

//==================================================================================================
// IF STATEMENTS
//==================================================================================================
ifBlock: IF condition COLON inside;
inside: (INDENT (blockCode | oneDeepIf))+ endIf*;
endIf:  NEWLINE ELSE COLON inside | NEWLINE | NEWLINE ifBlock;

oneDeepIf: IF condition COLON insideOneIf;
insideOneIf: (INDENTx2 (blockCode | twoDeepIf | twoDeepFor))+ endOneIf*;
endOneIf: NEWLINE | INDENT ELSE COLON insideOneIf;

twoDeepIf: IF condition COLON insideTwoIf;
insideTwoIf: (INDENTx3 (blockCode | threeDeepIf ))+ endTwoIf*;
endTwoIf: NEWLINE | INDENTx2 ELSE COLON insideTwoIf;

threeDeepIf: IF condition COLON  insideThreeIf;
insideThreeIf: (INDENTx4 blockCode)+ endThreeIf*;
endThreeIf: NEWLINE | INDENTx3 ELSE COLON insideThreeIf;

//==================================================================================================
// FOR LOOPS
//==================================================================================================

//Looping range
forRange: variableName RANGE LPAREN IDENTIFIER+ RPAREN | 'range';// TODO: for debug remove | 'range'

//Non-nested for
for_statement: LOOP forRange COLON insideFor;
insideFor: (INDENT (blockCode | oneDeepIf))+ endFor*;
endFor: NEWLINE;

//double-nested for
twoDeepFor: LOOP forRange COLON insideTwoFor;
insideTwoFor: (INDENTx3 (blockCode | threeDeepIf))+ endTwoFor*;
endTwoFor: NEWLINE;

//==================================================================================================
// WHILE LOOPS
//==================================================================================================

while_statement: LOOP condition COLON insideWhile;
insideWhile: (INDENT (blockCode | oneDeepIf))+ endWhile*;
endWhile: NEWLINE;

print: PRINT LPAREN STRING RPAREN;

blockCode
    : print
    | while_statement
    | assignmentOperators
    | CTRL_FLOW
    ;

arithmeticOperands: PLUS | MINUS | DIVIDE | MULTIPLY | MOD | XOR;

// Jaden was here
// S -> NA=V
// A -> empty | + | - | * | / | % | // | ** | & | | | ^ | >> | <<
// O -> A | ~
// N -> var_name
// V -> value | E | N
// E -> VOV
assignmentOperators: variableName (SET | assignmentPreOperand SET) assigned;
assignmentPreOperand: arithmeticOperands | PRESETOPERAND;
assigned: variableType | arithmeticOperation;
arithmeticOperation: arithmeticOperation arithmeticOperands arithmeticOperation
    | floatvalue
    | number
    | variableName
    | LPAREN arithmeticOperation RPAREN
    ;

conditionalStatement: equality;
equality: comparison((NOT_EQUAL|EQUAL) comparison)*;
comparison: term((GREATER_THAN|EQUAL_GREATER|LESS_THAN|EQUAL_LESS) term)*;
term: factor((MINUS|PLUS) factor)*;
factor: unary((DIVIDE|MULTIPLY) unary)*;
unary: unary(NOT|MINUS) unary
    | primary;
primary: variableType | variableName | string | bool | nullvalue
    | LPAREN conditionalStatement RPAREN;

condition: condition_handler | (condition_handler);

// making var to handle case of multiple condition
condition_handler: conditionalStatement COMBINE condition_handler | conditionalStatement;

//condition_handler: conditionalStatement AND_STATEMENT condition_handler | conditionalStatement;
// while loop

//while_statement: WHILE ' ' condition_handler COLON NEWLINE SEMICOLON;

//while_test: WHILE COLON INDENT;
// for loop

PRINT: 'print';
COMBINE: 'AND' | 'OR';
RANGE: 'in range';
BOOL: 'True' | 'False';
LOOP: 'while' | 'for';
//for_statement: 'for' variableName 'in range('IDENTIFIER+ '):';
INDENTx4: INDENTx3 TAB;
INDENTx3: INDENTx2 TAB;
INDENTx2: INDENT TAB;
INDENT: NEWLINE TAB;
//indent_test: INDENT;
CTRL_FLOW: 'break' | 'continue';
BRACKET: '[' | ']' | '{' | '}';
STRING: '"' STRING_LITERAL* '"';
DELIM: ',';
fragment STRING_LITERAL:
	'a' ..'z'
	| 'A' ..'Z'
	| '0' ..'9'
	| ':'
	| '.'
	| '&'
	| '/'
	| '\\'
	| ';'
	| ' ';
PRESETOPERAND: '//' | '**' | '&' | '|' | '<<' | '>>';
fragment HEX_DIGIT: ('0' ..'9' | 'a' ..'f' | 'A' ..'F');
fragment DIGIT: ('0' ..'9');
HEX_NUMBER: '0' 'x' HEX_DIGIT+;
INTEGER_NUMBER: [0-9]+;
DECIMAL_INTEGER: NON_ZERO_DIGIT DIGIT* | '0'+;
NON_ZERO_DIGIT: [1-9];
NEWLINE: [\r\n]+;
EQUAL: '==';
NOT_EQUAL: '!=';
EQUAL_GREATER: '>=';
GREATER_THAN: '>';
EQUAL_LESS: '<=';
LESS_THAN: '<';
NOT: '!';
DIVIDE: '/';
MULTIPLY: '*';
PLUS: '+';
MINUS: '-';
MOD : '%';
XOR : '^';
LPAREN: '(';
RPAREN: ')';
COMMENT : ('#') (.)*? '\n' -> channel(HIDDEN);
WS: [ \t\n\r]+ -> skip;
fragment D : [0-9] ;
INT : D+ ;
fragment DIGIT2: '0' ..'9';
fragment INTEGER: DIGIT2+;
fragment DOT : '.';
NUMBER: INTEGER (DOT INTEGER)?;
AND_STATEMENT: 'and';
SET: '=';
IF: 'if' | 'elif';
ELSE: 'else';
IDENTIFIER: [a-zA-Z_][a-zA-Z0-9_]*;
COLON: ':';
//need symbol for tab
fragment SPACE: ' ';
TAB: SPACE SPACE SPACE SPACE;
//tab_test: TAB;
//WS: [ \n\r]+ -> skip;
//OPTIONAL_SPACE: ' ' | ;
//DOUBLESPACE: '  ';
SEMICOLON: ';';
//INDENT: '\n    ';
//AND_STATEMENT: 'and';
//tab_test: TAB;
