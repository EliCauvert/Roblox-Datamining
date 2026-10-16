local PromptsServerDrivenUi = script:FindFirstAncestor("PromptsServerDrivenUi")
local Parent = PromptsServerDrivenUi.Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local GetSduiActionHandlerRegistryFunction = SduiCoreSystemModule.getSduiActionHandlerRegistry
local FFlagSduiDismissPromptAction = require(Parent.SharedFlags).FFlagSduiDismissPromptAction
local FFlagLuaAppSduiMovePromptsActions = require(Parent.SharedFlags).FFlagLuaAppSduiMovePromptsActions
local FFlagSduiRequestPushNotificationPermissionActionHandler = require(Parent.SharedFlags).FFlagSduiRequestPushNotificationPermissionActionHandler

return function() --[[ Line: 16 | Named "registerPromptsActions" ]]
	-- upvalues: SduiActionType (copy), FFlagLuaAppSduiMovePromptsActions (copy), FFlagSduiDismissPromptAction (copy), PromptsServerDrivenUi (copy), FFlagSduiRequestPushNotificationPermissionActionHandler (copy), GetSduiActionHandlerRegistryFunction (copy)
	GetSduiActionHandlerRegistryFunction().registerActionHandlerConfigs({
		[SduiActionType.DismissPrompt] = if FFlagLuaAppSduiMovePromptsActions and FFlagSduiDismissPromptAction then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 20 ]]
				-- upvalues: PromptsServerDrivenUi (upval)
				return require(PromptsServerDrivenUi.Actions.SduiDismissPromptAction)
			end
		} else nil,
		[SduiActionType.RequestPushNotificationPermission] = if FFlagSduiRequestPushNotificationPermissionActionHandler then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 28 ]]
				-- upvalues: PromptsServerDrivenUi (upval)
				return require(PromptsServerDrivenUi.Actions.SduiRequestPushNotificationPermissionAction)
			end
		} else nil
	})
end