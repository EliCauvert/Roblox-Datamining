local getFFlagEnableInExpPhoneVoiceUpsellEntrypoints = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints
game:DefineFastFlag("EnableLeaveGameUpsellEntrypoint", false)

return function() --[[ line: 6 ]]
	-- upvalues: getFFlagEnableInExpPhoneVoiceUpsellEntrypoints (ref)
	return getFFlagEnableInExpPhoneVoiceUpsellEntrypoints() and game:GetFastFlag("EnableLeaveGameUpsellEntrypoint")
end