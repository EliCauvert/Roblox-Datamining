local dashModule = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.Dash)
local _ = require(script.Parent.Parent.Types)
local getEventInfoModule = require(script.Parent.getEventInfo)
local optionallyLogModule = require(script.Parent.optionallyLog)
local reportDiagEventModule = require(script.Parent.reportDiagEvent)
local getFormattedDiagEventInfoModule = require(script.Parent.getFormattedDiagEventInfo)

local var1 = function(p1)
	return `Fired Diag {p1.type}: {p1.name}, {p1.value}`
end

return function(p1)
	-- upvalues: dashModule (ref), getEventInfoModule (ref), getFormattedDiagEventInfoModule (ref), reportDiagEventModule (ref), optionallyLogModule (ref), var1 (ref)
	return function(p2, p3)
		-- upvalues: dashModule (copy), getEventInfoModule (copy), p1 (ref), getFormattedDiagEventInfoModule (copy), reportDiagEventModule (copy), optionallyLogModule (copy), var1 (copy)
		return dashModule.pipe(getEventInfoModule(p1.eventList), getFormattedDiagEventInfoModule(), reportDiagEventModule(p1.diagImpl), optionallyLogModule(p1.loggerImpl, var1))(p2, p3)
	end
end