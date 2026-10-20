local GetFFlagPackagifySettingsShowSignalModule = require(script.Parent.GetFFlagPackagifySettingsShowSignal)
game:DefineFastFlag("NotificationModalSetMenuIsOpen", false)

return function()
	-- upvalues: GetFFlagPackagifySettingsShowSignalModule (copy)
	return GetFFlagPackagifySettingsShowSignalModule() and game:GetFastFlag("NotificationModalSetMenuIsOpen")
end