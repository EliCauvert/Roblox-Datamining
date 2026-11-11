local Rules = script.Parent.rules
local KnownTypeNamesRule = require(Rules.KnownTypeNamesRule).KnownTypeNamesRule
local KnownDirectivesRule = require(Rules.KnownDirectivesRule).KnownDirectivesRule
local UniqueDirectivesPerLocationRule = require(Rules.UniqueDirectivesPerLocationRule).UniqueDirectivesPerLocationRule
local KnownArgumentNamesRuleModule = require(Rules.KnownArgumentNamesRule)
local UniqueArgumentNamesRule = require(Rules.UniqueArgumentNamesRule).UniqueArgumentNamesRule
local ProvidedRequiredArgumentsRuleModule = require(Rules.ProvidedRequiredArgumentsRule)
local UniqueInputFieldNamesRule = require(Rules.UniqueInputFieldNamesRule).UniqueInputFieldNamesRule

return {
	specifiedRules = {
		require(Rules.ExecutableDefinitionsRule).ExecutableDefinitionsRule,
		require(Rules.UniqueOperationNamesRule).UniqueOperationNamesRule,
		require(Rules.LoneAnonymousOperationRule).LoneAnonymousOperationRule,
		require(Rules.SingleFieldSubscriptionsRule).SingleFieldSubscriptionsRule,
		KnownTypeNamesRule,
		require(Rules.FragmentsOnCompositeTypesRule).FragmentsOnCompositeTypesRule,
		require(Rules.VariablesAreInputTypesRule).VariablesAreInputTypesRule,
		require(Rules.ScalarLeafsRule).ScalarLeafsRule,
		require(Rules.FieldsOnCorrectTypeRule).FieldsOnCorrectTypeRule,
		require(Rules.UniqueFragmentNamesRule).UniqueFragmentNamesRule,
		require(Rules.KnownFragmentNamesRule).KnownFragmentNamesRule,
		require(Rules.NoUnusedFragmentsRule).NoUnusedFragmentsRule,
		require(Rules.PossibleFragmentSpreadsRule).PossibleFragmentSpreadsRule,
		require(Rules.NoFragmentCyclesRule).NoFragmentCyclesRule,
		require(Rules.UniqueVariableNamesRule).UniqueVariableNamesRule,
		require(Rules.NoUndefinedVariablesRule).NoUndefinedVariablesRule,
		require(Rules.NoUnusedVariablesRule).NoUnusedVariablesRule,
		KnownDirectivesRule, UniqueDirectivesPerLocationRule,
		KnownArgumentNamesRuleModule.KnownArgumentNamesRule, UniqueArgumentNamesRule,
		require(Rules.ValuesOfCorrectTypeRule).ValuesOfCorrectTypeRule,
		ProvidedRequiredArgumentsRuleModule.ProvidedRequiredArgumentsRule,
		require(Rules.VariablesInAllowedPositionRule).VariablesInAllowedPositionRule,
		require(Rules.OverlappingFieldsCanBeMergedRule).OverlappingFieldsCanBeMergedRule,
		UniqueInputFieldNamesRule
	},
	specifiedSDLRules = {
		require(Rules.LoneSchemaDefinitionRule).LoneSchemaDefinitionRule,
		require(Rules.UniqueOperationTypesRule).UniqueOperationTypesRule,
		require(Rules.UniqueTypeNamesRule).UniqueTypeNamesRule,
		require(Rules.UniqueEnumValueNamesRule).UniqueEnumValueNamesRule,
		require(Rules.UniqueFieldDefinitionNamesRule).UniqueFieldDefinitionNamesRule,
		require(Rules.UniqueDirectiveNamesRule).UniqueDirectiveNamesRule,
		KnownTypeNamesRule, KnownDirectivesRule, UniqueDirectivesPerLocationRule,
		require(Rules.PossibleTypeExtensionsRule).PossibleTypeExtensionsRule,
		KnownArgumentNamesRuleModule.KnownArgumentNamesOnDirectivesRule,
		UniqueArgumentNamesRule, UniqueInputFieldNamesRule,
		ProvidedRequiredArgumentsRuleModule.ProvidedRequiredArgumentsOnDirectivesRule
	}
}