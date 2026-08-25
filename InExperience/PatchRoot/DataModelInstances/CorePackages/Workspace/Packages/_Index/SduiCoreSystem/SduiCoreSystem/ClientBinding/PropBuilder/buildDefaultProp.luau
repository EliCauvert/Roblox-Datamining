local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(sduiCoreSystem.Parent.Signals)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local propResultCategory = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local sduiPropUtilsModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)

local function buildDefaultProp(p0, p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: sduiPropUtilsModule (ref), propResultCategory (ref), buildDefaultProp (ref)
	if p0 == "literal" then
		return sduiPropUtilsModule.generateStaticPropValue(p1, p6), propResultCategory.Literal
	elseif p0 == "token" then
		return sduiPropUtilsModule.generateTokenBindingPropValue(p1, p4, p6), propResultCategory.PropSignal
	elseif p0 == "binding_path" then
		return sduiPropUtilsModule.generateDynamicBindingPropValue(p1, p2, p4, p3, p6), propResultCategory.PropSignal
	elseif p0 == "conditional" then
		return sduiPropUtilsModule.generateConditionalPropValue(p1, p2, p4, p5, p3, p7 or buildDefaultProp, p6), propResultCategory.PropSignal
	end
	return nil, propResultCategory.Failed
end

return buildDefaultProp