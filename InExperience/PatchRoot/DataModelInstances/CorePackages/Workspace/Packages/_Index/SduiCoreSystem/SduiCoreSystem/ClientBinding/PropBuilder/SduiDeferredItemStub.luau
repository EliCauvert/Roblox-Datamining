local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(sduiCoreSystem.Parent.Signals)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local sduiClientBindingBuilderModule = require(sduiCoreSystem.ClientBinding.SduiClientBindingBuilder)
local sduiLoggerModule = require(sduiCoreSystem.SduiLogger)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiParseHelpersModule = require(sduiCoreSystem.SduiParseHelpers)
local _ = require(sduiCoreSystem.SduiComponentType)
local buildConfigForComponent = sduiClientBindingBuilderModule.buildConfigForComponent

return {
	makeStub = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: buildConfigForComponent (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref)
		return setmetatable({ isBlank = false }, {
			__index = function(p7, p8)
				-- upvalues: buildConfigForComponent (copy), p1 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), sduiParseHelpersModule (copy), p6 (ref)
				setmetatable(p7, nil)
				local ok, status = pcall(buildConfigForComponent, p1, p2, p3, p4, nil, p5, p7)
				
				if ok then
					return p7[p8]
				end
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `Failed to materialize deferred list item: {sduiParseHelpersModule.stringifyValue(status)}`,
					name = p6.name,
					componentType = p6.componentType,
					parserName = p6.parserName
				}, p6.appPage)
				
				return nil
			end
		})
	end
}