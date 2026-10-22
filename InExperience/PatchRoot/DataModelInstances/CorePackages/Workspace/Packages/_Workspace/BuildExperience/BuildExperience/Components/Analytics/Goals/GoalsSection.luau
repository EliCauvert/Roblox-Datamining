local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.DataHydration.ExperienceAnalytics)
local _ = require(BuildExperience.Analytics.AnalyticsWindow)
local UseMetricMetadataModule = require(BuildExperience.Analytics.useMetricMetadata)
local GoalsModule = require(BuildExperience.Analytics.Goals.Goals)
local UseGoalMilestonesModule = require(BuildExperience.Analytics.Goals.useGoalMilestones)
local GoalsSectionViewModule = require(script.Parent.GoalsSectionView)
local UseGoalLockedActionsModule = require(script.Parent.useGoalLockedActions)
local UseGoalClickTelemetryModule = require(script.Parent.useGoalClickTelemetry)
local UseGoalsSectionTelemetryModule = require(script.Parent.useGoalsSectionTelemetry)
local UseGoalsSectionViewModelModule = require(script.Parent.useGoalsSectionViewModel)
local _ = require(BuildExperience.Analytics.Goals.GoalTypes)
local MetricDetailSheetModule = require(BuildExperience.Components.Analytics.MetricDetailSheet.MetricDetailSheet)
local t = {}
local List = {}

for _, goal in GoalsModule.Goals do
	for _, metricSummary in goal.metricSummaries do
		if not t[metricSummary.source.query.metric] then
			t[metricSummary.source.query.metric] = true
			table.insert(List, metricSummary.source.query.metric)
		end
	end
	if goal.charts ~= nil then
		for _, chart in goal.charts do
			if not t[chart.id] then
				t[chart.id] = true
				table.insert(List, chart.id)
			end
		end
	end
end
return function(p1)
	-- upvalues: UseMetricMetadataModule (copy), List (copy), UseGoalMilestonesModule (copy), ReactModule (copy), UseGoalClickTelemetryModule (copy), UseGoalsSectionViewModelModule (copy), GoalsModule (copy), UseGoalLockedActionsModule (copy), UseGoalsSectionTelemetryModule (copy), GoalsSectionViewModule (copy), MetricDetailSheetModule (copy)
	local TestId = p1.testId or "GoalsSection"
	local UseMetricMetadataModuleResult = UseMetricMetadataModule(List)
	local UseGoalMilestonesModuleResult, UseGoalMilestonesModuleResult2 = UseGoalMilestonesModule(p1.universeId)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(nil)
	end, {})
	local UniverseId = p1.universeId
	local Id = p1.window.id
	local UseGoalClickTelemetryModuleResult = UseGoalClickTelemetryModule(UniverseId)
	local UseGoalsSectionViewModelModuleResult = UseGoalsSectionViewModelModule({
		goals = GoalsModule.Goals,
		milestones = UseGoalMilestonesModuleResult,
		onGoalSelected = ReactModule.useCallback(function(p2)
			-- upvalues: UseGoalClickTelemetryModuleResult (copy), UseStateResult2 (copy)
			UseGoalClickTelemetryModuleResult(p2.id)
			UseStateResult2(p2)
		end, { UseGoalClickTelemetryModuleResult })
	})
	local UseGoalLockedActionsModuleResult = UseGoalLockedActionsModule(p1.universeId)
	local Overlays = {}
	local v1 = false
	
	for i, action in UseGoalLockedActionsModuleResult.actions do
		Overlays[i] = action.overlay
		v1 = v1 or action.isLoading == true
	end
	local NoV30: boolean = UseGoalMilestonesModuleResult2 and not v1
	UseGoalsSectionTelemetryModule(UniverseId, Id, NoV30, UseGoalsSectionViewModelModuleResult)
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Goals = ReactModule.createElement(GoalsSectionViewModule, {
			entries = if NoV30 then UseGoalsSectionViewModelModuleResult else {},
			universeId = p1.universeId,
			window = p1.window,
			latestByMetric = UseMetricMetadataModuleResult.latestByMetric,
			metadataStatus = UseMetricMetadataModuleResult.status,
			lockedActions = UseGoalLockedActionsModuleResult.actions,
			layoutOrder = p1.layoutOrder,
			testId = TestId
		}),
		ActionOverlays = ReactModule.createElement(ReactModule.Fragment, nil, Overlays),
		Sheet = if UseStateResult == nil then nil else ReactModule.createElement(MetricDetailSheetModule, {
			metrics = UseStateResult.charts,
			titleKey = UseStateResult.titleKey,
			universeId = p1.universeId,
			window = p1.window,
			latestByMetric = UseMetricMetadataModuleResult.latestByMetric,
			metadataStatus = UseMetricMetadataModuleResult.status,
			onClose = UseResult,
			onOpenChat = p1.onOpenChat,
			testId = `{TestId}.Sheet`
		})
	})
end