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

local function buildStringProp(p0, p1, p2, p3, p4, p5, p6) --[[ line: 21 ]]
	-- upvalues: fFlagSduiStringPropToString (ref), sduiClientBindingParsersModule (ref), propResultCategory (ref), sduiPropUtilsModule (ref), buildDefaultPropModule (ref), buildStringProp (ref)
	p6 = p6 or (if fFlagSduiStringPropToString then sduiClientBindingParsersModule.parseToString else nil)
	
	if p0 == "translation" then
		local var6 = p4.resolveLocalizedLiteral(p1)
		
		if var6 then
			return if p6 then p6(var6) else var6, propResultCategory.Literal
		end
		return nil, propResultCategory.Failed
	elseif p0 == "format" then
		return sduiPropUtilsModule.generateFormatStringPropValue(p1, p2, p4, p3, p6), propResultCategory.PropSignal
	end
	local var7, var8 = buildDefaultPropModule(p0, p1, p2, p3, p4, p5, p6, buildStringProp)
	
	return var7, var8
end

return buildStringProp