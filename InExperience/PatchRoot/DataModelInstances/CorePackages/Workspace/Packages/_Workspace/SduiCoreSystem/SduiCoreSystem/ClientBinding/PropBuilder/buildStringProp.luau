local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(SduiCoreSystem.Parent.Signals)
local PropResultCategory = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local BuildDefaultPropModule = require(SduiCoreSystem.ClientBinding.PropBuilder.buildDefaultProp)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local _ = require(SduiCoreSystem.ClientBinding.SduiDataBindingContentType)
local SduiPropUtilsModule = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local SduiClientBindingParsersModule = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiClientBindingParsers)

local function buildStringProp(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: SduiClientBindingParsersModule (copy), PropResultCategory (copy), SduiPropUtilsModule (copy), BuildDefaultPropModule (copy), buildStringProp (copy)
	local Callback = p7 or SduiClientBindingParsersModule.parseToString
	
	if p1 == "translation" then
		local ResolveLocalizedLiteralResult = p5.resolveLocalizedLiteral(p2)
		
		if ResolveLocalizedLiteralResult then
			return if Callback then Callback(ResolveLocalizedLiteralResult) else ResolveLocalizedLiteralResult, PropResultCategory.Literal
		else
			return nil, PropResultCategory.Failed
		end
	elseif p1 == "format" then
		return SduiPropUtilsModule.generateFormatStringPropValue(p2, p3, p5, p4, Callback), PropResultCategory.PropSignal
	else
		local DefaultPropModule, DefaultPropModule2 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, Callback, buildStringProp)
		
		return DefaultPropModule, DefaultPropModule2
	end
end

return buildStringProp