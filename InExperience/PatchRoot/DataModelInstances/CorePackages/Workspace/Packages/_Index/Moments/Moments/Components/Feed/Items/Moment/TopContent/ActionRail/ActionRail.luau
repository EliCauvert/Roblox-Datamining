local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local signalsReactModule = require(parent.SignalsReact)
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local sharedFlagsModule = require(parent.SharedFlags)
local view = foundationModule.View
local getMomentsCapabilities = momentsCommonModule.Stores.GetMomentsCapabilities
local useSignalBinding = signalsReactModule.useSignalBinding
local useSignalState = signalsReactModule.useSignalState
local momentContextModule = require(script.Parent.Parent.Parent.MomentContext)
local railItemModule = require(script.Parent.RailItem)
local reactionButtonModule = require(script.Parent.ReactionButton)
local contextualMenuModule = require(moments.Components.Feed.ContextualMenu)
local useMomentsSession = require(moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)
local useCommentCapabilitiesModule = require(moments.Components.Comments.useCommentCapabilities)
local fFlagMomentsActionRailNarrowWidthModule = require(moments.Flags.FFlagMomentsActionRailNarrowWidth)
local fFlagMomentsActionRailSpacingModule = require(moments.Flags.FFlagMomentsActionRailSpacing)
local fFlagMomentsOptimisticProfilePending = sharedFlagsModule.FFlagMomentsOptimisticProfilePending
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local fFlagMomentsComments = sharedFlagsModule.FFlagMomentsComments
local fFlagMomentsCommentsIxpEnabled = sharedFlagsModule.FFlagMomentsCommentsIxpEnabled
local fFlagMomentsEngagementMetricsFeature = momentsCommonModule.Flags.FFlagMomentsEngagementMetricsFeature
local useConfigurationModule = require(moments.Hooks.useConfiguration)
local useShareMomentModule = require(moments.Share.useShareMoment)
local useCommentActionImpressionModule = require(script.Parent.useCommentActionImpression)
local arrowThickToRight = builderIconsModule.Icon.ArrowThickToRight
local speechBubbleAlignLeft = builderIconsModule.Icon.SpeechBubbleAlignLeft

return reactModule.memo(function(p1)
	-- upvalues: reactUtilsModule (ref), momentContextModule (ref), fFlagMomentsEngagementMetricsFeature (ref), sharedFlagsModule (ref), useSignalState (ref), getMomentsCapabilities (ref), useShareMomentModule (ref), useSignalBinding (ref), fFlagMomentsComments (ref), fFlagMomentsOptimisticProfilePending (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), useConfigurationModule (ref), useMomentsSession (ref), getMomentsPreferencesStoreModule (ref), useCommentCapabilitiesModule (ref), fFlagMomentsCommentsIxpEnabled (ref), useCommentActionImpressionModule (ref), reactModule (ref), reactionButtonModule (ref), railItemModule (ref), speechBubbleAlignLeft (ref), arrowThickToRight (ref), contextualMenuModule (ref), fFlagMomentsActionRailSpacingModule (ref), fFlagMomentsActionRailNarrowWidthModule (ref), view (ref)
	local var1 = reactUtilsModule.createNextOrder()
	local var2 = momentContextModule.useMoment()
	local store = var2.store
	local data = store.getData(false)
	local isAd = data.kind == "ad"
	local var3 = if fFlagMomentsEngagementMetricsFeature and sharedFlagsModule.FFlagGuacMomentsFeatureList then useSignalState(getMomentsCapabilities(false).getIsEngagementMetricsEnabled) else nil
	local var4 = useShareMomentModule(p1.moment)
	local animationRatio = var2.animationRatio
	local var5 = useSignalBinding(store.getShareCount)
	local var6 = if fFlagMomentsComments then useSignalBinding(store.getCommentCount) else nil
	local var7 = useSignalState(store.getIsModerated)
	local var8 = var7 or fFlagMomentsOptimisticProfilePending and data.isPending == true
	local var9 = if p1.moment == nil or p1.moment.recommendationMetadata == nil then nil else p1.moment.recommendationMetadata.feedItemId
	local var10 = var8 or (fFlagMomentsPassFeedItemIdToBackendApis and (if var9 ~= nil then var9 == "" else true))
	local var11 = useConfigurationModule("feed_mute_enabled", false)
	local var12 = useConfigurationModule("feed_mute_button_analytics_enabled", false)
	local var13 = getMomentsPreferencesStoreModule(false)
	local var14 = useSignalState(useMomentsSession().getHideDetails)
	local var15 = if p1.moment ~= nil then nil else p1.moment.comments
	local var16 = useCommentCapabilitiesModule().canRead and (not var14 and (not isAd and (if var15 ~= nil then var15.viewerCanRead else true)))
	
	if fFlagMomentsComments or fFlagMomentsCommentsIxpEnabled then
		useCommentActionImpressionModule(var16 and p1.moment ~= nil)
	end
	local var17 = useSignalState(var13.getFeedGlobalMute)
	local var18 = reactModule.useMemo(function()
		-- upvalues: var17 (ref), var13 (ref)
		return { isMuted = var17, toggle = var13.toggleFeedGlobalMute }
	end, { var17, var13.toggleFeedGlobalMute })
	local t = {}
	
	if not var14 and not isAd then
		t.React = reactModule.createElement(reactionButtonModule, {
			animationRatio = animationRatio,
			isDisabled = var8,
			LayoutOrder = var1()
		})
	end
	if fFlagMomentsComments and var16 then
		t.Comment = reactModule.createElement(railItemModule, {
			testId = "moments-comment-button",
			LayoutOrder = var1(),
			slot = speechBubbleAlignLeft,
			count = if fFlagMomentsEngagementMetricsFeature and sharedFlagsModule.FFlagGuacMomentsFeatureList and not var3 then nil else var6,
			countIsCapped = var15 ~= nil and var15.countIsCapped == true,
			animationRatio = animationRatio,
			isDisabled = var8,
			onActivated = function()
				-- upvalues: var8 (ref), var9 (ref), p1 (ref)
				if not var8 and var9 ~= nil and (var9 ~= "" and p1.onOpenComments ~= nil) then
					p1.onOpenComments()
				end
			end
		})
	end
	if not var14 then
		t.Share = reactModule.createElement(railItemModule, {
			LayoutOrder = var1(),
			slot = arrowThickToRight,
			count = if fFlagMomentsEngagementMetricsFeature and sharedFlagsModule.FFlagGuacMomentsFeatureList and not var3 then nil else var5,
			animationRatio = animationRatio,
			isDisabled = var10,
			onActivated = var4.onShareActivated
		})
		t.Music = reactModule.createElement(require(script.Parent.MusicButton), {
			LayoutOrder = var1(),
			moment = p1.moment,
			animationRatio = animationRatio,
			isDisabled = var7
		})
	end
	if p1.moment ~= nil then
		t.ContextualMenu = reactModule.createElement(contextualMenuModule, {
			isFeedMuteEnabled = var11,
			isFeedMuteButtonAnalyticsEnabled = var12,
			isDisabled = var7,
			layoutOrder = var1(),
			moment = p1.moment,
			playbackVolume = var18
		})
	end
	return reactModule.createElement(view, {
		LayoutOrder = p1.LayoutOrder,
		tag = if fFlagMomentsActionRailNarrowWidthModule then if fFlagMomentsActionRailSpacingModule then "col align-x-center gap-large size-1000-0 auto-y" else "col align-x-center size-1000-0 auto-y" elseif fFlagMomentsActionRailSpacingModule then "col align-x-center gap-large size-1200-0 auto-y" else "col size-1200-0 auto-y",
		testId = if fFlagMomentsActionRailSpacingModule or fFlagMomentsActionRailNarrowWidthModule then "moments-action-rail" else nil
	}, t)
end)