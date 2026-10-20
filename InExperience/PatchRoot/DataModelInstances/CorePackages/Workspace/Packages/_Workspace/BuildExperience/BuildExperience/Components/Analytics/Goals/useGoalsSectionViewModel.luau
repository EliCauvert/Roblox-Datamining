local BuildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(BuildExperience.Parent.DataHydration.ExperienceAnalytics)
local _ = require(BuildExperience.Analytics.Goals.GoalTypes)

return function(p1)
	local List = {}
	local v1 = false
	
	for LayoutOrder, goal in p1.goals do
		local V4: boolean = v1 or not p1.milestones[goal.unlockMilestone]
		local OnActivated: (() -> ())? = nil
		local OnGoalSelectedFunction = p1.onGoalSelected
		
		if OnGoalSelectedFunction ~= nil and goal.charts ~= nil and #goal.charts > 0 then
			OnActivated = function()
				-- upvalues: OnGoalSelectedFunction (copy), goal (copy)
				OnGoalSelectedFunction(goal)
			end
		end
		table.insert(List, {
			goal = goal,
			isLocked = V4,
			layoutOrder = LayoutOrder,
			onActivated = OnActivated
		})
		v1 = V4
	end
	return List
end