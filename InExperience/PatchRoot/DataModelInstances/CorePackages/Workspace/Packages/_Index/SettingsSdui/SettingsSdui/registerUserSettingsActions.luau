local settingsSdui = script:FindFirstAncestor("SettingsSdui")
local sduiCoreSystemModule = require(settingsSdui.Parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local getSduiActionHandlerRegistry = sduiCoreSystemModule.getSduiActionHandlerRegistry

return function()
	-- upvalues: sduiActionType (ref), settingsSdui (ref), getSduiActionHandlerRegistry (ref)
	getSduiActionHandlerRegistry().registerActionHandlerConfigs({
		[sduiActionType.UpdateUserSettings] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: settingsSdui (copy)
				return require(settingsSdui.SduiUpdateUserSettingsAction)
			end
		}
	})
end