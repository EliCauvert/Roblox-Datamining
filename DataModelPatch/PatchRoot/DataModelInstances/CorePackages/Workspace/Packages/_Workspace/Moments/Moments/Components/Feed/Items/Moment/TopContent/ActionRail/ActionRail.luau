local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local ReactUtilsModule = require(Parent.ReactUtils)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(Parent.MomentsTypes)
local View = require(Parent.Foundation).View
local UseSignalBindingFunction = SignalsReactModule.useSignalBinding
local UseSignalStateFunction = SignalsReactModule.useSignalState
local MomentContextModule = require(script.Parent.Parent.Parent.MomentContext)
local RailItemModule = require(script.Parent.RailItem)
local ReactionButtonModule = require(script.Parent.ReactionButton)
local ContextualMenuModule = require(Moments.Components.Feed.ContextualMenu)
local UseMomentsSessionFunction = require(Moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local GetMomentsPreferencesStoreModule = require(Moments.Stores.GetMomentsPreferencesStore)
local GetFFlagMomentsMusicButtonModule = require(Moments.Flags.GetFFlagMomentsMusicButton)
local UseConfigurationModule = require(Moments.Hooks.useConfiguration)
local UseShareMomentModule = require(Moments.Share.useShareMoment)
local PaperAirplane = require(Parent.BuilderIcons).Icon.PaperAirplane

return ReactModule.memo(function(Frame)
	-- upvalues: ReactUtilsModule (copy), MomentContextModule (copy), UseShareMomentModule (copy), UseSignalBindingFunction (copy), UseSignalStateFunction (copy), UseConfigurationModule (copy), UseMomentsSessionFunction (copy), GetMomentsPreferencesStoreModule (copy), ReactModule (copy), ReactionButtonModule (copy), RailItemModule (copy), PaperAirplane (copy), GetFFlagMomentsMusicButtonModule (copy), ContextualMenuModule (copy), View (copy)
	local NextOrder = ReactUtilsModule.createNextOrder()
	local UseMomentResult = MomentContextModule.useMoment()
	local Store = UseMomentResult.store
	local IsAd = Store.getData(false).kind == "ad"
	local UseShareMomentModuleResult = UseShareMomentModule(Frame.moment)
	local AnimationRatio = UseMomentResult.animationRatio
	local UseSignalBindingResult = UseSignalBindingFunction(Store.getShareCount)
	local UseSignalStateResult = UseSignalStateFunction(Store.getIsModerated)
	local FeedMuteEnabled = UseConfigurationModule("feed_mute_enabled", false)
	local FeedMuteButtonAnalyticsEnabled = UseConfigurationModule("feed_mute_button_analytics_enabled", false)
	local UseMomentsSessionResult = UseMomentsSessionFunction()
	local MomentsPreferencesStoreModule = GetMomentsPreferencesStoreModule(false)
	local UseSignalStateResult1 = UseSignalStateFunction(UseMomentsSessionResult.getHideDetails)
	local UseSignalStateResult2 = UseSignalStateFunction(MomentsPreferencesStoreModule.getFeedGlobalMute)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult2 (copy), MomentsPreferencesStoreModule (copy)
		return {
			isMuted = UseSignalStateResult2,
			toggle = MomentsPreferencesStoreModule.toggleFeedGlobalMute
		}
	end, {
		UseSignalStateResult2,
		MomentsPreferencesStoreModule.toggleFeedGlobalMute
	})
	local t = {}
	
	if not UseSignalStateResult1 then
		if not IsAd then
			t.React = ReactModule.createElement(ReactionButtonModule, {
				animationRatio = AnimationRatio,
				isDisabled = UseSignalStateResult,
				LayoutOrder = NextOrder()
			})
		end
		t.Share = ReactModule.createElement(RailItemModule, {
			LayoutOrder = NextOrder(),
			slot = PaperAirplane,
			count = UseSignalBindingResult,
			animationRatio = AnimationRatio,
			isDisabled = UseSignalStateResult,
			onActivated = UseShareMomentModuleResult.onShareActivated
		})
		
		if GetFFlagMomentsMusicButtonModule() then
			t.Music = ReactModule.createElement(require(script.Parent.MusicButton), {
				LayoutOrder = NextOrder(),
				moment = Frame.moment,
				animationRatio = AnimationRatio,
				isDisabled = UseSignalStateResult
			})
		end
	end
	if Frame.moment ~= nil then
		t.ContextualMenu = ReactModule.createElement(ContextualMenuModule, {
			isFeedMuteEnabled = FeedMuteEnabled,
			isFeedMuteButtonAnalyticsEnabled = FeedMuteButtonAnalyticsEnabled,
			isDisabled = UseSignalStateResult,
			layoutOrder = NextOrder(),
			moment = Frame.moment,
			playbackVolume = UseMemoResult
		})
	end
	return ReactModule.createElement(View, {
		tag = "col size-1200-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, t)
end)