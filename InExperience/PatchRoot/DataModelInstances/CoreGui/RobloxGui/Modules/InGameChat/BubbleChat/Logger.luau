local bubbleChatLogger = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsInitializer).CoreLogger:new("BubbleChatLogger")

return function(p1)
	-- upvalues: bubbleChatLogger (ref)
	return bubbleChatLogger:new(p1)
end