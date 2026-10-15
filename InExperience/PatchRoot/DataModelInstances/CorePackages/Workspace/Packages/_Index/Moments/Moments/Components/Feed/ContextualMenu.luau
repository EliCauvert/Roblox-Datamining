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
	-- upvalues: useLocalization (ref), t (ref), useFeed (ref), useMomentsHost (ref), useToggleState (ref), reactModule (ref), useMomentsSession (ref), getMomentsPreferencesStoreModule (ref), getModeratedItemsStoreModule (ref), getToastStoreModule (ref), signalsReactModule (ref), fireAnalyticsEvent (ref), eventNames (ref), checkDebugAccessModule (ref), reportMomentModule (ref), makeRecommendationAttributionModule (ref), signalActionTypeModule (ref), makeFeedActionFieldsModule (ref), momentsReportButtonAnalytics (ref), reportMomentsEngagement (ref), getPostFeedItemIdModule (ref), reportModalCovering (ref), localPlayer (ref), foundationModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), fFlagMomentsOptimisticProfilePending (ref), menu (ref), momentsUseSmallOverflowMenu (ref), iconButton (ref), threeDotsVertical (ref), reportMomentDialogModule (ref), ipReportConfirmationDialogModule (ref), view (ref), speakerSlash (ref), speaker (ref)
	local var1 = useLocalization(t)
	local var2 = useFeed()
	local openMomentsFeedReport = useMomentsHost().openMomentsFeedReport
	local var3 = useToggleState()
	local var4, var5 = reactModule.useState(false)
	local var6, var7 = reactModule.useState(false)
	local var8, var9 = reactModule.useState("------")
	local var10 = reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		if var3.enabled then
			var3.disable()
			
			return
		end
		var3.enable()
	end, { var3.enabled, var3.enable, var3.disable })
	local var11 = useMomentsSession()
	local var12 = getMomentsPreferencesStoreModule(false)
	local var13 = getModeratedItemsStoreModule(false)
	local var14 = getToastStoreModule(false)
	local var15 = signalsReactModule.useSignalState(var11.getHideDetails)
	local var16 = signalsReactModule.useSignalState(var12.getMinimized)
	local var17 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var11 (ref), fireAnalyticsEvent (copy), eventNames (copy), p1 (ref)
		var3.disable()
		var11.toggleFeedDetailVisibility()
		fireAnalyticsEvent(eventNames.FeedHideDetailsButtonPressed, { momentId = p1.moment.momentId })
	end, {
		p1.moment,
		var3.disable,
		var11.toggleFeedDetailVisibility
	})
	local var18 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var12 (ref), fireAnalyticsEvent (copy), eventNames (copy), p1 (ref)
		var3.disable()
		var12.toggleFeedScaleType()
		fireAnalyticsEvent(eventNames.FeedMinimizeButtonPressed, { momentId = p1.moment.momentId })
	end, { p1.moment, var3.disable, var12.toggleFeedScaleType })
	local var19 = reactModule.useCallback(function()
		-- upvalues: checkDebugAccessModule (copy), var12 (ref), var3 (ref)
		if checkDebugAccessModule() then
			var12.toggleFeedDebugMode()
		end
		var3.disable()
	end, { var3.disable, var12.toggleFeedDebugMode })
	local var20 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: p1 (ref), reportMomentModule (copy), makeRecommendationAttributionModule (copy), var2 (ref), signalActionTypeModule (copy), makeFeedActionFieldsModule (copy), fireAnalyticsEvent (copy), eventNames (copy), var13 (ref), var14 (ref), var1 (ref)
		if not p1.moment then
			return nil
		end
		local var21 = true
		local var22 = true
		local var23 = nil
		
		if not p4 then
			local ok, status, var24 = pcall(function()
				-- upvalues: reportMomentModule (copy), p1 (copy), p2 (ref)
				return reportMomentModule(p1.moment.recommendationMetadata.feedItemId, p2):await()
			end)
			var21 = ok
			var22 = status
			var23 = var24
		end
		local recommendationMetadata = p1.moment.recommendationMetadata
		local var25 = makeRecommendationAttributionModule(recommendationMetadata)
		
		if var25 then
			local ok, status = pcall(function()
				-- upvalues: var2 (copy), signalActionTypeModule (copy), var25 (ref)
				var2.logAction(signalActionTypeModule.Report, var25, {})
			end)
			
			if not ok then
				warn("Failed to log action event", status)
			end
		end
		local var26 = makeFeedActionFieldsModule(p1.moment.momentId, recommendationMetadata and recommendationMetadata.feedItemId, recommendationMetadata and recommendationMetadata.tracingId, "report")
		
		if var26 then
			fireAnalyticsEvent(eventNames.FeedAbuseReported, var26)
		end
		if not p3 then
			var13.markReported(p1.moment.momentId)
			var2.removeCurrentItem()
			var14.triggerToast({
				title = var1.reportSubmittedTitle,
				text = var1.reportSubmittedBody
			})
		end
		return if var21 and var22 and type(var23) == "table" then var23.reportCode else nil
	end, {
		p1.moment, var2.logAction, var2.removeCurrentItem, var13.markReported,
		var14.triggerToast, var1
	})
	local var21 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), momentsReportButtonAnalytics (copy), reportMomentsEngagement (copy), getPostFeedItemIdModule (copy), p1 (ref), openMomentsFeedReport (ref), reportModalCovering (copy), var20 (ref), var9 (ref), var7 (ref), var5 (ref)
		var3.disable()
		
		if momentsReportButtonAnalytics then
			reportMomentsEngagement("report_click")
		end
		local var22 = getPostFeedItemIdModule(p1.moment)
		
		if var22 and openMomentsFeedReport then
			reportModalCovering.setCovering(true)
			openMomentsFeedReport({
				feedItemId = var22,
				momentId = p1.moment.momentId,
				onSubmit = function()
					-- upvalues: var20 (copy)
					var20(nil, false, true)
				end,
				onClose = function()
					-- upvalues: reportModalCovering (copy)
					reportModalCovering.setCovering(false)
				end,
				onIpReportCode = function(p2)
					-- upvalues: var20 (copy), var9 (copy), var7 (copy)
					var20(nil, true, true)
					var9(if p2 and p2 ~= "" then p2 else "------")
					var7(true)
				end
			})
			
			return
		end
		var5(true)
	end, { var3.disable, var20, openMomentsFeedReport, p1.moment })
	local var22 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		var5(false)
	end, {})
	local var23 = reactModule.useCallback(function()
		-- upvalues: var7 (ref)
		if var7 then
			var7(false)
		end
	end, {})
	local var24 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var11 (ref), p1 (ref)
		var3.disable()
		var11.requestDeletion(p1.moment.momentId, p1.moment.recommendationMetadata and p1.moment.recommendationMetadata.feedItemId, if p1.moment.recommendationMetadata then p1.moment.recommendationMetadata.tracingId else nil)
	end, { p1.moment, var3.disable, var11.requestDeletion })
	local var25 = if p1.isFeedMuteButtonAnalyticsEnabled then reactModule.useCallback(function()
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
	local var26 = reactModule.createElement(menu, {
		align = foundationModule.Enums.PopoverAlign.End,
		isOpen = var3.enabled,
		items = reactModule.useMemo(function()
			-- upvalues: var15 (ref), var1 (ref), var17 (ref), var16 (ref), var18 (ref), p1 (ref), localPlayer (copy), foundationModule (copy), var21 (ref), fFlagMomentsPassFeedItemIdToBackendApis (copy), fFlagMomentsOptimisticProfilePending (copy), var24 (ref), checkDebugAccessModule (copy), var19 (ref)
			local list = {
				{
					id = "details",
					icon = if var15 then "icons/actions/viewOn" else "icons/actions/viewOff",
					text = if var15 then var1.showDetails else var1.hideDetails,
					onActivated = var17
				},
				{
					id = "minimize",
					icon = if var16 then "icons/actions/previewExpand" else "icons/actions/previewShrink",
					text = if var16 then var1.expand else var1.minimize,
					onActivated = var18
				}
			}
			local var27 = p1.moment.recommendationMetadata ~= nil and (p1.moment.recommendationMetadata.feedItemId ~= nil and p1.moment.recommendationMetadata.feedItemId ~= "")
			
			if p1.moment.creatorId ~= (if localPlayer then localPlayer.UserId else nil) and var27 then
				table.insert(list, {
					id = "reportAbuse",
					icon = foundationModule.Enums.IconName.Flag,
					text = var1.report,
					onActivated = var21
				})
			elseif (not fFlagMomentsPassFeedItemIdToBackendApis or var27) and (not fFlagMomentsOptimisticProfilePending or p1.moment.status ~= "Pending") then
				table.insert(list, {
					id = "delete",
					icon = "icons/actions/delete",
					text = var1.delete,
					onActivated = var24
				})
			end
			if checkDebugAccessModule() then
				table.insert(list, {
					id = "debug",
					icon = "icons/logo/block",
					text = "Toggle Debug Mode",
					onActivated = var19
				})
			end
			return list
		end, {
			p1.moment, var15, var16, var1, var19, var17, var18, var21, var24
		}),
		onPressedOutside = var3.disable,
		side = foundationModule.Enums.PopoverSide.Left,
		size = if momentsUseSmallOverflowMenu then foundationModule.Enums.InputSize.Small else nil
	}, {
		ContextualMenuButton = reactModule.createElement(iconButton, {
			testId = "FeedContextualMenuButton",
			icon = threeDotsVertical,
			isDisabled = p1.isDisabled,
			onActivated = var10,
			size = foundationModule.Enums.InputSize.Large
		})
	})
	local var27 = reactModule.createElement(reportMomentDialogModule, { isOpen = var4, onClose = var22, onSubmitReport = var20 })
	local var28 = if var6 then reactModule.createElement(ipReportConfirmationDialogModule, { reportCode = var8, onClose = var23 }) else nil
	
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
				onActivated = var25,
				size = foundationModule.Enums.InputSize.Medium
			}),
			ContextMenuPopover = var26
		}),
		ReportDialog = var27,
		IpConfirmationDialog = var28
	}) else reactModule.createElement(view, {
		tag = "col align-x-center auto-xy",
		LayoutOrder = p1.layoutOrder
	}, {
		ContextMenuPopover = var26,
		ReportDialog = var27,
		IpConfirmationDialog = var28
	})
end