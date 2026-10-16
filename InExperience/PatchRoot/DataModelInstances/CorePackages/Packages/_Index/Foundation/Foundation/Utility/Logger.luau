local LumberyakModule = require(script:FindFirstAncestor("Foundation").Parent.Lumberyak)
local Logger = LumberyakModule.Logger
local FoundationSink = {
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
	-- upvalues: LumberyakModule (copy), FoundationSink (copy)
	local NewResult = LumberyakModule.Logger.new(nil, p1)
	NewResult:setContext({ prefix = "[{loggerName} - {level}] - " })
	NewResult:addSink(FoundationSink)
	
	return NewResult
end

local Foundation = LumberyakModule.Logger.new(nil, "Foundation")
Foundation:setContext({ prefix = "[{loggerName} - {level}] - " })
Foundation:addSink(FoundationSink)
local LoggerModule = {
	foundationSink = FoundationSink,
	setLogLevel = function(p1, MaxLevel) --[[ Line: 38 ]]
		p1.foundationSink.maxLevel = MaxLevel
		p1:addSink(p1.foundationSink)
	end,
	enableTraceLog = function(p1) --[[ Line: 42 ]]
		-- upvalues: Logger (copy)
		p1:setLogLevel(Logger.Levels.Trace)
	end
}
setmetatable(LoggerModule, { __index = Foundation })

return LoggerModule