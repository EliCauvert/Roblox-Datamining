local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local signalsReactModule = require(parent.SignalsReact)
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local _ = require(parent.MomentsTypes)
local sharedFlagsModule = require(parent.SharedFlags)
local view = foundationModule.View
local useSignalBinding = signalsReactModule.useSignalBinding
local useSignalState = signalsReactModule.useSignalState
local momentContextModule = require(script.Parent.Parent.Parent.MomentContext)
local railItemModule = require(script.Parent.RailItem)
local reactionButtonModule = require(script.Parent.ReactionButton)
local contextualMenuModule = require(moments.Components.Feed.ContextualMenu)
local useMomentsSession = require(moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)
local fFlagMomentsFixFeedShareArrowIconModule = require(moments.Flags.FFlagMomentsFixFeedShareArrowIcon)
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local useConfigurationModule = require(moments.Hooks.useConfiguration)
local useShareMomentModule = require(moments.Share.useShareMoment)
local paperAirplane = builderIconsModule.Icon.PaperAirplane
local arrowThickToRight = builderIconsModule.Icon.ArrowThickToRight

return reactModule.memo(function(p0)
	-- upvalues: reactUtilsModule (ref), momentContextModule (ref), useShareMomentModule (ref), useSignalBinding (ref), useSignalState (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), useConfigurationModule (ref), useMomentsSession (ref), getMomentsPreferencesStoreModule (ref), reactModule (ref), reactionButtonModule (ref), railItemModule (ref), fFlagMomentsFixFeedShareArrowIconModule (ref), arrowThickToRight (ref), paperAirplane (ref), contextualMenuModule (ref), view (ref)
	local var15 = reactUtilsModule.createNextOrder()
	local var16 = momentContextModule.useMoment()
	local store = var16.store
	local isAd = store.getData(false).kind == "ad"
	local var18 = useShareMomentModule(p0.moment)
	local animationRatio = var16.animationRatio
	local var19 = useSignalBinding(store.getShareCount)
	local var20 = useSignalState(store.getIsModerated)
	local var21 = if p0.moment == nil or p0.moment.recommendationMetadata == nil then nil else p0.moment.recommendationMetadata.feedItemId
	local var22 = var20 or (fFlagMomentsPassFeedItemIdToBackendApis and (if var21 ~= nil then var21 == "" else true))
	local var23 = useConfigurationModule("feed_mute_enabled", false)
	local var24 = useConfigurationModule("feed_mute_button_analytics_enabled", false)
	local var25 = getMomentsPreferencesStoreModule(false)
	local var26 = useSignalState(useMomentsSession().getHideDetails)
	local var27 = useSignalState(var25.getFeedGlobalMute)
	local var28 = reactModule.useMemo(function()
		-- upvalues: var27 (ref), var25 (ref)
		return { isMuted = var27, toggle = var25.toggleFeedGlobalMute }
	end, { var27, var25.toggleFeedGlobalMute })
	local t = {}
	
	if not var26 then
		if not isAd then
			t.React = reactModule.createElement(reactionButtonModule, {
				animationRatio = animationRatio,
				isDisabled = var20,
				LayoutOrder = var15()
			})
		end
		t.Share = reactModule.createElement(railItemModule, {
			LayoutOrder = var15(),
			slot = if fFlagMomentsFixFeedShareArrowIconModule then arrowThickToRight else paperAirplane,
			count = var19,
			animationRatio = animationRatio,
			isDisabled = var22,
			onActivated = var18.onShareActivated
		})
		t.Music = reactModule.createElement(require(script.Parent.MusicButton), {
			LayoutOrder = var15(),
			moment = p0.moment,
			animationRatio = animationRatio,
			isDisabled = var20
		})
	end
	if p0.moment ~= nil then
		t.ContextualMenu = reactModule.createElement(contextualMenuModule, {
			isFeedMuteEnabled = var23,
			isFeedMuteButtonAnalyticsEnabled = var24,
			isDisabled = var20,
			layoutOrder = var15(),
			moment = p0.moment,
			playbackVolume = var28
		})
	end
	return reactModule.createElement(view, {
		tag = "col size-1200-0 auto-y",
		LayoutOrder = p0.LayoutOrder
	}, t)
end)