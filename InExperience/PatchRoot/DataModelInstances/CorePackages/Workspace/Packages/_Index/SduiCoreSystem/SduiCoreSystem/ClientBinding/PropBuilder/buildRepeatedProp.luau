local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local SignalsModule = require(Parent.Signals)
local TutilsModule = require(Parent.tutils)
local SduiClientBindingBuilderModule = require(SduiCoreSystem.ClientBinding.SduiClientBindingBuilder)
local PropResultCategory = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local SduiPropUtilsModule = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local SduiLoggerModule = require(SduiCoreSystem.SduiLogger)
local SduiParseHelpersModule = require(SduiCoreSystem.SduiParseHelpers)
local _ = require(SduiCoreSystem.SduiComponentType)

local function buildRepeatedProp(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: SduiPropUtilsModule (copy), SduiClientBindingBuilderModule (copy), PropResultCategory (copy), SignalsModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), SduiParseHelpersModule (copy), TutilsModule (copy), buildRepeatedProp (copy)
	local CurrentComponentType = p5.currentComponentType
	local CurrentParserName = p5.currentParserName
	
	if p1 == "literal" then
		if typeof(p2) ~= "table" then
			error("buildRepeatedProp: propDefinitionValue must be a table for literal type")
		end
		local Array = p2.array
		
		if Array == nil then
			error("buildRepeatedProp: wrapper message must have 'array' field")
		end
		if typeof(Array) ~= "table" then
			error("buildRepeatedProp: array field must be a table/array")
		end
		return SduiPropUtilsModule.generateTablePropSignalValue(Array, p3, p5, p6, p4, SduiClientBindingBuilderModule.buildPropTable, p7), PropResultCategory.PropSignal
	else
		if p1 == "binding_path" then
			return SduiPropUtilsModule.generateDynamicBindingPropValue(p2, p3, p5, p4, function(p8, p9)
				-- upvalues: SduiClientBindingBuilderModule (upval), p3 (copy), p4 (copy), p5 (copy), p6 (copy), SduiPropUtilsModule (upval)
				local PropTable, PropTable2, PropTable3 = SduiClientBindingBuilderModule.buildPropTable(p8, p3, p4, p5, p6)
				
				return SduiPropUtilsModule.resolveTablePropValue(p9, PropTable, PropTable2, PropTable3, p3, p5, p6, p4, SduiClientBindingBuilderModule.buildPropTable)
			end), PropResultCategory.PropSignal
		end
		if p1 == "array_map" then
			local Type = p2.kind and p2.kind.type
			local Value = p2.kind and p2.kind.value
			local ItemHydrationSpecs = p2.item_hydration_specs
			local FieldMap = p2.field_map
			
			if FieldMap == nil then
				error("buildRepeatedProp array_map: missing field_map")
			end
			return SignalsModule.createComputed(function(p8)
				-- upvalues: SduiPropUtilsModule (upval), Type (copy), Value (copy), p3 (copy), p4 (copy), p5 (copy), ItemHydrationSpecs (copy), FieldMap (copy), p6 (copy), SduiClientBindingBuilderModule (upval), SduiLoggerModule (upval), SduiErrorsModule (upval), SduiParseHelpersModule (upval), CurrentComponentType (copy), CurrentParserName (copy)
				local Success, Result = pcall(function()
					-- upvalues: SduiPropUtilsModule (upval), Type (upval), Value (upval), p8 (copy), p3 (upval), p4 (upval), p5 (upval), ItemHydrationSpecs (upval), FieldMap (upval), p6 (upval), SduiClientBindingBuilderModule (upval)
					local ResolveSourceArrayResult = SduiPropUtilsModule.resolveSourceArray(Type, Value, p8, p3, p4, p5)
					
					if ResolveSourceArrayResult == nil then
						error("buildRepeatedProp array_map: source array resolved to nil")
					end
					return SduiPropUtilsModule.mapArrayWithFieldMap(ResolveSourceArrayResult, ItemHydrationSpecs or {}, FieldMap, p5, p6, p8, SduiClientBindingBuilderModule.buildPropTable)
				end)
				
				if Success then
					return { data = Result }
				else
					SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
						message = `Failed to build array_map: {SduiParseHelpersModule.stringifyValue(Result)}`,
						name = p5.debugName,
						componentType = CurrentComponentType,
						parserName = CurrentParserName
					}, p5.appPage)
					
					return { data = {} }
				end
			end, TutilsModule.shallowEqual), PropResultCategory.PropSignal
		elseif p1 == "conditional" then
			return SduiPropUtilsModule.generateConditionalPropValue(p2, p3, p5, p6, p4, buildRepeatedProp, p7), PropResultCategory.PropSignal
		else
			return nil, PropResultCategory.Failed
		end
	end
end

return buildRepeatedProp