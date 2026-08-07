local _ = require(script.Parent.Types)
local getEventInfoModule = require(script.Parent.getEventInfo)
local optionallyLogModule = require(script.Parent.optionallyLog)
local composeModule = require(script.Parent.Parent.Parent.RoduxTools.compose)
local reportCounterModule = require(script.Parent.reportCounter)

local var4 = function(p0) --[[ line: 8 ]]
	return "Fired diagCounter: " .. p0.name .. ", count: " .. (p0.count and tostring(p0.count) or "1")
end

return function(p1) --[[ line: 15 ]]
	-- upvalues: composeModule (ref), reportCounterModule (ref), optionallyLogModule (ref), var4 (ref), getEventInfoModule (ref)
	return function(p2) --[[ line: 16 ]]
		-- upvalues: composeModule (copy), reportCounterModule (copy), p1 (ref), optionallyLogModule (copy), var4 (copy), getEventInfoModule (copy)
		return composeModule(reportCounterModule(p1.diagImpl), optionallyLogModule(p1.loggerImpl, var4), getEventInfoModule(p1.eventList))(p2)
	end
end