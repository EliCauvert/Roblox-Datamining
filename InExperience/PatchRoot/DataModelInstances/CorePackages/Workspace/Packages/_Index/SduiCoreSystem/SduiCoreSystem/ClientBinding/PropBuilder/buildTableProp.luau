local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(SduiCoreSystem.Parent.Signals)
local SduiClientBindingBuilderModule = require(SduiCoreSystem.ClientBinding.SduiClientBindingBuilder)
local PropResultCategory = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local _ = require(SduiCoreSystem.ClientBinding.SduiDataBindingContentType)
local SduiPropUtilsModule = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)

local function buildTableProp(p1, p2, p3, p4, p5, p6, p7) --[[ Line: 18 ]]
	-- upvalues: SduiPropUtilsModule (copy), SduiClientBindingBuilderModule (copy), PropResultCategory (copy), buildTableProp (copy)
	if p1 == "literal" then
		return SduiPropUtilsModule.generateTablePropSignalValue(p2, p3, p5, p6, p4, SduiClientBindingBuilderModule.buildPropTable, p7), PropResultCategory.PropSignal
	elseif p1 == "binding_path" then
		return SduiPropUtilsModule.generateDynamicBindingPropValue(p2, p3, p5, p4, function(p8, p9) --[[ Line: 40 | Named "evaluatePropTable" ]]
			-- upvalues: SduiClientBindingBuilderModule (upval), p3 (copy), p4 (copy), p5 (copy), p6 (copy), SduiPropUtilsModule (upval)
			local PropTable, PropTable2, PropTable3 = SduiClientBindingBuilderModule.buildPropTable(p8, p3, p4, p5, p6)
			
			return SduiPropUtilsModule.resolveTablePropValue(p9, PropTable, PropTable2, PropTable3, p3, p5, p6, p4, SduiClientBindingBuilderModule.buildPropTable)
		end), PropResultCategory.PropSignal
	elseif p1 == "conditional" then
		return SduiPropUtilsModule.generateConditionalPropValue(p2, p3, p5, p6, p4, buildTableProp, p7), PropResultCategory.PropSignal
	else
		return nil, PropResultCategory.Failed
	end
end

return buildTableProp