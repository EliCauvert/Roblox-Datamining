local _ = require(script:FindFirstAncestor("BuildExperience").Analytics.Goals.GoalTypes)

return function(p1)
	local t = {}
	
	for i, v in p1.goals do
		table.insert(t, { goal = v, layoutOrder = i })
	end
	return t
end