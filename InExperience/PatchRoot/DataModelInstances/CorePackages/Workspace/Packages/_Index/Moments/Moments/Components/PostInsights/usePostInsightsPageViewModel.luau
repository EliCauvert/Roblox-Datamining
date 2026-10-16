local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local LocalizationService = game:GetService("LocalizationService")
local BuilderIconsModule = require(Parent.BuilderIcons)
local LocalizationModule = require(Parent.Localization)
local _ = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local AbbreviateCountFunction = LocalizationModule.abbreviateCount
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local ReactionType = require(Parent.MomentsTypes).Enums.ReactionType
local _ = require(script.Parent.createPostInsightsPageStore)
local PlaceholderOverviewMetricsModule = require(script.Parent.placeholderOverviewMetrics)
local PostInsightsStringsModule = require(script.Parent.postInsightsStrings)
local ToMediaItemModule = require(Moments.Components.Feed.Media.toMediaItem)
local ReactionTypes = {
	ReactionType.ThumbsUp, ReactionType.Heart, ReactionType.LaughJoy,
	ReactionType.Wow, ReactionType.Cry, ReactionType.Fire, ReactionType.Skull
}

return function(p1, OnBack) --[[ Line: 82 | Named "usePostInsightsPageViewModel" ]]
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), PostInsightsStringsModule (copy), UseSignalStateFunction (copy), ReactModule (copy), ToMediaItemModule (copy), ReactionTypes (copy), AbbreviateCountFunction (copy), LocalizationService (copy), PlaceholderOverviewMetricsModule (copy), BuilderIconsModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction(PostInsightsStringsModule.PAGE_KEYS)
	local Moment = p1.moment
	local MomentStore = p1.momentStore
	local UseSignalStateResult = UseSignalStateFunction(MomentStore.getReactionCount)
	local UseSignalStateResult1 = UseSignalStateFunction(MomentStore.getIndividualReactionCounts)
	local UseSignalStateResult2 = UseSignalStateFunction(MomentStore.getCommentCount)
	local UseSignalStateResult3 = UseSignalStateFunction(MomentStore.getShareCount)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 95 ]]
		-- upvalues: ToMediaItemModule (upval), Moment (copy), UseTokensResult (copy)
		local MediaItemModule = ToMediaItemModule({ kind = "moment", moment = Moment })
		
		if MediaItemModule ~= nil then
			MediaItemModule.cornerRadius = UseTokensResult.Radius.Small
		end
		return MediaItemModule
	end, { Moment.momentId })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 103 ]]
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
	local UseLocalizationResult1 = UseLocalizationFunction((ReactModule.useMemo(function() --[[ Line: 121 ]]
		-- upvalues: PlaceholderOverviewMetricsModule (upval), PostInsightsStringsModule (upval)
		local t = {}
		
		for _, value in PlaceholderOverviewMetricsModule do
			if value.seconds ~= nil then
				t[value.key] = {
					PostInsightsStringsModule.DURATION_SECONDS_KEY,
					seconds = value.seconds
				}
			end
		end
		return t
	end, {})))
	local OverviewMetrics = {}
	
	for _, value in PlaceholderOverviewMetricsModule do
		table.insert(OverviewMetrics, {
			key = value.key,
			label = UseLocalizationResult[value.key],
			valueText = if value.seconds == nil then value.valueText or "" else UseLocalizationResult1[value.key]
		})
	end
	local Description = Moment.metadata.description
	
	return {
		title = UseLocalizationResult.title,
		overviewHeading = UseLocalizationResult.overview,
		engagementHeading = UseLocalizationResult.engagement,
		totalReactionsLabel = UseLocalizationResult.totalReactions,
		onBack = OnBack,
		mediaItem = UseMemoResult,
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
				countText = AbbreviateCountFunction(UseSignalStateResult2 or 0, LocalizationService.RobloxLocaleId)
			},
			{
				key = "shares",
				icon = BuilderIconsModule.Icon.ArrowThickToRight,
				countText = AbbreviateCountFunction(UseSignalStateResult3 or 0, LocalizationService.RobloxLocaleId)
			}
		},
		overviewMetrics = OverviewMetrics,
		totalReactionsText = AbbreviateCountFunction(UseSignalStateResult or 0, LocalizationService.RobloxLocaleId),
		reactionCounts = UseMemoResult1
	}
end