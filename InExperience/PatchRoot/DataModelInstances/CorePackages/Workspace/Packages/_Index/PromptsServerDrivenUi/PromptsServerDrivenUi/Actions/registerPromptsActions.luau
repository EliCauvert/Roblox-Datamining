local promptsServerDrivenUi = script:FindFirstAncestor("PromptsServerDrivenUi")
local parent = promptsServerDrivenUi.Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local getSduiActionHandlerRegistry = sduiCoreSystemModule.getSduiActionHandlerRegistry
local fFlagSduiDismissPromptAction = require(parent.SharedFlags).FFlagSduiDismissPromptAction

return function()
	-- upvalues: sduiActionType (ref), fFlagSduiDismissPromptAction (ref), promptsServerDrivenUi (ref), getSduiActionHandlerRegistry (ref)
	getSduiActionHandlerRegistry().registerActionHandlerConfigs({
		[sduiActionType.DismissPrompt] = if fFlagSduiDismissPromptAction then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: promptsServerDrivenUi (copy)
				return require(promptsServerDrivenUi.Actions.SduiDismissPromptAction)
			end
		} else nil
	})
end