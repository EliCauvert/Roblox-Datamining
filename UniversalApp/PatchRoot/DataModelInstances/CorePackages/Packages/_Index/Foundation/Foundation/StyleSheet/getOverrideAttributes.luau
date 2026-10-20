local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Enums.ColorMode)
local _ = require(Foundation.Enums.Device)
local _ = require(Foundation.Enums.ThemeName)
local TokenProcessingUtilitiesModule = require(Foundation.Providers.Style.Tokens.TokenProcessingUtilities)
local TokensModule = require(Foundation.Providers.Style.Tokens)

local function _(Text: string)
	return Text:gsub("%.", ""):gsub("_", "")
end

local function emitLeafAttributes(p1, Key, ResolveTokenOverrideResult)
	-- upvalues: emitLeafAttributes (copy)
	if type(ResolveTokenOverrideResult) ~= "table" then
		p1[Key] = ResolveTokenOverrideResult
		
		return
	end
	for i, value in ResolveTokenOverrideResult do
		emitLeafAttributes(p1, Key .. tostring(i), value)
	end
end

return function(p2, p3, p4, List)
	-- upvalues: TokensModule (copy), TokenProcessingUtilitiesModule (copy), emitLeafAttributes (copy)
	local t = {}
	
	if not List or not next(List) then
		return t
	end
	local Tokens = TokensModule.getTokens(p3, p4, 1, nil, p2)
	
	for Text, value in List do
		local ResolveTokenOverrideResult = TokenProcessingUtilitiesModule.resolveTokenOverride(Tokens, Text, value)
		
		if ResolveTokenOverrideResult ~= nil then
			emitLeafAttributes(t, Text:gsub("%.", ""):gsub("_", ""), ResolveTokenOverrideResult)
		end
	end
	return t
end