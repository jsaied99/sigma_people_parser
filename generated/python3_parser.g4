grammar python3_parser;
//import test;

program: line+;

line
    : blockCode
    | ifBlock
    | for_statement;

blockCode
    : print
    | while_statement
    | assignmentOperators
    | CTRL_FLOW
    | NEWLINE
    ;

variableName: IDENTIFIER;
variableType:
    number
	| STRING
	| bool
	| nullvalue
	| floatvalue
	| set
	| list
	| dict;
number
    : INT
    | INTEGER_NUMBER
    | NON_ZERO_DIGIT
    | MINUS INTEGER_NUMBER;
bool: BOOL;
nullvalue: 'None';//TODO: what is this?
floatvalue: NUMBER;
set: LPAREN variableType (DELIM variableType)* RPAREN | LPAREN RPAREN;
list: BRACKET variableType (DELIM variableType)* BRACKET | BRACKET BRACKET;
dict: BRACKET ( keyValuePair (DELIM keyValuePair)*)? BRACKET;
keyValuePair: STRING COLON (variableType | dict);

//==================================================================================================
// IF STATEMENTS
//==================================================================================================

//Non-nested if (+else + elif)
ifBlock: IF condition COLON inside;
inside: (INDENT (blockCode | oneDeepIf))+ endIf*;
endIf
    : NEWLINE ELSE COLON inside //ELSE
    | NEWLINE                   //END IF
    | NEWLINE ifBlock;          //ELSE IF

//Nested if (+else)
oneDeepIf: IF condition COLON insideOneIf;
insideOneIf: (INDENTx2 (blockCode | twoDeepIf | twoDeepFor))+ endOneIf*;
endOneIf
    : NEWLINE                       // END IF
    | INDENT ELSE COLON insideOneIf;// ELSE

//Double-nested if (+else)
twoDeepIf: IF condition COLON insideTwoIf;
insideTwoIf: (INDENTx3 (blockCode | threeDeepIf ))+ endTwoIf*;
endTwoIf
    : NEWLINE                           // END IF
    | INDENTx2 ELSE COLON insideTwoIf;  // ELSE

//Triple-nested if (+else)
threeDeepIf: IF condition COLON  insideThreeIf;
insideThreeIf: (INDENTx4 blockCode)+ endThreeIf*;
endThreeIf
    : NEWLINE                               // END IF
    | INDENTx3 ELSE COLON insideThreeIf;    // ELSE

//==================================================================================================
// FOR LOOPS
//==================================================================================================

//Looping range
forRange: variableName RANGE LPAREN startRange DELIM endRange RPAREN;
startRange: (IDENTIFIER | NUMBER arithmeticOperation);
endRange: (IDENTIFIER | NUMBER | arithmeticOperation);
//Non-nested for
for_statement: LOOP forRange COLON insideFor;
insideFor: (INDENT (blockCode | oneDeepIf))+ endFor*;
endFor: NEWLINE;

//Double-nested for
twoDeepFor: LOOP forRange COLON insideTwoFor;
insideTwoFor: (INDENTx3 (blockCode | threeDeepIf))+ endTwoFor*;
endTwoFor: NEWLINE;

//==================================================================================================
// WHILE LOOPS
//==================================================================================================

// While loop
while_statement: LOOP condition COLON insideWhile;
insideWhile: (INDENT (blockCode | oneDeepIf))+ endWhile*;
endWhile: NEWLINE;

print: PRINT LPAREN (STRING | cast | variableName) (PLUS STRING | PLUS cast | PLUS variableName)* RPAREN;
cast: CAST LPAREN (arithmeticOperation | variableName) RPAREN;

arithmeticOperands: PLUS | MINUS | DIVIDE | MULTIPLY | MOD | XOR;

assignmentOperators: variableName (SET | assignmentPreOperand SET) assigned;
assignmentPreOperand: arithmeticOperands | PRESETOPERAND;
assigned: variableType | arithmeticOperation;
arithmeticOperation: arithmeticOperation arithmeticOperands arithmeticOperation
    | floatvalue
    | number
    | variableName
    | LPAREN arithmeticOperation RPAREN
    | cast
    ;

conditionalStatement: equality;
equality: comparison((NOT_EQUAL|EQUAL) comparison)*;
comparison: term((GREATER_THAN|EQUAL_GREATER|LESS_THAN|EQUAL_LESS) term)*;
term: factor((MINUS|PLUS) factor)*;
factor: unary((DIVIDE|MULTIPLY) unary)*;
unary: unary(NOT|MINUS) unary
    | primary;
primary: variableType | variableName
    | LPAREN conditionalStatement RPAREN;

condition: condition_handler | (condition_handler);

// making var to handle case of multiple condition
condition_handler: conditionalStatement COMBINE condition_handler | conditionalStatement;

CAST: 'str' | 'int';
PRINT: 'print';
COMBINE: 'and' | 'or';
RANGE: 'in range';
BOOL: 'True' | 'False';
LOOP: 'while' | 'for';
INDENTx4: INDENTx3 TAB;
INDENTx3: INDENTx2 TAB;
INDENTx2: INDENT TAB;
INDENT: NEWLINE TAB;
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
	| '\''
	| '('
	| ')'
	| '&'
	| '/'
	| '\\'
	| ';'
	| '!'
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
SET: '=';
IF: 'if' | 'elif';
ELSE: 'else';
IDENTIFIER: [a-zA-Z_][a-zA-Z0-9_]*;
COLON: ':';
fragment SPACE: ' ';
TAB: SPACE SPACE SPACE SPACE;
SEMICOLON: ';';
