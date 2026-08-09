local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local signalsReactModule = require(parent.SignalsReact)
local builderIconsModule = require(parent.BuilderIcons)
local _ = require(parent.MomentsTypes)
local view = require(parent.Foundation).View
local useSignalBinding = signalsReactModule.useSignalBinding
local useSignalState = signalsReactModule.useSignalState
local momentContextModule = require(script.Parent.Parent.Parent.MomentContext)
local railItemModule = require(script.Parent.RailItem)
local reactionButtonModule = require(script.Parent.ReactionButton)
local contextualMenuModule = require(moments.Components.Feed.ContextualMenu)
local useMomentsSession = require(moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)
local getFFlagMomentsMusicButtonModule = require(moments.Flags.GetFFlagMomentsMusicButton)
local useConfigurationModule = require(moments.Hooks.useConfiguration)
local useShareMomentModule = require(moments.Share.useShareMoment)
local paperAirplane = builderIconsModule.Icon.PaperAirplane

return reactModule.memo(function(p0) --[[ line: 51 | named "ActionRail" ]]
	-- upvalues: reactUtilsModule (ref), momentContextModule (ref), useShareMomentModule (ref), useSignalBinding (ref), useSignalState (ref), useConfigurationModule (ref), useMomentsSession (ref), getMomentsPreferencesStoreModule (ref), reactModule (ref), reactionButtonModule (ref), railItemModule (ref), paperAirplane (ref), getFFlagMomentsMusicButtonModule (ref), contextualMenuModule (ref), view (ref)
	local var13 = reactUtilsModule.createNextOrder()
	local var14 = momentContextModule.useMoment()
	local store = var14.store
	local isAd = store.getData(false).kind == "ad"
	local var16 = useShareMomentModule(p0.moment)
	local animationRatio = var14.animationRatio
	local var17 = useSignalBinding(store.getShareCount)
	local var18 = useSignalState(store.getIsModerated)
	local var19 = useConfigurationModule("feed_mute_enabled", false)
	local var20 = useConfigurationModule("feed_mute_button_analytics_enabled", false)
	local var21 = getMomentsPreferencesStoreModule(false)
	local var22 = useSignalState(useMomentsSession().getHideDetails)
	local var23 = useSignalState(var21.getFeedGlobalMute)
	local var24 = reactModule.useMemo(function() --[[ line: 80 ]]
		-- upvalues: var23 (ref), var21 (ref)
		return { isMuted = var23, toggle = var21.toggleFeedGlobalMute }
	end, { var23, var21.toggleFeedGlobalMute })
	local t = {}
	
	if not var22 then
		if not isAd then
			t.React = reactModule.createElement(reactionButtonModule, {
				animationRatio = animationRatio,
				isDisabled = var18,
				LayoutOrder = var13()
			})
		end
		t.Share = reactModule.createElement(railItemModule, {
			LayoutOrder = var13(),
			slot = paperAirplane,
			count = var17,
			animationRatio = animationRatio,
			isDisabled = var18,
			onActivated = var16.onShareActivated
		})
		
		if getFFlagMomentsMusicButtonModule() then
			t.Music = reactModule.createElement(require(script.Parent.MusicButton), {
				LayoutOrder = var13(),
				moment = p0.moment,
				animationRatio = animationRatio,
				isDisabled = var18
			})
		end
	end
	if p0.moment ~= nil then
		t.ContextualMenu = reactModule.createElement(contextualMenuModule, {
			isFeedMuteEnabled = var19,
			isFeedMuteButtonAnalyticsEnabled = var20,
			isDisabled = var18,
			layoutOrder = var13(),
			moment = p0.moment,
			playbackVolume = var24
		})
	end
	return reactModule.createElement(view, {
		tag = "col size-1200-0 auto-y",
		LayoutOrder = p0.LayoutOrder
	}, t)
end)