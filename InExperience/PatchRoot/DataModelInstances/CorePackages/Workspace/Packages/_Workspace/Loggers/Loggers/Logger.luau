local Logger = require(script.Parent.Parent.Lumberyak).Logger.new(nil, "Logger")
local FromStringResult = Logger.Levels.fromString((game:DefineFastString("DebugLuaLogLevel", "")))
local DebugLuaLogPattern = game:DefineFastString("DebugLuaLogPattern", "")
Logger:setContext({ prefix = "[{loggerName}] - " })
Logger:addSink({
	maxLevel = FromStringResult,
	log = function(_, Text: string, _) --[[ Line: 14 ]]
		-- upvalues: DebugLuaLogPattern (copy)
		if string.match(Text, DebugLuaLogPattern) then
			print(Text)
		end
	end
})

return Logger