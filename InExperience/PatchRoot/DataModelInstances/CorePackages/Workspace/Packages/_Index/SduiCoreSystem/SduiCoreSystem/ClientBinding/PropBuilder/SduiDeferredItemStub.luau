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
	makeStub = function(p0, p1, p2, p3, p4, p5) --[[ line: 44 ]]
		-- upvalues: buildConfigForComponent (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref)
		return setmetatable({ isBlank = false }, {
			__index = function(p6, p7) --[[ line: 60 ]]
				-- upvalues: buildConfigForComponent (copy), p0 (ref), p1 (ref), p2 (ref), p3 (ref), p4 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), sduiParseHelpersModule (copy), p5 (ref)
				setmetatable(p6, nil)
				local ok, status = pcall(buildConfigForComponent, p0, p1, p2, p3, nil, p4, p6)
				
				if ok then
					return p6[p7]
				end
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `Failed to materialize deferred list item: {sduiParseHelpersModule.stringifyValue(status)}`,
					name = p5.name,
					componentType = p5.componentType,
					parserName = p5.parserName
				}, p5.appPage)
				
				return nil
			end
		})
	end
}