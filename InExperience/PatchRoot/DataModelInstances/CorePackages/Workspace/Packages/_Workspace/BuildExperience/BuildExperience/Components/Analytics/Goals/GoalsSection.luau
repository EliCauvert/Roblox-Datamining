local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local _ = require(parent.DataHydration.ExperienceAnalytics)
local _ = require(buildExperience.Analytics.AnalyticsWindow)
local useMetricMetadataModule = require(buildExperience.Analytics.useMetricMetadata)
local goalsModule = require(buildExperience.Analytics.Goals.Goals)
local goalsSectionViewModule = require(script.Parent.GoalsSectionView)
local useGoalsSectionViewModelModule = require(script.Parent.useGoalsSectionViewModel)
local t = {}
local t_1 = {}

for i, v in goalsModule.Goals do
	for i_1, v_1 in v.metricSummaries do
		if not t[v_1.source.query.metric] then
			t[v_1.source.query.metric] = true
			table.insert(t_1, v_1.source.query.metric)
		end
	end
end
return function(p1)
	-- upvalues: useMetricMetadataModule (ref), t_1 (ref), useGoalsSectionViewModelModule (ref), goalsModule (ref), reactModule (ref), goalsSectionViewModule (ref)
	local var1 = useMetricMetadataModule(t_1)
	
	return reactModule.createElement(goalsSectionViewModule, {
		entries = useGoalsSectionViewModelModule({ goals = goalsModule.Goals }),
		universeId = p1.universeId,
		window = p1.window,
		latestByMetric = var1.latestByMetric,
		metadataStatus = var1.status,
		layoutOrder = p1.layoutOrder,
		testId = p1.testId or "GoalsSection"
	})
end