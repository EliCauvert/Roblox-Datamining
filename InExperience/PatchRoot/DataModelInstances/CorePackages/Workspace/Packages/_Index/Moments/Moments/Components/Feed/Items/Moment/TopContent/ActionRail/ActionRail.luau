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
local fFlagMomentsReactFeatureGate = sharedFlagsModule.FFlagMomentsReactFeatureGate
local fFlagMomentsEngagementMetricsFeature = momentsCommonModule.Flags.FFlagMomentsEngagementMetricsFeature
local useConfigurationModule = require(moments.Hooks.useConfiguration)
local useShareMomentModule = require(moments.Share.useShareMoment)
local useCommentActionImpressionModule = require(script.Parent.useCommentActionImpression)
local arrowThickToRight = builderIconsModule.Icon.ArrowThickToRight
local speechBubbleAlignLeft = builderIconsModule.Icon.SpeechBubbleAlignLeft

return reactModule.memo(function(p1)
	-- upvalues: reactUtilsModule (ref), momentContextModule (ref), fFlagMomentsEngagementMetricsFeature (ref), useSignalState (ref), getMomentsCapabilities (ref), fFlagMomentsReactFeatureGate (ref), useShareMomentModule (ref), useSignalBinding (ref), fFlagMomentsComments (ref), fFlagMomentsOptimisticProfilePending (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), useConfigurationModule (ref), useMomentsSession (ref), getMomentsPreferencesStoreModule (ref), useCommentCapabilitiesModule (ref), fFlagMomentsCommentsIxpEnabled (ref), useCommentActionImpressionModule (ref), reactModule (ref), reactionButtonModule (ref), railItemModule (ref), speechBubbleAlignLeft (ref), arrowThickToRight (ref), contextualMenuModule (ref), fFlagMomentsActionRailSpacingModule (ref), fFlagMomentsActionRailNarrowWidthModule (ref), view (ref)
	local var1 = reactUtilsModule.createNextOrder()
	local var2 = momentContextModule.useMoment()
	local store = var2.store
	local data = store.getData(false)
	local isAd = data.kind == "ad"
	local var3 = if fFlagMomentsEngagementMetricsFeature then useSignalState(getMomentsCapabilities(false).getIsEngagementMetricsEnabled) else nil
	local var4 = if fFlagMomentsReactFeatureGate then useSignalState(getMomentsCapabilities(false).getCanReactToMoments) else true
	local var5 = useShareMomentModule(p1.moment)
	local animationRatio = var2.animationRatio
	local var6 = useSignalBinding(store.getShareCount)
	local var7 = if fFlagMomentsComments then useSignalBinding(store.getCommentCount) else nil
	local var8 = useSignalState(store.getIsModerated)
	local var9 = var8 or fFlagMomentsOptimisticProfilePending and data.isPending == true
	local var10 = if p1.moment == nil or p1.moment.recommendationMetadata == nil then nil else p1.moment.recommendationMetadata.feedItemId
	local var11 = var9 or (fFlagMomentsPassFeedItemIdToBackendApis and (if var10 ~= nil then var10 == "" else true))
	local var12 = useConfigurationModule("feed_mute_enabled", false)
	local var13 = useConfigurationModule("feed_mute_button_analytics_enabled", false)
	local var14 = getMomentsPreferencesStoreModule(false)
	local var15 = useSignalState(useMomentsSession().getHideDetails)
	local var16 = if p1.moment ~= nil then nil else p1.moment.comments
	local var17 = useCommentCapabilitiesModule().canRead and (not var15 and (not isAd and (if var16 ~= nil then var16.viewerCanRead else true)))
	
	if fFlagMomentsComments or fFlagMomentsCommentsIxpEnabled then
		useCommentActionImpressionModule(var17 and p1.moment ~= nil)
	end
	local var18 = useSignalState(var14.getFeedGlobalMute)
	local var19 = reactModule.useMemo(function()
		-- upvalues: var18 (ref), var14 (ref)
		return { isMuted = var18, toggle = var14.toggleFeedGlobalMute }
	end, { var18, var14.toggleFeedGlobalMute })
	local t = {}
	
	if var4 and not var15 and not isAd then
		t.React = reactModule.createElement(reactionButtonModule, {
			animationRatio = animationRatio,
			isDisabled = var9,
			LayoutOrder = var1()
		})
	end
	if fFlagMomentsComments and var17 then
		t.Comment = reactModule.createElement(railItemModule, {
			testId = "moments-comment-button",
			LayoutOrder = var1(),
			slot = speechBubbleAlignLeft,
			count = if fFlagMomentsEngagementMetricsFeature and not var3 then nil else var7,
			countIsCapped = var16 ~= nil and var16.countIsCapped == true,
			animationRatio = animationRatio,
			isDisabled = var9,
			onActivated = function()
				-- upvalues: var9 (ref), var10 (ref), p1 (ref)
				if not var9 and var10 ~= nil and (var10 ~= "" and p1.onOpenComments ~= nil) then
					p1.onOpenComments()
				end
			end
		})
	end
	if not var15 then
		t.Share = reactModule.createElement(railItemModule, {
			LayoutOrder = var1(),
			slot = arrowThickToRight,
			count = if fFlagMomentsEngagementMetricsFeature and not var3 then nil else var6,
			animationRatio = animationRatio,
			isDisabled = var11,
			onActivated = var5.onShareActivated
		})
		t.Music = reactModule.createElement(require(script.Parent.MusicButton), {
			LayoutOrder = var1(),
			moment = p1.moment,
			animationRatio = animationRatio,
			isDisabled = var8
		})
	end
	if p1.moment ~= nil then
		t.ContextualMenu = reactModule.createElement(contextualMenuModule, {
			isFeedMuteEnabled = var12,
			isFeedMuteButtonAnalyticsEnabled = var13,
			isDisabled = var8,
			layoutOrder = var1(),
			moment = p1.moment,
			playbackVolume = var19
		})
	end
	return reactModule.createElement(view, {
		LayoutOrder = p1.LayoutOrder,
		tag = if fFlagMomentsActionRailNarrowWidthModule then if fFlagMomentsActionRailSpacingModule then "col align-x-center gap-large size-1000-0 auto-y" else "col align-x-center size-1000-0 auto-y" elseif fFlagMomentsActionRailSpacingModule then "col align-x-center gap-large size-1200-0 auto-y" else "col size-1200-0 auto-y",
		testId = if fFlagMomentsActionRailSpacingModule or fFlagMomentsActionRailNarrowWidthModule then "moments-action-rail" else nil
	}, t)
end)