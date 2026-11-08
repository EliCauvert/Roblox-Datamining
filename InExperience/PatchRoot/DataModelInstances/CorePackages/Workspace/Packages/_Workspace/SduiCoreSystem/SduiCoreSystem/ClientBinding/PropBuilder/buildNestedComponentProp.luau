local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local FFlagSduiErrorPaths = require(Parent.SharedFlags).FFlagSduiErrorPaths
local _ = require(Parent.ServiceContractsProto)
local SignalsModule = require(Parent.Signals)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local PropResultCategory = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local BuildConfigForComponentFunction = require(SduiCoreSystem.ClientBinding.SduiClientBindingBuilder).buildConfigForComponent
local BuildInputsForNestedComponentModule = require(SduiCoreSystem.ClientBinding.PropBuilder.buildInputsForNestedComponent)
local SduiPropUtilsModule = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local SduiLoggerModule = require(SduiCoreSystem.SduiLogger)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local AddSduiErrorContextFieldsModule = require(SduiCoreSystem.addSduiErrorContextFields)
local SduiParseHelpersModule = require(SduiCoreSystem.SduiParseHelpers)
local _ = require(SduiCoreSystem.SduiComponentType)

local function buildNestedComponentProp(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: SduiPropUtilsModule (copy), BuildConfigForComponentFunction (copy), SignalsModule (copy), BuildInputsForNestedComponentModule (copy), SduiParseHelpersModule (copy), FFlagSduiErrorPaths (copy), AddSduiErrorContextFieldsModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), PropResultCategory (copy), buildNestedComponentProp (copy)
	local CurrentComponentType = p5.currentComponentType
	local CurrentParserName = p5.currentParserName
	
	if p1 == "literal" then
		local ResolveTemplateFromDataResult = SduiPropUtilsModule.resolveTemplateFromData(p2, p5)
		local ConfigForComponent = if p2.inline_component == nil then BuildConfigForComponentFunction(ResolveTemplateFromDataResult, SignalsModule.createComputed(function(p8)
			-- upvalues: BuildInputsForNestedComponentModule (upval), p4 (copy), p2 (copy), p3 (copy), p5 (copy), SduiParseHelpersModule (upval), CurrentComponentType (copy), CurrentParserName (copy), FFlagSduiErrorPaths (upval), AddSduiErrorContextFieldsModule (upval), SduiLoggerModule (upval), SduiErrorsModule (upval)
			local t = {}
			local Success, Result = pcall(function()
				-- upvalues: BuildInputsForNestedComponentModule (upval), p4 (upval), p2 (upval), p3 (upval), p8 (copy), t (copy), p5 (upval)
				BuildInputsForNestedComponentModule(p4, p2.inputs, p3, p8, t, p5)
			end)
			
			if not Success then
				local config = {
					message = `Failed to build inputs for nested component: {SduiParseHelpersModule.stringifyValue(Result)}`,
					name = p5.debugName,
					componentType = CurrentComponentType,
					parserName = CurrentParserName
				}
				
				if FFlagSduiErrorPaths then
					AddSduiErrorContextFieldsModule(config, p5.errorContext)
				end
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, config, p5.appPage)
			end
			return t
		end), p5, p6, nil, nil, nil, if FFlagSduiErrorPaths then p2.roblox_component else nil) else BuildConfigForComponentFunction(ResolveTemplateFromDataResult, p4, p5, p6, nil, p3)
		
		if p7 then
			return ConfigForComponent, PropResultCategory.Literal
		else
			return ConfigForComponent, PropResultCategory.NestedComponentConfig
		end
	elseif p1 == "conditional" then
		return SduiPropUtilsModule.generateConditionalPropValue(p2, p3, p5, p6, p4, buildNestedComponentProp, nil, not p7), PropResultCategory.PropSignal
	else
		error(`Could not build prop. Unknown propDefinitionType: {p1}`)
	end
end

return buildNestedComponentProp