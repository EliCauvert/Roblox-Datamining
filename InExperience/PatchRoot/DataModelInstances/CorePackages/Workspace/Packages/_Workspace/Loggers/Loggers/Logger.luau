local logger = require(script.Parent.Parent.Lumberyak).Logger.new(nil, "Logger")
local var1 = logger.Levels.fromString(game:DefineFastString("DebugLuaLogLevel", ""))
local debugLuaLogPattern = game:DefineFastString("DebugLuaLogPattern", "")
logger:setContext({ prefix = "[{loggerName}] - " })
logger:addSink({
	maxLevel = var1,
	log = function(_, p0, _)
		-- upvalues: debugLuaLogPattern (ref)
		if string.match(p0, debugLuaLogPattern) then
			print(p0)
		end
	end
})

return logger