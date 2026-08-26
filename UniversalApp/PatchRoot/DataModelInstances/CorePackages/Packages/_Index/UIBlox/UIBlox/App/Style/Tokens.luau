local dependenciesModule = require(script.dependencies)
local parent = script.Parent.Parent.Parent
local getTokenGenerators = dependenciesModule.GetTokenGenerators
local getFoundationTokens = dependenciesModule.GetFoundationTokens
local UIBloxConfigModule = require(parent.UIBloxConfig)
local typesModule = require(script.Types)
local constantsModule = require(script.Parent.Constants)

local function _(p1, p2)
	-- upvalues: UIBloxConfigModule (ref), constantsModule (ref)
	if UIBloxConfigModule.disableTokenScaling then
		return 1
	elseif p2 == nil then
		p2 = 1
	end
	return (if p1 == constantsModule.DeviceType.Console then 1.5 else 1) * math.clamp(p2, 0, 1e999)
end

return {
	getTokens = function(p1, p2, p3)
		-- upvalues: getTokenGenerators (ref), constantsModule (ref), UIBloxConfigModule (ref)
		local var1
		local var2 = getTokenGenerators(p2) or getTokenGenerators(constantsModule.DefaultThemeName)
		local var3 = p3
		
		if UIBloxConfigModule.disableTokenScaling then
			var1 = 1
		elseif var3 == nil then
			var3 = 1
		end
		var1 = (if p1 == constantsModule.DeviceType.Console then 1.5 else 1) * math.clamp(var3, 0, 1e999)
		return {
			Global = require(var2.Global)(var1),
			Semantic = require(var2.Semantic)(var1),
			Component = require(var2.Component)(var1)
		}
	end,
	Types = typesModule,
	getFoundationTokens = function(p1, p2, p3)
		-- upvalues: getFoundationTokens (ref), constantsModule (ref), UIBloxConfigModule (ref)
		local var1
		local var2 = getFoundationTokens(p2) or getFoundationTokens(constantsModule.DefaultThemeName)
		local var3 = p3
		
		if UIBloxConfigModule.disableTokenScaling then
			var1 = 1
		elseif var3 == nil then
			var3 = 1
		end
		var1 = (if p1 == constantsModule.DeviceType.Console then 1.5 else 1) * math.clamp(var3, 0, 1e999)
		return var2(var1)
	end,
	getFoundationTokensDefaultScale = function(p1)
		-- upvalues: getFoundationTokens (ref), constantsModule (ref)
		return (getFoundationTokens(p1) or getFoundationTokens(constantsModule.DefaultThemeName))(1)
	end,
	Mappers = require(script.mappers)
}