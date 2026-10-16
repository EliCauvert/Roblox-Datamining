local ExpChat = require(script:FindFirstAncestor("ExpChatShared").Parent.Lumberyak).Logger.new(nil, "ExpChat")
local Success, Result = pcall(function() --[[ Line: 29 ]]
	return {
		level = game:DefineFastString("DebugLuaLogLevel", ""),
		pattern = game:DefineFastString("DebugLuaLogPattern", "")
	}
end)

if not Success then
	Result = { level = "debug", pattern = "" }
end
ExpChat:setContext({ prefix = "[{loggerName} ({level})] - " })
ExpChat:addSink({
	maxLevel = ExpChat.Levels.fromString(Result.level),
	log = function(_, Text: string, _) --[[ Line: 46 ]]
		-- upvalues: Result (ref)
		if string.match(Text, Result.pattern) then
			print(Text)
		end
	end
})

return ExpChat