local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local FFlagSduiErrorPaths = require(Parent.SharedFlags).FFlagSduiErrorPaths
local _ = require(Parent.Signals)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local _ = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local SduiLoggerModule = require(SduiCoreSystem.SduiLogger)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local AddSduiErrorContextFieldsModule = require(SduiCoreSystem.addSduiErrorContextFields)
local SduiParseHelpersModule = require(SduiCoreSystem.SduiParseHelpers)
local _ = require(SduiCoreSystem.SduiComponentType)
local BuildConfigForComponent = require(SduiCoreSystem.ClientBinding.SduiClientBindingBuilder).buildConfigForComponent

return {
	makeStub = function(p1, p2, p3, p4, p5, p6, p7, p8)
		-- upvalues: BuildConfigForComponent (copy), FFlagSduiErrorPaths (copy), SduiParseHelpersModule (copy), AddSduiErrorContextFieldsModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy)
		return (setmetatable({ isBlank = false }, {
			__index = function(p9, p10)
				-- upvalues: BuildConfigForComponent (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), p5 (copy), FFlagSduiErrorPaths (upval), p7 (copy), p8 (copy), SduiParseHelpersModule (upval), p6 (copy), AddSduiErrorContextFieldsModule (upval), SduiLoggerModule (upval), SduiErrorsModule (upval)
				setmetatable(p9, nil)
				local Success, Result = pcall(BuildConfigForComponent, p1, p2, p3, p4, nil, p5, p9, if FFlagSduiErrorPaths then p7 else nil, if FFlagSduiErrorPaths then p8 else nil)
				
				if Success then
					return p9[p10]
				end
				local config = {
					message = `Failed to materialize deferred list item: {SduiParseHelpersModule.stringifyValue(Result)}`,
					name = p6.name,
					componentType = p6.componentType,
					parserName = p6.parserName
				}
				
				if FFlagSduiErrorPaths then
					AddSduiErrorContextFieldsModule(config, p9.errorContext or p6.nodeContext)
				end
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, config, p6.appPage)
				
				return nil
			end
		}))
	end
}