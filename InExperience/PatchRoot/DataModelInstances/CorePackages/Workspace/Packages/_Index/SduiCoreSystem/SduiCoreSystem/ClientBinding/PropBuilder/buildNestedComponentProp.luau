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

local function buildNestedComponentProp(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), fFlagSduiInlineNestedComponentSchema (ref), sduiPropUtilsModule (ref), buildConfigForComponent (ref), signalsModule (ref), buildInputsForNestedComponentModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref), fFlagSduiLazyNestedComponentProp (ref), propResultCategory (ref), buildNestedComponentProp (ref)
	local currentComponentType = nil
	local currentParserName = nil
	
	if fFlagSduiImprovedErrorDimensions then
		currentComponentType = p5.currentComponentType
		currentParserName = p5.currentParserName
	end
	if p1 == "literal" then
		local var1
		local _ = nil
		
		if fFlagSduiInlineNestedComponentSchema then
			var1 = sduiPropUtilsModule.resolveTemplateFromData(p2, p5)
		elseif p2.roblox_component == nil then
			error("Missing templateData.roblox_component")
		end
		local templateForRobloxComponent = p5.getTemplateForRobloxComponent(p2.roblox_component)
		
		if templateForRobloxComponent == nil then
			error(`Could not find template for roblox_component {p2.roblox_component}`)
		end
		var1 = templateForRobloxComponent
		local _ = nil
		
		return if fFlagSduiInlineNestedComponentSchema and p2.inline_component ~= nil then buildConfigForComponent(var1, p4, p5, p6, nil, p3) else buildConfigForComponent(var1, signalsModule.createComputed(function(p8)
			-- upvalues: buildInputsForNestedComponentModule (copy), p4 (ref), p2 (ref), p3 (ref), p5 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), sduiParseHelpersModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write)
			local t = {}
			local ok, status = pcall(function()
				-- upvalues: buildInputsForNestedComponentModule (copy), p4 (copy), p2 (copy), p3 (copy), p8 (ref), t (ref), p5 (copy)
				buildInputsForNestedComponentModule(p4, p2.inputs, p3, p8, t, p5)
			end)
			
			if not ok then
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `Failed to build inputs for nested component: {sduiParseHelpersModule.stringifyValue(status)}`,
					name = p5.debugName,
					componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
					parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
				}, p5.appPage)
			end
			return t
		end), p5, p6), if fFlagSduiLazyNestedComponentProp and p7 then propResultCategory.Literal else propResultCategory.NestedComponentConfig
	elseif p1 == "conditional" then
		return sduiPropUtilsModule.generateConditionalPropValue(p2, p3, p5, p6, p4, buildNestedComponentProp, nil, if fFlagSduiLazyNestedComponentProp then not p7 else true), propResultCategory.PropSignal
	end
	error(`Could not build prop. Unknown propDefinitionType: {p1}`)
end

return buildNestedComponentProp