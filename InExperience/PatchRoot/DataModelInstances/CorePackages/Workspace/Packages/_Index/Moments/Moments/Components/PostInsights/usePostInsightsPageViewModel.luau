local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local LocalizationService = game:GetService("LocalizationService")
local _ = require(Parent.AnalyticsMetricChart)
local BuilderIconsModule = require(Parent.BuilderIcons)
local LocalizationModule = require(Parent.Localization)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local AbbreviateCountFunction = LocalizationModule.abbreviateCount
local NumberLocalization = LocalizationModule.NumberLocalization
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local ReactionType = require(Parent.MomentsTypes).Enums.ReactionType
local CreatorAnalyticsModule = require(Parent.DataHydration.CreatorAnalytics)
local _ = require(script.Parent.createPostInsightsPageStore)
local MakeFeedActionFieldsModule = require(Moments.Analytics.makeFeedActionFields)
local PostInsightsStringsModule = require(script.Parent.postInsightsStrings)
local UsePostInsightsAnalyticsModule = require(script.Parent.usePostInsightsAnalytics)
local ToMediaItemModule = require(Moments.Components.Feed.Media.toMediaItem)
local DataStatus = CreatorAnalyticsModule.DataStatus
local EventNames = MomentsCommonModule.Analytics.EventNames

local function _(p1)
	local Trim = if p1.edits == nil then nil else p1.edits.trim
	
	if Trim == nil or Trim.startTime >= Trim.endTime then
		local AssetTotalDuration: number = p1.assetTotalDuration
		
		return if AssetTotalDuration == nil or AssetTotalDuration <= 0 then nil else AssetTotalDuration
	else
		return Trim.endTime - Trim.startTime
	end
end

local _ = function(p1: number, p2)
	-- upvalues: PostInsightsStringsModule (copy), NumberLocalization (copy)
	return {
		PostInsightsStringsModule.PERCENT_KEY,
		number = NumberLocalization.localize(math.round(p1 * 1000) / 10, p2)
	}
end

local ReactionTypes = {
	ReactionType.ThumbsUp, ReactionType.Heart, ReactionType.LaughJoy,
	ReactionType.Wow, ReactionType.Cry, ReactionType.Fire, ReactionType.Skull
}

return function(p1, Callback)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), PostInsightsStringsModule (copy), UseSignalStateFunction (copy), ReactModule (copy), ToMediaItemModule (copy), ReactionTypes (copy), AbbreviateCountFunction (copy), LocalizationService (copy), UsePostInsightsAnalyticsModule (copy), MakeFeedActionFieldsModule (copy), MomentsCommonModule (copy), DataStatus (copy), EventNames (copy), NumberLocalization (copy), CreatorAnalyticsModule (copy), BuilderIconsModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction(PostInsightsStringsModule.PAGE_KEYS)
	local Moment = p1.moment
	local MomentStore = p1.momentStore
	local UseSignalStateResult = UseSignalStateFunction(MomentStore.getReactionCount)
	local UseSignalStateResult1 = UseSignalStateFunction(MomentStore.getIndividualReactionCounts)
	local UseSignalStateResult2 = UseSignalStateFunction(MomentStore.getCommentCount)
	local UseSignalStateResult3 = UseSignalStateFunction(MomentStore.getShareCount)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ToMediaItemModule (upval), Moment (copy), UseTokensResult (copy)
		local MediaItemModule = ToMediaItemModule({ kind = "moment", moment = Moment })
		
		if MediaItemModule ~= nil then
			MediaItemModule.cornerRadius = UseTokensResult.Radius.Small
		end
		return MediaItemModule
	end, { Moment.momentId })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult1 (copy), ReactionTypes (upval), AbbreviateCountFunction (upval), LocalizationService (upval)
		local t = {}
		
		for _, value in UseSignalStateResult1 do
			t[value.reaction] = value.count
		end
		local List = {}
		
		for _, reactionType in ReactionTypes do
			table.insert(List, {
				reactionType = reactionType,
				countText = AbbreviateCountFunction(t[reactionType] or 0, LocalizationService.RobloxLocaleId)
			})
		end
		return List
	end, { UseSignalStateResult1 })
	local UsePostInsightsAnalyticsModuleResult = UsePostInsightsAnalyticsModule(Moment)
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	
	local function _(p2, p3, p4)
		-- upvalues: Moment (copy), MakeFeedActionFieldsModule (upval), MomentsCommonModule (upval)
		local RecommendationMetadata = Moment.recommendationMetadata
		local FeedActionFieldsModule = MakeFeedActionFieldsModule(Moment.momentId, if RecommendationMetadata == nil then nil else RecommendationMetadata.feedItemId, if RecommendationMetadata == nil then nil else RecommendationMetadata.tracingId, p3)
		
		if FeedActionFieldsModule ~= nil then
			if p4 ~= nil then
				FeedActionFieldsModule.durationMs = tostring(p4)
			end
			MomentsCommonModule.Analytics.fireAnalyticsEvent(p2, FeedActionFieldsModule)
		end
	end
	
	local IsNotLifetimeStatusMatch: boolean = UsePostInsightsAnalyticsModuleResult.viewsStatus ~= DataStatus.NotReady and UsePostInsightsAnalyticsModuleResult.lifetimeStatus ~= DataStatus.NotReady
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: IsNotLifetimeStatusMatch (copy), UseRefResult (copy), EventNames (upval), Moment (copy), MakeFeedActionFieldsModule (upval), MomentsCommonModule (upval)
		if not IsNotLifetimeStatusMatch or UseRefResult.current then return end
		UseRefResult.current = true
		local PostInsightsPageImpression = EventNames.PostInsightsPageImpression
		local RecommendationMetadata = Moment.recommendationMetadata
		local PostInsightsImpression = MakeFeedActionFieldsModule(Moment.momentId, if RecommendationMetadata == nil then nil else RecommendationMetadata.feedItemId, if RecommendationMetadata == nil then nil else RecommendationMetadata.tracingId, "post_insights_impression")
		
		if PostInsightsImpression ~= nil then
			MomentsCommonModule.Analytics.fireAnalyticsEvent(PostInsightsPageImpression, PostInsightsImpression)
		end
	end, { IsNotLifetimeStatusMatch })
	local UseRefResult1 = ReactModule.useRef(os.clock())
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), EventNames (upval), Moment (copy), MakeFeedActionFieldsModule (upval), MomentsCommonModule (upval), Callback (copy)
		local Rounded = math.round((os.clock() - UseRefResult1.current) * 1000)
		local PostInsightsBackButtonPressed = EventNames.PostInsightsBackButtonPressed
		local RecommendationMetadata = Moment.recommendationMetadata
		local PostInsightsBack = MakeFeedActionFieldsModule(Moment.momentId, if RecommendationMetadata == nil then nil else RecommendationMetadata.feedItemId, if RecommendationMetadata == nil then nil else RecommendationMetadata.tracingId, "post_insights_back")
		
		if PostInsightsBack ~= nil then
			if Rounded ~= nil then
				PostInsightsBack.durationMs = tostring(Rounded)
			end
			MomentsCommonModule.Analytics.fireAnalyticsEvent(PostInsightsBackButtonPressed, PostInsightsBack)
		end
		Callback()
	end, { Callback, Moment })
	local LifetimeViews: number = UsePostInsightsAnalyticsModuleResult.lifetimeViews
	local Rounded: number? = nil
	local Smallest: number? = nil
	local LifetimeJoinsRatio = nil
	
	if LifetimeViews ~= nil and LifetimeViews > 0 then
		if UsePostInsightsAnalyticsModuleResult.lifetimeWatchTimeSeconds ~= nil then
			local LifetimeWatchTimeSecondsRatio = UsePostInsightsAnalyticsModuleResult.lifetimeWatchTimeSeconds / LifetimeViews
			Rounded = math.round(LifetimeWatchTimeSecondsRatio)
			local Metadata = Moment.metadata
			local Trim = if Metadata.edits == nil then nil else Metadata.edits.trim
			local AssetTotalDuration1 = nil
			
			if Trim == nil or Trim.startTime >= Trim.endTime then
				local AssetTotalDuration: number = Metadata.assetTotalDuration
				AssetTotalDuration1 = if AssetTotalDuration == nil or AssetTotalDuration <= 0 then nil else AssetTotalDuration
			else
				AssetTotalDuration1 = Trim.endTime - Trim.startTime
			end
			if AssetTotalDuration1 ~= nil then
				Smallest = math.min(LifetimeWatchTimeSecondsRatio / AssetTotalDuration1, 1)
			end
		end
		if UsePostInsightsAnalyticsModuleResult.lifetimeJoins ~= nil then
			LifetimeJoinsRatio = UsePostInsightsAnalyticsModuleResult.lifetimeJoins / LifetimeViews
		end
	end
	local UseLocalizationResult1 = UseLocalizationFunction((ReactModule.useMemo(function()
		-- upvalues: PostInsightsStringsModule (upval), Rounded (ref), Smallest (ref), RobloxLocaleId (copy), NumberLocalization (upval), LifetimeJoinsRatio (ref)
		return {
			averageWatchTime = {
				PostInsightsStringsModule.DURATION_SECONDS_KEY,
				seconds = Rounded or 0
			},
			averageCompletion = {
				PostInsightsStringsModule.PERCENT_KEY,
				number = NumberLocalization.localize(math.round((Smallest or 0) * 1000) / 10, RobloxLocaleId)
			},
			gameJoinConversion = {
				PostInsightsStringsModule.PERCENT_KEY,
				number = NumberLocalization.localize(math.round((LifetimeJoinsRatio or 0) * 1000) / 10, RobloxLocaleId)
			}
		}
	end, {
		Rounded or false,
		Smallest or false,
		LifetimeJoinsRatio or false,
		RobloxLocaleId
	})))
	local _DateTime = if Moment.createdAt == nil then nil else DateTime.fromIsoDate(Moment.createdAt)
	local L = if _DateTime == nil then nil else _DateTime:FormatLocalTime("L", RobloxLocaleId)
	local UseLocalizationResult2 = UseLocalizationFunction((ReactModule.useMemo(function()
		-- upvalues: PostInsightsStringsModule (upval), L (copy)
		return {
			postedOn = {
				PostInsightsStringsModule.POSTED_ON_DATE_KEY,
				date = L or ""
			}
		}
	end, { L or false })))
	local OverviewMetrics = {
		{
			key = "averageWatchTime",
			label = UseLocalizationResult.averageWatchTime,
			valueText = if Rounded == nil then "—" else UseLocalizationResult1.averageWatchTime
		},
		{
			key = "averageCompletion",
			label = UseLocalizationResult.averageCompletion,
			valueText = if Smallest == nil then "—" else UseLocalizationResult1.averageCompletion
		},
		{
			key = "gameJoinConversion",
			label = UseLocalizationResult.gameJoinConversion,
			valueText = if LifetimeJoinsRatio == nil then "—" else UseLocalizationResult1.gameJoinConversion
		}
	}
	local ViewsSeries = UsePostInsightsAnalyticsModuleResult.viewsSeries
	local IsGranularityMatch: boolean = UsePostInsightsAnalyticsModuleResult.window ~= nil and UsePostInsightsAnalyticsModuleResult.window.granularity == CreatorAnalyticsModule.MetricGranularity.OneHour
	
	local function formatTime(p2)
		-- upvalues: IsGranularityMatch (copy), RobloxLocaleId (copy)
		local _DateTime = DateTime.fromIsoDate(p2)
		
		return if _DateTime == nil then p2 elseif IsGranularityMatch then _DateTime:FormatLocalTime("LT", RobloxLocaleId) else _DateTime:FormatUniversalTime("MMM D", RobloxLocaleId)
	end
	
	local IsViewsStatusMatch = UsePostInsightsAnalyticsModuleResult.viewsStatus == DataStatus.NotReady
	local HasData = ViewsSeries ~= nil and ViewsSeries.hasData
	local Total = if LifetimeViews == nil then if ViewsSeries == nil then nil else ViewsSeries.total else LifetimeViews
	
	if not HasData and Total == 0 then
		Total = nil
	end
	local AbbreviateCountResult = if Total == nil then "—" else AbbreviateCountFunction(Total, RobloxLocaleId)
	
	if not HasData and not IsViewsStatusMatch then
		table.insert(OverviewMetrics, 1, {
			key = "totalViews",
			label = UseLocalizationResult.totalViews,
			valueText = AbbreviateCountResult
		})
	end
	local Description = Moment.metadata.description
	local IsCountIsCapped: boolean = Moment.comments ~= nil and Moment.comments.countIsCapped == true
	
	return {
		title = UseLocalizationResult.title,
		overviewHeading = UseLocalizationResult.overview,
		engagementHeading = UseLocalizationResult.engagement,
		totalReactionsLabel = UseLocalizationResult.totalReactions,
		onBack = UseResult,
		mediaItem = UseMemoResult,
		caption = if Description == nil or Description == "" then nil else Description,
		postedOnText = if L == nil then nil else UseLocalizationResult2.postedOn,
		interactionCounts = {
			{
				key = "likes",
				icon = BuilderIconsModule.Icon.ThumbUp,
				countText = AbbreviateCountFunction(UseSignalStateResult or 0, LocalizationService.RobloxLocaleId)
			},
			{
				key = "comments",
				icon = BuilderIconsModule.Icon.SpeechBubbleAlignLeft,
				countText = AbbreviateCountFunction(UseSignalStateResult2 or 0, LocalizationService.RobloxLocaleId) .. (if IsCountIsCapped then "+" else "")
			},
			{
				key = "shares",
				icon = BuilderIconsModule.Icon.ArrowThickToRight,
				countText = AbbreviateCountFunction(UseSignalStateResult3 or 0, LocalizationService.RobloxLocaleId)
			}
		},
		totalViewsLabel = UseLocalizationResult.totalViews,
		totalViewsText = AbbreviateCountResult,
		viewsChart = {
			hideHeader = true,
			isDeltaPositive = false,
			testId = "post-insights-views-chart",
			plotId = `views:{Moment.momentId}`,
			series = if ViewsSeries == nil then nil else {
				{
					id = "views",
					name = UseLocalizationResult.totalViews,
					points = ViewsSeries.points
				}
			},
			hasData = HasData,
			title = UseLocalizationResult.totalViews,
			valueText = AbbreviateCountResult,
			yAxisFormatter = function(p2)
				-- upvalues: AbbreviateCountFunction (upval), RobloxLocaleId (copy)
				return AbbreviateCountFunction(p2.value, RobloxLocaleId)
			end,
			xAxisFormatter = function(p2)
				-- upvalues: IsGranularityMatch (copy), RobloxLocaleId (copy)
				local Value = p2.value
				local _DateTime = DateTime.fromIsoDate(Value)
				
				return if _DateTime == nil then Value elseif IsGranularityMatch then _DateTime:FormatLocalTime("LT", RobloxLocaleId) else _DateTime:FormatUniversalTime("MMM D", RobloxLocaleId)
			end,
			tooltipFormatters = {
				formatXForPoint = formatTime,
				formatSeriesValueForPoint = function(p2)
					-- upvalues: NumberLocalization (upval), RobloxLocaleId (copy)
					return NumberLocalization.localize(p2.y, RobloxLocaleId)
				end
			}
		},
		isViewsChartLoading = IsViewsStatusMatch,
		isViewsChartVisible = HasData,
		overviewMetrics = OverviewMetrics,
		totalReactionsText = AbbreviateCountFunction(UseSignalStateResult or 0, LocalizationService.RobloxLocaleId),
		reactionCounts = UseMemoResult1
	}
end