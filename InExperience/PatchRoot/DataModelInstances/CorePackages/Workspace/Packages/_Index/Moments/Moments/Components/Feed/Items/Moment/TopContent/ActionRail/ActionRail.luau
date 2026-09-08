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
local fFlagMomentsComments = sharedFlagsModule.FFlagMomentsComments
local useConfigurationModule = require(moments.Hooks.useConfiguration)
local useShareMomentModule = require(moments.Share.useShareMoment)
local var1 = if fFlagMomentsComments then require(moments.Components.Comments.Sheet) else nil
local paperAirplane = builderIconsModule.Icon.PaperAirplane
local arrowThickToRight = builderIconsModule.Icon.ArrowThickToRight
local speechBubbleAlignLeft = builderIconsModule.Icon.SpeechBubbleAlignLeft

return reactModule.memo(function(p1)
	-- upvalues: reactUtilsModule (ref), momentContextModule (ref), useShareMomentModule (ref), useSignalBinding (ref), fFlagMomentsComments (ref), useSignalState (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), useConfigurationModule (ref), useMomentsSession (ref), getMomentsPreferencesStoreModule (ref), reactModule (ref), reactionButtonModule (ref), railItemModule (ref), speechBubbleAlignLeft (ref), var1 (ref), fFlagMomentsFixFeedShareArrowIconModule (ref), arrowThickToRight (ref), paperAirplane (ref), contextualMenuModule (ref), view (ref)
	local var2 = reactUtilsModule.createNextOrder()
	local var3 = momentContextModule.useMoment()
	local store = var3.store
	local isAd = store.getData(false).kind == "ad"
	local var4 = useShareMomentModule(p1.moment)
	local animationRatio = var3.animationRatio
	local var5 = useSignalBinding(store.getShareCount)
	local var6 = if fFlagMomentsComments then useSignalBinding(store.getCommentCount) else nil
	local var7 = useSignalState(store.getIsModerated)
	local var8 = if p1.moment == nil or p1.moment.recommendationMetadata == nil then nil else p1.moment.recommendationMetadata.feedItemId
	local var9 = var7 or (fFlagMomentsPassFeedItemIdToBackendApis and (if var8 ~= nil then var8 == "" else true))
	local var10 = useConfigurationModule("feed_mute_enabled", false)
	local var11 = useConfigurationModule("feed_mute_button_analytics_enabled", false)
	local var12 = getMomentsPreferencesStoreModule(false)
	local var13 = useSignalState(useMomentsSession().getHideDetails)
	local var14 = useSignalState(var12.getFeedGlobalMute)
	local var15 = reactModule.useMemo(function()
		-- upvalues: var14 (ref), var12 (ref)
		return { isMuted = var14, toggle = var12.toggleFeedGlobalMute }
	end, { var14, var12.toggleFeedGlobalMute })
	local t = {}
	
	if not var13 then
		if not isAd then
			t.React = reactModule.createElement(reactionButtonModule, {
				animationRatio = animationRatio,
				isDisabled = var7,
				LayoutOrder = var2()
			})
			
			if fFlagMomentsComments then
				local var16 = if p1.moment ~= nil then nil else p1.moment.comments
				
				if var16 == nil or var16.viewerCanRead then
					t.Comment = reactModule.createElement(railItemModule, {
						testId = "moments-comment-button",
						LayoutOrder = var2(),
						slot = speechBubbleAlignLeft,
						count = var6,
						countIsCapped = var16 ~= nil and var16.countIsCapped == true,
						animationRatio = animationRatio,
						isDisabled = var7,
						onActivated = function()
							-- upvalues: var7 (ref), var8 (ref), var1 (copy)
							if not var7 and var8 ~= nil and (var8 ~= "" and var1 ~= nil) then
								var1.getCommentsSheetStore(false).open(var8)
							end
						end
					})
				end
			end
		end
		t.Share = reactModule.createElement(railItemModule, {
			LayoutOrder = var2(),
			slot = if fFlagMomentsFixFeedShareArrowIconModule then arrowThickToRight else paperAirplane,
			count = var5,
			animationRatio = animationRatio,
			isDisabled = var9,
			onActivated = var4.onShareActivated
		})
		t.Music = reactModule.createElement(require(script.Parent.MusicButton), {
			LayoutOrder = var2(),
			moment = p1.moment,
			animationRatio = animationRatio,
			isDisabled = var7
		})
	end
	if p1.moment ~= nil then
		t.ContextualMenu = reactModule.createElement(contextualMenuModule, {
			isFeedMuteEnabled = var10,
			isFeedMuteButtonAnalyticsEnabled = var11,
			isDisabled = var7,
			layoutOrder = var2(),
			moment = p1.moment,
			playbackVolume = var15
		})
	end
	return reactModule.createElement(view, {
		tag = "col size-1200-0 auto-y",
		LayoutOrder = p1.LayoutOrder
	}, t)
end)