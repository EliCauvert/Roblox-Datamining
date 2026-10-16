local GetFFlagEnableInExpPhoneVoiceUpsellEntrypointsFunction = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints
game:DefineFastFlag("EnableLeaveGameUpsellEntrypoint", false)

return function() --[[ Line: 6 ]]
	-- upvalues: GetFFlagEnableInExpPhoneVoiceUpsellEntrypointsFunction (copy)
	return GetFFlagEnableInExpPhoneVoiceUpsellEntrypointsFunction() and game:GetFastFlag("EnableLeaveGameUpsellEntrypoint")
end