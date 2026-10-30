local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local _ = require(Parent.DataHydration.CreatorAnalytics)
local _ = require(BuildExperience.Analytics.AnalyticsWindow)
local GoalCardModule = require(script.Parent.GoalCard)
local _ = require(BuildExperience.Analytics.Goals.GoalTypes)
local _ = require(script.Parent.useGoalsSectionViewModel)

return function(p1)
	-- upvalues: ReactModule (copy), GoalCardModule (copy), View (copy)
	local TestId = p1.testId or "GoalsSection"
	local Elements = {}
	
	for _, entry in p1.entries do
		local Goal = entry.goal
		Elements[Goal.id] = ReactModule.createElement(GoalCardModule, {
			onActivated = entry.onActivated,
			goal = Goal,
			universeId = p1.universeId,
			window = p1.window,
			latestByMetric = p1.latestByMetric,
			metadataStatus = p1.metadataStatus,
			isLocked = entry.isLocked,
			lockedActions = p1.lockedActions,
			layoutOrder = entry.layoutOrder,
			testId = `{TestId}.{Goal.id}`
		})
	end
	return ReactModule.createElement(View, {
		tag = "col gap-xxlarge size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = TestId
	}, Elements)
end