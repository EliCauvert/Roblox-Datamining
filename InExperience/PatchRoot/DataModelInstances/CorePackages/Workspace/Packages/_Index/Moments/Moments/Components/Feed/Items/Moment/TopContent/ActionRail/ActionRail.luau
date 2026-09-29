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
local fFlagMomentsActionRailSpacingModule = require(moments.Flags.FFlagMomentsActionRailSpacing)
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local fFlagMomentsComments = sharedFlagsModule.FFlagMomentsComments
local fFlagMomentsEngagementMetricsFeature = momentsCommonModule.Flags.FFlagMomentsEngagementMetricsFeature
local useConfigurationModule = require(moments.Hooks.useConfiguration)
local useShareMomentModule = require(moments.Share.useShareMoment)
local var1 = if fFlagMomentsComments then require(moments.Components.Comments.useCommentsRecommendationEvents) else nil
local arrowThickToRight = builderIconsModule.Icon.ArrowThickToRight
local speechBubbleAlignLeft = builderIconsModule.Icon.SpeechBubbleAlignLeft

return reactModule.memo(function(p1)
	-- upvalues: reactUtilsModule (ref), momentContextModule (ref), fFlagMomentsEngagementMetricsFeature (ref), sharedFlagsModule (ref), useSignalState (ref), getMomentsCapabilities (ref), useShareMomentModule (ref), useSignalBinding (ref), fFlagMomentsComments (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), useConfigurationModule (ref), useMomentsSession (ref), var1 (ref), getMomentsPreferencesStoreModule (ref), reactModule (ref), reactionButtonModule (ref), railItemModule (ref), speechBubbleAlignLeft (ref), arrowThickToRight (ref), contextualMenuModule (ref), fFlagMomentsActionRailSpacingModule (ref), view (ref)
	local var2 = reactUtilsModule.createNextOrder()
	local var3 = momentContextModule.useMoment()
	local store = var3.store
	local isAd = store.getData(false).kind == "ad"
	local var4 = if fFlagMomentsEngagementMetricsFeature and sharedFlagsModule.FFlagGuacMomentsFeatureList then useSignalState(getMomentsCapabilities(false).getIsEngagementMetricsEnabled) else nil
	local var5 = useShareMomentModule(p1.moment)
	local animationRatio = var3.animationRatio
	local var6 = useSignalBinding(store.getShareCount)
	local var7 = if fFlagMomentsComments then useSignalBinding(store.getCommentCount) else nil
	local var8 = useSignalState(store.getIsModerated)
	local var9 = if p1.moment == nil or p1.moment.recommendationMetadata == nil then nil else p1.moment.recommendationMetadata.feedItemId
	local var10 = var8 or (fFlagMomentsPassFeedItemIdToBackendApis and (if var9 ~= nil then var9 == "" else true))
	local var11 = useConfigurationModule("feed_mute_enabled", false)
	local var12 = useConfigurationModule("feed_mute_button_analytics_enabled", false)
	local var13 = useMomentsSession()
	local var14 = if fFlagMomentsComments and var1 ~= nil then var1(if p1.moment ~= nil then nil else p1.moment.recommendationMetadata, var13.getMomentsSessionId) else nil
	local var15 = getMomentsPreferencesStoreModule(false)
	local var16 = useSignalState(var13.getHideDetails)
	local var17 = useSignalState(var15.getFeedGlobalMute)
	local var18 = reactModule.useMemo(function()
		-- upvalues: var17 (ref), var15 (ref)
		return { isMuted = var17, toggle = var15.toggleFeedGlobalMute }
	end, { var17, var15.toggleFeedGlobalMute })
	local t = {}
	
	if not var16 then
		local var19
		if not isAd then
			t.React = reactModule.createElement(reactionButtonModule, {
				animationRatio = animationRatio,
				isDisabled = var8,
				LayoutOrder = var2()
			})
			
			if fFlagMomentsComments then
				var19 = if p1.moment ~= nil then nil else p1.moment.comments
				
				if var19 == nil or var19.viewerCanRead then
					t.Comment = reactModule.createElement(railItemModule, {
						testId = "moments-comment-button",
						LayoutOrder = var2(),
						slot = speechBubbleAlignLeft,
						count = if fFlagMomentsEngagementMetricsFeature and sharedFlagsModule.FFlagGuacMomentsFeatureList and not var4 then nil else var7,
						countIsCapped = var19 ~= nil and var19.countIsCapped == true,
						animationRatio = animationRatio,
						isDisabled = var8,
						onActivated = function()
							-- upvalues: var8 (ref), var9 (ref), var14 (write)
							if not var8 and var9 ~= nil and (var9 ~= "" and var14 ~= nil) then
								var14()
							end
						end
					})
				end
			end
		end
		var19 = reactModule.createElement
		t.Share = var19(railItemModule, {
			LayoutOrder = var2(),
			slot = arrowThickToRight,
			count = if fFlagMomentsEngagementMetricsFeature and sharedFlagsModule.FFlagGuacMomentsFeatureList and not var4 then nil else var6,
			animationRatio = animationRatio,
			isDisabled = var10,
			onActivated = var5.onShareActivated
		})
		t.Music = reactModule.createElement(require(script.Parent.MusicButton), {
			LayoutOrder = var2(),
			moment = p1.moment,
			animationRatio = animationRatio,
			isDisabled = var8
		})
	end
	if p1.moment ~= nil then
		t.ContextualMenu = reactModule.createElement(contextualMenuModule, {
			isFeedMuteEnabled = var11,
			isFeedMuteButtonAnalyticsEnabled = var12,
			isDisabled = var8,
			layoutOrder = var2(),
			moment = p1.moment,
			playbackVolume = var18
		})
	end
	return reactModule.createElement(view, {
		LayoutOrder = p1.LayoutOrder,
		tag = if fFlagMomentsActionRailSpacingModule then "col align-x-center gap-large size-1200-0 auto-y" else "col size-1200-0 auto-y",
		testId = if fFlagMomentsActionRailSpacingModule then "moments-action-rail" else nil
	}, t)
end)