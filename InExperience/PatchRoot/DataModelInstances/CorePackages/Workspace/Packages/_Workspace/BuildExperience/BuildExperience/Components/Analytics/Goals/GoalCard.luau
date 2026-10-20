local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local View = FoundationModule.View
local Text = FoundationModule.Text
local _ = require(Parent.DataHydration.ExperienceAnalytics)
local _ = require(BuildExperience.Analytics.AnalyticsWindow)
local _ = require(BuildExperience.Analytics.Goals.GoalTypes)
local GoalLockedContentModule = require(script.Parent.GoalLockedContent)
local GoalMetricRowModule = require(script.Parent.GoalMetricRow)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), GoalMetricRowModule (copy), View (copy), Text (copy), GoalLockedContentModule (copy)
	local TestId = p1.testId or "GoalCard"
	local Goal = p1.goal
	local config = { title = Goal.titleKey }
	
	for _, metricSummary in Goal.metricSummaries do
		config[metricSummary.id] = metricSummary.titleKey
	end
	local UseLocalizationResult = UseLocalizationFunction(config)
	local Elements = {}
	
	for LayoutOrder, metricSummary1 in Goal.metricSummaries do
		Elements[metricSummary1.id] = ReactModule.createElement(GoalMetricRowModule, {
			title = UseLocalizationResult[metricSummary1.id],
			universeId = p1.universeId,
			summary = metricSummary1,
			window = p1.window,
			latestAvailableTime = if p1.latestByMetric == nil then nil else p1.latestByMetric[metricSummary1.source.query.metric],
			metadataStatus = p1.metadataStatus,
			layoutOrder = LayoutOrder,
			testId = `{TestId}.{metricSummary1.id}`
		})
	end
	return ReactModule.createElement(View, {
		tag = "col gap-large size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = TestId
	}, {
		Heading = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-heading-small text-align-x-left content-emphasis",
			Text = UseLocalizationResult.title,
			testId = `{TestId}.Heading`
		}),
		Card = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col gap-large size-full-0 auto-y padding-large stroke-standard stroke-default radius-large",
			onActivated = if p1.isLocked then nil else p1.onActivated,
			testId = `{TestId}.Card`
		}, if p1.isLocked then {
			Locked = ReactModule.createElement(GoalLockedContentModule, {
				locked = Goal.locked,
				actionHandlers = p1.lockedActions,
				testId = `{TestId}.Locked`
			})
		} else Elements)
	})
end