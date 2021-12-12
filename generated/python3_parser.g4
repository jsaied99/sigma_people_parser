grammar python3_parser;

IDENTIFIER: [a-zA-Z_][a-zA-Z0-9_]*;

variableName: IDENTIFIER;

variableAssignment: variableName '=' variableType;

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

// number: DECIMAL_INTEGER;
fragment HEX_DIGIT: ('0' ..'9' | 'a' ..'f' | 'A' ..'F');

fragment DIGIT: ('0' ..'9');

// number: HEX_NUMBER | INTEGER_NUMBER;
number: INT | INTEGER_NUMBER | NON_ZERO_DIGIT;

HEX_NUMBER: '0' 'x' HEX_DIGIT+;

INTEGER_NUMBER: [0-9]+;


testingFloat: INTEGER_NUMBER+ '.' INTEGER_NUMBER+;

DECIMAL_INTEGER: NON_ZERO_DIGIT DIGIT* | '0'+;

NON_ZERO_DIGIT: [1-9];
// DIGIT: [0-9];

bool: 'True' | 'False';
nullvalue: 'None';

floatvalue: NUMBER;



set: '(' variableType (',' variableType)* ')' | '(' ')';
list: '[' variableType (',' variableType)* ']' | '[' ']';

dict: '{' ( keyValuePair (',' keyValuePair)*)? '}';
keyValuePair: string ':' (variableType | dict);

operation: INTEGER_NUMBER+ arithmeticOperands INTEGER_NUMBER+ NEWLINE;
NEWLINE: [\r\n]+;
// primitive : string | bool ;
ifBlock:
	'if ' condition ':' blockCode
	| 'if ' condition ':' blockCode 'else:' blockCode;


// NEWLINE : ('\r'? '\n' | '\r' | '\f') SPACES? ;


// ifElseBlock : 'if' condition ':' blockCode 'else:' blockCode ;

// whileBlock : 'while' condition ':' blockCode ;

condition: (IDENTIFIER | variableType) conditionalStatement (IDENTIFIER | variableType);

blockCode: 'print("hello world")' NEWLINE* | ifBlock;

arithmeticOperands: '+' | '-' | '/' | '*' | '%' | '^';


// Jaden was here
// S -> NA=V
// A -> empty | + | - | * | / | % | // | ** | & | | | ^ | >> | <<
// O -> A | ~
// N -> var_name
// V -> value | E | N
// E -> VOV
assignmentOperators: variableName ('=' | assignmentPreOperand '=') assigned;
assignmentPreOperand: arithmeticOperands | '//' | '**' | '&' | '|' | '<<' | '>>' ;
assigned: variableName | variableType | arithmeticOperation;
arithmeticOperation: arithmeticOperation arithmeticOperands arithmeticOperation
    | floatvalue
    | number
    | '(' arithmeticOperation ')'
    ;

/*
expression: literal
	| unary
	| binary
	| grouping;
literal: NUMBER | STRING | 'true' | 'false' | 'nil';
grouping: '('expression')';
unary: ( '-' | '!' ) expression;
binary: expression operator expression;
operator: '==' | '!=' | '<' | '<=' | '>' | '>=' | '+'  | '-'  | '*' | '/';
*/

conditionalStatement: equality;
equality: comparison(('!='|'==') comparison)*;
comparison: term(('>'|'>='|'<'|'=<') term)*;
term: factor(('-'|'+') factor)*;
factor: unary(('/'|'-') unary)*;
unary: unary('!'|'-') unary
    | primary;
primary: variableType | variableName | string | 'true' | 'false' | 'nil'
    | '(' conditionalStatement ')';

//WS
//    : [ \t\r\n]+ -> channel(HIDDEN)
//;
//
//COMMENT
//    : '#' .*? -> skip
//;
COMMENT : ('#') (.)*? '\n' -> channel(HIDDEN);


WS: [ \t\n\r]+ -> skip;
fragment D : [0-9] ;
INT : D+ ;

fragment DIGIT2: '0' ..'9';

fragment INTEGER: DIGIT2+;

fragment DOT : '.';

// NUMBER: INTEGER (DOT INTEGER)?;
NUMBER: INTEGER (DOT INTEGER)?;

// making var to handle case of multiple condition
condition_handler: condition 'AND' condition_handler | condition;

// while loop
while_statement: 'while' condition_handler':';

// for loop
for_statement: 'for' variableName 'in range('IDENTIFIER+ '):';