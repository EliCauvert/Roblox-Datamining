local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local Players = game:GetService("Players")
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local VerticalPagerModule = require(Moments.Components.VerticalPager)
local UseFeedOptionalFunction = require(Moments.Components.Feed.FeedContext).useFeedOptional
local _ = require(Moments.Components.Feed.Items.Moment.createMomentStore)
local FirePostInsightsCoachmarkEventModule = require(script.Parent.firePostInsightsCoachmarkEvent)
local GetPostInsightsCoachmarkSessionStoreModule = require(script.Parent.getPostInsightsCoachmarkSessionStore)
local GetPostInsightsPageStoreModule = require(script.Parent.getPostInsightsPageStore)
local PostInsightsCoachmarkImpressionCacheModule = require(script.Parent.postInsightsCoachmarkImpressionCache)
local PostInsightsStringsModule = require(script.Parent.postInsightsStrings)
local GetCommentsSheetStoreModule = if require(Parent.SharedFlags).FFlagMomentsComments then require(Moments.Components.Comments.Sheet.getCommentsSheetStore) else nil
local EventNames = MomentsCommonModule.Analytics.EventNames
local RecommendationSource = MomentsCommonModule.Analytics.RecommendationSource
local GetFIntMomentsCoachmarkMaxImpressionsFunction = MomentsCommonModule.Flags.GetFIntMomentsCoachmarkMaxImpressions
local GetFIntMomentsCoachmarkAutoDismissSecondsFunction = MomentsCommonModule.Flags.GetFIntMomentsCoachmarkAutoDismissSeconds
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

local function onImpression()
	-- upvalues: FirePostInsightsCoachmarkEventModule (copy), EventNames (copy)
	FirePostInsightsCoachmarkEventModule(EventNames.FTUXTooltipImpression)
end

local function onDismissed()
	-- upvalues: FirePostInsightsCoachmarkEventModule (copy), EventNames (copy)
	FirePostInsightsCoachmarkEventModule(EventNames.FTUXTooltipDismissed)
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), PostInsightsStringsModule (copy), UseFeedOptionalFunction (copy), VerticalPagerModule (copy), ReactModule (copy), SignalsModule (copy), SignalsReactModule (copy), GetPostInsightsPageStoreModule (copy), GetCommentsSheetStoreModule (copy), RecommendationSource (copy), Players (copy), GetPostInsightsCoachmarkSessionStoreModule (copy), PostInsightsCoachmarkImpressionCacheModule (copy), GetFIntMomentsCoachmarkMaxImpressionsFunction (copy), GetFIntMomentsCoachmarkAutoDismissSecondsFunction (copy), onImpression (copy), onDismissed (copy)
	local UseLocalizationResult = UseLocalizationFunction(PostInsightsStringsModule.TOOLTIP_KEYS)
	local UseFeedOptionalResult = UseFeedOptionalFunction()
	local UseVerticalPagerResult = VerticalPagerModule.useVerticalPager()
	local Item = VerticalPagerModule.usePagerItem().item
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), Item (copy), UseVerticalPagerResult (copy)
		return SignalsModule.createComputed(function(p2): boolean
			-- upvalues: Item (upval), UseVerticalPagerResult (upval)
			return Item ~= nil and UseVerticalPagerResult.store.getCurrentItem(p2) == Item
		end)
	end, { UseVerticalPagerResult, Item })))
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(GetPostInsightsPageStoreModule(false).getIsOpen)
	local UseSignalStateResult2 = GetCommentsSheetStoreModule ~= nil and SignalsReactModule.useSignalState(GetCommentsSheetStoreModule(false).getIsOpen)
	local IsCreatorIdMatch: boolean = UseFeedOptionalResult ~= nil and (UseFeedOptionalResult.recommendationSource == RecommendationSource.Profile and (p1.momentStore ~= nil and (not p1.isDisabled and p1.moment.creatorId == (if Players.LocalPlayer then Players.LocalPlayer.UserId else nil))))
	local IsActiveFeed = IsCreatorIdMatch and (UseSignalStateResult and (UseFeedOptionalResult ~= nil and UseFeedOptionalResult.isActiveFeed))
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: IsActiveFeed (copy), UseStateResult2 (copy)
		if IsActiveFeed then
			UseStateResult2(true)
		end
	end, { IsActiveFeed })
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2_1 (copy)
		if p1.isMenuOpen then
			UseStateResult2_1(true)
		end
	end, { p1.isMenuOpen })
	local PostInsightsCoachmarkSessionStoreModule = GetPostInsightsCoachmarkSessionStoreModule(false)
	
	return {
		shouldMount = IsCreatorIdMatch and (IsActiveFeed or UseStateResult),
		hidden = not IsActiveFeed or (p1.isMenuOpen or (UseStateResult1 or (UseSignalStateResult2 or UseSignalStateResult1))),
		title = UseLocalizationResult.title,
		text = UseLocalizationResult.text,
		impressionCache = PostInsightsCoachmarkImpressionCacheModule,
		maxImpressions = GetFIntMomentsCoachmarkMaxImpressionsFunction(),
		autoDismissSeconds = GetFIntMomentsCoachmarkAutoDismissSecondsFunction(),
		isSessionHandled = PostInsightsCoachmarkSessionStoreModule.getIsHandled(false),
		onSessionHandled = PostInsightsCoachmarkSessionStoreModule.markHandled,
		onImpression = onImpression,
		onDismissed = onDismissed
	}
end