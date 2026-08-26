local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local _ = require(parent.Signals)
local propResultCategory = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local buildDefaultPropModule = require(sduiCoreSystem.ClientBinding.PropBuilder.buildDefaultProp)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.ClientBinding.SduiDataBindingContentType)
local sduiPropUtilsModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local sduiClientBindingParsersModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiClientBindingParsers)
local fFlagSduiStringPropToString = require(parent.SharedFlags).FFlagSduiStringPropToString

local function buildStringProp(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: fFlagSduiStringPropToString (ref), sduiClientBindingParsersModule (ref), propResultCategory (ref), sduiPropUtilsModule (ref), buildDefaultPropModule (ref), buildStringProp (ref)
	p7 = p7 or (if fFlagSduiStringPropToString then sduiClientBindingParsersModule.parseToString else nil)
	
	if p1 == "translation" then
		local var1 = p5.resolveLocalizedLiteral(p2)
		
		if var1 then
			return if p7 then p7(var1) else var1, propResultCategory.Literal
		end
		return nil, propResultCategory.Failed
	elseif p1 == "format" then
		return sduiPropUtilsModule.generateFormatStringPropValue(p2, p3, p5, p4, p7), propResultCategory.PropSignal
	end
	local var2, var3 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, p7, buildStringProp)
	
	return var2, var3
end

return buildStringProp