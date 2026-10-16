local BubbleChatLogger = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsInitializer).CoreLogger:new("BubbleChatLogger")

return function(p1) --[[ Line: 5 ]]
	-- upvalues: BubbleChatLogger (copy)
	return BubbleChatLogger:new(p1)
end