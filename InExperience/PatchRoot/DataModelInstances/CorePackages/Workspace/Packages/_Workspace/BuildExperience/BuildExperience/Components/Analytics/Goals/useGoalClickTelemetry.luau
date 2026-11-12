local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local AnalyticsEventContextModule = require(BuildExperience.Analytics.AnalyticsEventContext)
local AnalyticsPageEventsModule = require(BuildExperience.Analytics.AnalyticsPageEvents)
local FFlagBuildExperienceEventContextTelemetryModule = require(BuildExperience.Flags.FFlagBuildExperienceEventContextTelemetry)

return function(p1)
	-- upvalues: FFlagBuildExperienceEventContextTelemetryModule (copy), ReactModule (copy), AnalyticsEventContextModule (copy), AnalyticsPageEventsModule (copy)
	local UseContextResult = if FFlagBuildExperienceEventContextTelemetryModule then ReactModule.useContext(AnalyticsEventContextModule) else nil
	
	return ReactModule.useCallback(function(p2)
		-- upvalues: AnalyticsPageEventsModule (upval), p1 (copy), UseContextResult (copy)
		AnalyticsPageEventsModule.goalClick(p1, p2, UseContextResult)
	end, { p1, UseContextResult })
end