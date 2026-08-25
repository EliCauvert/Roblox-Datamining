local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local _ = require(parent.ServiceContractsProto)
local signalsModule = require(parent.Signals)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local propResultCategory = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local buildConfigForComponent = require(sduiCoreSystem.ClientBinding.SduiClientBindingBuilder).buildConfigForComponent
local buildInputsForNestedComponentModule = require(sduiCoreSystem.ClientBinding.PropBuilder.buildInputsForNestedComponent)
local sduiPropUtilsModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local sduiLoggerModule = require(sduiCoreSystem.SduiLogger)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiParseHelpersModule = require(sduiCoreSystem.SduiParseHelpers)
local _ = require(sduiCoreSystem.SduiComponentType)
local fFlagSduiImprovedErrorDimensions = require(parent.SharedFlags).FFlagSduiImprovedErrorDimensions
local fFlagSduiInlineNestedComponentSchema = require(parent.SharedFlags).FFlagSduiInlineNestedComponentSchema
local fFlagSduiLazyNestedComponentProp = require(parent.SharedFlags).FFlagSduiLazyNestedComponentProp

local function buildNestedComponentProp(p0, p1, p2, p3, p4, p5, p6)
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), fFlagSduiInlineNestedComponentSchema (ref), sduiPropUtilsModule (ref), buildConfigForComponent (ref), signalsModule (ref), buildInputsForNestedComponentModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref), fFlagSduiLazyNestedComponentProp (ref), propResultCategory (ref), buildNestedComponentProp (ref)
	local currentComponentType = nil
	local currentParserName = nil
	
	if fFlagSduiImprovedErrorDimensions then
		currentComponentType = p4.currentComponentType
		currentParserName = p4.currentParserName
	end
	if p0 == "literal" then
		local var8
		local _ = nil
		
		if fFlagSduiInlineNestedComponentSchema then
			var8 = sduiPropUtilsModule.resolveTemplateFromData(p1, p4)
		elseif p1.roblox_component == nil then
			error("Missing templateData.roblox_component")
		end
		local templateForRobloxComponent = p4.getTemplateForRobloxComponent(p1.roblox_component)
		
		if templateForRobloxComponent == nil then
			error(`Could not find template for roblox_component {p1.roblox_component}`)
		end
		var8 = templateForRobloxComponent
		local _ = nil
		
		return if fFlagSduiInlineNestedComponentSchema and p1.inline_component ~= nil then buildConfigForComponent(var8, p3, p4, p5, nil, p2) else buildConfigForComponent(var8, signalsModule.createComputed(function(p7)
			-- upvalues: buildInputsForNestedComponentModule (copy), p3 (ref), p1 (ref), p2 (ref), p4 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), sduiParseHelpersModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write)
			local t = {}
			local ok, status = pcall(function()
				-- upvalues: buildInputsForNestedComponentModule (copy), p3 (copy), p1 (copy), p2 (copy), p7 (ref), t (ref), p4 (copy)
				buildInputsForNestedComponentModule(p3, p1.inputs, p2, p7, t, p4)
			end)
			
			if not ok then
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `Failed to build inputs for nested component: {sduiParseHelpersModule.stringifyValue(status)}`,
					name = p4.debugName,
					componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
					parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
				}, p4.appPage)
			end
			return t
		end), p4, p5), if fFlagSduiLazyNestedComponentProp and p6 then propResultCategory.Literal else propResultCategory.NestedComponentConfig
	elseif p0 == "conditional" then
		return sduiPropUtilsModule.generateConditionalPropValue(p1, p2, p4, p5, p3, buildNestedComponentProp, nil, if fFlagSduiLazyNestedComponentProp then not p6 else true), propResultCategory.PropSignal
	end
	error(`Could not build prop. Unknown propDefinitionType: {p0}`)
end

return buildNestedComponentProp