local PromptsServerDrivenUi = script:FindFirstAncestor("PromptsServerDrivenUi")
local SduiCoreSystemModule = require(PromptsServerDrivenUi.Parent.SduiCoreSystem)
local SduiImpressionEventType = SduiCoreSystemModule.SduiImpressionEventType
local GetSduiImpressionHandlerRegistryFunction = SduiCoreSystemModule.getSduiImpressionHandlerRegistry

return function() --[[ Line: 11 | Named "registerPromptsImpressions" ]]
	-- upvalues: SduiImpressionEventType (copy), PromptsServerDrivenUi (copy), GetSduiImpressionHandlerRegistryFunction (copy)
	GetSduiImpressionHandlerRegistryFunction().registerImpressionHandlerConfigs({
		[SduiImpressionEventType.promptImpressions] = {
			skipItemImpressionsLog = false,
			lazyHandler = function() --[[ Line: 14 ]]
				-- upvalues: PromptsServerDrivenUi (upval)
				return require(PromptsServerDrivenUi.Impressions.SduiPromptImpressionsHandler)
			end
		}
	})
end