local dashModule = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.Dash)
local _ = require(script.Parent.Parent.Types)
local getEventInfoModule = require(script.Parent.getEventInfo)
local optionallyLogModule = require(script.Parent.optionallyLog)
local reportDiagEventModule = require(script.Parent.reportDiagEvent)
local getFormattedDiagEventInfoModule = require(script.Parent.getFormattedDiagEventInfo)

local var5 = function(p0) --[[ line: 13 ]]
	return `Fired Diag {p0.type}: {p0.name}, {p0.value}`
end

return function(p1) --[[ line: 17 ]]
	-- upvalues: dashModule (ref), getEventInfoModule (ref), getFormattedDiagEventInfoModule (ref), reportDiagEventModule (ref), optionallyLogModule (ref), var5 (ref)
	return function(p2, p3) --[[ line: 18 ]]
		-- upvalues: dashModule (copy), getEventInfoModule (copy), p1 (ref), getFormattedDiagEventInfoModule (copy), reportDiagEventModule (copy), optionallyLogModule (copy), var5 (copy)
		return dashModule.pipe(getEventInfoModule(p1.eventList), getFormattedDiagEventInfoModule(), reportDiagEventModule(p1.diagImpl), optionallyLogModule(p1.loggerImpl, var5))(p2, p3)
	end
end