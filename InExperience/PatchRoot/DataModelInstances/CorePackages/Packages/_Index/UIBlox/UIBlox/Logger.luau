local lumberyakModule = require(script.Parent.Parent.Lumberyak)
local logger = lumberyakModule.Logger
local t = {
	maxLevel = logger.Levels.Info,
	log = function(_, p0, p1)
		-- upvalues: logger (ref)
		if p1.level == logger.Levels.Error or p1.level == logger.Levels.Warning then
			warn(p0)
			
			return
		end
		print(p0)
	end
}

local _ = function(p2)
	-- upvalues: lumberyakModule (ref), t (ref)
	local var4 = lumberyakModule.Logger.new(nil, p2)
	var4:setContext({ prefix = "[{loggerName} - {level}] - " })
	var4:addSink(t)
	
	return var4
end

local UIBlox = lumberyakModule.Logger.new(nil, "UIBlox")
UIBlox:setContext({ prefix = "[{loggerName} - {level}] - " })
UIBlox:addSink(t)
local t_1 = {
	uibloxSink = t,
	setLogLevel = function(value, p3)
		value.uibloxSink.maxLevel = p3
		value:addSink(value.uibloxSink)
	end,
	enableTraceLog = function(p4)
		-- upvalues: logger (ref)
		p4:setLogLevel(logger.Levels.Trace)
	end
}
setmetatable(t_1, { __index = UIBlox })

return t_1