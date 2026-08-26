local voiceChatLogger = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsInitializer).CoreLogger:new("VoiceChatLogger")

return function(p1)
	-- upvalues: voiceChatLogger (ref)
	return voiceChatLogger:new(p1)
end