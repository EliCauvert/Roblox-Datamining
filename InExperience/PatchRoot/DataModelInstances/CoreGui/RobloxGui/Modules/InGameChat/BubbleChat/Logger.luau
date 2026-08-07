local bubbleChatLogger = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsInitializer).CoreLogger:new("BubbleChatLogger")

return function(p0) --[[ line: 5 ]]
	-- upvalues: bubbleChatLogger (ref)
	return bubbleChatLogger:new(p0)
end