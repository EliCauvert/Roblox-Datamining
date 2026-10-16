local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(SduiCoreSystem.Parent.Signals)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local _ = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local SduiLoggerModule = require(SduiCoreSystem.SduiLogger)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local SduiParseHelpersModule = require(SduiCoreSystem.SduiParseHelpers)
local _ = require(SduiCoreSystem.SduiComponentType)
local BuildConfigForComponent = require(SduiCoreSystem.ClientBinding.SduiClientBindingBuilder).buildConfigForComponent

return {
	makeStub = function(p1, p2, p3, p4, p5, p6) --[[ Line: 44 ]]
		-- upvalues: BuildConfigForComponent (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), SduiParseHelpersModule (copy)
		return (setmetatable({ isBlank = false }, {
			__index = function(p7, p8) --[[ Line: 60 ]]
				-- upvalues: BuildConfigForComponent (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), p5 (copy), SduiLoggerModule (upval), SduiErrorsModule (upval), SduiParseHelpersModule (upval), p6 (copy)
				setmetatable(p7, nil)
				local Success, Result = pcall(BuildConfigForComponent, p1, p2, p3, p4, nil, p5, p7)
				
				if Success then
					return p7[p8]
				else
					SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
						message = `Failed to materialize deferred list item: {SduiParseHelpersModule.stringifyValue(Result)}`,
						name = p6.name,
						componentType = p6.componentType,
						parserName = p6.parserName
					}, p6.appPage)
					
					return nil
				end
			end
		}))
	end
}