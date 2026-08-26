local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(sduiCoreSystem.Parent.Signals)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local propResultCategory = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local sduiPropUtilsModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)

local function buildDefaultProp(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: sduiPropUtilsModule (ref), propResultCategory (ref), buildDefaultProp (ref)
	if p1 == "literal" then
		return sduiPropUtilsModule.generateStaticPropValue(p2, p7), propResultCategory.Literal
	elseif p1 == "token" then
		return sduiPropUtilsModule.generateTokenBindingPropValue(p2, p5, p7), propResultCategory.PropSignal
	elseif p1 == "binding_path" then
		return sduiPropUtilsModule.generateDynamicBindingPropValue(p2, p3, p5, p4, p7), propResultCategory.PropSignal
	elseif p1 == "conditional" then
		return sduiPropUtilsModule.generateConditionalPropValue(p2, p3, p5, p6, p4, p8 or buildDefaultProp, p7), propResultCategory.PropSignal
	end
	return nil, propResultCategory.Failed
end

return buildDefaultProp