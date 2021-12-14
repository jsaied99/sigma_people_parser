grammar python3_parser;
//import test;

variableName: IDENTIFIER;
variableAssignment: variableName SET variableType;
variableType:
    number
	| string
	// | number
	| bool
	| nullvalue
	| floatvalue
	| set
	| list
	| dict;
string : STRING ;
// number: HEX_NUMBER | INTEGER_NUMBER;
number: INT | INTEGER_NUMBER | NON_ZERO_DIGIT | MINUS INTEGER_NUMBER;
//testingFloat: INTEGER_NUMBER+ '.' INTEGER_NUMBER+;
bool: BOOL;
nullvalue: 'None';
floatvalue: NUMBER;

set: LPAREN variableType (DELIM variableType)* RPAREN | LPAREN RPAREN;
list: BRACKET variableType (DELIM variableType)* BRACKET | BRACKET BRACKET;

dict: BRACKET ( keyValuePair (DELIM keyValuePair)*)? BRACKET;
keyValuePair: string COLON (variableType | dict);

operation: INTEGER_NUMBER+ arithmeticOperands INTEGER_NUMBER+ NEWLINE;

// primitive : string | bool ;
//ifBlock:
//	IF condition COLON blockCode
//	| IF condition COLON blockCode ELSE blockCode;
ifBlock: IF condition_handler COLON INDENT inside;
inside: blockCode INDENT inside | blockCode endIf | oneDeepIf;
endIf:  NEWLINE blockCode| NEWLINE ELSE COLON INDENT inside | NEWLINE | NEWLINE ifBlock;

elif: ELIF IF condition_handler COLON INDENT inside;

oneDeepIf: IF condition_handler COLON INDENTx2 insideOneIf;
insideOneIf: blockCode INDENTx2 insideOneIf | blockCode endOneIf | twoDeepIf | twoDeepFor;
endOneIf: NEWLINE | INDENT inside | INDENT ELSE COLON INDENTx2 insideOneIf;

twoDeepIf: IF condition_handler COLON INDENTx3 insideTwoIf;
insideTwoIf: blockCode INDENTx3 insideTwoIf | blockCode endTwoIf | threeDeepIf;
endTwoIf: NEWLINE | INDENT inside | INDENTx2 insideOneIf | INDENTx2 ELSE COLON INDENTx3 insideTwoIf;

threeDeepIf: IF condition_handler COLON INDENTx4 insideThreeIf;
insideThreeIf: blockCode INDENTx4 insideThreeIf | blockCode endThreeIf;
endThreeIf: NEWLINE | INDENT inside | INDENTx2 insideOneIf | INDENTx3 insideTwoIf | INDENTx3 ELSE COLON INDENTx4 insideThreeIf;


for_statement: LOOP variableName RANGE LPAREN IDENTIFIER+ RPAREN COLON INDENT insideFor;
insideFor: blockCode INDENT insideFor | endFor;
endFor: NEWLINE;
twoDeepFor: 'no';
// NEWLINE : ('\r'? '\n' | '\r' | '\f') SPACES? ;


// ifElseBlock : 'if' condition ':' blockCode 'else:' blockCode ;

// whileBlock : 'while' condition ':' blockCode ;

//condition: (IDENTIFIER | variableType) conditionalStatement (IDENTIFIER | variableType);

/*
IF -> if statement: INDENT INSIDE
INSIDE -> BLOCK INDENT INDISE | END | 1-DEEP-IF
END -> NEWLINE | NEWLINE else | NEWLINE el IF

1-DEEP-IF -> if statement: INDENTx2 INSIDEx2
INSIDEx3 -> BLOCK INDENTx2 INDISEx3 | ENDx2 | 2-DEEP-IF | 2-DEEP-FOR
ENDx2 -> INDENT | INDENT else

2-DEEP-IF -> if statement: INDENTx3 INSIDEx3
INSIDEx3 -> BLOCK INDENTx3 INDISEx3 | ENDx3 | 3-DEEP-IF
ENDx3 -> INDENTx2 | INDENTx2 else

3-DEEP-IF -> if statement: INDENTx4 INSIDEx4
INSIDEx4 -> BLOCK INDENTx4 INDISEx4 | ENDx4
ENDx4 -> INDENTx3 | INDENTx3 else

FOR -> for statement: INDENT INSIDE-FOR
INSIDE-FOR -> BLOCK INDENT INSIDE | NEWLINE | 1-DEEP-IF

2-DEEP-FOR -> for statement: INDENTx3 INSIDE-FORx2
INSIDE-FORx2 -> BLOCK INDENTx3 INSIDE-FORx2 | INDENTx2 | 3-DEEP-IF
*/


blockCode
    : 'print("hello world")' NEWLINE*
    //| ifBlock
    | while_statement
    //| for_statement
    | assignmentOperators
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

// making var to handle case of multiple condition
condition_handler: conditionalStatement COMBINE condition_handler | conditionalStatement;

//condition_handler: conditionalStatement AND_STATEMENT condition_handler | conditionalStatement;
// while loop
while_statement: LOOP condition_handler COLON;
//while_statement: WHILE ' ' condition_handler COLON NEWLINE SEMICOLON;

//while_test: WHILE COLON INDENT;
// for loop


COMBINE: 'AND' | 'OR';
RANGE: 'in range';
BOOL: 'True' | 'False';
LOOP: 'while' | 'for';
//for_statement: 'for' variableName 'in range('IDENTIFIER+ '):';
INDENTx4: INDENTx3 TAB;
INDENTx3: INDENTx2 TAB;
INDENTx2: INDENT TAB;
INDENT: NEWLINE TAB;
indent_test: INDENT;

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
fragment SPACE_TEST: ' ';
TAB: SPACE_TEST SPACE_TEST SPACE_TEST SPACE_TEST;
tab_test: TAB;
//WS: [ \n\r]+ -> skip;
//OPTIONAL_SPACE: ' ' | ;
//DOUBLESPACE: '  ';
SEMICOLON: ';';
//INDENT: '\n    ';
//AND_STATEMENT: 'and';
//tab_test: TAB;
