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
local getFFlagMomentsMusicButtonModule = require(moments.Flags.GetFFlagMomentsMusicButton)
local useConfigurationModule = require(moments.Hooks.useConfiguration)
local useShareMomentModule = require(moments.Share.useShareMoment)
local paperAirplane = builderIconsModule.Icon.PaperAirplane
local arrowThickToRight = builderIconsModule.Icon.ArrowThickToRight

return reactModule.memo(function(p0) --[[ line: 55 | named "ActionRail" ]]
	-- upvalues: reactUtilsModule (ref), momentContextModule (ref), useShareMomentModule (ref), useSignalBinding (ref), useSignalState (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), useConfigurationModule (ref), useMomentsSession (ref), getMomentsPreferencesStoreModule (ref), reactModule (ref), reactionButtonModule (ref), railItemModule (ref), fFlagMomentsFixFeedShareArrowIconModule (ref), arrowThickToRight (ref), paperAirplane (ref), getFFlagMomentsMusicButtonModule (ref), contextualMenuModule (ref), view (ref)
	local var16 = reactUtilsModule.createNextOrder()
	local var17 = momentContextModule.useMoment()
	local store = var17.store
	local isAd = store.getData(false).kind == "ad"
	local var19 = useShareMomentModule(p0.moment)
	local animationRatio = var17.animationRatio
	local var20 = useSignalBinding(store.getShareCount)
	local var21 = useSignalState(store.getIsModerated)
	local var22 = if p0.moment == nil or p0.moment.recommendationMetadata == nil then nil else p0.moment.recommendationMetadata.feedItemId
	local var23 = var21 or (fFlagMomentsPassFeedItemIdToBackendApis and (if var22 ~= nil then var22 == "" else true))
	local var24 = useConfigurationModule("feed_mute_enabled", false)
	local var25 = useConfigurationModule("feed_mute_button_analytics_enabled", false)
	local var26 = getMomentsPreferencesStoreModule(false)
	local var27 = useSignalState(useMomentsSession().getHideDetails)
	local var28 = useSignalState(var26.getFeedGlobalMute)
	local var29 = reactModule.useMemo(function() --[[ line: 91 ]]
		-- upvalues: var28 (ref), var26 (ref)
		return { isMuted = var28, toggle = var26.toggleFeedGlobalMute }
	end, { var28, var26.toggleFeedGlobalMute })
	local t = {}
	
	if not var27 then
		if not isAd then
			t.React = reactModule.createElement(reactionButtonModule, {
				animationRatio = animationRatio,
				isDisabled = var21,
				LayoutOrder = var16()
			})
		end
		t.Share = reactModule.createElement(railItemModule, {
			LayoutOrder = var16(),
			slot = if fFlagMomentsFixFeedShareArrowIconModule then arrowThickToRight else paperAirplane,
			count = var20,
			animationRatio = animationRatio,
			isDisabled = var23,
			onActivated = var19.onShareActivated
		})
		
		if getFFlagMomentsMusicButtonModule() then
			t.Music = reactModule.createElement(require(script.Parent.MusicButton), {
				LayoutOrder = var16(),
				moment = p0.moment,
				animationRatio = animationRatio,
				isDisabled = var21
			})
		end
	end
	if p0.moment ~= nil then
		t.ContextualMenu = reactModule.createElement(contextualMenuModule, {
			isFeedMuteEnabled = var24,
			isFeedMuteButtonAnalyticsEnabled = var25,
			isDisabled = var21,
			layoutOrder = var16(),
			moment = p0.moment,
			playbackVolume = var29
		})
	end
	return reactModule.createElement(view, {
		tag = "col size-1200-0 auto-y",
		LayoutOrder = p0.LayoutOrder
	}, t)
end)