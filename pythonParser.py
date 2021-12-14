import antlr4
from antlr4.InputStream import InputStream
from python3_parserLexer import python3_parserLexer
from python3_parserParser import python3_parserParser
from antlr4.tree.Trees import Trees
import sys


def main():
    input_stream = None
    if len(sys.argv) > 1:
        input_stream = FileStream(sys.argv[1])
    else:
        input_stream = InputStream(sys.stdin.readline())
    lexer = python3_parserLexer(input_stream) 
    stream = antlr4.CommonTokenStream(lexer) 
    parser = python3_parserParser(stream) 
    tree = parser.conditionalStatement()
    # handleExpression(tree) 
    
    print(Trees.toStringTree(tree, None, parser))

if __name__ == '__main__':
    main()

