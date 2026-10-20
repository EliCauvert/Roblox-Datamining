local PromptsServerDrivenUi = script:FindFirstAncestor("PromptsServerDrivenUi")
local SduiCoreSystemModule = require(PromptsServerDrivenUi.Parent.SduiCoreSystem)
local SduiImpressionEventType = SduiCoreSystemModule.SduiImpressionEventType
local GetSduiImpressionHandlerRegistryFunction = SduiCoreSystemModule.getSduiImpressionHandlerRegistry

return function()
	-- upvalues: SduiImpressionEventType (copy), PromptsServerDrivenUi (copy), GetSduiImpressionHandlerRegistryFunction (copy)
	GetSduiImpressionHandlerRegistryFunction().registerImpressionHandlerConfigs({
		[SduiImpressionEventType.promptImpressions] = {
			skipItemImpressionsLog = false,
			lazyHandler = function()
				-- upvalues: PromptsServerDrivenUi (upval)
				return require(PromptsServerDrivenUi.Impressions.SduiPromptImpressionsHandler)
			end
		}
	})
end