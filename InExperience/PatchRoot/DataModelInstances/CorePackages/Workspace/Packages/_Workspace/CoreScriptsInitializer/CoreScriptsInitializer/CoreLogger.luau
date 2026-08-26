local coreLogger = require(script.Parent.Parent.Lumberyak).Logger.new(nil, "CoreLogger")
local var1 = coreLogger.Levels.fromString(game:DefineFastString("DebugLuaLogLevel", ""))
local debugLuaLogPattern = game:DefineFastString("DebugLuaLogPattern", "")
coreLogger:setContext({ prefix = "[{loggerName}] - " })
coreLogger:addSink({
	maxLevel = var1,
	log = function(_, p1, _)
		-- upvalues: debugLuaLogPattern (ref)
		if string.match(p1, debugLuaLogPattern) then
			print(p1)
		end
	end
})

return coreLogger