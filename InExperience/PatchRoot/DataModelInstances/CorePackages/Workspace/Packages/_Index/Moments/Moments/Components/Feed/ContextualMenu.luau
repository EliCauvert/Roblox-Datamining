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
local fFlagMomentsIPReporting = sharedFlagsModule.FFlagMomentsIPReporting
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local fFlagEnableReportingFlowForMomentsFeed = sharedFlagsModule.FFlagEnableReportingFlowForMomentsFeed
local fFlagMomentsReportWithFeedId = sharedFlagsModule.FFlagMomentsReportWithFeedId
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
	-- upvalues: useLocalization (ref), t (ref), useFeed (ref), useMomentsHost (ref), useToggleState (ref), fFlagMomentsIPReporting (ref), reactModule (ref), fFlagEnableReportingFlowForMomentsFeed (ref), useMomentsSession (ref), getMomentsPreferencesStoreModule (ref), getModeratedItemsStoreModule (ref), getToastStoreModule (ref), signalsReactModule (ref), fireAnalyticsEvent (ref), eventNames (ref), checkDebugAccessModule (ref), reportMomentModule (ref), fFlagMomentsReportWithFeedId (ref), makeRecommendationAttributionModule (ref), signalActionTypeModule (ref), makeFeedActionFieldsModule (ref), getPostFeedItemIdModule (ref), reportModalCovering (ref), localPlayer (ref), foundationModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), menu (ref), iconButton (ref), threeDotsVertical (ref), reportMomentDialogModule (ref), ipReportConfirmationDialogModule (ref), view (ref), speakerSlash (ref), speaker (ref)
	local var1 = useLocalization(t)
	local var2 = useFeed()
	local openMomentsFeedReport = useMomentsHost().openMomentsFeedReport
	local var3 = useToggleState()
	local var4 = nil
	local var5 = nil
	
	if fFlagMomentsIPReporting then
		local var6, var7 = reactModule.useState(false)
		var4 = var6
		var5 = var7
	end
	local var8 = nil
	local var9 = nil
	local var10 = nil
	local var11 = nil
	
	if fFlagEnableReportingFlowForMomentsFeed then
		local var12, var13 = reactModule.useState(false)
		var8 = var12
		var9 = var13
		local var14, var15 = reactModule.useState("------")
		var10 = var14
		var11 = var15
	end
	local var16 = reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		if var3.enabled then
			var3.disable()
			
			return
		end
		var3.enable()
	end, { var3.enabled, var3.enable, var3.disable })
	local var17 = useMomentsSession()
	local var18 = getMomentsPreferencesStoreModule(false)
	local var19 = getModeratedItemsStoreModule(false)
	local var20 = getToastStoreModule(false)
	local var21 = signalsReactModule.useSignalState(var17.getHideDetails)
	local var22 = signalsReactModule.useSignalState(var18.getMinimized)
	local var23 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var17 (ref), fireAnalyticsEvent (copy), eventNames (copy), p1 (ref)
		var3.disable()
		var17.toggleFeedDetailVisibility()
		fireAnalyticsEvent(eventNames.FeedHideDetailsButtonPressed, { momentId = p1.moment.momentId })
	end, {
		p1.moment,
		var3.disable,
		var17.toggleFeedDetailVisibility
	})
	local var24 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var18 (ref), fireAnalyticsEvent (copy), eventNames (copy), p1 (ref)
		var3.disable()
		var18.toggleFeedScaleType()
		fireAnalyticsEvent(eventNames.FeedMinimizeButtonPressed, { momentId = p1.moment.momentId })
	end, { p1.moment, var3.disable, var18.toggleFeedScaleType })
	local var25 = reactModule.useCallback(function()
		-- upvalues: checkDebugAccessModule (copy), var18 (ref), var3 (ref)
		if checkDebugAccessModule() then
			var18.toggleFeedDebugMode()
		end
		var3.disable()
	end, { var3.disable, var18.toggleFeedDebugMode })
	local var26 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: p1 (ref), fFlagMomentsIPReporting (copy), reportMomentModule (copy), fFlagMomentsReportWithFeedId (copy), makeRecommendationAttributionModule (copy), var2 (ref), signalActionTypeModule (copy), makeFeedActionFieldsModule (copy), fireAnalyticsEvent (copy), eventNames (copy), var19 (ref), var20 (ref), var1 (ref)
		if not p1.moment then
			return nil
		end
		local var27 = true
		local var28 = true
		local var29 = nil
		
		if not p4 then
			local ok, status, var30 = pcall(function()
				-- upvalues: fFlagMomentsIPReporting (copy), reportMomentModule (copy), fFlagMomentsReportWithFeedId (copy), p1 (copy), p2 (ref)
				return if fFlagMomentsIPReporting then reportMomentModule(if fFlagMomentsReportWithFeedId then p1.moment.recommendationMetadata.feedItemId else p1.moment.momentId, p2):await() else reportMomentModule(if fFlagMomentsReportWithFeedId then p1.moment.recommendationMetadata.feedItemId else p1.moment.momentId):await()
			end)
			var27 = ok
			var28 = status
			var29 = var30
		end
		local recommendationMetadata = p1.moment.recommendationMetadata
		local var31 = makeRecommendationAttributionModule(recommendationMetadata)
		
		if var31 then
			local ok, status = pcall(function()
				-- upvalues: var2 (copy), signalActionTypeModule (copy), var31 (ref)
				var2.logAction(signalActionTypeModule.Report, var31, {})
			end)
			
			if not ok then
				warn("Failed to log action event", status)
			end
		end
		local var32 = makeFeedActionFieldsModule(p1.moment.momentId, recommendationMetadata and recommendationMetadata.feedItemId, recommendationMetadata and recommendationMetadata.tracingId, "report")
		
		if var32 then
			fireAnalyticsEvent(eventNames.FeedAbuseReported, var32)
		end
		if not p3 then
			var19.markReported(p1.moment.momentId)
			var2.removeCurrentItem()
			var20.triggerToast({
				title = var1.reportSubmittedTitle,
				text = var1.reportSubmittedBody
			})
		end
		return if var27 and var28 and type(var29) == "table" then var29.reportCode else nil
	end, {
		p1.moment, var2.logAction, var2.removeCurrentItem, var19.markReported,
		var20.triggerToast, var1
	})
	local var27 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), getPostFeedItemIdModule (copy), p1 (ref), fFlagEnableReportingFlowForMomentsFeed (copy), openMomentsFeedReport (ref), reportModalCovering (copy), var26 (ref), var11 (write), var9 (write), fFlagMomentsIPReporting (copy), var5 (write)
		var3.disable()
		local var28 = getPostFeedItemIdModule(p1.moment)
		
		if fFlagEnableReportingFlowForMomentsFeed and var28 and openMomentsFeedReport then
			reportModalCovering.setCovering(true)
			openMomentsFeedReport({
				feedItemId = var28,
				momentId = p1.moment.momentId,
				onSubmit = function()
					-- upvalues: var26 (copy)
					var26(nil, false, true)
				end,
				onClose = function()
					-- upvalues: reportModalCovering (copy)
					reportModalCovering.setCovering(false)
				end,
				onIpReportCode = function(p2)
					-- upvalues: var26 (copy), var11 (copy), var9 (copy)
					var26(nil, true, true)
					var11(if p2 and p2 ~= "" then p2 else "------")
					var9(true)
				end
			})
			
			return
		elseif fFlagMomentsIPReporting then
			var5(true)
			
			return
		end
		task.spawn(function()
			-- upvalues: var26 (copy)
			var26(nil, false)
		end)
	end, { var3.disable, var26, openMomentsFeedReport, p1.moment })
	local var28 = if fFlagMomentsIPReporting then reactModule.useCallback(function()
		-- upvalues: var5 (write)
		var5(false)
	end, {}) else nil
	local var29 = reactModule.useCallback(function()
		-- upvalues: var9 (write)
		if var9 then
			var9(false)
		end
	end, {})
	local var30 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var17 (ref), p1 (ref)
		var3.disable()
		var17.requestDeletion(p1.moment.momentId, p1.moment.recommendationMetadata and p1.moment.recommendationMetadata.feedItemId, if p1.moment.recommendationMetadata then p1.moment.recommendationMetadata.tracingId else nil)
	end, { p1.moment, var3.disable, var17.requestDeletion })
	local var31 = if p1.isFeedMuteButtonAnalyticsEnabled then reactModule.useCallback(function()
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
	local var32 = reactModule.createElement(menu, {
		align = foundationModule.Enums.PopoverAlign.End,
		isOpen = var3.enabled,
		items = reactModule.useMemo(function()
			-- upvalues: var21 (ref), var1 (ref), var23 (ref), var22 (ref), var24 (ref), p1 (ref), localPlayer (copy), fFlagMomentsReportWithFeedId (copy), foundationModule (copy), var27 (ref), fFlagMomentsPassFeedItemIdToBackendApis (copy), var30 (ref), checkDebugAccessModule (copy), var25 (ref)
			local list = {
				{
					id = "details",
					icon = if var21 then "icons/actions/viewOn" else "icons/actions/viewOff",
					text = if var21 then var1.showDetails else var1.hideDetails,
					onActivated = var23
				},
				{
					id = "minimize",
					icon = if var22 then "icons/actions/previewExpand" else "icons/actions/previewShrink",
					text = if var22 then var1.expand else var1.minimize,
					onActivated = var24
				}
			}
			local var33 = p1.moment.recommendationMetadata ~= nil and (p1.moment.recommendationMetadata.feedItemId ~= nil and p1.moment.recommendationMetadata.feedItemId ~= "")
			
			if p1.moment.creatorId ~= (if localPlayer then localPlayer.UserId else nil) and (not fFlagMomentsReportWithFeedId or var33) then
				table.insert(list, {
					id = "reportAbuse",
					icon = foundationModule.Enums.IconName.Flag,
					text = var1.report,
					onActivated = var27
				})
			elseif not fFlagMomentsPassFeedItemIdToBackendApis or var33 then
				table.insert(list, {
					id = "delete",
					icon = "icons/actions/delete",
					text = var1.delete,
					onActivated = var30
				})
			end
			if checkDebugAccessModule() then
				table.insert(list, {
					id = "debug",
					icon = "icons/logo/block",
					text = "Toggle Debug Mode",
					onActivated = var25
				})
			end
			return list
		end, {
			p1.moment, var21, var22, var1, var25, var23, var24, var27, var30
		}),
		onPressedOutside = var3.disable,
		side = foundationModule.Enums.PopoverSide.Left
	}, {
		ContextualMenuButton = reactModule.createElement(iconButton, {
			testId = "FeedContextualMenuButton",
			icon = threeDotsVertical,
			isDisabled = p1.isDisabled,
			onActivated = var16,
			size = foundationModule.Enums.InputSize.Large
		})
	})
	local var33 = if fFlagMomentsIPReporting then reactModule.createElement(reportMomentDialogModule, { isOpen = var4, onClose = var28, onSubmitReport = var26 }) else nil
	local var34 = if fFlagEnableReportingFlowForMomentsFeed and var8 then reactModule.createElement(ipReportConfirmationDialogModule, { reportCode = var10, onClose = var29 }) else nil
	
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
				onActivated = var31,
				size = foundationModule.Enums.InputSize.Medium
			}),
			ContextMenuPopover = var32
		}),
		ReportDialog = var33,
		IpConfirmationDialog = var34
	}) else reactModule.createElement(view, {
		tag = "col align-x-center auto-xy",
		LayoutOrder = p1.layoutOrder
	}, {
		ContextMenuPopover = var32,
		ReportDialog = var33,
		IpConfirmationDialog = var34
	})
end