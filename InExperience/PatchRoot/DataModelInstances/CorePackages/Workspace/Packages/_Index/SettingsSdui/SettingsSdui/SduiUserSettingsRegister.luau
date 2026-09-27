local settingsSdui = script:FindFirstAncestor("SettingsSdui")
local reactModule = require(settingsSdui.Parent.React)
local registerUserSettingsActionsModule = require(settingsSdui.registerUserSettingsActions)

return reactModule.memo(function()
	-- upvalues: reactModule (ref), registerUserSettingsActionsModule (ref)
	reactModule.useEffect(function()
		-- upvalues: registerUserSettingsActionsModule (copy)
		registerUserSettingsActionsModule()
	end, {})
	
	return nil
end)