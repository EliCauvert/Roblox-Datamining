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
local fFlagSduiLazyNestedComponentProp = require(parent.SharedFlags).FFlagSduiLazyNestedComponentProp

local function buildNestedComponentProp(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: sduiPropUtilsModule (ref), buildConfigForComponent (ref), signalsModule (ref), buildInputsForNestedComponentModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref), fFlagSduiLazyNestedComponentProp (ref), propResultCategory (ref), buildNestedComponentProp (ref)
	local currentComponentType = p5.currentComponentType
	local currentParserName = p5.currentParserName
	
	if p1 == "literal" then
		local var1 = sduiPropUtilsModule.resolveTemplateFromData(p2, p5)
		local var2 = if p2.inline_component ~= nil then buildConfigForComponent(var1, signalsModule.createComputed(function(p8)
			-- upvalues: buildInputsForNestedComponentModule (copy), p4 (ref), p2 (ref), p3 (ref), p5 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), sduiParseHelpersModule (copy), currentComponentType (ref), currentParserName (ref)
			local t = {}
			local ok, status = pcall(function()
				-- upvalues: buildInputsForNestedComponentModule (copy), p4 (copy), p2 (copy), p3 (copy), p8 (ref), t (ref), p5 (copy)
				buildInputsForNestedComponentModule(p4, p2.inputs, p3, p8, t, p5)
			end)
			
			if not ok then
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `Failed to build inputs for nested component: {sduiParseHelpersModule.stringifyValue(status)}`,
					name = p5.debugName,
					componentType = currentComponentType,
					parserName = currentParserName
				}, p5.appPage)
			end
			return t
		end), p5, p6) else buildConfigForComponent(var1, p4, p5, p6, nil, p3)
		
		if fFlagSduiLazyNestedComponentProp and p7 then
			return var2, propResultCategory.Literal
		end
		return var2, propResultCategory.NestedComponentConfig
	elseif p1 == "conditional" then
		return sduiPropUtilsModule.generateConditionalPropValue(p2, p3, p5, p6, p4, buildNestedComponentProp, nil, if fFlagSduiLazyNestedComponentProp then not p7 else true), propResultCategory.PropSignal
	end
	error(`Could not build prop. Unknown propDefinitionType: {p1}`)
end

return buildNestedComponentProp