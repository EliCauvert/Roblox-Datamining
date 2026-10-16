local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local MomentsCommonModule = require(Parent.MomentsCommon)
local SharedFlagsModule = require(Parent.SharedFlags)
local MomentsGetMomentsCommentsStoreModule = require(Parent.DataHydration.MomentsGetMomentsCommentsStore)
local FFlagMomentsComments = SharedFlagsModule.FFlagMomentsComments
local FFlagMomentsCommentsIxpEnabled = SharedFlagsModule.FFlagMomentsCommentsIxpEnabled
local UseVerticalPagerFunction = require(Moments.Components.VerticalPager).useVerticalPager
local UsePagerItemFunction = require(Moments.Components.VerticalPager).usePagerItem
local UseFeedOptionalFunction = require(Moments.Components.Feed.FeedContext).useFeedOptional
local FStringMomentsCommentsIxpLayerModule = require(Moments.Flags.FStringMomentsCommentsIxpLayer)
local FFlagMomentsCommentsCountAnalyticsModule = require(Moments.Flags.FFlagMomentsCommentsCountAnalytics)
local MakeCommentCountFieldsModule = require(Moments.Analytics.makeCommentCountFields)
local MomentImpressionMemoryModule = require(Moments.Components.Feed.Items.Moment.MomentImpressionMemory)
local FFlagMomentsFixOverlayRemountImpressionsModule = require(Moments.Flags.FFlagMomentsFixOverlayRemountImpressions)

return function(p1) --[[ Line: 30 | Named "useCommentActionImpression" ]]
	-- upvalues: UseVerticalPagerFunction (copy), UsePagerItemFunction (copy), UseFeedOptionalFunction (copy), ReactModule (copy), SignalsModule (copy), SignalsReactModule (copy), FFlagMomentsFixOverlayRemountImpressionsModule (copy), MomentImpressionMemoryModule (copy), FFlagMomentsComments (copy), FFlagMomentsCommentsCountAnalyticsModule (copy), MakeCommentCountFieldsModule (copy), MomentsGetMomentsCommentsStoreModule (copy), MomentsCommonModule (copy), FFlagMomentsCommentsIxpEnabled (copy), FStringMomentsCommentsIxpLayerModule (copy)
	local UseVerticalPagerResult = UseVerticalPagerFunction()
	local UsePagerItemResult = UsePagerItemFunction()
	local UseFeedOptionalResult = UseFeedOptionalFunction()
	local Item = UsePagerItemResult.item
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 36 ]]
		-- upvalues: SignalsModule (upval), Item (copy), UseVerticalPagerResult (copy)
		return SignalsModule.createComputed(function(p2): boolean --[[ Line: 37 ]]
			-- upvalues: Item (upval), UseVerticalPagerResult (upval)
			return Item ~= nil and UseVerticalPagerResult.store.getCurrentItem(p2) == Item
		end)
	end, { UseVerticalPagerResult, Item })))
	local IsActiveFeed = p1 and (UseSignalStateResult and (UseFeedOptionalResult ~= nil and UseFeedOptionalResult.isActiveFeed))
	local CommentAction = if FFlagMomentsFixOverlayRemountImpressionsModule then MomentImpressionMemoryModule.useImpressionRef("commentAction") else ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 48 ]]
		-- upvalues: CommentAction (copy), IsActiveFeed (copy), Item (copy), FFlagMomentsComments (upval), FFlagMomentsCommentsCountAnalyticsModule (upval), MakeCommentCountFieldsModule (upval), MomentsGetMomentsCommentsStoreModule (upval), MomentsCommonModule (upval), FFlagMomentsCommentsIxpEnabled (upval), FStringMomentsCommentsIxpLayerModule (upval)
		local Current = CommentAction.current
		CommentAction.current = IsActiveFeed
		
		if not IsActiveFeed or Current or Item == nil or Item.kind ~= "moment" then return end
		local RecommendationMetadata = Item.moment.recommendationMetadata
		local FeedItemId = if RecommendationMetadata == nil then nil else RecommendationMetadata.feedItemId
		
		if FFlagMomentsComments and FeedItemId ~= nil and FeedItemId ~= "" then
			local CommentCountFieldsModule = if FFlagMomentsCommentsCountAnalyticsModule then MakeCommentCountFieldsModule(MomentsGetMomentsCommentsStoreModule(false).getCachedMomentComments(FeedItemId).data(false)) else {}
			CommentCountFieldsModule.feedItemId = FeedItemId
			MomentsCommonModule.Analytics.fireAnalyticsEvent(MomentsCommonModule.Analytics.EventNames.MomentCommentActionButtonImpression, CommentCountFieldsModule)
		end
		if FFlagMomentsCommentsIxpEnabled then
			MomentsCommonModule.Utils.logMomentsLayerExposure(FStringMomentsCommentsIxpLayerModule)
		end
	end, { IsActiveFeed, Item })
end