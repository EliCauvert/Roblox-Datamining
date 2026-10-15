local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local responsiveModule = require(parent.Responsive)
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagBuildAnalyticsCreatorHubWindowFixModule = require(buildExperience.Flags.FFlagBuildAnalyticsCreatorHubWindowFix)
local fFlagBuildAnalyticsGoalsModule = require(buildExperience.Flags.FFlagBuildAnalyticsGoals)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local analyticsKeysModule = require(buildExperience.Analytics.AnalyticsKeys)
local analyticsMetricModule = require(buildExperience.Analytics.AnalyticsMetric)
local _ = require(buildExperience.Analytics.AnalyticsWindow)
local _ = require(parent.DataHydration.ExperienceAnalytics)
local gameConfigurationActionsModule = require(buildExperience.utils.GameConfigurationActions)
local _ = require(script.Parent.MetricDetailSheetView)
local useClosableFocusRootModule = require(buildExperience.utils.useClosableFocusRoot)

return function(p1)
	-- upvalues: fFlagBuildAnalyticsGoalsModule (ref), useClosableFocusRootModule (ref), focusNavigationUtilsModule (ref), responsiveModule (ref), analyticsMetricModule (ref), reactModule (ref), useOpenWebView (ref), analyticsKeysModule (ref), useLocalization (ref), localizationStringsModule (ref), fFlagBuildAnalyticsCreatorHubWindowFixModule (ref), gameConfigurationActionsModule (ref)
	local var1 = nil
	local var2 = true
	
	if fFlagBuildAnalyticsGoalsModule then
		var1 = useClosableFocusRootModule({
			isOpen = true,
			surfaceIdentifier = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.PopUp,
			onClose = p1.onClose
		})
		var2 = responsiveModule.usePreferredInput() ~= responsiveModule.Input.Directional
	end
	local var3 = if p1.metricId == nil then analyticsMetricModule.DailyActiveUsers else analyticsMetricModule.MetricById[p1.metricId] or analyticsMetricModule.DailyActiveUsers
	local latestAvailableTime = p1.latestAvailableTime
	local t = nil
	
	if fFlagBuildAnalyticsGoalsModule then
		local var4, var5 = reactModule.useState(1)
		local metrics = p1.metrics
		local var6 = if metrics ~= nil then 0 else #metrics
		local clampedValue = math.clamp(var4, 1, math.max(1, var6))
		reactModule.useEffect(function()
			-- upvalues: var5 (ref)
			var5(1)
		end, { metrics })
		
		if metrics ~= nil and var6 > 0 then
			var3 = metrics[clampedValue]
			latestAvailableTime = if p1.latestByMetric ~= nil then nil else p1.latestByMetric[var3.id]
		end
		if var6 > 1 then
			t = {
				index = clampedValue,
				count = var6,
				onPrevious = function()
					-- upvalues: var5 (ref), clampedValue (ref)
					var5(math.max(1, clampedValue - 1))
				end,
				onNext = function()
					-- upvalues: var5 (ref), var6 (ref), clampedValue (ref)
					var5(math.min(var6, clampedValue + 1))
				end
			}
		end
	end
	local var7 = useOpenWebView()
	local t_1 = {
		analyze = if fFlagBuildAnalyticsGoalsModule then analyticsKeysModule.ANALYTICS_SHEET_ASK_ABOUT_THIS else analyticsKeysModule.ANALYTICS_SHEET_ANALYZE,
		viewInOverview = if fFlagBuildAnalyticsGoalsModule then analyticsKeysModule.ANALYTICS_SHEET_VIEW_MORE_STATS else analyticsKeysModule.ANALYTICS_SHEET_VIEW_IN_OVERVIEW,
		title = if fFlagBuildAnalyticsGoalsModule then p1.titleKey or var3.titleKey else var3.titleKey,
		summary = var3.summaryKey,
		description = var3.descriptionKey,
		analyzeName = var3.analyzeNameKey
	}
	local var8 = if fFlagBuildAnalyticsGoalsModule then var3.improvementKey else nil
	
	if var8 ~= nil then
		t_1.howToImprove = analyticsKeysModule.ANALYTICS_HOW_TO_IMPROVE
		t_1.improvement = var8
	end
	local var9 = useLocalization(t_1)
	
	local function _(p2)
		-- upvalues: t_1 (ref), var9 (ref)
		return if t_1[p2] == nil then "" else var9[p2]
	end
	
	local onClose = p1.onClose
	local var10 = if t_1.analyzeName == nil then "" else var9.analyzeName
	local analyzePrompt = useLocalization({
		analyzePrompt = {
			analyticsKeysModule.ANALYTICS_ANALYZE_CHAT_PROMPT,
			analyzeName = var10,
			days = tostring(p1.window.days)
		}
	}).analyzePrompt
	local onOpenChat = p1.onOpenChat
	local var11 = reactModule.useCallback(function()
		-- upvalues: onOpenChat (ref), var10 (ref), analyzePrompt (ref), onClose (ref)
		if onOpenChat ~= nil and var10 ~= "" then
			onOpenChat(analyzePrompt)
		end
		onClose()
	end, { onOpenChat, analyzePrompt, var10, onClose })
	local creatorHub = useLocalization({
		creatorHub = localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB
	}).creatorHub
	local overviewPath = var3.overviewPath
	local universeId = p1.universeId
	local var12 = if fFlagBuildAnalyticsCreatorHubWindowFixModule then p1.window.creatorHubRangeType else nil
	
	return {
		focusRootRef = var1,
		showCloseButton = var2,
		metric = var3,
		universeId = p1.universeId,
		window = p1.window,
		latestAvailableTime = latestAvailableTime,
		navigation = t,
		metadataStatus = p1.metadataStatus,
		titleText = if t_1.title == nil then "" else var9.title,
		summaryText = if t_1.summary == nil then "" else var9.summary,
		descriptionText = if t_1.description == nil then "" else var9.description,
		improvementTitleText = if t_1.howToImprove == nil then "" else var9.howToImprove,
		improvementText = if t_1.improvement == nil then "" else var9.improvement,
		analyzeText = if t_1.analyze == nil then "" else var9.analyze,
		viewInOverviewText = if t_1.viewInOverview == nil then "" else var9.viewInOverview,
		onAnalyze = var11,
		onViewInOverview = reactModule.useCallback(function()
			-- upvalues: overviewPath (ref), var7 (ref), gameConfigurationActionsModule (copy), universeId (ref), var12 (ref), creatorHub (ref), onClose (ref)
			if overviewPath ~= nil then
				var7(gameConfigurationActionsModule.getCreatorHubAnalyticsUrl(universeId, overviewPath, var12), creatorHub)
			end
			onClose()
		end, {
			var7, overviewPath, universeId, var12, creatorHub, onClose
		}),
		onClose = p1.onClose,
		testId = p1.testId
	}
end