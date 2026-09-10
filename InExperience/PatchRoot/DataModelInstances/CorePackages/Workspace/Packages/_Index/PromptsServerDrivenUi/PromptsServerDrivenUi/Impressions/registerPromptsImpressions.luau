local promptsServerDrivenUi = script:FindFirstAncestor("PromptsServerDrivenUi")
local sduiCoreSystemModule = require(promptsServerDrivenUi.Parent.SduiCoreSystem)
local sduiImpressionEventType = sduiCoreSystemModule.SduiImpressionEventType
local getSduiImpressionHandlerRegistry = sduiCoreSystemModule.getSduiImpressionHandlerRegistry

return function()
	-- upvalues: sduiImpressionEventType (ref), promptsServerDrivenUi (ref), getSduiImpressionHandlerRegistry (ref)
	getSduiImpressionHandlerRegistry().registerImpressionHandlerConfigs({
		[sduiImpressionEventType.promptImpressions] = {
			skipItemImpressionsLog = false,
			lazyHandler = function()
				-- upvalues: promptsServerDrivenUi (copy)
				return require(promptsServerDrivenUi.Impressions.SduiPromptImpressionsHandler)
			end
		}
	})
end