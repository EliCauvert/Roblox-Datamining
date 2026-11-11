local DashModule = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.Dash)
local _ = require(script.Parent.Parent.Types)
local GetEventInfoModule = require(script.Parent.getEventInfo)
local OptionallyLogModule = require(script.Parent.optionallyLog)
local ReportDiagEventModule = require(script.Parent.reportDiagEvent)
local GetFormattedDiagEventInfoModule = require(script.Parent.getFormattedDiagEventInfo)

local function v6(p1): string
	return `Fired Diag {p1.type}: {p1.name}, {p1.value}`
end

return function(p1)
	-- upvalues: DashModule (copy), GetEventInfoModule (copy), GetFormattedDiagEventInfoModule (copy), ReportDiagEventModule (copy), OptionallyLogModule (copy), v6 (copy)
	return function(p2, p3)
		-- upvalues: DashModule (upval), GetEventInfoModule (upval), p1 (copy), GetFormattedDiagEventInfoModule (upval), ReportDiagEventModule (upval), OptionallyLogModule (upval), v6 (upval)
		return DashModule.pipe(GetEventInfoModule(p1.eventList), GetFormattedDiagEventInfoModule(), ReportDiagEventModule(p1.diagImpl), OptionallyLogModule(p1.loggerImpl, v6))(p2, p3)
	end
end