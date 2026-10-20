local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local GoalMetricRowViewModule = require(script.Parent.GoalMetricRowView)
local UseGoalMetricRowViewModelModule = require(script.Parent.useGoalMetricRowViewModel)

return function(p1)
	-- upvalues: UseGoalMetricRowViewModelModule (copy), ReactModule (copy), GoalMetricRowViewModule (copy)
	return ReactModule.createElement(GoalMetricRowViewModule, (UseGoalMetricRowViewModelModule(p1)))
end