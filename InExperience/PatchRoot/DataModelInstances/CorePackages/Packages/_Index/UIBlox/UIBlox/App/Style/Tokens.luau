local DependenciesModule = require(script.dependencies)
local GetTokenGeneratorsFunction = DependenciesModule.GetTokenGenerators
local GetFoundationTokensFunction = DependenciesModule.GetFoundationTokens
local UIBloxConfigModule = require(script.Parent.Parent.Parent.UIBloxConfig)
local ConstantsModule = require(script.Parent.Constants)
local t = {}

local function _(Console, Value: number): number
	-- upvalues: UIBloxConfigModule (copy), ConstantsModule (copy)
	if UIBloxConfigModule.disableTokenScaling then
		return 1
	end
	if Value == nil then
		Value = 1
	end
	return (if Console == ConstantsModule.DeviceType.Console then 1.5 else 1) * math.clamp(Value, 0, 1e999)
end

return {
	getTokens = function(Console, p1, p2)
		-- upvalues: GetTokenGeneratorsFunction (copy), ConstantsModule (copy), UIBloxConfigModule (copy)
		local TokenGenerators = GetTokenGeneratorsFunction(p1) or GetTokenGeneratorsFunction(ConstantsModule.DefaultThemeName)
		local Value: number = p2
		local ScaledClampedValue = nil
		
		if UIBloxConfigModule.disableTokenScaling then
			ScaledClampedValue = 1
		else
			if Value == nil then
				Value = 1
			end
			ScaledClampedValue = (if Console == ConstantsModule.DeviceType.Console then 1.5 else 1) * math.clamp(Value, 0, 1e999)
		end
		return {
			Global = TokenGenerators.Global(ScaledClampedValue),
			Semantic = TokenGenerators.Semantic(ScaledClampedValue),
			Component = TokenGenerators.Component(ScaledClampedValue)
		}
	end,
	Types = require(script.Types),
	getFoundationTokens = function(Console, p1, p2)
		-- upvalues: UIBloxConfigModule (copy), ConstantsModule (copy), t (copy), GetFoundationTokensFunction (copy)
		local Value: number = p2
		local ScaledClampedValue = nil
		
		if UIBloxConfigModule.disableTokenScaling then
			ScaledClampedValue = 1
		else
			if Value == nil then
				Value = 1
			end
			ScaledClampedValue = (if Console == ConstantsModule.DeviceType.Console then 1.5 else 1) * math.clamp(Value, 0, 1e999)
		end
		if not UIBloxConfigModule.shareDerivedStyleTokens then
			return (GetFoundationTokensFunction(p1) or GetFoundationTokensFunction(ConstantsModule.DefaultThemeName))(ScaledClampedValue)
		end
		local Text: string = `{p1}|{ScaledClampedValue}`
		local Entry = t[Text]
		
		if Entry == nil then
			Entry = (GetFoundationTokensFunction(p1) or GetFoundationTokensFunction(ConstantsModule.DefaultThemeName))(ScaledClampedValue)
			t[Text] = Entry
		end
		return Entry
	end,
	getFoundationTokensDefaultScale = function(p1)
		-- upvalues: GetFoundationTokensFunction (copy), ConstantsModule (copy)
		return (GetFoundationTokensFunction(p1) or GetFoundationTokensFunction(ConstantsModule.DefaultThemeName))(1)
	end,
	Mappers = require(script.mappers)
}