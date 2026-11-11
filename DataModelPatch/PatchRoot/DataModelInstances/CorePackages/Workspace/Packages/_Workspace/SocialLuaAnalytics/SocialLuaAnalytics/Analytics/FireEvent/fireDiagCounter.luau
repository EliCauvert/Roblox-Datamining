local DashModule = require(script.Parent.Parent.Parent.Parent.Dash)
local _ = require(script.Parent.Parent.Types)
local GetEventInfoModule = require(script.Parent.getEventInfo)
local OptionallyLogModule = require(script.Parent.optionallyLog)
local ReportCounterModule = require(script.Parent.reportCounter)

local function v5(p1): string
	return "Fired diagCounter: " .. p1.name .. ", count: " .. (p1.count and tostring(p1.count) or "1")
end

return function(p1)
	-- upvalues: DashModule (copy), GetEventInfoModule (copy), OptionallyLogModule (copy), v5 (copy), ReportCounterModule (copy)
	return function(p2)
		-- upvalues: DashModule (upval), GetEventInfoModule (upval), p1 (copy), OptionallyLogModule (upval), v5 (upval), ReportCounterModule (upval)
		return DashModule.pipe(GetEventInfoModule(p1.eventList), OptionallyLogModule(p1.loggerImpl, v5), ReportCounterModule(p1.diagImpl))(p2)
	end
end