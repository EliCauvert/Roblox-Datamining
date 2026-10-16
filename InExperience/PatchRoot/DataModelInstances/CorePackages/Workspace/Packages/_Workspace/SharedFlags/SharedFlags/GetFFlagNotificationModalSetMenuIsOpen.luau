local GetFFlagPackagifySettingsShowSignalModule = require(script.Parent.GetFFlagPackagifySettingsShowSignal)
game:DefineFastFlag("NotificationModalSetMenuIsOpen", false)

return function() --[[ Line: 5 ]]
	-- upvalues: GetFFlagPackagifySettingsShowSignalModule (copy)
	return GetFFlagPackagifySettingsShowSignalModule() and game:GetFastFlag("NotificationModalSetMenuIsOpen")
end