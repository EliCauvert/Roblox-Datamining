local SettingsSdui = script:FindFirstAncestor("SettingsSdui")
local SduiCoreSystemModule = require(SettingsSdui.Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local GetSduiActionHandlerRegistryFunction = SduiCoreSystemModule.getSduiActionHandlerRegistry

return function()
	-- upvalues: SduiActionType (copy), SettingsSdui (copy), GetSduiActionHandlerRegistryFunction (copy)
	GetSduiActionHandlerRegistryFunction().registerActionHandlerConfigs({
		[SduiActionType.UpdateUserSettings] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: SettingsSdui (upval)
				return require(SettingsSdui.SduiUpdateUserSettingsAction)
			end
		}
	})
end