local buildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(buildExperience.Parent.DataHydration.ExperienceAnalytics)
local _ = require(buildExperience.Analytics.Goals.GoalTypes)

return function(p1)
	local t = {}
	local var1 = false
	
	for i, v in p1.goals do
		local var2 = var1 or not p1.milestones[v.unlockMilestone]
		table.insert(t, { goal = v, isLocked = var2, layoutOrder = i })
		var1 = var2
	end
	return t
end