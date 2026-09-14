local promptsServerDrivenUi = script:FindFirstAncestor("PromptsServerDrivenUi")
local parent = promptsServerDrivenUi.Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local getSduiActionHandlerRegistry = sduiCoreSystemModule.getSduiActionHandlerRegistry
local fFlagSduiDismissPromptAction = require(parent.SharedFlags).FFlagSduiDismissPromptAction
local fFlagLuaAppSduiMovePromptsActions = require(parent.SharedFlags).FFlagLuaAppSduiMovePromptsActions
local fFlagSduiRequestPushNotificationPermissionActionHandler = require(parent.SharedFlags).FFlagSduiRequestPushNotificationPermissionActionHandler

return function()
	-- upvalues: sduiActionType (ref), fFlagLuaAppSduiMovePromptsActions (ref), fFlagSduiDismissPromptAction (ref), promptsServerDrivenUi (ref), fFlagSduiRequestPushNotificationPermissionActionHandler (ref), getSduiActionHandlerRegistry (ref)
	getSduiActionHandlerRegistry().registerActionHandlerConfigs({
		[sduiActionType.DismissPrompt] = if fFlagLuaAppSduiMovePromptsActions and fFlagSduiDismissPromptAction then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: promptsServerDrivenUi (copy)
				return require(promptsServerDrivenUi.Actions.SduiDismissPromptAction)
			end
		} else nil,
		[sduiActionType.RequestPushNotificationPermission] = if fFlagSduiRequestPushNotificationPermissionActionHandler then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: promptsServerDrivenUi (copy)
				return require(promptsServerDrivenUi.Actions.SduiRequestPushNotificationPermissionAction)
			end
		} else nil
	})
end