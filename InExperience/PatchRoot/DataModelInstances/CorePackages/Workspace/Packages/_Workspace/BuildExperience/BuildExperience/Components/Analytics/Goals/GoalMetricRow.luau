local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local goalMetricRowViewModule = require(script.Parent.GoalMetricRowView)
local useGoalMetricRowViewModelModule = require(script.Parent.useGoalMetricRowViewModel)

return function(p1)
	-- upvalues: useGoalMetricRowViewModelModule (ref), reactModule (ref), goalMetricRowViewModule (ref)
	return reactModule.createElement(goalMetricRowViewModule, useGoalMetricRowViewModelModule(p1))
end