local GetFFlagEnableInExpPhoneVoiceUpsellEntrypointsFunction = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints
game:DefineFastFlag("EnableLeaveGameUpsellEntrypoint", false)

return function()
	-- upvalues: GetFFlagEnableInExpPhoneVoiceUpsellEntrypointsFunction (copy)
	return GetFFlagEnableInExpPhoneVoiceUpsellEntrypointsFunction() and game:GetFastFlag("EnableLeaveGameUpsellEntrypoint")
end