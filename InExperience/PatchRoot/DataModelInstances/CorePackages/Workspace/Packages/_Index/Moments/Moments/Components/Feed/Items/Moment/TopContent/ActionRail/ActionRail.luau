local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local ReactUtilsModule = require(Parent.ReactUtils)
local SignalsReactModule = require(Parent.SignalsReact)
local BuilderIconsModule = require(Parent.BuilderIcons)
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local SharedFlagsModule = require(Parent.SharedFlags)
local View = require(Parent.Foundation).View
local GetMomentsCapabilitiesFunction = MomentsCommonModule.Stores.GetMomentsCapabilities
local UseSignalBindingFunction = SignalsReactModule.useSignalBinding
local UseSignalStateFunction = SignalsReactModule.useSignalState
local MomentContextModule = require(script.Parent.Parent.Parent.MomentContext)
local RailItemModule = require(script.Parent.RailItem)
local ReactionButtonModule = require(script.Parent.ReactionButton)
local ContextualMenuModule = require(Moments.Components.Feed.ContextualMenu)
local UseMomentsSessionFunction = require(Moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local GetMomentsPreferencesStoreModule = require(Moments.Stores.GetMomentsPreferencesStore)
local UseCommentCapabilitiesModule = require(Moments.Components.Comments.useCommentCapabilities)
local FFlagMomentsActionRailNarrowWidthModule = require(Moments.Flags.FFlagMomentsActionRailNarrowWidth)
local FFlagMomentsActionRailSpacingModule = require(Moments.Flags.FFlagMomentsActionRailSpacing)
local FFlagMomentsCreatorAnalyticsModule = require(Moments.Flags.FFlagMomentsCreatorAnalytics)
local FFlagMomentsOptimisticProfilePending = SharedFlagsModule.FFlagMomentsOptimisticProfilePending
local FFlagMomentsPassFeedItemIdToBackendApis = SharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local FFlagMomentsComments = SharedFlagsModule.FFlagMomentsComments
local FFlagMomentsCommentsIxpEnabled = SharedFlagsModule.FFlagMomentsCommentsIxpEnabled
local FFlagMomentsReactFeatureGate = SharedFlagsModule.FFlagMomentsReactFeatureGate
local FFlagMomentsEngagementMetricsFeature = MomentsCommonModule.Flags.FFlagMomentsEngagementMetricsFeature
local UseConfigurationModule = require(Moments.Hooks.useConfiguration)
local UseShareMomentModule = require(Moments.Share.useShareMoment)
local UseCommentActionImpressionModule = require(script.Parent.useCommentActionImpression)
local ArrowThickToRight = BuilderIconsModule.Icon.ArrowThickToRight
local SpeechBubbleAlignLeft = BuilderIconsModule.Icon.SpeechBubbleAlignLeft

return ReactModule.memo(function(Frame) --[[ Line: 67 | Named "ActionRail" ]]
	-- upvalues: ReactUtilsModule (copy), MomentContextModule (copy), FFlagMomentsEngagementMetricsFeature (copy), UseSignalStateFunction (copy), GetMomentsCapabilitiesFunction (copy), FFlagMomentsReactFeatureGate (copy), UseShareMomentModule (copy), UseSignalBindingFunction (copy), FFlagMomentsComments (copy), FFlagMomentsOptimisticProfilePending (copy), FFlagMomentsPassFeedItemIdToBackendApis (copy), UseConfigurationModule (copy), UseMomentsSessionFunction (copy), GetMomentsPreferencesStoreModule (copy), UseCommentCapabilitiesModule (copy), FFlagMomentsCommentsIxpEnabled (copy), UseCommentActionImpressionModule (copy), ReactModule (copy), ReactionButtonModule (copy), RailItemModule (copy), SpeechBubbleAlignLeft (copy), ArrowThickToRight (copy), ContextualMenuModule (copy), FFlagMomentsCreatorAnalyticsModule (copy), FFlagMomentsActionRailSpacingModule (copy), FFlagMomentsActionRailNarrowWidthModule (copy), View (copy)
	local NextOrder = ReactUtilsModule.createNextOrder()
	local UseMomentResult = MomentContextModule.useMoment()
	local Store = UseMomentResult.store
	local Data = Store.getData(false)
	local IsAd = Data.kind == "ad"
	local UseSignalStateResult = if FFlagMomentsEngagementMetricsFeature then UseSignalStateFunction(GetMomentsCapabilitiesFunction(false).getIsEngagementMetricsEnabled) else nil
	local NoFFlagMomentsReactFeatureGate = not FFlagMomentsReactFeatureGate or UseSignalStateFunction(GetMomentsCapabilitiesFunction(false).getCanReactToMoments)
	local UseShareMomentModuleResult = UseShareMomentModule(Frame.moment)
	local AnimationRatio = UseMomentResult.animationRatio
	local UseSignalBindingResult = UseSignalBindingFunction(Store.getShareCount)
	local UseSignalBindingResult1 = if FFlagMomentsComments then UseSignalBindingFunction(Store.getCommentCount) else nil
	local UseSignalStateResult1 = UseSignalStateFunction(Store.getIsModerated)
	local IsIsPending: boolean = FFlagMomentsOptimisticProfilePending and Data.isPending == true
	local UseSignalStateResult1_1 = UseSignalStateResult1 or IsIsPending
	local FeedItemId = if Frame.moment == nil or Frame.moment.recommendationMetadata == nil then nil else Frame.moment.recommendationMetadata.feedItemId
	local UseSignalStateResult1_1_1 = UseSignalStateResult1_1 or FFlagMomentsPassFeedItemIdToBackendApis and (FeedItemId == nil or FeedItemId == "")
	local FeedMuteEnabled = UseConfigurationModule("feed_mute_enabled", false)
	local FeedMuteButtonAnalyticsEnabled = UseConfigurationModule("feed_mute_button_analytics_enabled", false)
	local UseMomentsSessionResult = UseMomentsSessionFunction()
	local MomentsPreferencesStoreModule = GetMomentsPreferencesStoreModule(false)
	local UseSignalStateResult2 = UseSignalStateFunction(UseMomentsSessionResult.getHideDetails)
	local Comments = if Frame.moment == nil then nil else Frame.moment.comments
	local NoComments = UseCommentCapabilitiesModule().canRead and (not UseSignalStateResult2 and (not IsAd and (Comments == nil or Comments.viewerCanRead)))
	
	if FFlagMomentsComments or FFlagMomentsCommentsIxpEnabled then
		UseCommentActionImpressionModule(NoComments and Frame.moment ~= nil)
	end
	local UseSignalStateResult3 = UseSignalStateFunction(MomentsPreferencesStoreModule.getFeedGlobalMute)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 130 ]]
		-- upvalues: UseSignalStateResult3 (copy), MomentsPreferencesStoreModule (copy)
		return {
			isMuted = UseSignalStateResult3,
			toggle = MomentsPreferencesStoreModule.toggleFeedGlobalMute
		}
	end, {
		UseSignalStateResult3,
		MomentsPreferencesStoreModule.toggleFeedGlobalMute
	})
	local t = {}
	
	if NoFFlagMomentsReactFeatureGate and not UseSignalStateResult2 and not IsAd then
		t.React = ReactModule.createElement(ReactionButtonModule, {
			animationRatio = AnimationRatio,
			isDisabled = UseSignalStateResult1_1,
			LayoutOrder = NextOrder()
		})
	end
	if FFlagMomentsComments and NoComments then
		t.Comment = ReactModule.createElement(RailItemModule, {
			testId = "moments-comment-button",
			LayoutOrder = NextOrder(),
			slot = SpeechBubbleAlignLeft,
			count = if FFlagMomentsEngagementMetricsFeature and not UseSignalStateResult then nil else UseSignalBindingResult1,
			countIsCapped = Comments ~= nil and Comments.countIsCapped == true,
			animationRatio = AnimationRatio,
			isDisabled = UseSignalStateResult1_1,
			onActivated = function() --[[ Line: 157 ]]
				-- upvalues: UseSignalStateResult1_1 (copy), FeedItemId (copy), Frame (copy)
				if not UseSignalStateResult1_1 and FeedItemId ~= nil and FeedItemId ~= "" and Frame.onOpenComments ~= nil then
					Frame.onOpenComments()
				end
			end
		})
	end
	if not UseSignalStateResult2 then
		t.Share = ReactModule.createElement(RailItemModule, {
			LayoutOrder = NextOrder(),
			slot = ArrowThickToRight,
			count = if FFlagMomentsEngagementMetricsFeature and not UseSignalStateResult then nil else UseSignalBindingResult,
			animationRatio = AnimationRatio,
			isDisabled = UseSignalStateResult1_1_1,
			onActivated = UseShareMomentModuleResult.onShareActivated
		})
		t.Music = ReactModule.createElement(require(script.Parent.MusicButton), {
			LayoutOrder = NextOrder(),
			moment = Frame.moment,
			animationRatio = AnimationRatio,
			isDisabled = UseSignalStateResult1
		})
	end
	if Frame.moment ~= nil then
		t.ContextualMenu = ReactModule.createElement(ContextualMenuModule, {
			isFeedMuteEnabled = FeedMuteEnabled,
			isFeedMuteButtonAnalyticsEnabled = FeedMuteButtonAnalyticsEnabled,
			isDisabled = UseSignalStateResult1,
			layoutOrder = NextOrder(),
			moment = Frame.moment,
			momentStore = if FFlagMomentsCreatorAnalyticsModule then Store else nil,
			playbackVolume = UseMemoResult
		})
	end
	return ReactModule.createElement(View, {
		LayoutOrder = Frame.LayoutOrder,
		tag = if FFlagMomentsActionRailNarrowWidthModule then if FFlagMomentsActionRailSpacingModule then "col align-x-center gap-large size-1000-0 auto-y" else "col align-x-center size-1000-0 auto-y" elseif FFlagMomentsActionRailSpacingModule then "col align-x-center gap-large size-1200-0 auto-y" else "col size-1200-0 auto-y",
		testId = if FFlagMomentsActionRailSpacingModule or FFlagMomentsActionRailNarrowWidthModule then "moments-action-rail" else nil
	}, t)
end)