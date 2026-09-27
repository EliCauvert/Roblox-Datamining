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
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local fFlagEnableReportingFlowForMomentsFeed = sharedFlagsModule.FFlagEnableReportingFlowForMomentsFeed
local momentsUseSmallOverflowMenu = game:DefineFastFlag("MomentsUseSmallOverflowMenu", false)
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
	-- upvalues: useLocalization (ref), t (ref), useFeed (ref), useMomentsHost (ref), useToggleState (ref), reactModule (ref), fFlagEnableReportingFlowForMomentsFeed (ref), useMomentsSession (ref), getMomentsPreferencesStoreModule (ref), getModeratedItemsStoreModule (ref), getToastStoreModule (ref), signalsReactModule (ref), fireAnalyticsEvent (ref), eventNames (ref), checkDebugAccessModule (ref), reportMomentModule (ref), makeRecommendationAttributionModule (ref), signalActionTypeModule (ref), makeFeedActionFieldsModule (ref), getPostFeedItemIdModule (ref), reportModalCovering (ref), localPlayer (ref), foundationModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), menu (ref), momentsUseSmallOverflowMenu (ref), iconButton (ref), threeDotsVertical (ref), reportMomentDialogModule (ref), ipReportConfirmationDialogModule (ref), view (ref), speakerSlash (ref), speaker (ref)
	local var1 = useLocalization(t)
	local var2 = useFeed()
	local openMomentsFeedReport = useMomentsHost().openMomentsFeedReport
	local var3 = useToggleState()
	local var4, var5 = reactModule.useState(false)
	local var6 = nil
	local var7 = nil
	local var8 = nil
	local var9 = nil
	
	if fFlagEnableReportingFlowForMomentsFeed then
		local var10, var11 = reactModule.useState(false)
		var6 = var10
		var7 = var11
		local var12, var13 = reactModule.useState("------")
		var8 = var12
		var9 = var13
	end
	local var14 = reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		if var3.enabled then
			var3.disable()
			
			return
		end
		var3.enable()
	end, { var3.enabled, var3.enable, var3.disable })
	local var15 = useMomentsSession()
	local var16 = getMomentsPreferencesStoreModule(false)
	local var17 = getModeratedItemsStoreModule(false)
	local var18 = getToastStoreModule(false)
	local var19 = signalsReactModule.useSignalState(var15.getHideDetails)
	local var20 = signalsReactModule.useSignalState(var16.getMinimized)
	local var21 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var15 (ref), fireAnalyticsEvent (copy), eventNames (copy), p1 (ref)
		var3.disable()
		var15.toggleFeedDetailVisibility()
		fireAnalyticsEvent(eventNames.FeedHideDetailsButtonPressed, { momentId = p1.moment.momentId })
	end, {
		p1.moment,
		var3.disable,
		var15.toggleFeedDetailVisibility
	})
	local var22 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var16 (ref), fireAnalyticsEvent (copy), eventNames (copy), p1 (ref)
		var3.disable()
		var16.toggleFeedScaleType()
		fireAnalyticsEvent(eventNames.FeedMinimizeButtonPressed, { momentId = p1.moment.momentId })
	end, { p1.moment, var3.disable, var16.toggleFeedScaleType })
	local var23 = reactModule.useCallback(function()
		-- upvalues: checkDebugAccessModule (copy), var16 (ref), var3 (ref)
		if checkDebugAccessModule() then
			var16.toggleFeedDebugMode()
		end
		var3.disable()
	end, { var3.disable, var16.toggleFeedDebugMode })
	local var24 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: p1 (ref), reportMomentModule (copy), makeRecommendationAttributionModule (copy), var2 (ref), signalActionTypeModule (copy), makeFeedActionFieldsModule (copy), fireAnalyticsEvent (copy), eventNames (copy), var17 (ref), var18 (ref), var1 (ref)
		if not p1.moment then
			return nil
		end
		local var25 = true
		local var26 = true
		local var27 = nil
		
		if not p4 then
			local ok, status, var28 = pcall(function()
				-- upvalues: reportMomentModule (copy), p1 (copy), p2 (ref)
				return reportMomentModule(p1.moment.recommendationMetadata.feedItemId, p2):await()
			end)
			var25 = ok
			var26 = status
			var27 = var28
		end
		local recommendationMetadata = p1.moment.recommendationMetadata
		local var29 = makeRecommendationAttributionModule(recommendationMetadata)
		
		if var29 then
			local ok, status = pcall(function()
				-- upvalues: var2 (copy), signalActionTypeModule (copy), var29 (ref)
				var2.logAction(signalActionTypeModule.Report, var29, {})
			end)
			
			if not ok then
				warn("Failed to log action event", status)
			end
		end
		local var30 = makeFeedActionFieldsModule(p1.moment.momentId, recommendationMetadata and recommendationMetadata.feedItemId, recommendationMetadata and recommendationMetadata.tracingId, "report")
		
		if var30 then
			fireAnalyticsEvent(eventNames.FeedAbuseReported, var30)
		end
		if not p3 then
			var17.markReported(p1.moment.momentId)
			var2.removeCurrentItem()
			var18.triggerToast({
				title = var1.reportSubmittedTitle,
				text = var1.reportSubmittedBody
			})
		end
		return if var25 and var26 and type(var27) == "table" then var27.reportCode else nil
	end, {
		p1.moment, var2.logAction, var2.removeCurrentItem, var17.markReported,
		var18.triggerToast, var1
	})
	local var25 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), getPostFeedItemIdModule (copy), p1 (ref), fFlagEnableReportingFlowForMomentsFeed (copy), openMomentsFeedReport (ref), reportModalCovering (copy), var24 (ref), var9 (write), var7 (write), var5 (ref)
		var3.disable()
		local var26 = getPostFeedItemIdModule(p1.moment)
		
		if fFlagEnableReportingFlowForMomentsFeed and var26 and openMomentsFeedReport then
			reportModalCovering.setCovering(true)
			openMomentsFeedReport({
				feedItemId = var26,
				momentId = p1.moment.momentId,
				onSubmit = function()
					-- upvalues: var24 (copy)
					var24(nil, false, true)
				end,
				onClose = function()
					-- upvalues: reportModalCovering (copy)
					reportModalCovering.setCovering(false)
				end,
				onIpReportCode = function(p2)
					-- upvalues: var24 (copy), var9 (copy), var7 (copy)
					var24(nil, true, true)
					var9(if p2 and p2 ~= "" then p2 else "------")
					var7(true)
				end
			})
			
			return
		end
		var5(true)
	end, { var3.disable, var24, openMomentsFeedReport, p1.moment })
	local var26 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		var5(false)
	end, {})
	local var27 = reactModule.useCallback(function()
		-- upvalues: var7 (write)
		if var7 then
			var7(false)
		end
	end, {})
	local var28 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var15 (ref), p1 (ref)
		var3.disable()
		var15.requestDeletion(p1.moment.momentId, p1.moment.recommendationMetadata and p1.moment.recommendationMetadata.feedItemId, if p1.moment.recommendationMetadata then p1.moment.recommendationMetadata.tracingId else nil)
	end, { p1.moment, var3.disable, var15.requestDeletion })
	local var29 = if p1.isFeedMuteButtonAnalyticsEnabled then reactModule.useCallback(function()
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
	local var30 = reactModule.createElement(menu, {
		align = foundationModule.Enums.PopoverAlign.End,
		isOpen = var3.enabled,
		items = reactModule.useMemo(function()
			-- upvalues: var19 (ref), var1 (ref), var21 (ref), var20 (ref), var22 (ref), p1 (ref), localPlayer (copy), foundationModule (copy), var25 (ref), fFlagMomentsPassFeedItemIdToBackendApis (copy), var28 (ref), checkDebugAccessModule (copy), var23 (ref)
			local list = {
				{
					id = "details",
					icon = if var19 then "icons/actions/viewOn" else "icons/actions/viewOff",
					text = if var19 then var1.showDetails else var1.hideDetails,
					onActivated = var21
				},
				{
					id = "minimize",
					icon = if var20 then "icons/actions/previewExpand" else "icons/actions/previewShrink",
					text = if var20 then var1.expand else var1.minimize,
					onActivated = var22
				}
			}
			local var31 = p1.moment.recommendationMetadata ~= nil and (p1.moment.recommendationMetadata.feedItemId ~= nil and p1.moment.recommendationMetadata.feedItemId ~= "")
			
			if p1.moment.creatorId ~= (if localPlayer then localPlayer.UserId else nil) and var31 then
				table.insert(list, {
					id = "reportAbuse",
					icon = foundationModule.Enums.IconName.Flag,
					text = var1.report,
					onActivated = var25
				})
			elseif not fFlagMomentsPassFeedItemIdToBackendApis or var31 then
				table.insert(list, {
					id = "delete",
					icon = "icons/actions/delete",
					text = var1.delete,
					onActivated = var28
				})
			end
			if checkDebugAccessModule() then
				table.insert(list, {
					id = "debug",
					icon = "icons/logo/block",
					text = "Toggle Debug Mode",
					onActivated = var23
				})
			end
			return list
		end, {
			p1.moment, var19, var20, var1, var23, var21, var22, var25, var28
		}),
		onPressedOutside = var3.disable,
		side = foundationModule.Enums.PopoverSide.Left,
		size = if momentsUseSmallOverflowMenu then foundationModule.Enums.InputSize.Small else nil
	}, {
		ContextualMenuButton = reactModule.createElement(iconButton, {
			testId = "FeedContextualMenuButton",
			icon = threeDotsVertical,
			isDisabled = p1.isDisabled,
			onActivated = var14,
			size = foundationModule.Enums.InputSize.Large
		})
	})
	local var31 = reactModule.createElement(reportMomentDialogModule, { isOpen = var4, onClose = var26, onSubmitReport = var24 })
	local var32 = if fFlagEnableReportingFlowForMomentsFeed and var6 then reactModule.createElement(ipReportConfirmationDialogModule, { reportCode = var8, onClose = var27 }) else nil
	
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
				onActivated = var29,
				size = foundationModule.Enums.InputSize.Medium
			}),
			ContextMenuPopover = var30
		}),
		ReportDialog = var31,
		IpConfirmationDialog = var32
	}) else reactModule.createElement(view, {
		tag = "col align-x-center auto-xy",
		LayoutOrder = p1.layoutOrder
	}, {
		ContextMenuPopover = var30,
		ReportDialog = var31,
		IpConfirmationDialog = var32
	})
end