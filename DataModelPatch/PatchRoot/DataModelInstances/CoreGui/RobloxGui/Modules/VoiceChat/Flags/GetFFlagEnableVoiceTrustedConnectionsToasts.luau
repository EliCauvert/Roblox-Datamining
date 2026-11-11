local _ = require(game:GetService("CorePackages").Workspace.Packages.VoiceChatCore)
local GetFFlagUpdateVoiceConnectionToastsModule = require(script.Parent.GetFFlagUpdateVoiceConnectionToasts)
game:DefineFastFlag("EnableVoiceTrustedConnectionsToasts", false)

return function()
	-- upvalues: GetFFlagUpdateVoiceConnectionToastsModule (copy)
	return GetFFlagUpdateVoiceConnectionToastsModule() and game:GetFastFlag("EnableVoiceTrustedConnectionsToasts")
end