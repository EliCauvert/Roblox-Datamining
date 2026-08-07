local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Enums.Device)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Enums.Theme)
local tokenProcessingUtilitiesModule = require(foundation.Providers.Style.Tokens.TokenProcessingUtilities)
local tokensModule = require(foundation.Providers.Style.Tokens)

local function _(p0) --[[ line: 14 | named "tokenPathToAttributeBase" ]]
	return p0:gsub("%.", ""):gsub("_", "")
end

local function emitLeafAttributes(p1, p2, p3) --[[ line: 19 ]]
	-- upvalues: emitLeafAttributes (ref)
	if type(p3) ~= "table" then
		p1[p2] = p3
		
		return
	end
	for i, v in p3 do
		emitLeafAttributes(p1, p2 .. tostring(i), v)
	end
end

return function(p4, p5, p6) --[[ line: 37 | named "getOverrideAttributes" ]]
	-- upvalues: flagsModule (ref), tokensModule (ref), tokenProcessingUtilitiesModule (ref), emitLeafAttributes (ref)
	local t = {}
	
	if not flagsModule.FoundationTokenOverrides then
		return t
	elseif not p6 or not next(p6) then
		return t
	end
	local tokens = tokensModule.getTokens(p4, p5, 1)
	
	for i, v in p6 do
		local var7 = tokenProcessingUtilitiesModule.resolveTokenOverride(tokens, i, v)
		
		if var7 ~= nil then
			emitLeafAttributes(t, i:gsub("%.", ""):gsub("_", ""), var7)
		end
	end
	return t
end