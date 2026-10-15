local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local _ = require(parent.DataHydration.ExperienceAnalytics)
local _ = require(buildExperience.Analytics.AnalyticsWindow)
local useMetricMetadataModule = require(buildExperience.Analytics.useMetricMetadata)
local goalsModule = require(buildExperience.Analytics.Goals.Goals)
local useGoalMilestonesModule = require(buildExperience.Analytics.Goals.useGoalMilestones)
local experienceShareOverlaysModule = require(buildExperience.Components.ShareAudience.ExperienceShareOverlays)
local goalsSectionViewModule = require(script.Parent.GoalsSectionView)
local useGoalLockedActionsModule = require(script.Parent.useGoalLockedActions)
local useGoalsSectionViewModelModule = require(script.Parent.useGoalsSectionViewModel)
local _ = require(buildExperience.Analytics.Goals.GoalTypes)
local metricDetailSheetModule = require(buildExperience.Components.Analytics.MetricDetailSheet.MetricDetailSheet)
local t = {}
local t_1 = {}

for i, v in goalsModule.Goals do
	for i_1, v_1 in v.metricSummaries do
		if not t[v_1.source.query.metric] then
			t[v_1.source.query.metric] = true
			table.insert(t_1, v_1.source.query.metric)
		end
	end
	if v.charts ~= nil then
		for i_1, v_1 in v.charts do
			if not t[v_1.id] then
				t[v_1.id] = true
				table.insert(t_1, v_1.id)
			end
		end
	end
end
return function(p1)
	-- upvalues: useMetricMetadataModule (ref), t_1 (ref), useGoalMilestonesModule (ref), reactModule (ref), useGoalsSectionViewModelModule (ref), goalsModule (ref), useGoalLockedActionsModule (ref), goalsSectionViewModule (ref), experienceShareOverlaysModule (ref), metricDetailSheetModule (ref)
	local testId = p1.testId or "GoalsSection"
	local var1 = useMetricMetadataModule(t_1)
	local var2 = useGoalMilestonesModule(p1.universeId)
	local var3, var4 = reactModule.useState(nil)
	local var5 = reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		var4(nil)
	end, {})
	local var6 = useGoalsSectionViewModelModule({
		goals = goalsModule.Goals,
		milestones = var2,
		onGoalSelected = var4
	})
	local var7 = useGoalLockedActionsModule(p1.universeId)
	local shareFlow = var7.shareFlow
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Goals = reactModule.createElement(goalsSectionViewModule, {
			entries = var6,
			universeId = p1.universeId,
			window = p1.window,
			latestByMetric = var1.latestByMetric,
			metadataStatus = var1.status,
			onLockedAction = var7.onLockedAction,
			layoutOrder = p1.layoutOrder,
			testId = testId
		}),
		ShareOverlays = reactModule.createElement(experienceShareOverlaysModule, {
			activeDialog = shareFlow.activeDialog,
			hasShareError = shareFlow.hasShareError,
			onCancel = shareFlow.onCancelDialog,
			onConfirmFriends = shareFlow.onConfirmFriends,
			onConfirmPlaytesters = shareFlow.onConfirmPlaytesters
		}),
		Sheet = if var3 ~= nil then nil else reactModule.createElement(metricDetailSheetModule, {
			metrics = var3.charts,
			titleKey = var3.titleKey,
			universeId = p1.universeId,
			window = p1.window,
			latestByMetric = var1.latestByMetric,
			metadataStatus = var1.status,
			onClose = var5,
			onOpenChat = p1.onOpenChat,
			testId = `{testId}.Sheet`
		})
	})
end