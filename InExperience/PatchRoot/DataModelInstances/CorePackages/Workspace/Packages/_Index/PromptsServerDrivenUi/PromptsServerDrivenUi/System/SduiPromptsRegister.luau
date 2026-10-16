local PromptsServerDrivenUi = script:FindFirstAncestor("PromptsServerDrivenUi")
local Parent = PromptsServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppSduiMovePromptsActions = SharedFlagsModule.FFlagLuaAppSduiMovePromptsActions
local FFlagSduiRequestPushNotificationPermissionActionHandler = SharedFlagsModule.FFlagSduiRequestPushNotificationPermissionActionHandler
local RegisterPromptsActionsModule = require(PromptsServerDrivenUi.Actions.registerPromptsActions)
local RegisterPromptsImpressionsModule = require(PromptsServerDrivenUi.Impressions.registerPromptsImpressions)

return ReactModule.memo(function() --[[ Line: 13 | Named "SduiPromptsRegister" ]]
	-- upvalues: ReactModule (copy), FFlagLuaAppSduiMovePromptsActions (copy), FFlagSduiRequestPushNotificationPermissionActionHandler (copy), RegisterPromptsActionsModule (copy), RegisterPromptsImpressionsModule (copy)
	ReactModule.useEffect(function() --[[ Line: 14 ]]
		-- upvalues: FFlagLuaAppSduiMovePromptsActions (upval), FFlagSduiRequestPushNotificationPermissionActionHandler (upval), RegisterPromptsActionsModule (upval), RegisterPromptsImpressionsModule (upval)
		if FFlagLuaAppSduiMovePromptsActions or FFlagSduiRequestPushNotificationPermissionActionHandler then
			RegisterPromptsActionsModule()
		end
		RegisterPromptsImpressionsModule()
	end, {})
	
	return nil
end)