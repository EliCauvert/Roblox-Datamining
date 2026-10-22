local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local AnalyticsPageEventsModule = require(BuildExperience.Analytics.AnalyticsPageEvents)

return function(p1)
	-- upvalues: ReactModule (copy), AnalyticsPageEventsModule (copy)
	return ReactModule.useCallback(function(p2)
		-- upvalues: AnalyticsPageEventsModule (upval), p1 (copy)
		AnalyticsPageEventsModule.goalClick(p1, p2)
	end, { p1 })
end