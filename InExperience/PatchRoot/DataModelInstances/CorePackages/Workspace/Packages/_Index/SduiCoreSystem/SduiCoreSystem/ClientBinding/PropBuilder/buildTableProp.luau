local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(sduiCoreSystem.Parent.Signals)
local sduiClientBindingBuilderModule = require(sduiCoreSystem.ClientBinding.SduiClientBindingBuilder)
local propResultCategory = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.ClientBinding.SduiDataBindingContentType)
local sduiPropUtilsModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)

local function buildTableProp(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: sduiPropUtilsModule (ref), sduiClientBindingBuilderModule (ref), propResultCategory (ref), buildTableProp (ref)
	if p1 == "literal" then
		return sduiPropUtilsModule.generateTablePropSignalValue(p2, p3, p5, p6, p4, sduiClientBindingBuilderModule.buildPropTable, p7), propResultCategory.PropSignal
	elseif p1 == "binding_path" then
		return sduiPropUtilsModule.generateDynamicBindingPropValue(p2, p3, p5, p4, function(p8, p9)
			-- upvalues: sduiClientBindingBuilderModule (copy), p3 (ref), p4 (ref), p5 (ref), p6 (ref), sduiPropUtilsModule (copy)
			local var1, var2, var3 = sduiClientBindingBuilderModule.buildPropTable(p8, p3, p4, p5, p6)
			
			return sduiPropUtilsModule.resolveTablePropValue(p9, var1, var2, var3, p3, p5, p6, p4, sduiClientBindingBuilderModule.buildPropTable)
		end), propResultCategory.PropSignal
	elseif p1 == "conditional" then
		return sduiPropUtilsModule.generateConditionalPropValue(p2, p3, p5, p6, p4, buildTableProp, p7), propResultCategory.PropSignal
	end
	return nil, propResultCategory.Failed
end

return buildTableProp