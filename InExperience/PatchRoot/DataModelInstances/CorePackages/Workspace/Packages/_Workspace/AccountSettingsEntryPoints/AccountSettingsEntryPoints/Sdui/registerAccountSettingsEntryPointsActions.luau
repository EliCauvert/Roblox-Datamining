local AccountSettingsEntryPoints = script:FindFirstAncestor("AccountSettingsEntryPoints")
local SduiCoreSystemModule = require(AccountSettingsEntryPoints.Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local GetSduiActionHandlerRegistryFunction = SduiCoreSystemModule.getSduiActionHandlerRegistry

return function()
	-- upvalues: SduiActionType (copy), AccountSettingsEntryPoints (copy), GetSduiActionHandlerRegistryFunction (copy)
	GetSduiActionHandlerRegistryFunction().registerActionHandlerConfigs({
		[SduiActionType.OpenAccountSettings] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: AccountSettingsEntryPoints (upval)
				return require(AccountSettingsEntryPoints.Sdui.SduiOpenAccountSettingsAction)
			end
		}
	})
end