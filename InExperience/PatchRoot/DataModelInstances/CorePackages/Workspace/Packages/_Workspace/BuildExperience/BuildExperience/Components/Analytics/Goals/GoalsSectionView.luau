local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local _ = require(parent.DataHydration.ExperienceAnalytics)
local _ = require(buildExperience.Analytics.AnalyticsWindow)
local goalCardModule = require(script.Parent.GoalCard)
local _ = require(script.Parent.useGoalsSectionViewModel)

return function(p1)
	-- upvalues: reactModule (ref), goalCardModule (ref), view (ref)
	local testId = p1.testId or "GoalsSection"
	local t = {}
	
	for i, v in p1.entries do
		local goal = v.goal
		t[goal.id] = reactModule.createElement(goalCardModule, {
			goal = goal,
			universeId = p1.universeId,
			window = p1.window,
			latestByMetric = p1.latestByMetric,
			metadataStatus = p1.metadataStatus,
			layoutOrder = v.layoutOrder,
			testId = `{testId}.{goal.id}`
		})
	end
	return reactModule.createElement(view, {
		tag = "col gap-xxlarge size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = testId
	}, t)
end