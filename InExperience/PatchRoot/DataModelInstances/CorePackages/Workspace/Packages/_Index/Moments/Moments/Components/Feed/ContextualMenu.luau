local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local playersService = game:GetService("Players")
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local speaker = builderIconsModule.Icon.Speaker
local speakerSlash = builderIconsModule.Icon.SpeakerSlash
local threeDotsVertical = builderIconsModule.Icon.ThreeDotsVertical
local iconButton = foundationModule.IconButton
local menu = foundationModule.Menu
local view = foundationModule.View
local useLocalization = localizationModule.Hooks.useLocalization
local useToggleState = momentsCommonModule.Hooks.useToggleState
local checkDebugAccessModule = require(moments.Utils.checkDebugAccess)
local getPostFeedItemIdModule = require(moments.Utils.getPostFeedItemId)
local fireAnalyticsEvent = momentsCommonModule.Analytics.fireAnalyticsEvent
local reportMomentsEngagement = momentsCommonModule.Analytics.reportMomentsEngagement
local eventNames = momentsCommonModule.Analytics.EventNames
local reportModalCovering = momentsCommonModule.Media.reportModalCovering
local makeFeedActionFieldsModule = require(moments.Analytics.makeFeedActionFields)
local makeRecommendationAttributionModule = require(moments.Analytics.makeRecommendationAttribution)
local reportMomentModule = require(moments.Moderation.reportMoment)
local useFeed = require(moments.Components.Feed.FeedContext).useFeed
local useMomentsSession = require(moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)
local getModeratedItemsStoreModule = require(moments.Stores.GetModeratedItemsStore)
local getToastStoreModule = require(moments.Stores.GetToastStore)
local signalActionTypeModule = require(moments.Enums.SignalActionType)
local fFlagMomentsOptimisticProfilePending = sharedFlagsModule.FFlagMomentsOptimisticProfilePending
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local fFlagMomentsServeEDPVideos = sharedFlagsModule.FFlagMomentsServeEDPVideos
local momentsUseSmallOverflowMenu = game:DefineFastFlag("MomentsUseSmallOverflowMenu", false)
local momentsReportButtonAnalytics = game:DefineFastFlag("MomentsReportButtonAnalytics", false)
local reportMomentDialogModule = require(moments.Components.Feed.ReportMomentDialog)
local ipReportConfirmationDialogModule = require(moments.Components.Feed.IpReportConfirmationDialog)
local useMomentsHost = require(moments.MomentsHostContext).useMomentsHost
local localPlayer = playersService.LocalPlayer
local t = {
	showDetails = "Feature.Moments.Action.ShowDetails",
	hideDetails = "Feature.Moments.Action.Hide",
	expand = "Feature.Moments.Action.Expand",
	minimize = "Feature.Moments.Action.Minimize",
	report = "Feature.Moments.Action.Report",
	delete = "Feature.Moments.Action.Delete",
	reportSubmittedTitle = "Feature.Moments.Label.ReportSubmittedTitle",
	reportSubmittedBody = "Feature.Moments.Label.ReportSubmittedBody"
}

return function(p1)
	-- upvalues: useLocalization (ref), t (ref), useFeed (ref), fFlagMomentsServeEDPVideos (ref), useMomentsHost (ref), useToggleState (ref), reactModule (ref), useMomentsSession (ref), getMomentsPreferencesStoreModule (ref), getModeratedItemsStoreModule (ref), getToastStoreModule (ref), signalsReactModule (ref), fireAnalyticsEvent (ref), eventNames (ref), checkDebugAccessModule (ref), reportMomentModule (ref), makeRecommendationAttributionModule (ref), signalActionTypeModule (ref), makeFeedActionFieldsModule (ref), momentsReportButtonAnalytics (ref), reportMomentsEngagement (ref), getPostFeedItemIdModule (ref), reportModalCovering (ref), moments (ref), localPlayer (ref), foundationModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), fFlagMomentsOptimisticProfilePending (ref), menu (ref), momentsUseSmallOverflowMenu (ref), iconButton (ref), threeDotsVertical (ref), reportMomentDialogModule (ref), ipReportConfirmationDialogModule (ref), view (ref), speakerSlash (ref), speaker (ref)
	local var1 = useLocalization(t)
	local var2 = useFeed()
	local var3 = fFlagMomentsServeEDPVideos and p1.moment.entityType == "edpVideo"
	local openMomentsFeedReport = useMomentsHost().openMomentsFeedReport
	local var4 = useToggleState()
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(false)
	local var9, var10 = reactModule.useState("------")
	local var11 = reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		if var4.enabled then
			var4.disable()
			
			return
		end
		var4.enable()
	end, { var4.enabled, var4.enable, var4.disable })
	local var12 = useMomentsSession()
	local var13 = getMomentsPreferencesStoreModule(false)
	local var14 = getModeratedItemsStoreModule(false)
	local var15 = getToastStoreModule(false)
	local var16 = signalsReactModule.useSignalState(var12.getHideDetails)
	local var17 = signalsReactModule.useSignalState(var13.getMinimized)
	local var18 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var12 (ref), fireAnalyticsEvent (copy), eventNames (copy), p1 (ref)
		var4.disable()
		var12.toggleFeedDetailVisibility()
		fireAnalyticsEvent(eventNames.FeedHideDetailsButtonPressed, { momentId = p1.moment.momentId })
	end, {
		p1.moment,
		var4.disable,
		var12.toggleFeedDetailVisibility
	})
	local var19 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var13 (ref), fireAnalyticsEvent (copy), eventNames (copy), p1 (ref)
		var4.disable()
		var13.toggleFeedScaleType()
		fireAnalyticsEvent(eventNames.FeedMinimizeButtonPressed, { momentId = p1.moment.momentId })
	end, { p1.moment, var4.disable, var13.toggleFeedScaleType })
	local var20 = reactModule.useCallback(function()
		-- upvalues: checkDebugAccessModule (copy), var13 (ref), var4 (ref)
		if checkDebugAccessModule() then
			var13.toggleFeedDebugMode()
		end
		var4.disable()
	end, { var4.disable, var13.toggleFeedDebugMode })
	local var21 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: p1 (ref), reportMomentModule (copy), makeRecommendationAttributionModule (copy), var2 (ref), signalActionTypeModule (copy), makeFeedActionFieldsModule (copy), fireAnalyticsEvent (copy), eventNames (copy), var14 (ref), var15 (ref), var1 (ref)
		if not p1.moment then
			return nil
		end
		local var22 = true
		local var23 = true
		local var24 = nil
		
		if not p4 then
			local ok, status, var25 = pcall(function()
				-- upvalues: reportMomentModule (copy), p1 (copy), p2 (ref)
				return reportMomentModule(p1.moment.recommendationMetadata.feedItemId, p2):await()
			end)
			var22 = ok
			var23 = status
			var24 = var25
		end
		local recommendationMetadata = p1.moment.recommendationMetadata
		local var26 = makeRecommendationAttributionModule(recommendationMetadata)
		
		if var26 then
			local ok, status = pcall(function()
				-- upvalues: var2 (copy), signalActionTypeModule (copy), var26 (ref)
				var2.logAction(signalActionTypeModule.Report, var26, {})
			end)
			
			if not ok then
				warn("Failed to log action event", status)
			end
		end
		local var27 = makeFeedActionFieldsModule(p1.moment.momentId, recommendationMetadata and recommendationMetadata.feedItemId, recommendationMetadata and recommendationMetadata.tracingId, "report")
		
		if var27 then
			fireAnalyticsEvent(eventNames.FeedAbuseReported, var27)
		end
		if not p3 then
			var14.markReported(p1.moment.momentId)
			var2.removeCurrentItem()
			var15.triggerToast({
				title = var1.reportSubmittedTitle,
				text = var1.reportSubmittedBody
			})
		end
		return if var22 and var23 and type(var24) == "table" then var24.reportCode else nil
	end, {
		p1.moment, var2.logAction, var2.removeCurrentItem, var14.markReported,
		var15.triggerToast, var1
	})
	local var22 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), momentsReportButtonAnalytics (copy), reportMomentsEngagement (copy), getPostFeedItemIdModule (copy), p1 (ref), fFlagMomentsServeEDPVideos (copy), var3 (ref), openMomentsFeedReport (ref), reportModalCovering (copy), var21 (ref), var10 (ref), var8 (ref), moments (copy), var6 (ref)
		var4.disable()
		
		if momentsReportButtonAnalytics then
			reportMomentsEngagement("report_click")
		end
		local var23 = if fFlagMomentsServeEDPVideos and var3 then p1.moment.recommendationMetadata.feedItemId else getPostFeedItemIdModule(p1.moment)
		
		if var23 and openMomentsFeedReport then
			reportModalCovering.setCovering(true)
			openMomentsFeedReport({
				feedItemId = var23,
				momentId = p1.moment.momentId,
				onSubmit = function()
					-- upvalues: var21 (copy)
					var21(nil, false, true)
				end,
				onClose = function()
					-- upvalues: reportModalCovering (copy)
					reportModalCovering.setCovering(false)
				end,
				onIpReportCode = function(p2)
					-- upvalues: var21 (copy), var10 (copy), var8 (copy)
					var21(nil, true, true)
					var10(if p2 and p2 ~= "" then p2 else "------")
					var8(true)
				end,
				onCustomSubmit = if fFlagMomentsServeEDPVideos and var3 then require(moments.Moderation.reportEdpVideo) else nil
			})
			
			return
		elseif fFlagMomentsServeEDPVideos and var3 then
			return
		end
		var6(true)
	end, {
		var4.disable,
		var21,
		openMomentsFeedReport,
		p1.moment,
		if fFlagMomentsServeEDPVideos then var3 else false
	})
	local var23 = reactModule.useCallback(function()
		-- upvalues: var6 (ref)
		var6(false)
	end, {})
	local var24 = reactModule.useCallback(function()
		-- upvalues: var8 (ref)
		if var8 then
			var8(false)
		end
	end, {})
	local var25 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var12 (ref), p1 (ref)
		var4.disable()
		var12.requestDeletion(p1.moment.momentId, p1.moment.recommendationMetadata and p1.moment.recommendationMetadata.feedItemId, if p1.moment.recommendationMetadata then p1.moment.recommendationMetadata.tracingId else nil)
	end, { p1.moment, var4.disable, var12.requestDeletion })
	local var26 = if p1.isFeedMuteButtonAnalyticsEnabled then reactModule.useCallback(function()
		-- upvalues: p1 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if p1.isDisabled then
			return
		end
		fireAnalyticsEvent(if p1.playbackVolume.isMuted then eventNames.FeedUnmuteButtonPressed else eventNames.FeedMuteButtonPressed, { momentId = p1.moment.momentId })
		p1.playbackVolume.toggle()
	end, { p1.isDisabled, p1.playbackVolume, p1.moment }) else reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.isDisabled then
			return
		end
		p1.playbackVolume.toggle()
	end, { p1.isDisabled, p1.playbackVolume })
	local var27 = reactModule.createElement(menu, {
		align = foundationModule.Enums.PopoverAlign.End,
		isOpen = var4.enabled,
		items = reactModule.useMemo(function()
			-- upvalues: var16 (ref), var1 (ref), var18 (ref), var17 (ref), var19 (ref), p1 (ref), fFlagMomentsServeEDPVideos (copy), var3 (ref), localPlayer (copy), foundationModule (copy), var22 (ref), fFlagMomentsPassFeedItemIdToBackendApis (copy), fFlagMomentsOptimisticProfilePending (copy), var25 (ref), checkDebugAccessModule (copy), var20 (ref)
			local list = {
				{
					id = "details",
					icon = if var16 then "icons/actions/viewOn" else "icons/actions/viewOff",
					text = if var16 then var1.showDetails else var1.hideDetails,
					onActivated = var18
				},
				{
					id = "minimize",
					icon = if var17 then "icons/actions/previewExpand" else "icons/actions/previewShrink",
					text = if var17 then var1.expand else var1.minimize,
					onActivated = var19
				}
			}
			local var28 = p1.moment.recommendationMetadata ~= nil and (p1.moment.recommendationMetadata.feedItemId ~= nil and p1.moment.recommendationMetadata.feedItemId ~= "")
			
			if fFlagMomentsServeEDPVideos and var3 or p1.moment.creatorId ~= (if localPlayer then localPlayer.UserId else nil) and var28 then
				table.insert(list, {
					id = "reportAbuse",
					icon = foundationModule.Enums.IconName.Flag,
					text = var1.report,
					onActivated = var22
				})
			elseif (not fFlagMomentsPassFeedItemIdToBackendApis or var28) and (not fFlagMomentsOptimisticProfilePending or p1.moment.status ~= "Pending") then
				table.insert(list, {
					id = "delete",
					icon = "icons/actions/delete",
					text = var1.delete,
					onActivated = var25
				})
			end
			if checkDebugAccessModule() then
				table.insert(list, {
					id = "debug",
					icon = "icons/logo/block",
					text = "Toggle Debug Mode",
					onActivated = var20
				})
			end
			return list
		end, {
			p1.moment, var16, var17, var1, var20, var18, var19, var22, var25,
			if fFlagMomentsServeEDPVideos then var3 else false
		}),
		onPressedOutside = var4.disable,
		side = foundationModule.Enums.PopoverSide.Left,
		size = if momentsUseSmallOverflowMenu then foundationModule.Enums.InputSize.Small else nil
	}, {
		ContextualMenuButton = reactModule.createElement(iconButton, {
			testId = "FeedContextualMenuButton",
			icon = threeDotsVertical,
			isDisabled = p1.isDisabled,
			onActivated = var11,
			size = foundationModule.Enums.InputSize.Large
		})
	})
	local var28 = reactModule.createElement(reportMomentDialogModule, { isOpen = var5, onClose = var23, onSubmitReport = var21 })
	local var29 = if var7 then reactModule.createElement(ipReportConfirmationDialogModule, { reportCode = var9, onClose = var24 }) else nil
	
	return if p1.isFeedMuteEnabled then reactModule.createElement(view, {
		tag = "col align-x-right auto-xy",
		LayoutOrder = p1.layoutOrder
	}, {
		MuteAndMenuRow = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-x-right align-y-center gap-xsmall auto-xy"
		}, {
			FeedMuteButton = reactModule.createElement(iconButton, {
				testId = "FeedMuteButton",
				icon = if p1.playbackVolume.isMuted then speakerSlash else speaker,
				isDisabled = p1.isDisabled,
				onActivated = var26,
				size = foundationModule.Enums.InputSize.Medium
			}),
			ContextMenuPopover = var27
		}),
		ReportDialog = var28,
		IpConfirmationDialog = var29
	}) else reactModule.createElement(view, {
		tag = "col align-x-center auto-xy",
		LayoutOrder = p1.layoutOrder
	}, {
		ContextMenuPopover = var27,
		ReportDialog = var28,
		IpConfirmationDialog = var29
	})
end