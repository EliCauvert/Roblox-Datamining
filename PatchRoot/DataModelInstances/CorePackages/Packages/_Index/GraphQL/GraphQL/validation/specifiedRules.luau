-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:39 2026 Pacific Standard Time.

local rules = script.Parent.rules
local executableDefinitionsRule = require(rules.ExecutableDefinitionsRule).ExecutableDefinitionsRule
local uniqueOperationNamesRule = require(rules.UniqueOperationNamesRule).UniqueOperationNamesRule
local loneAnonymousOperationRule = require(rules.LoneAnonymousOperationRule).LoneAnonymousOperationRule
local singleFieldSubscriptionsRule = require(rules.SingleFieldSubscriptionsRule).SingleFieldSubscriptionsRule
local knownTypeNamesRule = require(rules.KnownTypeNamesRule).KnownTypeNamesRule
local fragmentsOnCompositeTypesRule = require(rules.FragmentsOnCompositeTypesRule).FragmentsOnCompositeTypesRule
local variablesAreInputTypesRule = require(rules.VariablesAreInputTypesRule).VariablesAreInputTypesRule
local scalarLeafsRule = require(rules.ScalarLeafsRule).ScalarLeafsRule
local fieldsOnCorrectTypeRule = require(rules.FieldsOnCorrectTypeRule).FieldsOnCorrectTypeRule
local uniqueFragmentNamesRule = require(rules.UniqueFragmentNamesRule).UniqueFragmentNamesRule
local knownFragmentNamesRule = require(rules.KnownFragmentNamesRule).KnownFragmentNamesRule
local noUnusedFragmentsRule = require(rules.NoUnusedFragmentsRule).NoUnusedFragmentsRule
local possibleFragmentSpreadsRule = require(rules.PossibleFragmentSpreadsRule).PossibleFragmentSpreadsRule
local noFragmentCyclesRule = require(rules.NoFragmentCyclesRule).NoFragmentCyclesRule
local uniqueVariableNamesRule = require(rules.UniqueVariableNamesRule).UniqueVariableNamesRule
local noUndefinedVariablesRule = require(rules.NoUndefinedVariablesRule).NoUndefinedVariablesRule
local noUnusedVariablesRule = require(rules.NoUnusedVariablesRule).NoUnusedVariablesRule
local knownDirectivesRule = require(rules.KnownDirectivesRule).KnownDirectivesRule
local uniqueDirectivesPerLocationRule = require(rules.UniqueDirectivesPerLocationRule).UniqueDirectivesPerLocationRule
local knownArgumentNamesRuleModule = require(rules.KnownArgumentNamesRule)
local knownArgumentNamesRule = knownArgumentNamesRuleModule.KnownArgumentNamesRule
local knownArgumentNamesOnDirectivesRule = knownArgumentNamesRuleModule.KnownArgumentNamesOnDirectivesRule
local uniqueArgumentNamesRule = require(rules.UniqueArgumentNamesRule).UniqueArgumentNamesRule
local valuesOfCorrectTypeRule = require(rules.ValuesOfCorrectTypeRule).ValuesOfCorrectTypeRule
local providedRequiredArgumentsRuleModule = require(rules.ProvidedRequiredArgumentsRule)
local uniqueInputFieldNamesRule = require(rules.UniqueInputFieldNamesRule).UniqueInputFieldNamesRule

return {
	specifiedRules = {
		executableDefinitionsRule, uniqueOperationNamesRule,
		loneAnonymousOperationRule, singleFieldSubscriptionsRule, knownTypeNamesRule,
		fragmentsOnCompositeTypesRule, variablesAreInputTypesRule, scalarLeafsRule,
		fieldsOnCorrectTypeRule, uniqueFragmentNamesRule, knownFragmentNamesRule,
		noUnusedFragmentsRule, possibleFragmentSpreadsRule, noFragmentCyclesRule,
		uniqueVariableNamesRule, noUndefinedVariablesRule, noUnusedVariablesRule,
		knownDirectivesRule, uniqueDirectivesPerLocationRule, knownArgumentNamesRule,
		uniqueArgumentNamesRule, valuesOfCorrectTypeRule,
		providedRequiredArgumentsRuleModule.ProvidedRequiredArgumentsRule,
		require(rules.VariablesInAllowedPositionRule).VariablesInAllowedPositionRule,
		require(rules.OverlappingFieldsCanBeMergedRule).OverlappingFieldsCanBeMergedRule,
		uniqueInputFieldNamesRule
	},
	specifiedSDLRules = {
		require(rules.LoneSchemaDefinitionRule).LoneSchemaDefinitionRule,
		require(rules.UniqueOperationTypesRule).UniqueOperationTypesRule,
		require(rules.UniqueTypeNamesRule).UniqueTypeNamesRule,
		require(rules.UniqueEnumValueNamesRule).UniqueEnumValueNamesRule,
		require(rules.UniqueFieldDefinitionNamesRule).UniqueFieldDefinitionNamesRule,
		require(rules.UniqueDirectiveNamesRule).UniqueDirectiveNamesRule,
		knownTypeNamesRule, knownDirectivesRule, uniqueDirectivesPerLocationRule,
		require(rules.PossibleTypeExtensionsRule).PossibleTypeExtensionsRule,
		knownArgumentNamesOnDirectivesRule, uniqueArgumentNamesRule,
		uniqueInputFieldNamesRule,
		providedRequiredArgumentsRuleModule.ProvidedRequiredArgumentsOnDirectivesRule
	}
}