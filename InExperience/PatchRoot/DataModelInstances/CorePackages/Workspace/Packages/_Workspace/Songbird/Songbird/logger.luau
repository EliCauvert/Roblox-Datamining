local songbird = require(script:FindFirstAncestor("Songbird").Parent.Lumberyak).Logger.new(nil, "Songbird")
local ok, status = pcall(function()
	return {
		level = game:DefineFastString("DebugLuaLogLevel", ""),
		pattern = game:DefineFastString("DebugLuaLogPattern", "")
	}
end)

if not ok then
	status = { level = "debug", pattern = "" }
end
songbird:setContext({ prefix = "[{loggerName} - {level}] - " })
songbird:addSink({
	maxLevel = songbird.Levels.fromString(status.level),
	log = function(_, p1, _)
		-- upvalues: status (write)
		if p1:match(status.pattern) then
			print(p1)
		end
	end
})

return songbird