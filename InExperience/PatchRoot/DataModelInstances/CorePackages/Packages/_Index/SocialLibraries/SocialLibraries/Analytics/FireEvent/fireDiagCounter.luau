local _ = require(script.Parent.Types)
local GetEventInfoModule = require(script.Parent.getEventInfo)
local OptionallyLogModule = require(script.Parent.optionallyLog)
local ComposeModule = require(script.Parent.Parent.Parent.RoduxTools.compose)
local ReportCounterModule = require(script.Parent.reportCounter)

local function v5(p1): string
	return "Fired diagCounter: " .. p1.name .. ", count: " .. (p1.count and tostring(p1.count) or "1")
end

return function(p1)
	-- upvalues: ComposeModule (copy), ReportCounterModule (copy), OptionallyLogModule (copy), v5 (copy), GetEventInfoModule (copy)
	return function(p2)
		-- upvalues: ComposeModule (upval), ReportCounterModule (upval), p1 (copy), OptionallyLogModule (upval), v5 (upval), GetEventInfoModule (upval)
		return ComposeModule(ReportCounterModule(p1.diagImpl), OptionallyLogModule(p1.loggerImpl, v5), GetEventInfoModule(p1.eventList))(p2)
	end
end