local lumberyakModule = require(script:FindFirstAncestor("Foundation").Parent.Lumberyak)
local logger = lumberyakModule.Logger
local t = {
	maxLevel = logger.Levels.Info,
	log = function(_, p1, p2)
		-- upvalues: logger (ref)
		if p2.level == logger.Levels.Error or p2.level == logger.Levels.Warning then
			warn(p1)
			
			return
		end
		print(p1)
	end
}

local _ = function(p1)
	-- upvalues: lumberyakModule (ref), t (ref)
	local var1 = lumberyakModule.Logger.new(nil, p1)
	var1:setContext({ prefix = "[{loggerName} - {level}] - " })
	var1:addSink(t)
	
	return var1
end

local foundation = lumberyakModule.Logger.new(nil, "Foundation")
foundation:setContext({ prefix = "[{loggerName} - {level}] - " })
foundation:addSink(t)
local t_1 = {
	foundationSink = t,
	setLogLevel = function(value, p1)
		value.foundationSink.maxLevel = p1
		value:addSink(value.foundationSink)
	end,
	enableTraceLog = function(p1)
		-- upvalues: logger (ref)
		p1:setLogLevel(logger.Levels.Trace)
	end
}
setmetatable(t_1, { __index = foundation })

return t_1