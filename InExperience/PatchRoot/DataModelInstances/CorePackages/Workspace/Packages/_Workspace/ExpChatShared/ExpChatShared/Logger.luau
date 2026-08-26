local expChat = require(script:FindFirstAncestor("ExpChatShared").Parent.Lumberyak).Logger.new(nil, "ExpChat")
local ok, status = pcall(function()
	return {
		level = game:DefineFastString("DebugLuaLogLevel", ""),
		pattern = game:DefineFastString("DebugLuaLogPattern", "")
	}
end)

if not ok then
	status = { level = "debug", pattern = "" }
end
expChat:setContext({ prefix = "[{loggerName} ({level})] - " })
expChat:addSink({
	maxLevel = expChat.Levels.fromString(status.level),
	log = function(_, p1, _)
		-- upvalues: status (write)
		if string.match(p1, status.pattern) then
			print(p1)
		end
	end
})

return expChat