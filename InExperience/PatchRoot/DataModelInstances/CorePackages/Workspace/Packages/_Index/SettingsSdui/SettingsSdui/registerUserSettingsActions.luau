local SettingsSdui = script:FindFirstAncestor("SettingsSdui")
local SduiCoreSystemModule = require(SettingsSdui.Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local GetSduiActionHandlerRegistryFunction = SduiCoreSystemModule.getSduiActionHandlerRegistry

return function() --[[ Line: 11 | Named "registerUserSettingsActions" ]]
	-- upvalues: SduiActionType (copy), SettingsSdui (copy), GetSduiActionHandlerRegistryFunction (copy)
	GetSduiActionHandlerRegistryFunction().registerActionHandlerConfigs({
		[SduiActionType.UpdateUserSettings] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 14 ]]
				-- upvalues: SettingsSdui (upval)
				return require(SettingsSdui.SduiUpdateUserSettingsAction)
			end
		}
	})
end