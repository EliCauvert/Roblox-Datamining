local SettingsSdui = script:FindFirstAncestor("SettingsSdui")
local ReactModule = require(SettingsSdui.Parent.React)
local RegisterUserSettingsActionsModule = require(SettingsSdui.registerUserSettingsActions)

return ReactModule.memo(function() --[[ Line: 8 | Named "SduiUserSettingsRegister" ]]
	-- upvalues: ReactModule (copy), RegisterUserSettingsActionsModule (copy)
	ReactModule.useEffect(function() --[[ Line: 9 ]]
		-- upvalues: RegisterUserSettingsActionsModule (upval)
		RegisterUserSettingsActionsModule()
	end, {})
	
	return nil
end)