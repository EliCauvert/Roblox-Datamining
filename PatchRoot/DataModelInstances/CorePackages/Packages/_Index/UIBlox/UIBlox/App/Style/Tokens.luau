-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:58 2026 Pacific Standard Time.

local dependenciesModule = require(script.dependencies)
local parent = script.Parent.Parent.Parent
local tModule = require(parent.Parent.t)
local getTokenGenerators = dependenciesModule.GetTokenGenerators
local validators = dependenciesModule.SchemaPackage.Validators
local getFoundationTokens = dependenciesModule.GetFoundationTokens
local UIBloxConfigModule = require(parent.UIBloxConfig)
local typesModule = require(script.Types)
local constantsModule = require(script.Parent.Constants)

local function _(p0, p1) --[[ line: 19 | named "getPlatformScale" ]]
	-- upvalues: UIBloxConfigModule (ref), constantsModule (ref)
	if UIBloxConfigModule.disableTokenScaling then
		return 1
	elseif p1 == nil then
		p1 = 1
	end
	return (if p0 == constantsModule.DeviceType.Console then 1.5 else 1) * math.clamp(p1, 0, 1e999)
end

return {
	getTokens = function(p2, p3, p4) --[[ line: 39 ]]
		-- upvalues: getTokenGenerators (ref), constantsModule (ref), UIBloxConfigModule (ref)
		local var7
		local var5 = getTokenGenerators(p3) or getTokenGenerators(constantsModule.DefaultThemeName)
		local var6 = p4
		
		if UIBloxConfigModule.disableTokenScaling then
			var7 = 1
		elseif var6 == nil then
			var6 = 1
		end
		var7 = (if p2 == constantsModule.DeviceType.Console then 1.5 else 1) * math.clamp(var6, 0, 1e999)
		return {
			Global = require(var5.Global)(var7),
			Semantic = require(var5.Semantic)(var7),
			Component = require(var5.Component)(var7)
		}
	end,
	validateTokens = tModule.interface({
		Global = tModule.strictInterface(validators.Global),
		Semantic = tModule.strictInterface(validators.Semantic),
		Component = tModule.strictInterface(validators.Component)
	}),
	Types = typesModule,
	getFoundationTokens = function(p5, p6, p7) --[[ line: 55 ]]
		-- upvalues: getFoundationTokens (ref), constantsModule (ref), UIBloxConfigModule (ref)
		local var10
		local var8 = getFoundationTokens(p6) or getFoundationTokens(constantsModule.DefaultThemeName)
		local var9 = p7
		
		if UIBloxConfigModule.disableTokenScaling then
			var10 = 1
		elseif var9 == nil then
			var9 = 1
		end
		var10 = (if p5 == constantsModule.DeviceType.Console then 1.5 else 1) * math.clamp(var9, 0, 1e999)
		return var8(var10)
	end,
	getFoundationTokensDefaultScale = function(p8) --[[ line: 65 ]]
		-- upvalues: getFoundationTokens (ref), constantsModule (ref)
		return (getFoundationTokens(p8) or getFoundationTokens(constantsModule.DefaultThemeName))(1)
	end,
	Mappers = require(script.mappers)
}