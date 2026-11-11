local CoreLogger = require(script.Parent.Parent.Lumberyak).Logger.new(nil, "CoreLogger")
local FromStringResult = CoreLogger.Levels.fromString((game:DefineFastString("DebugLuaLogLevel", "")))
local DebugLuaLogPattern = game:DefineFastString("DebugLuaLogPattern", "")
CoreLogger:setContext({ prefix = "[{loggerName}] - " })
CoreLogger:addSink({
	maxLevel = FromStringResult,
	log = function(_, Text: string, _)
		-- upvalues: DebugLuaLogPattern (copy)
		if string.match(Text, DebugLuaLogPattern) then
			print(Text)
		end
	end
})

return CoreLogger