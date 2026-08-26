local _ = require(script.Parent.Types)
local getEventInfoModule = require(script.Parent.getEventInfo)
local optionallyLogModule = require(script.Parent.optionallyLog)
local composeModule = require(script.Parent.Parent.Parent.RoduxTools.compose)
local reportCounterModule = require(script.Parent.reportCounter)

local var1 = function(p1)
	return "Fired diagCounter: " .. p0.name .. ", count: " .. (p1.count and tostring(p1.count) or "1")
end

return function(p1)
	-- upvalues: composeModule (ref), reportCounterModule (ref), optionallyLogModule (ref), var1 (ref), getEventInfoModule (ref)
	return function(p2)
		-- upvalues: composeModule (copy), reportCounterModule (copy), p1 (ref), optionallyLogModule (copy), var1 (copy), getEventInfoModule (copy)
		return composeModule(reportCounterModule(p1.diagImpl), optionallyLogModule(p1.loggerImpl, var1), getEventInfoModule(p1.eventList))(p2)
	end
end