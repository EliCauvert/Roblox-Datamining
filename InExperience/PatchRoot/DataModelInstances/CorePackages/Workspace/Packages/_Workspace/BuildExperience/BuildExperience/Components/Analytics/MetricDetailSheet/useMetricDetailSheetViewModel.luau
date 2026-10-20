local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local ResponsiveModule = require(Parent.Responsive)
local WebViewUtilsModule = require(Parent.WebViewUtils)
local UseOpenWebViewFunction = WebViewUtilsModule.useOpenWebView
local OpenWebViewSessionFunction = WebViewUtilsModule.openWebViewSession
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagBuildAnalyticsCreatorHubWindowFixModule = require(BuildExperience.Flags.FFlagBuildAnalyticsCreatorHubWindowFix)
local FFlagBuildAnalyticsGoalsModule = require(BuildExperience.Flags.FFlagBuildAnalyticsGoals)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local AnalyticsKeysModule = require(BuildExperience.Analytics.AnalyticsKeys)
local AnalyticsMetricModule = require(BuildExperience.Analytics.AnalyticsMetric)
local _ = require(BuildExperience.Analytics.AnalyticsWindow)
local _ = require(Parent.DataHydration.ExperienceAnalytics)
local GameConfigurationActionsModule = require(BuildExperience.utils.GameConfigurationActions)
local _ = require(script.Parent.MetricDetailSheetView)
local UseClosableFocusRootModule = require(BuildExperience.utils.useClosableFocusRoot)

return function(p1)
	-- upvalues: FFlagBuildAnalyticsGoalsModule (copy), UseClosableFocusRootModule (copy), FocusNavigationUtilsModule (copy), ResponsiveModule (copy), AnalyticsMetricModule (copy), ReactModule (copy), UseOpenWebViewFunction (copy), AnalyticsKeysModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), FFlagBuildAnalyticsCreatorHubWindowFixModule (copy), GameConfigurationActionsModule (copy), OpenWebViewSessionFunction (copy)
	local FocusRootRef = nil
	local IsNotUsePreferredInputResultMatch = true
	
	if FFlagBuildAnalyticsGoalsModule then
		FocusRootRef = UseClosableFocusRootModule({
			isOpen = true,
			surfaceIdentifier = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.PopUp,
			onClose = p1.onClose
		})
		IsNotUsePreferredInputResultMatch = ResponsiveModule.usePreferredInput() ~= ResponsiveModule.Input.Directional
	end
	local DailyActiveUsers = if p1.metricId == nil then AnalyticsMetricModule.DailyActiveUsers else AnalyticsMetricModule.MetricById[p1.metricId] or AnalyticsMetricModule.DailyActiveUsers
	local LatestAvailableTime = p1.latestAvailableTime
	local Navigation = nil
	
	if FFlagBuildAnalyticsGoalsModule then
		local UseStateResult, UseStateResult2 = ReactModule.useState(1)
		local Metrics = p1.metrics
		local CountMetrics: number = if Metrics == nil then 0 else #Metrics
		local ClampedValue = math.clamp(UseStateResult, 1, (math.max(1, CountMetrics)))
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(1)
		end, { Metrics })
		
		if Metrics ~= nil and CountMetrics > 0 then
			DailyActiveUsers = Metrics[ClampedValue]
			LatestAvailableTime = if p1.latestByMetric == nil then nil else p1.latestByMetric[DailyActiveUsers.id]
		end
		if CountMetrics > 1 then
			Navigation = {
				index = ClampedValue,
				count = CountMetrics,
				onPrevious = function()
					-- upvalues: UseStateResult2 (copy), ClampedValue (copy)
					UseStateResult2((math.max(1, ClampedValue - 1)))
				end,
				onNext = function()
					-- upvalues: UseStateResult2 (copy), CountMetrics (copy), ClampedValue (copy)
					UseStateResult2((math.min(CountMetrics, ClampedValue + 1)))
				end
			}
		end
	end
	local UseOpenWebViewResult = UseOpenWebViewFunction()
	local config = {
		analyze = if FFlagBuildAnalyticsGoalsModule then AnalyticsKeysModule.ANALYTICS_SHEET_ASK_ABOUT_THIS else AnalyticsKeysModule.ANALYTICS_SHEET_ANALYZE,
		viewInOverview = if FFlagBuildAnalyticsGoalsModule then AnalyticsKeysModule.ANALYTICS_SHEET_VIEW_MORE_STATS else AnalyticsKeysModule.ANALYTICS_SHEET_VIEW_IN_OVERVIEW,
		title = FFlagBuildAnalyticsGoalsModule and p1.titleKey or DailyActiveUsers.titleKey,
		summary = DailyActiveUsers.summaryKey,
		description = DailyActiveUsers.descriptionKey,
		analyzeName = DailyActiveUsers.analyzeNameKey
	}
	local ImprovementKey = if FFlagBuildAnalyticsGoalsModule then DailyActiveUsers.improvementKey else nil
	
	if ImprovementKey ~= nil then
		config.howToImprove = AnalyticsKeysModule.ANALYTICS_HOW_TO_IMPROVE
		config.improvement = ImprovementKey
	end
	local UseLocalizationResult = UseLocalizationFunction(config)
	
	local function _(p2)
		-- upvalues: config (copy), UseLocalizationResult (copy)
		return if config[p2] == nil then "" else UseLocalizationResult[p2]
	end
	
	local OnCloseFunction = p1.onClose
	local AnalyzeName = if config.analyzeName == nil then "" else UseLocalizationResult.analyzeName
	local AnalyzePrompt = UseLocalizationFunction({
		analyzePrompt = {
			AnalyticsKeysModule.ANALYTICS_ANALYZE_CHAT_PROMPT,
			analyzeName = AnalyzeName,
			days = tostring(p1.window.days)
		}
	}).analyzePrompt
	local OnOpenChatFunction = p1.onOpenChat
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: OnOpenChatFunction (copy), AnalyzeName (copy), AnalyzePrompt (copy), OnCloseFunction (copy)
		if OnOpenChatFunction ~= nil and AnalyzeName ~= "" then
			OnOpenChatFunction(AnalyzePrompt)
		end
		OnCloseFunction()
	end, {
		OnOpenChatFunction,
		AnalyzePrompt,
		AnalyzeName,
		OnCloseFunction
	})
	local CreatorHub = UseLocalizationFunction({
		creatorHub = LocalizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB
	}).creatorHub
	local OverviewPath = DailyActiveUsers.overviewPath
	local UniverseId = p1.universeId
	local CreatorHubRangeType = if FFlagBuildAnalyticsCreatorHubWindowFixModule then p1.window.creatorHubRangeType else nil
	
	return {
		focusRootRef = FocusRootRef,
		showCloseButton = IsNotUsePreferredInputResultMatch,
		metric = DailyActiveUsers,
		universeId = p1.universeId,
		window = p1.window,
		latestAvailableTime = LatestAvailableTime,
		navigation = Navigation,
		metadataStatus = p1.metadataStatus,
		titleText = if config.title == nil then "" else UseLocalizationResult.title,
		summaryText = if config.summary == nil then "" else UseLocalizationResult.summary,
		descriptionText = if config.description == nil then "" else UseLocalizationResult.description,
		improvementTitleText = if config.howToImprove == nil then "" else UseLocalizationResult.howToImprove,
		improvementText = if config.improvement == nil then "" else UseLocalizationResult.improvement,
		analyzeText = if config.analyze == nil then "" else UseLocalizationResult.analyze,
		viewInOverviewText = if config.viewInOverview == nil then "" else UseLocalizationResult.viewInOverview,
		onAnalyze = UseResult,
		onViewInOverview = ReactModule.useCallback(function()
			-- upvalues: OverviewPath (copy), GameConfigurationActionsModule (upval), UniverseId (copy), CreatorHubRangeType (copy), FFlagBuildAnalyticsGoalsModule (upval), OpenWebViewSessionFunction (upval), CreatorHub (copy), UseOpenWebViewResult (copy), OnCloseFunction (copy)
			if OverviewPath ~= nil then
				local CreatorHubAnalyticsUrl = GameConfigurationActionsModule.getCreatorHubAnalyticsUrl(UniverseId, OverviewPath, CreatorHubRangeType)
				
				if FFlagBuildAnalyticsGoalsModule then
					OpenWebViewSessionFunction(CreatorHubAnalyticsUrl, CreatorHub)
				else
					UseOpenWebViewResult(CreatorHubAnalyticsUrl, CreatorHub)
				end
			end
			OnCloseFunction()
		end, {
			UseOpenWebViewResult, OverviewPath, UniverseId, CreatorHubRangeType,
			CreatorHub, OnCloseFunction
		}),
		onClose = p1.onClose,
		testId = p1.testId
	}
end