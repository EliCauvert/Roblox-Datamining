local VoiceChatLogger = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsInitializer).CoreLogger:new("VoiceChatLogger")

return function(p1)
	-- upvalues: VoiceChatLogger (copy)
	return VoiceChatLogger:new(p1)
end