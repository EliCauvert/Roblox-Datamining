local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local LocalizationService = game:GetService("LocalizationService")
local _ = require(Parent.AnalyticsMetricChart)
local BuilderIconsModule = require(Parent.BuilderIcons)
local LocalizationModule = require(Parent.Localization)
local _ = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local AbbreviateCountFunction = LocalizationModule.abbreviateCount
local NumberLocalization = LocalizationModule.NumberLocalization
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local ReactionType = require(Parent.MomentsTypes).Enums.ReactionType
local CreatorAnalyticsModule = require(Parent.DataHydration.CreatorAnalytics)
local _ = require(script.Parent.createPostInsightsPageStore)
local MetricSeriesToChartPointsModule = require(script.Parent.metricSeriesToChartPoints)
local MockViewsResponsesModule = require(script.Parent.mockViewsResponses)
local PostInsightsStringsModule = require(script.Parent.postInsightsStrings)
local ToMediaItemModule = require(Moments.Components.Feed.Media.toMediaItem)
local ReactionTypes = {
	ReactionType.ThumbsUp, ReactionType.Heart, ReactionType.LaughJoy,
	ReactionType.Wow, ReactionType.Cry, ReactionType.Fire, ReactionType.Skull
}

return function(p1, OnBack)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), PostInsightsStringsModule (copy), UseSignalStateFunction (copy), ReactModule (copy), ToMediaItemModule (copy), ReactionTypes (copy), AbbreviateCountFunction (copy), LocalizationService (copy), MockViewsResponsesModule (copy), MetricSeriesToChartPointsModule (copy), CreatorAnalyticsModule (copy), NumberLocalization (copy), BuilderIconsModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction(PostInsightsStringsModule.PAGE_KEYS)
	local Moment = p1.moment
	local MomentStore = p1.momentStore
	local UseSignalStateResult = UseSignalStateFunction(MomentStore.getReactionCount)
	local UseSignalStateResult1 = UseSignalStateFunction(MomentStore.getIndividualReactionCounts)
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local PickForMomentResult = MockViewsResponsesModule.pickForMoment(Moment.momentId)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: MetricSeriesToChartPointsModule (upval), PickForMomentResult (copy)
		return MetricSeriesToChartPointsModule(PickForMomentResult.series, PickForMomentResult.window)
	end, { PickForMomentResult })
	local IsGranularityMatch = PickForMomentResult.window.granularity == CreatorAnalyticsModule.MetricGranularity.OneHour
	local Description = Moment.metadata.description
	
	return {
		title = UseLocalizationResult.title,
		overviewHeading = UseLocalizationResult.overview,
		engagementHeading = UseLocalizationResult.engagement,
		totalReactionsLabel = UseLocalizationResult.totalReactions,
		onBack = OnBack,
		mediaItem = ReactModule.useMemo(function()
			-- upvalues: ToMediaItemModule (upval), Moment (copy), UseTokensResult (copy)
			local MediaItemModule = ToMediaItemModule({ kind = "moment", moment = Moment })
			
			if MediaItemModule ~= nil then
				MediaItemModule.cornerRadius = UseTokensResult.Radius.Small
			end
			return MediaItemModule
		end, { Moment.momentId }),
		caption = if Description == nil or Description == "" then nil else Description,
		interactionCounts = {
			{
				key = "likes",
				icon = BuilderIconsModule.Icon.ThumbUp,
				countText = AbbreviateCountFunction(UseSignalStateResult or 0, LocalizationService.RobloxLocaleId)
			},
			{
				key = "comments",
				icon = BuilderIconsModule.Icon.SpeechBubbleAlignLeft,
				countText = AbbreviateCountFunction(UseSignalStateFunction(MomentStore.getCommentCount) or 0, LocalizationService.RobloxLocaleId)
			},
			{
				key = "shares",
				icon = BuilderIconsModule.Icon.ArrowThickToRight,
				countText = AbbreviateCountFunction(UseSignalStateFunction(MomentStore.getShareCount) or 0, LocalizationService.RobloxLocaleId)
			}
		},
		viewsChart = {
			isDeltaPositive = false,
			testId = "post-insights-views-chart",
			plotId = `views:{Moment.momentId}`,
			series = {
				{
					id = "views",
					name = UseLocalizationResult.totalViews,
					points = UseMemoResult.points
				}
			},
			hasData = UseMemoResult.hasData,
			title = UseLocalizationResult.totalViews,
			valueText = AbbreviateCountFunction(UseMemoResult.total, RobloxLocaleId),
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
				formatXForPoint = function(p2)
					-- upvalues: IsGranularityMatch (copy), RobloxLocaleId (copy)
					local _DateTime = DateTime.fromIsoDate(p2)
					
					return if _DateTime == nil then p2 elseif IsGranularityMatch then _DateTime:FormatLocalTime("LT", RobloxLocaleId) else _DateTime:FormatUniversalTime("MMM D", RobloxLocaleId)
				end,
				formatSeriesValueForPoint = function(p2)
					-- upvalues: NumberLocalization (upval), RobloxLocaleId (copy)
					return NumberLocalization.localize(p2.y, RobloxLocaleId)
				end
			}
		},
		overviewMetrics = {
			{
				key = "averageWatchTime",
				valueText = "—",
				label = UseLocalizationResult.averageWatchTime
			},
			{
				key = "averageCompletion",
				valueText = "—",
				label = UseLocalizationResult.averageCompletion
			},
			{
				key = "gameJoinConversion",
				valueText = "—",
				label = UseLocalizationResult.gameJoinConversion
			}
		},
		totalReactionsText = AbbreviateCountFunction(UseSignalStateResult or 0, LocalizationService.RobloxLocaleId),
		reactionCounts = ReactModule.useMemo(function()
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
	}
end