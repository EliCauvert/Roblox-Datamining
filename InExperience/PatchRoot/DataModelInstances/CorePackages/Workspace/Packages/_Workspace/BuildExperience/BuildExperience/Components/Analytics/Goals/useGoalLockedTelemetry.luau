local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local AnalyticsEventContextModule = require(BuildExperience.Analytics.AnalyticsEventContext)
local AnalyticsPageEventsModule = require(BuildExperience.Analytics.AnalyticsPageEvents)
local _ = require(BuildExperience.Analytics.Goals.GoalLockedActionId)
local FFlagBuildExperienceEventContextTelemetryModule = require(BuildExperience.Flags.FFlagBuildExperienceEventContextTelemetry)

return function(p1, p2, p3, p4)
	-- upvalues: ReactModule (copy), FFlagBuildExperienceEventContextTelemetryModule (copy), AnalyticsEventContextModule (copy), AnalyticsPageEventsModule (copy)
	local UseRefResult = ReactModule.useRef({})
	local UseContextResult = if FFlagBuildExperienceEventContextTelemetryModule then ReactModule.useContext(AnalyticsEventContextModule) else nil
	ReactModule.useEffect(function()
		-- upvalues: p3 (copy), p1 (copy), p2 (copy), UseRefResult (copy), AnalyticsPageEventsModule (upval), UseContextResult (copy), p4 (copy)
		if p3 ~= nil then
			local PrimaryName: string = `{p1}.{p2}.{p3}.primary`
			
			if not UseRefResult.current[PrimaryName] then
				UseRefResult.current[PrimaryName] = true
				AnalyticsPageEventsModule.goalCtaImpression(p1, p2, p3, "primary", UseContextResult)
			end
		end
		if p4 ~= nil then
			local SecondaryName: string = `{p1}.{p2}.{p4}.secondary`
			
			if not UseRefResult.current[SecondaryName] then
				UseRefResult.current[SecondaryName] = true
				AnalyticsPageEventsModule.goalCtaImpression(p1, p2, p4, "secondary", UseContextResult)
			end
		end
	end, {
		p1,
		p2,
		p3,
		p4,
		UseContextResult
	})
	
	return ReactModule.useCallback(function(p5, p6)
		-- upvalues: AnalyticsPageEventsModule (upval), p1 (copy), p2 (copy), UseContextResult (copy)
		AnalyticsPageEventsModule.goalCtaClick(p1, p2, p6, p5, UseContextResult)
	end, { p1, p2, UseContextResult })
end