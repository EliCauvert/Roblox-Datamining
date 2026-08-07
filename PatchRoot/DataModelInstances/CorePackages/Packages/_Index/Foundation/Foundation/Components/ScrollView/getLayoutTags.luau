-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:07 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local tokensModule = require(foundation.Providers.Style.Tokens)
local attributeRulesModule = require(foundation.StyleSheet.Rules.attributeRules)
local formatTokensModule = require(foundation.StyleSheet.formatTokens)

return function() --[[ line: 8 | named "getLayoutTags" ]]
	-- upvalues: tokensModule (ref), formatTokensModule (ref), attributeRulesModule (ref)
	local t = {}
	local defaultTokens = tokensModule.defaultTokens
	local _, var5 = attributeRulesModule.rulesGenerator(defaultTokens, formatTokensModule(defaultTokens))
	
	for i, v in var5 do
		if v.pseudo == "UIListLayout" and v.tag then
			t[v.tag] = true
		end
	end
	return t
end