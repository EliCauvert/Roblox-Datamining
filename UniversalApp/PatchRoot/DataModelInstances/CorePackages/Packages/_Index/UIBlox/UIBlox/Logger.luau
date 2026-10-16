local LumberyakModule = require(script.Parent.Parent.Lumberyak)
local Logger = LumberyakModule.Logger
local UibloxSink = {
	maxLevel = Logger.Levels.Info,
	log = function(_, p1, p2) --[[ Line: 18 ]]
		-- upvalues: Logger (copy)
		if p2.level == Logger.Levels.Error or p2.level == Logger.Levels.Warning then
			warn(p1)
			
			return
		else
			print(p1)
		end
	end
}

local function _(p1) --[[ Line: 27 ]]
	-- upvalues: LumberyakModule (copy), UibloxSink (copy)
	local NewResult = LumberyakModule.Logger.new(nil, p1)
	NewResult:setContext({ prefix = "[{loggerName} - {level}] - " })
	NewResult:addSink(UibloxSink)
	
	return NewResult
end

local UIBlox = LumberyakModule.Logger.new(nil, "UIBlox")
UIBlox:setContext({ prefix = "[{loggerName} - {level}] - " })
UIBlox:addSink(UibloxSink)
local LoggerModule = {
	uibloxSink = UibloxSink,
	setLogLevel = function(p1, MaxLevel) --[[ Line: 38 ]]
		p1.uibloxSink.maxLevel = MaxLevel
		p1:addSink(p1.uibloxSink)
	end,
	enableTraceLog = function(p1) --[[ Line: 42 ]]
		-- upvalues: Logger (copy)
		p1:setLogLevel(Logger.Levels.Trace)
	end
}
setmetatable(LoggerModule, { __index = UIBlox })

return LoggerModule