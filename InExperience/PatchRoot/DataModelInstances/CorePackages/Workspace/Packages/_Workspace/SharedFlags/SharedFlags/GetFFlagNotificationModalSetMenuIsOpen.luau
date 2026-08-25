local getFFlagPackagifySettingsShowSignalModule = require(script.Parent.GetFFlagPackagifySettingsShowSignal)
game:DefineFastFlag("NotificationModalSetMenuIsOpen", false)

return function()
	-- upvalues: getFFlagPackagifySettingsShowSignalModule (ref)
	return getFFlagPackagifySettingsShowSignalModule() and game:GetFastFlag("NotificationModalSetMenuIsOpen")
end