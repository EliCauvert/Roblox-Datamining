local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(SduiCoreSystem.Parent.Signals)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local PropResultCategory = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local SduiPropUtilsModule = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)

local function buildDefaultProp(p1, p2, p3, p4, p5, p6, p7, p8) --[[ Line: 37 ]]
	-- upvalues: SduiPropUtilsModule (copy), PropResultCategory (copy), buildDefaultProp (copy)
	if p1 == "literal" then
		return SduiPropUtilsModule.generateStaticPropValue(p2, p7), PropResultCategory.Literal
	elseif p1 == "token" then
		return SduiPropUtilsModule.generateTokenBindingPropValue(p2, p5, p7), PropResultCategory.PropSignal
	elseif p1 == "binding_path" then
		return SduiPropUtilsModule.generateDynamicBindingPropValue(p2, p3, p5, p4, p7), PropResultCategory.PropSignal
	elseif p1 == "conditional" then
		return SduiPropUtilsModule.generateConditionalPropValue(p2, p3, p5, p6, p4, p8 or buildDefaultProp, p7), PropResultCategory.PropSignal
	else
		return nil, PropResultCategory.Failed
	end
end

return buildDefaultProp