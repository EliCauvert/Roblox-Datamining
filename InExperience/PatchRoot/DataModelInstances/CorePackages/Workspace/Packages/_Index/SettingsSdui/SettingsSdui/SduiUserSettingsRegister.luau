local SettingsSdui = script:FindFirstAncestor("SettingsSdui")
local ReactModule = require(SettingsSdui.Parent.React)
local RegisterUserSettingsActionsModule = require(SettingsSdui.registerUserSettingsActions)

return ReactModule.memo(function()
	-- upvalues: ReactModule (copy), RegisterUserSettingsActionsModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: RegisterUserSettingsActionsModule (upval)
		RegisterUserSettingsActionsModule()
	end, {})
	
	return nil
end)