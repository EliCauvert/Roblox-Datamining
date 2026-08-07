-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:29 2026 Pacific Standard Time.

local lumberyakModule = require(script:FindFirstAncestor("Foundation").Parent.Lumberyak)
local logger = lumberyakModule.Logger
local t = {
	maxLevel = logger.Levels.Info,
	log = function(_, p0, p1) --[[ line: 18 ]]
		-- upvalues: logger (ref)
		if p1.level == logger.Levels.Error or p1.level == logger.Levels.Warning then
			warn(p0)
			
			return
		end
		print(p0)
	end
}

local _ = function(p2) --[[ line: 27 ]]
	-- upvalues: lumberyakModule (ref), t (ref)
	local var4 = lumberyakModule.Logger.new(nil, p2)
	var4:setContext({ prefix = "[{loggerName} - {level}] - " })
	var4:addSink(t)
	
	return var4
end

local foundation = lumberyakModule.Logger.new(nil, "Foundation")
foundation:setContext({ prefix = "[{loggerName} - {level}] - " })
foundation:addSink(t)
local t_1 = {
	foundationSink = t,
	setLogLevel = function(value, p3) --[[ line: 38 ]]
		value.foundationSink.maxLevel = p3
		value:addSink(value.foundationSink)
	end,
	enableTraceLog = function(p4) --[[ line: 42 ]]
		-- upvalues: logger (ref)
		p4:setLogLevel(logger.Levels.Trace)
	end
}
setmetatable(t_1, { __index = foundation })

return t_1