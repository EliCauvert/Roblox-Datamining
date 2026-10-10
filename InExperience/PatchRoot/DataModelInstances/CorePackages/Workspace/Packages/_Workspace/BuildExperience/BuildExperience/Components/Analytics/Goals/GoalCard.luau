local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local view = foundationModule.View
local text = foundationModule.Text
local _ = require(parent.DataHydration.ExperienceAnalytics)
local _ = require(buildExperience.Analytics.AnalyticsWindow)
local _ = require(buildExperience.Analytics.Goals.GoalTypes)
local goalMetricRowModule = require(script.Parent.GoalMetricRow)

return function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), goalMetricRowModule (ref), view (ref), text (ref)
	local testId = p1.testId or "GoalCard"
	local goal = p1.goal
	local t = { title = goal.titleKey }
	
	for i, v in goal.metricSummaries do
		t[v.id] = v.titleKey
	end
	local var1 = useLocalization(t)
	local t_1 = {}
	
	for i_1, v_1 in goal.metricSummaries do
		t_1[v_1.id] = reactModule.createElement(goalMetricRowModule, {
			title = var1[v_1.id],
			universeId = p1.universeId,
			summary = v_1,
			window = p1.window,
			latestAvailableTime = if p1.latestByMetric ~= nil then nil else p1.latestByMetric[v_1.source.query.metric],
			metadataStatus = p1.metadataStatus,
			layoutOrder = i_1,
			testId = `{testId}.{v_1.id}`
		})
	end
	return reactModule.createElement(view, {
		tag = "col gap-large size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = testId
	}, {
		Heading = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-heading-small text-align-x-left content-emphasis",
			Text = var1.title,
			testId = `{testId}.Heading`
		}),
		Card = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col gap-large size-full-0 auto-y padding-large stroke-standard stroke-default radius-large",
			testId = `{testId}.Card`
		}, t_1)
	})
end