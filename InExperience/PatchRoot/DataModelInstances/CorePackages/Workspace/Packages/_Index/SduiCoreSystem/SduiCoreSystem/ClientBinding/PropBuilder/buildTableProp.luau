local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(sduiCoreSystem.Parent.Signals)
local sduiClientBindingBuilderModule = require(sduiCoreSystem.ClientBinding.SduiClientBindingBuilder)
local propResultCategory = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.ClientBinding.SduiDataBindingContentType)
local sduiPropUtilsModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)

local function buildTableProp(p0, p1, p2, p3, p4, p5, p6)
	-- upvalues: sduiPropUtilsModule (ref), sduiClientBindingBuilderModule (ref), propResultCategory (ref), buildTableProp (ref)
	if p0 == "literal" then
		return sduiPropUtilsModule.generateTablePropSignalValue(p1, p2, p4, p5, p3, sduiClientBindingBuilderModule.buildPropTable, p6), propResultCategory.PropSignal
	elseif p0 == "binding_path" then
		return sduiPropUtilsModule.generateDynamicBindingPropValue(p1, p2, p4, p3, function(p7, p8)
			-- upvalues: sduiClientBindingBuilderModule (copy), p2 (ref), p3 (ref), p4 (ref), p5 (ref), sduiPropUtilsModule (copy)
			local var4, var5, var6 = sduiClientBindingBuilderModule.buildPropTable(p7, p2, p3, p4, p5)
			
			return sduiPropUtilsModule.resolveTablePropValue(p8, var4, var5, var6, p2, p4, p5, p3, sduiClientBindingBuilderModule.buildPropTable)
		end), propResultCategory.PropSignal
	elseif p0 == "conditional" then
		return sduiPropUtilsModule.generateConditionalPropValue(p1, p2, p4, p5, p3, buildTableProp, p6), propResultCategory.PropSignal
	end
	return nil, propResultCategory.Failed
end

return buildTableProp