local dashModule = require(script.Parent.Parent.Parent.Parent.Dash)
local _ = require(script.Parent.Parent.Types)
local getEventInfoModule = require(script.Parent.getEventInfo)
local optionallyLogModule = require(script.Parent.optionallyLog)
local reportCounterModule = require(script.Parent.reportCounter)

local var4 = function(p0)
	return "Fired diagCounter: " .. p0.name .. ", count: " .. (p0.count and tostring(p0.count) or "1")
end

return function(p1)
	-- upvalues: dashModule (ref), getEventInfoModule (ref), optionallyLogModule (ref), var4 (ref), reportCounterModule (ref)
	return function(p2)
		-- upvalues: dashModule (copy), getEventInfoModule (copy), p1 (ref), optionallyLogModule (copy), var4 (copy), reportCounterModule (copy)
		return dashModule.pipe(getEventInfoModule(p1.eventList), optionallyLogModule(p1.loggerImpl, var4), reportCounterModule(p1.diagImpl))(p2)
	end
end