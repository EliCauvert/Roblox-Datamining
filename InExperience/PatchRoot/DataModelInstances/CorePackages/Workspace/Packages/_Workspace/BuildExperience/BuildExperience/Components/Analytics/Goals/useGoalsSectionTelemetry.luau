local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local _ = require(BuildExperience.Analytics.AnalyticsWindow)
local AnalyticsPageEventsModule = require(BuildExperience.Analytics.AnalyticsPageEvents)
local _ = require(script.Parent.useGoalsSectionViewModel)

return function(p1, p2, p3, p4)
	-- upvalues: ReactModule (copy), AnalyticsPageEventsModule (copy)
	local UseRefResult = ReactModule.useRef({})
	ReactModule.useEffect(function()
		-- upvalues: p3 (copy), p4 (copy), p1 (copy), p2 (copy), UseRefResult (copy), AnalyticsPageEventsModule (upval)
		if not p3 then return end
		for _, value in p4 do
			local Locked: string = if value.isLocked then "locked" else "unlocked"
			local Text: string = `{p1}.{p2}.{value.goal.id}.{Locked}`
			
			if not UseRefResult.current[Text] then
				UseRefResult.current[Text] = true
				AnalyticsPageEventsModule.goalImpression(p1, value.goal.id, Locked, p2)
			end
		end
	end, { p3, p4, p1, p2 })
end