grammar python3_parser;

IDENTIFIER: [a-zA-Z_][a-zA-Z0-9_]+;

variableName: IDENTIFIER;

variableAssignment: variableName '=' variableType;

variableType:
	string
	// | number
	| number
	| bool
	| nullvalue
	| floatvalue
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

// number: DECIMAL_INTEGER;
fragment HEX_DIGIT: ('0' ..'9' | 'a' ..'f' | 'A' ..'F');

fragment DIGIT: ('0' ..'9');

// number: HEX_NUMBER | INTEGER_NUMBER;
number: NUMBER;

HEX_NUMBER: '0' 'x' HEX_DIGIT+;

INTEGER_NUMBER: [0-9]+;


testingFloat: INTEGER_NUMBER+ '.' INTEGER_NUMBER+;

DECIMAL_INTEGER: NON_ZERO_DIGIT DIGIT* | '0'+;

NON_ZERO_DIGIT: [1-9];
// DIGIT: [0-9];

bool: 'True' | 'False';
nullvalue: 'None';

floatvalue: DECIMAL_INTEGER+ '.' DECIMAL_INTEGER+;



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
assignmentOperators: ('+' | '-' | '*' | '/' | '^' | '%')? '=';
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


fragment DIGIT2: '0' ..'9';

fragment INTEGER: DIGIT2+;

fragment DOT : '.';

// NUMBER: INTEGER (DOT INTEGER)?;
NUMBER: INTEGER (DOT INTEGER)?;

