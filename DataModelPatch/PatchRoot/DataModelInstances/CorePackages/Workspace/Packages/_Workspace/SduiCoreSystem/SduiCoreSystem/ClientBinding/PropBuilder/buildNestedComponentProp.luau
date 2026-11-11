local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local _ = require(Parent.ServiceContractsProto)
local SignalsModule = require(Parent.Signals)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local PropResultCategory = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local BuildConfigForComponentFunction = require(SduiCoreSystem.ClientBinding.SduiClientBindingBuilder).buildConfigForComponent
local BuildInputsForNestedComponentModule = require(SduiCoreSystem.ClientBinding.PropBuilder.buildInputsForNestedComponent)
local SduiPropUtilsModule = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local SduiLoggerModule = require(SduiCoreSystem.SduiLogger)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local SduiParseHelpersModule = require(SduiCoreSystem.SduiParseHelpers)
local _ = require(SduiCoreSystem.SduiComponentType)
local FFlagSduiLocalizedLiterals = require(Parent.SharedFlags).FFlagSduiLocalizedLiterals
local FFlagSduiImprovedErrorDimensions = require(Parent.SharedFlags).FFlagSduiImprovedErrorDimensions
local FFlagSduiInlineNestedComponentSchema = require(Parent.SharedFlags).FFlagSduiInlineNestedComponentSchema
local FFlagSduiLazyNestedComponentProp = require(Parent.SharedFlags).FFlagSduiLazyNestedComponentProp

local function buildNestedComponentProp(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: FFlagSduiImprovedErrorDimensions (copy), FFlagSduiInlineNestedComponentSchema (copy), SduiPropUtilsModule (copy), BuildConfigForComponentFunction (copy), SignalsModule (copy), BuildInputsForNestedComponentModule (copy), FFlagSduiLocalizedLiterals (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), SduiParseHelpersModule (copy), FFlagSduiLazyNestedComponentProp (copy), PropResultCategory (copy), buildNestedComponentProp (copy)
	local CurrentComponentType = nil
	local CurrentParserName = nil
	
	if FFlagSduiImprovedErrorDimensions then
		CurrentComponentType = p5.currentComponentType
		CurrentParserName = p5.currentParserName
	end
	if p1 == "literal" then
		local ResolveTemplateFromDataResult = nil
		if FFlagSduiInlineNestedComponentSchema then
			ResolveTemplateFromDataResult = SduiPropUtilsModule.resolveTemplateFromData(p2, p5)
		else
			if p2.roblox_component == nil then
				error("Missing templateData.roblox_component")
			end
			local TemplateForRobloxComponent = p5.getTemplateForRobloxComponent(p2.roblox_component)
			
			if TemplateForRobloxComponent == nil then
				error(`Could not find template for roblox_component {p2.roblox_component}`)
			end
			ResolveTemplateFromDataResult = TemplateForRobloxComponent
		end
		return if FFlagSduiInlineNestedComponentSchema and p2.inline_component ~= nil then BuildConfigForComponentFunction(ResolveTemplateFromDataResult, p4, p5, p6, nil, p3) else BuildConfigForComponentFunction(ResolveTemplateFromDataResult, SignalsModule.createComputed(function(p8)
			-- upvalues: BuildInputsForNestedComponentModule (upval), p4 (copy), p2 (copy), p3 (copy), FFlagSduiLocalizedLiterals (upval), p5 (copy), SduiLoggerModule (upval), SduiErrorsModule (upval), SduiParseHelpersModule (upval), FFlagSduiImprovedErrorDimensions (upval), CurrentComponentType (ref), CurrentParserName (ref)
			local t = {}
			local Success, Result = pcall(function()
				-- upvalues: BuildInputsForNestedComponentModule (upval), p4 (upval), p2 (upval), p3 (upval), p8 (copy), t (copy), FFlagSduiLocalizedLiterals (upval), p5 (upval)
				BuildInputsForNestedComponentModule(p4, p2.inputs, p3, p8, t, if FFlagSduiLocalizedLiterals then p5 else nil)
			end)
			
			if not Success then
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `Failed to build inputs for nested component: {SduiParseHelpersModule.stringifyValue(Result)}`,
					name = p5.debugName,
					componentType = if FFlagSduiImprovedErrorDimensions then CurrentComponentType else nil,
					parserName = if FFlagSduiImprovedErrorDimensions then CurrentParserName else nil
				}, p5.appPage)
			end
			return t
		end), p5, p6), if FFlagSduiLazyNestedComponentProp and p7 then PropResultCategory.Literal else PropResultCategory.NestedComponentConfig
	elseif p1 == "conditional" then
		return SduiPropUtilsModule.generateConditionalPropValue(p2, p3, p5, p6, p4, buildNestedComponentProp, nil, not FFlagSduiLazyNestedComponentProp or not p7), PropResultCategory.PropSignal
	else
		error(`Could not build prop. Unknown propDefinitionType: {p1}`)
	end
end

return buildNestedComponentProp