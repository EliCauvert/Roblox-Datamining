local promptsServerDrivenUi = script:FindFirstAncestor("PromptsServerDrivenUi")
local parent = promptsServerDrivenUi.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppSduiMovePromptsActions = sharedFlagsModule.FFlagLuaAppSduiMovePromptsActions
local fFlagSduiRequestPushNotificationPermissionActionHandler = sharedFlagsModule.FFlagSduiRequestPushNotificationPermissionActionHandler
local registerPromptsActionsModule = require(promptsServerDrivenUi.Actions.registerPromptsActions)
local registerPromptsImpressionsModule = require(promptsServerDrivenUi.Impressions.registerPromptsImpressions)

return reactModule.memo(function()
	-- upvalues: reactModule (ref), fFlagLuaAppSduiMovePromptsActions (ref), fFlagSduiRequestPushNotificationPermissionActionHandler (ref), registerPromptsActionsModule (ref), registerPromptsImpressionsModule (ref)
	reactModule.useEffect(function()
		-- upvalues: fFlagLuaAppSduiMovePromptsActions (copy), fFlagSduiRequestPushNotificationPermissionActionHandler (copy), registerPromptsActionsModule (copy), registerPromptsImpressionsModule (copy)
		if fFlagLuaAppSduiMovePromptsActions or fFlagSduiRequestPushNotificationPermissionActionHandler then
			registerPromptsActionsModule()
		end
		registerPromptsImpressionsModule()
	end, {})
	
	return nil
end)