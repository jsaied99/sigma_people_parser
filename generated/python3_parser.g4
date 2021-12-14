grammar python3_parser;

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
testingFloat: INTEGER_NUMBER+ '.' INTEGER_NUMBER+;
bool: 'True' | 'False';
nullvalue: 'None';
floatvalue: NUMBER;

set: LPAREN variableType (',' variableType)* RPAREN | LPAREN RPAREN;
list: BRACKET variableType (',' variableType)* BRACKET | BRACKET BRACKET;

dict: BRACKET ( keyValuePair (',' keyValuePair)*)? BRACKET;
keyValuePair: string COLON (variableType | dict);

operation: INTEGER_NUMBER+ arithmeticOperands INTEGER_NUMBER+ NEWLINE;

// primitive : string | bool ;
ifBlock:
	IF condition COLON blockCode
	| IF condition COLON blockCode ELSE blockCode;


// NEWLINE : ('\r'? '\n' | '\r' | '\f') SPACES? ;


// ifElseBlock : 'if' condition ':' blockCode 'else:' blockCode ;

// whileBlock : 'while' condition ':' blockCode ;

condition: (IDENTIFIER | variableType) conditionalStatement (IDENTIFIER | variableType);

blockCode: 'print("hello world")' NEWLINE* | ifBlock;

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
    | '(' conditionalStatement ')';


//WS
//    : [ \t\r\n]+ -> channel(HIDDEN)
//;
//
//COMMENT
//    : '#' .*? -> skip
//;


// NUMBER: INTEGER (DOT INTEGER)?;


// making var to handle case of multiple condition
condition_handler: condition 'AND' condition_handler | condition;

// while loop
while_statement: 'while' condition_handler':';

// for loop
for_statement: 'for' variableName 'in range('IDENTIFIER+ '):';


BRACKET: '[' | ']' | '{' | '}';
STRING: '"' STRING_LITERAL* '"';
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
SET: '=';
IF: 'if';
ELSE: 'else';
ELIF: 'elif';
IDENTIFIER: [a-zA-Z_][a-zA-Z0-9_]*;
COLON: ':';