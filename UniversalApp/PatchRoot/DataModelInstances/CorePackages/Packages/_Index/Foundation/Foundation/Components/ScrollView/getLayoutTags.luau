local foundation = script:FindFirstAncestor("Foundation")
local tokensModule = require(foundation.Providers.Style.Tokens)
local attributeRulesModule = require(foundation.StyleSheet.Rules.attributeRules)
local formatTokensModule = require(foundation.StyleSheet.formatTokens)

return function()
	-- upvalues: tokensModule (ref), formatTokensModule (ref), attributeRulesModule (ref)
	local t = {}
	local defaultTokens = tokensModule.defaultTokens
	local _, var1 = attributeRulesModule.rulesGenerator(defaultTokens, formatTokensModule(defaultTokens))
	
	for i, v in var1 do
		if v.pseudo == "UIListLayout" and v.tag then
			t[v.tag] = true
		end
	end
	return t
end