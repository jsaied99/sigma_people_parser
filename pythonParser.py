import antlr4
from antlr4.InputStream import InputStream
from antlr4.FileStream import FileStream
from generated.python3_parserLexer import python3_parserLexer
from generated.python3_parserParser import python3_parserParser
from antlr4.tree.Trees import Trees
import sys


def main():
    
    file_name = None
    if len(sys.argv) > 1:
        file_name = sys.argv[1]
        
    if file_name is None:
        print("Please provide a file name as argument")
        
    
    input_stream = FileStream(file_name)
    lexer = python3_parserLexer(input_stream) 
    stream = antlr4.CommonTokenStream(lexer) 
    parser = python3_parserParser(stream) 
    tree = parser.program()
        
    print(Trees.toStringTree(tree, None, parser))

if __name__ == '__main__':
    main()

