local voiceChatLogger = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsInitializer).CoreLogger:new("VoiceChatLogger")

return function(p0)
	-- upvalues: voiceChatLogger (ref)
	return voiceChatLogger:new(p0)
end