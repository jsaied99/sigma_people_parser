grammar python3_parser;

IDENTIFIER: [a-zA-Z_][a-zA-Z0-9_]+;

variableName: IDENTIFIER;

variableAssignment: variableName '=' variableType;

variableType:
	string
	| NUMBER
	| bool
	| NULL
	| FLOAT
	| set
	| list
	| dict;
string: '"' STRING_LITERAL* '"';
STRING_LITERAL:
	'a' ..'z'
	| 'A' ..'Z'
	| '0' ..'9'
	| ':'
	| '.'
	| '&'
	| '/'
	| '\\'
	| ';';

NUMBER: DECIMAL_INTEGER;

DECIMAL_INTEGER: NON_ZERO_DIGIT DIGIT* | '0'+;

NON_ZERO_DIGIT: [1-9];
DIGIT: [0-9];

bool: 'True' | 'False';
NULL: 'None';

FLOAT: [0-9]+ '.' [0-9]+;

set: '(' variableType (',' variableType)* ')' | '(' ')';
list: '[' variableType (',' variableType)* ']' | '[' ']';

dict: '{' ( keyValuePair (',' keyValuePair)*)? '}';
keyValuePair: string ':' (variableType | dict);

NUMBERS: [0-9]+;

operation: NUMBERS+ arithmeticOperands NUMBERS+ NEWLINE;
NEWLINE: [\r\n]+;
// primitive : string | bool ;
ifBlock:
	'if ' condition ':' blockCode
	| 'if ' condition ':' blockCode 'else:' blockCode;

INDENT: SPACES+;
// NEWLINE : ('\r'? '\n' | '\r' | '\f') SPACES? ;

SPACES: [ \t]+;
// ifElseBlock : 'if' condition ':' blockCode 'else:' blockCode ;

// whileBlock : 'while' condition ':' blockCode ;

condition: IDENTIFIER conditionalStatement IDENTIFIER;

blockCode: 'print("hello world")' NEWLINE* | ifBlock;

arithmeticOperands: '+' | '-' | '/' | '*' | '%' | '^';

// Jaden was here
// S -> NA=V
// A -> empty | + | - | * | / | % | // | ** | & | | | ^ | >> | <<
// O -> A | ~
// N -> var_name
// V -> value | E | N
// E -> VOV
assignmentOperators: variableName assignmentPreOperand '=' assigned;
assignmentPreOperand: ;
assigned: variableName | variableType | arithmeticOperation;


conditionalStatement:
	'<'
	| '<='
	| '>'
	| '>='
	| '=='
	| '!='
	| 'and'
	| 'or'
	| 'not';

WS: [ \t\n\r]+ -> skip;