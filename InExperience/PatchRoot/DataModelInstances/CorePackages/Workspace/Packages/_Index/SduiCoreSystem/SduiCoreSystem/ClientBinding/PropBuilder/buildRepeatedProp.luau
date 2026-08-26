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

local function buildRepeatedProp(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), sduiPropUtilsModule (ref), sduiClientBindingBuilderModule (ref), propResultCategory (ref), fFlagSduiExperienceDetailsSupport (ref), sduiArrayMapSupport (ref), signalsModule (ref), fFlagSduiClientPageScope (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref), tutilsModule (ref), buildRepeatedProp (ref)
	local currentComponentType = nil
	local currentParserName = nil
	
	if fFlagSduiImprovedErrorDimensions then
		currentComponentType = p5.currentComponentType
		currentParserName = p5.currentParserName
	end
	if p1 == "literal" then
		if typeof(p2) ~= "table" then
			error("buildRepeatedProp: propDefinitionValue must be a table for literal type")
		end
		local array = p2.array
		
		if array == nil then
			error("buildRepeatedProp: wrapper message must have 'array' field")
		end
		if typeof(array) ~= "table" then
			error("buildRepeatedProp: array field must be a table/array")
		end
		return sduiPropUtilsModule.generateTablePropSignalValue(array, p3, p5, p6, p4, sduiClientBindingBuilderModule.buildPropTable, p7), propResultCategory.PropSignal
	elseif p1 == "binding_path" then
		return sduiPropUtilsModule.generateDynamicBindingPropValue(p2, p3, p5, p4, function(p8, p9)
			-- upvalues: sduiClientBindingBuilderModule (copy), p3 (ref), p4 (ref), p5 (ref), p6 (ref), sduiPropUtilsModule (copy)
			local var1, var2, var3 = sduiClientBindingBuilderModule.buildPropTable(p8, p3, p4, p5, p6)
			
			return sduiPropUtilsModule.resolveTablePropValue(p9, var1, var2, var3, p3, p5, p6, p4, sduiClientBindingBuilderModule.buildPropTable)
		end), propResultCategory.PropSignal
	elseif (fFlagSduiExperienceDetailsSupport or sduiArrayMapSupport) and p1 == "array_map" then
		local type = p2.kind and p2.kind.type
		local value = p2.kind and p2.kind.value
		local itemHydrationSpecs = p2.item_hydration_specs
		local fieldMap = p2.field_map
		
		if fieldMap == nil then
			error("buildRepeatedProp array_map: missing field_map")
		end
		return signalsModule.createComputed(function(p8)
			-- upvalues: sduiPropUtilsModule (copy), type (ref), value (ref), p3 (ref), p4 (ref), fFlagSduiClientPageScope (copy), p5 (ref), itemHydrationSpecs (ref), fieldMap (ref), p6 (ref), sduiClientBindingBuilderModule (copy), sduiLoggerModule (copy), sduiErrorsModule (copy), sduiParseHelpersModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write)
			local ok, status = pcall(function()
				-- upvalues: sduiPropUtilsModule (copy), type (copy), value (copy), p8 (ref), p3 (copy), p4 (copy), fFlagSduiClientPageScope (copy), p5 (copy), itemHydrationSpecs (copy), fieldMap (copy), p6 (copy), sduiClientBindingBuilderModule (copy)
				local var1 = sduiPropUtilsModule.resolveSourceArray(type, value, p8, p3, p4, if fFlagSduiClientPageScope then p5 else nil)
				
				if var1 == nil then
					error("buildRepeatedProp array_map: source array resolved to nil")
				end
				return sduiPropUtilsModule.mapArrayWithFieldMap(var1, itemHydrationSpecs or {}, fieldMap, p5, p6, p8, sduiClientBindingBuilderModule.buildPropTable)
			end)
			
			if ok then
				return { data = status }
			end
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
				message = `Failed to build array_map: {sduiParseHelpersModule.stringifyValue(status)}`,
				name = p5.debugName,
				componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
				parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
			}, p5.appPage)
			
			return { data = {} }
		end, tutilsModule.shallowEqual), propResultCategory.PropSignal
	elseif p1 == "conditional" then
		return sduiPropUtilsModule.generateConditionalPropValue(p2, p3, p5, p6, p4, buildRepeatedProp, p7), propResultCategory.PropSignal
	end
	return nil, propResultCategory.Failed
end

return buildRepeatedProp