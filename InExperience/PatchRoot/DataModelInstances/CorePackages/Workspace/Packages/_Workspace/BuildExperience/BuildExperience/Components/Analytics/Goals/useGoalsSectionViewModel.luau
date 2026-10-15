local buildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(buildExperience.Parent.DataHydration.ExperienceAnalytics)
local _ = require(buildExperience.Analytics.Goals.GoalTypes)

return function(p1)
	local t = {}
	local var1 = false
	
	for i, v in p1.goals do
		local var2 = var1 or not p1.milestones[v.unlockMilestone]
		local var3 = nil
		local onGoalSelected = p1.onGoalSelected
		
		if onGoalSelected ~= nil and v.charts ~= nil and #v.charts > 0 then
			var3 = function()
				-- upvalues: onGoalSelected (ref), v (ref)
				onGoalSelected(v)
			end
		end
		table.insert(t, {
			goal = v,
			isLocked = var2,
			layoutOrder = i,
			onActivated = var3
		})
		var1 = var2
	end
	return t
end