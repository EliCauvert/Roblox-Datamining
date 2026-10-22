local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local AnalyticsPageEventsModule = require(BuildExperience.Analytics.AnalyticsPageEvents)
local _ = require(BuildExperience.Analytics.Goals.GoalLockedActionId)

return function(p1, p2, p3, p4)
	-- upvalues: ReactModule (copy), AnalyticsPageEventsModule (copy)
	local UseRefResult = ReactModule.useRef({})
	ReactModule.useEffect(function()
		-- upvalues: p3 (copy), p1 (copy), p2 (copy), UseRefResult (copy), AnalyticsPageEventsModule (upval), p4 (copy)
		if p3 ~= nil then
			local PrimaryName: string = `{p1}.{p2}.{p3}.primary`
			
			if not UseRefResult.current[PrimaryName] then
				UseRefResult.current[PrimaryName] = true
				AnalyticsPageEventsModule.goalCtaImpression(p1, p2, p3, "primary")
			end
		end
		if p4 ~= nil then
			local SecondaryName: string = `{p1}.{p2}.{p4}.secondary`
			
			if not UseRefResult.current[SecondaryName] then
				UseRefResult.current[SecondaryName] = true
				AnalyticsPageEventsModule.goalCtaImpression(p1, p2, p4, "secondary")
			end
		end
	end, { p1, p2, p3, p4 })
	
	return ReactModule.useCallback(function(p5, p6)
		-- upvalues: AnalyticsPageEventsModule (upval), p1 (copy), p2 (copy)
		AnalyticsPageEventsModule.goalCtaClick(p1, p2, p6, p5)
	end, { p1, p2 })
end