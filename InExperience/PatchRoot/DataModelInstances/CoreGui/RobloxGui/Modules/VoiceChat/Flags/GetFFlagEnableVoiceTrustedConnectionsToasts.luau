local _ = require(game:GetService("CorePackages").Workspace.Packages.VoiceChatCore)
local getFFlagUpdateVoiceConnectionToastsModule = require(script.Parent.GetFFlagUpdateVoiceConnectionToasts)
game:DefineFastFlag("EnableVoiceTrustedConnectionsToasts", false)

return function() --[[ line: 7 ]]
	-- upvalues: getFFlagUpdateVoiceConnectionToastsModule (ref)
	return getFFlagUpdateVoiceConnectionToastsModule() and game:GetFastFlag("EnableVoiceTrustedConnectionsToasts")
end