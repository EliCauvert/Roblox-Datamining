local dependenciesModule = require(script.dependencies)
local parent = script.Parent.Parent.Parent
local getTokenGenerators = dependenciesModule.GetTokenGenerators
local getFoundationTokens = dependenciesModule.GetFoundationTokens
local UIBloxConfigModule = require(parent.UIBloxConfig)
local typesModule = require(script.Types)
local constantsModule = require(script.Parent.Constants)

local function _(p0, p1) --[[ line: 16 | named "getPlatformScale" ]]
	-- upvalues: UIBloxConfigModule (ref), constantsModule (ref)
	if UIBloxConfigModule.disableTokenScaling then
		return 1
	elseif p1 == nil then
		p1 = 1
	end
	return (if p0 == constantsModule.DeviceType.Console then 1.5 else 1) * math.clamp(p1, 0, 1e999)
end

return {
	getTokens = function(p2, p3, p4) --[[ line: 36 ]]
		-- upvalues: getTokenGenerators (ref), constantsModule (ref), UIBloxConfigModule (ref)
		local var6
		local var4 = getTokenGenerators(p3) or getTokenGenerators(constantsModule.DefaultThemeName)
		local var5 = p4
		
		if UIBloxConfigModule.disableTokenScaling then
			var6 = 1
		elseif var5 == nil then
			var5 = 1
		end
		var6 = (if p2 == constantsModule.DeviceType.Console then 1.5 else 1) * math.clamp(var5, 0, 1e999)
		return {
			Global = require(var4.Global)(var6),
			Semantic = require(var4.Semantic)(var6),
			Component = require(var4.Component)(var6)
		}
	end,
	Types = typesModule,
	getFoundationTokens = function(p5, p6, p7) --[[ line: 47 ]]
		-- upvalues: getFoundationTokens (ref), constantsModule (ref), UIBloxConfigModule (ref)
		local var9
		local var7 = getFoundationTokens(p6) or getFoundationTokens(constantsModule.DefaultThemeName)
		local var8 = p7
		
		if UIBloxConfigModule.disableTokenScaling then
			var9 = 1
		elseif var8 == nil then
			var8 = 1
		end
		var9 = (if p5 == constantsModule.DeviceType.Console then 1.5 else 1) * math.clamp(var8, 0, 1e999)
		return var7(var9)
	end,
	getFoundationTokensDefaultScale = function(p8) --[[ line: 57 ]]
		-- upvalues: getFoundationTokens (ref), constantsModule (ref)
		return (getFoundationTokens(p8) or getFoundationTokens(constantsModule.DefaultThemeName))(1)
	end,
	Mappers = require(script.mappers)
}