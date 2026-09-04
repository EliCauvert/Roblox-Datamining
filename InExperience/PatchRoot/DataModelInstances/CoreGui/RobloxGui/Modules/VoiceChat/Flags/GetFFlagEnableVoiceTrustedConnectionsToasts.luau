local _ = require(game:GetService("CorePackages").Workspace.Packages.VoiceChatCore)
game:DefineFastFlag("EnableVoiceTrustedConnectionsToasts", false)

return function()
	return game:GetFastFlag("EnableVoiceTrustedConnectionsToasts")
end