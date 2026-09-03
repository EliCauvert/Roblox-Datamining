local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local analyticsKeysModule = require(buildExperience.Analytics.AnalyticsKeys)
local analyticsMetricModule = require(buildExperience.Analytics.AnalyticsMetric)
local _ = require(buildExperience.Analytics.AnalyticsWindow)
local _ = require(parent.DataHydration.ExperienceAnalytics)
local gameConfigurationActionsModule = require(buildExperience.utils.GameConfigurationActions)
local _ = require(script.Parent.MetricDetailSheetView)

return function(p1)
	-- upvalues: analyticsMetricModule (ref), useOpenWebView (ref), analyticsKeysModule (ref), useLocalization (ref), reactModule (ref), localizationStringsModule (ref), gameConfigurationActionsModule (ref)
	local metricId = analyticsMetricModule.MetricById[p1.metricId] or analyticsMetricModule.DailyActiveUsers
	local var1 = useOpenWebView()
	local t = {
		analyze = analyticsKeysModule.ANALYTICS_SHEET_ANALYZE,
		viewInOverview = analyticsKeysModule.ANALYTICS_SHEET_VIEW_IN_OVERVIEW,
		title = metricId.titleKey,
		summary = metricId.summaryKey,
		description = metricId.descriptionKey,
		analyzeName = metricId.analyzeNameKey
	}
	local var2 = useLocalization(t)
	
	local function _(p2)
		-- upvalues: t (ref), var2 (ref)
		return if t[p2] == nil then "" else var2[p2]
	end
	
	local onClose = p1.onClose
	local var3 = if t.analyzeName == nil then "" else var2.analyzeName
	local analyzePrompt = useLocalization({
		analyzePrompt = {
			analyticsKeysModule.ANALYTICS_ANALYZE_CHAT_PROMPT,
			analyzeName = var3,
			days = tostring(p1.window.days)
		}
	}).analyzePrompt
	local onOpenChat = p1.onOpenChat
	local var4 = reactModule.useCallback(function()
		-- upvalues: onOpenChat (ref), var3 (ref), analyzePrompt (ref), onClose (ref)
		if onOpenChat ~= nil and var3 ~= "" then
			onOpenChat(analyzePrompt)
		end
		onClose()
	end, { onOpenChat, analyzePrompt, var3, onClose })
	local creatorHub = useLocalization({
		creatorHub = localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB
	}).creatorHub
	local overviewPath = metricId.overviewPath
	local universeId = p1.universeId
	
	return {
		metric = metricId,
		universeId = p1.universeId,
		window = p1.window,
		latestAvailableTime = p1.latestAvailableTime,
		metadataStatus = p1.metadataStatus,
		titleText = if t.title == nil then "" else var2.title,
		summaryText = if t.summary == nil then "" else var2.summary,
		descriptionText = if t.description == nil then "" else var2.description,
		analyzeText = if t.analyze == nil then "" else var2.analyze,
		viewInOverviewText = if t.viewInOverview == nil then "" else var2.viewInOverview,
		onAnalyze = var4,
		onViewInOverview = reactModule.useCallback(function()
			-- upvalues: overviewPath (ref), var1 (ref), gameConfigurationActionsModule (copy), universeId (ref), creatorHub (ref), onClose (ref)
			if overviewPath ~= nil then
				var1(gameConfigurationActionsModule.getCreatorHubAnalyticsUrl(universeId, overviewPath), creatorHub)
			end
			onClose()
		end, {
			var1,
			overviewPath,
			universeId,
			creatorHub,
			onClose
		}),
		onClose = p1.onClose,
		testId = p1.testId
	}
end