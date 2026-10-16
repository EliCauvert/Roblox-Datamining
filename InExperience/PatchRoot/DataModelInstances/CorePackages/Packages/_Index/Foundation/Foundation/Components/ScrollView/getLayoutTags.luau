local Foundation = script:FindFirstAncestor("Foundation")
local TokensModule = require(Foundation.Providers.Style.Tokens)
local AttributeRulesModule = require(Foundation.StyleSheet.Rules.attributeRules)
local FormatTokensModule = require(Foundation.StyleSheet.formatTokens)

return function() --[[ Line: 8 | Named "getLayoutTags" ]]
	-- upvalues: TokensModule (copy), FormatTokensModule (copy), AttributeRulesModule (copy)
	local t = {}
	local DefaultTokens = TokensModule.defaultTokens
	local _, RulesGeneratorResult2 = AttributeRulesModule.rulesGenerator(DefaultTokens, (FormatTokensModule(DefaultTokens)))
	
	for _, value in RulesGeneratorResult2 do
		if value.pseudo == "UIListLayout" and value.tag then
			t[value.tag] = true
		end
	end
	return t
end