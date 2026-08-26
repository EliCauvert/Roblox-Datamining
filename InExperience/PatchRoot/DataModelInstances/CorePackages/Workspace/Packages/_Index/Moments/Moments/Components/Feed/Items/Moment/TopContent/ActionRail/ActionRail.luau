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

return reactModule.memo(function(p1)
	-- upvalues: reactUtilsModule (ref), momentContextModule (ref), useShareMomentModule (ref), useSignalBinding (ref), useSignalState (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), useConfigurationModule (ref), useMomentsSession (ref), getMomentsPreferencesStoreModule (ref), reactModule (ref), reactionButtonModule (ref), railItemModule (ref), fFlagMomentsFixFeedShareArrowIconModule (ref), arrowThickToRight (ref), paperAirplane (ref), contextualMenuModule (ref), view (ref)
	local var1 = reactUtilsModule.createNextOrder()
	local var2 = momentContextModule.useMoment()
	local store = var2.store
	local isAd = store.getData(false).kind == "ad"
	local var3 = useShareMomentModule(p1.moment)
	local animationRatio = var2.animationRatio
	local var4 = useSignalBinding(store.getShareCount)
	local var5 = useSignalState(store.getIsModerated)
	local var6 = if p1.moment == nil or p1.moment.recommendationMetadata == nil then nil else p1.moment.recommendationMetadata.feedItemId
	local var7 = var5 or (fFlagMomentsPassFeedItemIdToBackendApis and (if var6 ~= nil then var6 == "" else true))
	local var8 = useConfigurationModule("feed_mute_enabled", false)
	local var9 = useConfigurationModule("feed_mute_button_analytics_enabled", false)
	local var10 = getMomentsPreferencesStoreModule(false)
	local var11 = useSignalState(useMomentsSession().getHideDetails)
	local var12 = useSignalState(var10.getFeedGlobalMute)
	local var13 = reactModule.useMemo(function()
		-- upvalues: var12 (ref), var10 (ref)
		return { isMuted = var12, toggle = var10.toggleFeedGlobalMute }
	end, { var12, var10.toggleFeedGlobalMute })
	local t = {}
	
	if not var11 then
		if not isAd then
			t.React = reactModule.createElement(reactionButtonModule, {
				animationRatio = animationRatio,
				isDisabled = var5,
				LayoutOrder = var1()
			})
		end
		t.Share = reactModule.createElement(railItemModule, {
			LayoutOrder = var1(),
			slot = if fFlagMomentsFixFeedShareArrowIconModule then arrowThickToRight else paperAirplane,
			count = var4,
			animationRatio = animationRatio,
			isDisabled = var7,
			onActivated = var3.onShareActivated
		})
		t.Music = reactModule.createElement(require(script.Parent.MusicButton), {
			LayoutOrder = var1(),
			moment = p1.moment,
			animationRatio = animationRatio,
			isDisabled = var5
		})
	end
	if p1.moment ~= nil then
		t.ContextualMenu = reactModule.createElement(contextualMenuModule, {
			isFeedMuteEnabled = var8,
			isFeedMuteButtonAnalyticsEnabled = var9,
			isDisabled = var5,
			layoutOrder = var1(),
			moment = p1.moment,
			playbackVolume = var13
		})
	end
	return reactModule.createElement(view, {
		tag = "col size-1200-0 auto-y",
		LayoutOrder = p1.LayoutOrder
	}, t)
end)