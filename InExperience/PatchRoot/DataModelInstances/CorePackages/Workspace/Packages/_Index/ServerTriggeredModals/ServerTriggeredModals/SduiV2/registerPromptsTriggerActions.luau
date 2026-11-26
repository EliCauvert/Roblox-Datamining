local SduiCoreSystemModule = require(script:FindFirstAncestor("ServerTriggeredModals").Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local GetSduiActionHandlerRegistryFunction = SduiCoreSystemModule.getSduiActionHandlerRegistry

return function()
	-- upvalues: SduiActionType (copy), GetSduiActionHandlerRegistryFunction (copy)
	GetSduiActionHandlerRegistryFunction().registerActionHandlerConfigs({
		[SduiActionType.FetchPrompts] = {
			skipUnifiedLogging = true,
			lazyHandler = function()
				return require(script.Parent.SduiFetchPromptsAction).handler
			end
		}
	})
end