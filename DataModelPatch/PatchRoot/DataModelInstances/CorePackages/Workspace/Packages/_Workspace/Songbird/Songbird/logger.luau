local Songbird = require(script:FindFirstAncestor("Songbird").Parent.Lumberyak).Logger.new(nil, "Songbird")
local Success, Result = pcall(function()
	return {
		level = game:DefineFastString("DebugLuaLogLevel", ""),
		pattern = game:DefineFastString("DebugLuaLogPattern", "")
	}
end)

if not Success then
	Result = { level = "debug", pattern = "" }
end
Songbird:setContext({ prefix = "[{loggerName} - {level}] - " })
Songbird:addSink({
	maxLevel = Songbird.Levels.fromString(Result.level),
	log = function(_, p1, _)
		-- upvalues: Result (ref)
		if p1:match(Result.pattern) then
			print(p1)
		end
	end
})

return Songbird