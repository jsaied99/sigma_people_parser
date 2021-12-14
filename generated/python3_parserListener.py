# Generated from python3_parser.g4 by ANTLR 4.9.2
from antlr4 import *
if __name__ is not None and "." in __name__:
    from .python3_parserParser import python3_parserParser
else:
    from python3_parserParser import python3_parserParser

# This class defines a complete listener for a parse tree produced by python3_parserParser.
class python3_parserListener(ParseTreeListener):

    # Enter a parse tree produced by python3_parserParser#program.
    def enterProgram(self, ctx:python3_parserParser.ProgramContext):
        pass

    # Exit a parse tree produced by python3_parserParser#program.
    def exitProgram(self, ctx:python3_parserParser.ProgramContext):
        pass


    # Enter a parse tree produced by python3_parserParser#line.
    def enterLine(self, ctx:python3_parserParser.LineContext):
        pass

    # Exit a parse tree produced by python3_parserParser#line.
    def exitLine(self, ctx:python3_parserParser.LineContext):
        pass


    # Enter a parse tree produced by python3_parserParser#blockCode.
    def enterBlockCode(self, ctx:python3_parserParser.BlockCodeContext):
        pass

    # Exit a parse tree produced by python3_parserParser#blockCode.
    def exitBlockCode(self, ctx:python3_parserParser.BlockCodeContext):
        pass


    # Enter a parse tree produced by python3_parserParser#variableName.
    def enterVariableName(self, ctx:python3_parserParser.VariableNameContext):
        pass

    # Exit a parse tree produced by python3_parserParser#variableName.
    def exitVariableName(self, ctx:python3_parserParser.VariableNameContext):
        pass


    # Enter a parse tree produced by python3_parserParser#variableType.
    def enterVariableType(self, ctx:python3_parserParser.VariableTypeContext):
        pass

    # Exit a parse tree produced by python3_parserParser#variableType.
    def exitVariableType(self, ctx:python3_parserParser.VariableTypeContext):
        pass


    # Enter a parse tree produced by python3_parserParser#number.
    def enterNumber(self, ctx:python3_parserParser.NumberContext):
        pass

    # Exit a parse tree produced by python3_parserParser#number.
    def exitNumber(self, ctx:python3_parserParser.NumberContext):
        pass


    # Enter a parse tree produced by python3_parserParser#boolValue.
    def enterBoolValue(self, ctx:python3_parserParser.BoolValueContext):
        pass

    # Exit a parse tree produced by python3_parserParser#boolValue.
    def exitBoolValue(self, ctx:python3_parserParser.BoolValueContext):
        pass


    # Enter a parse tree produced by python3_parserParser#nullvalue.
    def enterNullvalue(self, ctx:python3_parserParser.NullvalueContext):
        pass

    # Exit a parse tree produced by python3_parserParser#nullvalue.
    def exitNullvalue(self, ctx:python3_parserParser.NullvalueContext):
        pass


    # Enter a parse tree produced by python3_parserParser#floatvalue.
    def enterFloatvalue(self, ctx:python3_parserParser.FloatvalueContext):
        pass

    # Exit a parse tree produced by python3_parserParser#floatvalue.
    def exitFloatvalue(self, ctx:python3_parserParser.FloatvalueContext):
        pass


    # Enter a parse tree produced by python3_parserParser#setValue.
    def enterSetValue(self, ctx:python3_parserParser.SetValueContext):
        pass

    # Exit a parse tree produced by python3_parserParser#setValue.
    def exitSetValue(self, ctx:python3_parserParser.SetValueContext):
        pass


    # Enter a parse tree produced by python3_parserParser#listValue.
    def enterListValue(self, ctx:python3_parserParser.ListValueContext):
        pass

    # Exit a parse tree produced by python3_parserParser#listValue.
    def exitListValue(self, ctx:python3_parserParser.ListValueContext):
        pass


    # Enter a parse tree produced by python3_parserParser#dictValue.
    def enterDictValue(self, ctx:python3_parserParser.DictValueContext):
        pass

    # Exit a parse tree produced by python3_parserParser#dictValue.
    def exitDictValue(self, ctx:python3_parserParser.DictValueContext):
        pass


    # Enter a parse tree produced by python3_parserParser#keyValuePair.
    def enterKeyValuePair(self, ctx:python3_parserParser.KeyValuePairContext):
        pass

    # Exit a parse tree produced by python3_parserParser#keyValuePair.
    def exitKeyValuePair(self, ctx:python3_parserParser.KeyValuePairContext):
        pass


    # Enter a parse tree produced by python3_parserParser#ifBlock.
    def enterIfBlock(self, ctx:python3_parserParser.IfBlockContext):
        pass

    # Exit a parse tree produced by python3_parserParser#ifBlock.
    def exitIfBlock(self, ctx:python3_parserParser.IfBlockContext):
        pass


    # Enter a parse tree produced by python3_parserParser#inside.
    def enterInside(self, ctx:python3_parserParser.InsideContext):
        pass

    # Exit a parse tree produced by python3_parserParser#inside.
    def exitInside(self, ctx:python3_parserParser.InsideContext):
        pass


    # Enter a parse tree produced by python3_parserParser#endIf.
    def enterEndIf(self, ctx:python3_parserParser.EndIfContext):
        pass

    # Exit a parse tree produced by python3_parserParser#endIf.
    def exitEndIf(self, ctx:python3_parserParser.EndIfContext):
        pass


    # Enter a parse tree produced by python3_parserParser#oneDeepIf.
    def enterOneDeepIf(self, ctx:python3_parserParser.OneDeepIfContext):
        pass

    # Exit a parse tree produced by python3_parserParser#oneDeepIf.
    def exitOneDeepIf(self, ctx:python3_parserParser.OneDeepIfContext):
        pass


    # Enter a parse tree produced by python3_parserParser#insideOneIf.
    def enterInsideOneIf(self, ctx:python3_parserParser.InsideOneIfContext):
        pass

    # Exit a parse tree produced by python3_parserParser#insideOneIf.
    def exitInsideOneIf(self, ctx:python3_parserParser.InsideOneIfContext):
        pass


    # Enter a parse tree produced by python3_parserParser#endOneIf.
    def enterEndOneIf(self, ctx:python3_parserParser.EndOneIfContext):
        pass

    # Exit a parse tree produced by python3_parserParser#endOneIf.
    def exitEndOneIf(self, ctx:python3_parserParser.EndOneIfContext):
        pass


    # Enter a parse tree produced by python3_parserParser#twoDeepIf.
    def enterTwoDeepIf(self, ctx:python3_parserParser.TwoDeepIfContext):
        pass

    # Exit a parse tree produced by python3_parserParser#twoDeepIf.
    def exitTwoDeepIf(self, ctx:python3_parserParser.TwoDeepIfContext):
        pass


    # Enter a parse tree produced by python3_parserParser#insideTwoIf.
    def enterInsideTwoIf(self, ctx:python3_parserParser.InsideTwoIfContext):
        pass

    # Exit a parse tree produced by python3_parserParser#insideTwoIf.
    def exitInsideTwoIf(self, ctx:python3_parserParser.InsideTwoIfContext):
        pass


    # Enter a parse tree produced by python3_parserParser#endTwoIf.
    def enterEndTwoIf(self, ctx:python3_parserParser.EndTwoIfContext):
        pass

    # Exit a parse tree produced by python3_parserParser#endTwoIf.
    def exitEndTwoIf(self, ctx:python3_parserParser.EndTwoIfContext):
        pass


    # Enter a parse tree produced by python3_parserParser#threeDeepIf.
    def enterThreeDeepIf(self, ctx:python3_parserParser.ThreeDeepIfContext):
        pass

    # Exit a parse tree produced by python3_parserParser#threeDeepIf.
    def exitThreeDeepIf(self, ctx:python3_parserParser.ThreeDeepIfContext):
        pass


    # Enter a parse tree produced by python3_parserParser#insideThreeIf.
    def enterInsideThreeIf(self, ctx:python3_parserParser.InsideThreeIfContext):
        pass

    # Exit a parse tree produced by python3_parserParser#insideThreeIf.
    def exitInsideThreeIf(self, ctx:python3_parserParser.InsideThreeIfContext):
        pass


    # Enter a parse tree produced by python3_parserParser#endThreeIf.
    def enterEndThreeIf(self, ctx:python3_parserParser.EndThreeIfContext):
        pass

    # Exit a parse tree produced by python3_parserParser#endThreeIf.
    def exitEndThreeIf(self, ctx:python3_parserParser.EndThreeIfContext):
        pass


    # Enter a parse tree produced by python3_parserParser#forRange.
    def enterForRange(self, ctx:python3_parserParser.ForRangeContext):
        pass

    # Exit a parse tree produced by python3_parserParser#forRange.
    def exitForRange(self, ctx:python3_parserParser.ForRangeContext):
        pass


    # Enter a parse tree produced by python3_parserParser#startRange.
    def enterStartRange(self, ctx:python3_parserParser.StartRangeContext):
        pass

    # Exit a parse tree produced by python3_parserParser#startRange.
    def exitStartRange(self, ctx:python3_parserParser.StartRangeContext):
        pass


    # Enter a parse tree produced by python3_parserParser#endRange.
    def enterEndRange(self, ctx:python3_parserParser.EndRangeContext):
        pass

    # Exit a parse tree produced by python3_parserParser#endRange.
    def exitEndRange(self, ctx:python3_parserParser.EndRangeContext):
        pass


    # Enter a parse tree produced by python3_parserParser#for_statement.
    def enterFor_statement(self, ctx:python3_parserParser.For_statementContext):
        pass

    # Exit a parse tree produced by python3_parserParser#for_statement.
    def exitFor_statement(self, ctx:python3_parserParser.For_statementContext):
        pass


    # Enter a parse tree produced by python3_parserParser#insideFor.
    def enterInsideFor(self, ctx:python3_parserParser.InsideForContext):
        pass

    # Exit a parse tree produced by python3_parserParser#insideFor.
    def exitInsideFor(self, ctx:python3_parserParser.InsideForContext):
        pass


    # Enter a parse tree produced by python3_parserParser#endFor.
    def enterEndFor(self, ctx:python3_parserParser.EndForContext):
        pass

    # Exit a parse tree produced by python3_parserParser#endFor.
    def exitEndFor(self, ctx:python3_parserParser.EndForContext):
        pass


    # Enter a parse tree produced by python3_parserParser#twoDeepFor.
    def enterTwoDeepFor(self, ctx:python3_parserParser.TwoDeepForContext):
        pass

    # Exit a parse tree produced by python3_parserParser#twoDeepFor.
    def exitTwoDeepFor(self, ctx:python3_parserParser.TwoDeepForContext):
        pass


    # Enter a parse tree produced by python3_parserParser#insideTwoFor.
    def enterInsideTwoFor(self, ctx:python3_parserParser.InsideTwoForContext):
        pass

    # Exit a parse tree produced by python3_parserParser#insideTwoFor.
    def exitInsideTwoFor(self, ctx:python3_parserParser.InsideTwoForContext):
        pass


    # Enter a parse tree produced by python3_parserParser#endTwoFor.
    def enterEndTwoFor(self, ctx:python3_parserParser.EndTwoForContext):
        pass

    # Exit a parse tree produced by python3_parserParser#endTwoFor.
    def exitEndTwoFor(self, ctx:python3_parserParser.EndTwoForContext):
        pass


    # Enter a parse tree produced by python3_parserParser#while_statement.
    def enterWhile_statement(self, ctx:python3_parserParser.While_statementContext):
        pass

    # Exit a parse tree produced by python3_parserParser#while_statement.
    def exitWhile_statement(self, ctx:python3_parserParser.While_statementContext):
        pass


    # Enter a parse tree produced by python3_parserParser#insideWhile.
    def enterInsideWhile(self, ctx:python3_parserParser.InsideWhileContext):
        pass

    # Exit a parse tree produced by python3_parserParser#insideWhile.
    def exitInsideWhile(self, ctx:python3_parserParser.InsideWhileContext):
        pass


    # Enter a parse tree produced by python3_parserParser#endWhile.
    def enterEndWhile(self, ctx:python3_parserParser.EndWhileContext):
        pass

    # Exit a parse tree produced by python3_parserParser#endWhile.
    def exitEndWhile(self, ctx:python3_parserParser.EndWhileContext):
        pass


    # Enter a parse tree produced by python3_parserParser#printF.
    def enterPrintF(self, ctx:python3_parserParser.PrintFContext):
        pass

    # Exit a parse tree produced by python3_parserParser#printF.
    def exitPrintF(self, ctx:python3_parserParser.PrintFContext):
        pass


    # Enter a parse tree produced by python3_parserParser#cast.
    def enterCast(self, ctx:python3_parserParser.CastContext):
        pass

    # Exit a parse tree produced by python3_parserParser#cast.
    def exitCast(self, ctx:python3_parserParser.CastContext):
        pass


    # Enter a parse tree produced by python3_parserParser#arithmeticOperands.
    def enterArithmeticOperands(self, ctx:python3_parserParser.ArithmeticOperandsContext):
        pass

    # Exit a parse tree produced by python3_parserParser#arithmeticOperands.
    def exitArithmeticOperands(self, ctx:python3_parserParser.ArithmeticOperandsContext):
        pass


    # Enter a parse tree produced by python3_parserParser#assignmentOperators.
    def enterAssignmentOperators(self, ctx:python3_parserParser.AssignmentOperatorsContext):
        pass

    # Exit a parse tree produced by python3_parserParser#assignmentOperators.
    def exitAssignmentOperators(self, ctx:python3_parserParser.AssignmentOperatorsContext):
        pass


    # Enter a parse tree produced by python3_parserParser#assignmentPreOperand.
    def enterAssignmentPreOperand(self, ctx:python3_parserParser.AssignmentPreOperandContext):
        pass

    # Exit a parse tree produced by python3_parserParser#assignmentPreOperand.
    def exitAssignmentPreOperand(self, ctx:python3_parserParser.AssignmentPreOperandContext):
        pass


    # Enter a parse tree produced by python3_parserParser#assigned.
    def enterAssigned(self, ctx:python3_parserParser.AssignedContext):
        pass

    # Exit a parse tree produced by python3_parserParser#assigned.
    def exitAssigned(self, ctx:python3_parserParser.AssignedContext):
        pass


    # Enter a parse tree produced by python3_parserParser#arithmeticOperation.
    def enterArithmeticOperation(self, ctx:python3_parserParser.ArithmeticOperationContext):
        pass

    # Exit a parse tree produced by python3_parserParser#arithmeticOperation.
    def exitArithmeticOperation(self, ctx:python3_parserParser.ArithmeticOperationContext):
        pass


    # Enter a parse tree produced by python3_parserParser#conditionalStatement.
    def enterConditionalStatement(self, ctx:python3_parserParser.ConditionalStatementContext):
        pass

    # Exit a parse tree produced by python3_parserParser#conditionalStatement.
    def exitConditionalStatement(self, ctx:python3_parserParser.ConditionalStatementContext):
        pass


    # Enter a parse tree produced by python3_parserParser#equality.
    def enterEquality(self, ctx:python3_parserParser.EqualityContext):
        pass

    # Exit a parse tree produced by python3_parserParser#equality.
    def exitEquality(self, ctx:python3_parserParser.EqualityContext):
        pass


    # Enter a parse tree produced by python3_parserParser#comparison.
    def enterComparison(self, ctx:python3_parserParser.ComparisonContext):
        pass

    # Exit a parse tree produced by python3_parserParser#comparison.
    def exitComparison(self, ctx:python3_parserParser.ComparisonContext):
        pass


    # Enter a parse tree produced by python3_parserParser#term.
    def enterTerm(self, ctx:python3_parserParser.TermContext):
        pass

    # Exit a parse tree produced by python3_parserParser#term.
    def exitTerm(self, ctx:python3_parserParser.TermContext):
        pass


    # Enter a parse tree produced by python3_parserParser#factor.
    def enterFactor(self, ctx:python3_parserParser.FactorContext):
        pass

    # Exit a parse tree produced by python3_parserParser#factor.
    def exitFactor(self, ctx:python3_parserParser.FactorContext):
        pass


    # Enter a parse tree produced by python3_parserParser#unary.
    def enterUnary(self, ctx:python3_parserParser.UnaryContext):
        pass

    # Exit a parse tree produced by python3_parserParser#unary.
    def exitUnary(self, ctx:python3_parserParser.UnaryContext):
        pass


    # Enter a parse tree produced by python3_parserParser#primary.
    def enterPrimary(self, ctx:python3_parserParser.PrimaryContext):
        pass

    # Exit a parse tree produced by python3_parserParser#primary.
    def exitPrimary(self, ctx:python3_parserParser.PrimaryContext):
        pass


    # Enter a parse tree produced by python3_parserParser#condition.
    def enterCondition(self, ctx:python3_parserParser.ConditionContext):
        pass

    # Exit a parse tree produced by python3_parserParser#condition.
    def exitCondition(self, ctx:python3_parserParser.ConditionContext):
        pass


    # Enter a parse tree produced by python3_parserParser#condition_handler.
    def enterCondition_handler(self, ctx:python3_parserParser.Condition_handlerContext):
        pass

    # Exit a parse tree produced by python3_parserParser#condition_handler.
    def exitCondition_handler(self, ctx:python3_parserParser.Condition_handlerContext):
        pass



del python3_parserParser