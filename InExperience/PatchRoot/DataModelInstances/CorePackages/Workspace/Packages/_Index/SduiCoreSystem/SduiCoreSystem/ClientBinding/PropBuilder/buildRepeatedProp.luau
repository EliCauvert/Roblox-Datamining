local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local signalsModule = require(parent.Signals)
local tutilsModule = require(parent.tutils)
local sduiClientBindingBuilderModule = require(sduiCoreSystem.ClientBinding.SduiClientBindingBuilder)
local propResultCategory = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local sduiPropUtilsModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiLoggerModule = require(sduiCoreSystem.SduiLogger)
local sduiParseHelpersModule = require(sduiCoreSystem.SduiParseHelpers)
local _ = require(sduiCoreSystem.SduiComponentType)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagSduiImprovedErrorDimensions = sharedFlagsModule.FFlagSduiImprovedErrorDimensions
local fFlagSduiClientPageScope = sharedFlagsModule.FFlagSduiClientPageScope
local sduiArrayMapSupport = game:DefineFastFlag("SduiArrayMapSupport", false)

local function buildRepeatedProp(p0, p1, p2, p3, p4, p5, p6) --[[ line: 39 ]]
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), sduiPropUtilsModule (ref), sduiClientBindingBuilderModule (ref), propResultCategory (ref), fFlagSduiExperienceDetailsSupport (ref), sduiArrayMapSupport (ref), signalsModule (ref), fFlagSduiClientPageScope (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref), tutilsModule (ref), buildRepeatedProp (ref)
	local currentComponentType = nil
	local currentParserName = nil
	
	if fFlagSduiImprovedErrorDimensions then
		currentComponentType = p4.currentComponentType
		currentParserName = p4.currentParserName
	end
	if p0 == "literal" then
		if typeof(p1) ~= "table" then
			error("buildRepeatedProp: propDefinitionValue must be a table for literal type")
		end
		local array = p1.array
		
		if array == nil then
			error("buildRepeatedProp: wrapper message must have 'array' field")
		end
		if typeof(array) ~= "table" then
			error("buildRepeatedProp: array field must be a table/array")
		end
		return sduiPropUtilsModule.generateTablePropSignalValue(array, p2, p4, p5, p3, sduiClientBindingBuilderModule.buildPropTable, p6), propResultCategory.PropSignal
	elseif p0 == "binding_path" then
		return sduiPropUtilsModule.generateDynamicBindingPropValue(p1, p2, p4, p3, function(p7, p8) --[[ line: 83 | named "evaluatePropArray" ]]
			-- upvalues: sduiClientBindingBuilderModule (copy), p2 (ref), p3 (ref), p4 (ref), p5 (ref), sduiPropUtilsModule (copy)
			local var13, var14, var15 = sduiClientBindingBuilderModule.buildPropTable(p7, p2, p3, p4, p5)
			
			return sduiPropUtilsModule.resolveTablePropValue(p8, var13, var14, var15, p2, p4, p5, p3, sduiClientBindingBuilderModule.buildPropTable)
		end), propResultCategory.PropSignal
	elseif (fFlagSduiExperienceDetailsSupport or sduiArrayMapSupport) and p0 == "array_map" then
		local type = p1.kind and p1.kind.type
		local value = p1.kind and p1.kind.value
		local itemHydrationSpecs = p1.item_hydration_specs
		local fieldMap = p1.field_map
		
		if fieldMap == nil then
			error("buildRepeatedProp array_map: missing field_map")
		end
		return signalsModule.createComputed(function(p9) --[[ line: 123 ]]
			-- upvalues: sduiPropUtilsModule (copy), type (ref), value (ref), p2 (ref), p3 (ref), fFlagSduiClientPageScope (copy), p4 (ref), itemHydrationSpecs (ref), fieldMap (ref), p5 (ref), sduiClientBindingBuilderModule (copy), sduiLoggerModule (copy), sduiErrorsModule (copy), sduiParseHelpersModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write)
			local ok, status = pcall(function() --[[ line: 124 ]]
				-- upvalues: sduiPropUtilsModule (copy), type (copy), value (copy), p9 (ref), p2 (copy), p3 (copy), fFlagSduiClientPageScope (copy), p4 (copy), itemHydrationSpecs (copy), fieldMap (copy), p5 (copy), sduiClientBindingBuilderModule (copy)
				local var16 = sduiPropUtilsModule.resolveSourceArray(type, value, p9, p2, p3, if fFlagSduiClientPageScope then p4 else nil)
				
				if var16 == nil then
					error("buildRepeatedProp array_map: source array resolved to nil")
				end
				return sduiPropUtilsModule.mapArrayWithFieldMap(var16, itemHydrationSpecs or {}, fieldMap, p4, p5, p9, sduiClientBindingBuilderModule.buildPropTable)
			end)
			
			if ok then
				return { data = status }
			end
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
				message = `Failed to build array_map: {sduiParseHelpersModule.stringifyValue(status)}`,
				name = p4.debugName,
				componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
				parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
			}, p4.appPage)
			
			return { data = {} }
		end, tutilsModule.shallowEqual), propResultCategory.PropSignal
	elseif p0 == "conditional" then
		return sduiPropUtilsModule.generateConditionalPropValue(p1, p2, p4, p5, p3, buildRepeatedProp, p6), propResultCategory.PropSignal
	end
	return nil, propResultCategory.Failed
end

return buildRepeatedProp