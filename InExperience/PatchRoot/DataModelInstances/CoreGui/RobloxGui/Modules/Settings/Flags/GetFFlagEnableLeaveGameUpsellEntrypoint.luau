local getFFlagEnableInExpPhoneVoiceUpsellEntrypoints = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints
game:DefineFastFlag("EnableLeaveGameUpsellEntrypoint", false)

return function()
	-- upvalues: getFFlagEnableInExpPhoneVoiceUpsellEntrypoints (ref)
	return getFFlagEnableInExpPhoneVoiceUpsellEntrypoints() and game:GetFastFlag("EnableLeaveGameUpsellEntrypoint")
end