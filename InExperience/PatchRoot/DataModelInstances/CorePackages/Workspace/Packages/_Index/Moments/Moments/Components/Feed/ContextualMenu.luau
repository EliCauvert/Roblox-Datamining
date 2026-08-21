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
local fireAnalyticsEvent = momentsCommonModule.Analytics.fireAnalyticsEvent
local eventNames = momentsCommonModule.Analytics.EventNames
local getFFlagMomentsAnalyticsSchemaIdentity = momentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity
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

return function(p0) --[[ line: 84 ]]
	-- upvalues: useLocalization (ref), t (ref), useFeed (ref), useMomentsHost (ref), useToggleState (ref), fFlagMomentsIPReporting (ref), reactModule (ref), fFlagEnableReportingFlowForMomentsFeed (ref), useMomentsSession (ref), getMomentsPreferencesStoreModule (ref), getModeratedItemsStoreModule (ref), getToastStoreModule (ref), signalsReactModule (ref), fireAnalyticsEvent (ref), eventNames (ref), checkDebugAccessModule (ref), reportMomentModule (ref), fFlagMomentsReportWithFeedId (ref), makeRecommendationAttributionModule (ref), signalActionTypeModule (ref), makeFeedActionFieldsModule (ref), momentsCommonModule (ref), reportModalCovering (ref), getFFlagMomentsAnalyticsSchemaIdentity (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), localPlayer (ref), foundationModule (ref), menu (ref), iconButton (ref), threeDotsVertical (ref), reportMomentDialogModule (ref), ipReportConfirmationDialogModule (ref), view (ref), speakerSlash (ref), speaker (ref)
	local var20 = useLocalization(t)
	local var21 = useFeed()
	local openMomentsFeedReport = useMomentsHost().openMomentsFeedReport
	local var22 = useToggleState()
	local var23 = nil
	local var24 = nil
	
	if fFlagMomentsIPReporting then
		local var25, var26 = reactModule.useState(false)
		var23 = var25
		var24 = var26
	end
	local var27 = nil
	local var28 = nil
	local var29 = nil
	local var30 = nil
	
	if fFlagEnableReportingFlowForMomentsFeed then
		local var31, var32 = reactModule.useState(false)
		var27 = var31
		var28 = var32
		local var33, var34 = reactModule.useState("------")
		var29 = var33
		var30 = var34
	end
	local var35 = reactModule.useCallback(function() --[[ line: 109 ]]
		-- upvalues: var22 (ref)
		if var22.enabled then
			var22.disable()
			
			return
		end
		var22.enable()
	end, { var22.enabled, var22.enable, var22.disable })
	local var36 = useMomentsSession()
	local var37 = getMomentsPreferencesStoreModule(false)
	local var38 = getModeratedItemsStoreModule(false)
	local var39 = getToastStoreModule(false)
	local var40 = signalsReactModule.useSignalState(var36.getHideDetails)
	local var41 = signalsReactModule.useSignalState(var37.getMinimized)
	local var42 = reactModule.useCallback(function() --[[ line: 125 ]]
		-- upvalues: var22 (ref), var36 (ref), fireAnalyticsEvent (copy), eventNames (copy), p0 (ref)
		var22.disable()
		var36.toggleFeedDetailVisibility()
		fireAnalyticsEvent(eventNames.FeedHideDetailsButtonPressed, { momentId = p0.moment.momentId })
	end, {
		p0.moment,
		var22.disable,
		var36.toggleFeedDetailVisibility
	})
	local var43 = reactModule.useCallback(function() --[[ line: 133 ]]
		-- upvalues: var22 (ref), var37 (ref), fireAnalyticsEvent (copy), eventNames (copy), p0 (ref)
		var22.disable()
		var37.toggleFeedScaleType()
		fireAnalyticsEvent(eventNames.FeedMinimizeButtonPressed, { momentId = p0.moment.momentId })
	end, { p0.moment, var22.disable, var37.toggleFeedScaleType })
	local var44 = reactModule.useCallback(function() --[[ line: 141 ]]
		-- upvalues: checkDebugAccessModule (copy), var37 (ref), var22 (ref)
		if checkDebugAccessModule() then
			var37.toggleFeedDebugMode()
		end
		var22.disable()
	end, { var22.disable, var37.toggleFeedDebugMode })
	local var45 = reactModule.useCallback(function(p1, p2, p3) --[[ line: 149 ]]
		-- upvalues: p0 (ref), fFlagMomentsIPReporting (copy), reportMomentModule (copy), fFlagMomentsReportWithFeedId (copy), makeRecommendationAttributionModule (copy), var21 (ref), signalActionTypeModule (copy), makeFeedActionFieldsModule (copy), momentsCommonModule (copy), fireAnalyticsEvent (copy), eventNames (copy), var38 (ref), var39 (ref), var20 (ref)
		if not p0.moment then
			return nil
		end
		local var54 = true
		local var55 = true
		local var56 = nil
		
		if not p3 then
			local ok, status, var57 = pcall(function() --[[ line: 158 ]]
				-- upvalues: fFlagMomentsIPReporting (copy), reportMomentModule (copy), fFlagMomentsReportWithFeedId (copy), p0 (copy), p1 (ref)
				return if fFlagMomentsIPReporting then reportMomentModule(if fFlagMomentsReportWithFeedId then p0.moment.recommendationMetadata.feedItemId else p0.moment.momentId, p1):await() else reportMomentModule(if fFlagMomentsReportWithFeedId then p0.moment.recommendationMetadata.feedItemId else p0.moment.momentId):await()
			end)
			var54 = ok
			var55 = status
			var56 = var57
		end
		local recommendationMetadata = p0.moment.recommendationMetadata
		local var58 = makeRecommendationAttributionModule(recommendationMetadata)
		
		if var58 then
			local ok, status = pcall(function() --[[ line: 184 ]]
				-- upvalues: var21 (copy), signalActionTypeModule (copy), var58 (ref)
				var21.logAction(signalActionTypeModule.Report, var58, {})
			end)
			
			if not ok then
				warn("Failed to log action event", status)
			end
		end
		local var59 = makeFeedActionFieldsModule(p0.moment.momentId, recommendationMetadata and recommendationMetadata.feedItemId, recommendationMetadata and recommendationMetadata.tracingId, if momentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity() then "report" else nil)
		
		if var59 then
			fireAnalyticsEvent(eventNames.FeedAbuseReported, var59)
		end
		if not p2 then
			var38.markReported(p0.moment.momentId)
			var21.removeCurrentItem()
			var39.triggerToast({
				title = var20.reportSubmittedTitle,
				text = var20.reportSubmittedBody
			})
		end
		return if var54 and var55 and type(var56) == "table" then var56.reportCode else nil
	end, {
		p0.moment, var21.logAction, var21.removeCurrentItem, var38.markReported,
		var39.triggerToast, var20
	})
	local var46 = reactModule.useCallback(function() --[[ line: 231 ]]
		-- upvalues: var22 (ref), p0 (ref), fFlagEnableReportingFlowForMomentsFeed (copy), openMomentsFeedReport (ref), reportModalCovering (copy), var45 (ref), var30 (write), var28 (write), fFlagMomentsIPReporting (copy), var24 (write)
		var22.disable()
		local feedItemId = p0.moment.recommendationMetadata and p0.moment.recommendationMetadata.feedItemId
		
		if fFlagEnableReportingFlowForMomentsFeed and feedItemId and (feedItemId ~= "" and openMomentsFeedReport) then
			reportModalCovering.setCovering(true)
			openMomentsFeedReport({
				feedItemId = feedItemId,
				momentId = p0.moment.momentId,
				onSubmit = function() --[[ line: 243 ]]
					-- upvalues: var45 (copy)
					var45(nil, false, true)
				end,
				onClose = function() --[[ line: 246 ]]
					-- upvalues: reportModalCovering (copy)
					reportModalCovering.setCovering(false)
				end,
				onIpReportCode = function(p4) --[[ line: 250 ]]
					-- upvalues: var45 (copy), var30 (copy), var28 (copy)
					var45(nil, true, true)
					var30(if p4 and p4 ~= "" then p4 else "------")
					var28(true)
				end
			})
			
			return
		elseif fFlagMomentsIPReporting then
			var24(true)
			
			return
		end
		task.spawn(function() --[[ line: 262 ]]
			-- upvalues: var45 (copy)
			var45(nil, false)
		end)
	end, { var22.disable, var45, openMomentsFeedReport, p0.moment })
	local var47 = if fFlagMomentsIPReporting then reactModule.useCallback(function() --[[ line: 269 ]]
		-- upvalues: var24 (write)
		var24(false)
	end, {}) else nil
	local var48 = reactModule.useCallback(function() --[[ line: 274 ]]
		-- upvalues: var28 (write)
		if var28 then
			var28(false)
		end
	end, {})
	local var49 = reactModule.useCallback(function() --[[ line: 280 ]]
		-- upvalues: var22 (ref), getFFlagMomentsAnalyticsSchemaIdentity (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), var36 (ref), p0 (ref)
		var22.disable()
		local var61 = getFFlagMomentsAnalyticsSchemaIdentity()
		
		if not fFlagMomentsPassFeedItemIdToBackendApis and not var61 then
			var36.requestDeletion(p0.moment.momentId)
			
			return
		end
		var36.requestDeletion(p0.moment.momentId, p0.moment.recommendationMetadata and p0.moment.recommendationMetadata.feedItemId, if var61 and p0.moment.recommendationMetadata then p0.moment.recommendationMetadata.tracingId else nil)
	end, { p0.moment, var22.disable, var36.requestDeletion })
	local var50 = if p0.isFeedMuteButtonAnalyticsEnabled then reactModule.useCallback(function() --[[ line: 312 ]]
		-- upvalues: p0 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if p0.isDisabled then
			return
		end
		fireAnalyticsEvent(if p0.playbackVolume.isMuted then eventNames.FeedUnmuteButtonPressed else eventNames.FeedMuteButtonPressed, { momentId = p0.moment.momentId })
		p0.playbackVolume.toggle()
	end, { p0.isDisabled, p0.playbackVolume, p0.moment }) else reactModule.useCallback(function() --[[ line: 299 ]]
		-- upvalues: p0 (ref)
		if p0.isDisabled then
			return
		end
		p0.playbackVolume.toggle()
	end, { p0.isDisabled, p0.playbackVolume })
	local var51 = reactModule.createElement(menu, {
		align = foundationModule.Enums.PopoverAlign.End,
		isOpen = var22.enabled,
		items = reactModule.useMemo(function() --[[ line: 338 ]]
			-- upvalues: var40 (ref), var20 (ref), var42 (ref), var41 (ref), var43 (ref), p0 (ref), localPlayer (copy), fFlagMomentsReportWithFeedId (copy), foundationModule (copy), var46 (ref), fFlagMomentsPassFeedItemIdToBackendApis (copy), var49 (ref), checkDebugAccessModule (copy), var44 (ref)
			local list = {
				{
					id = "details",
					icon = if var40 then "icons/actions/viewOn" else "icons/actions/viewOff",
					text = if var40 then var20.showDetails else var20.hideDetails,
					onActivated = var42
				},
				{
					id = "minimize",
					icon = if var41 then "icons/actions/previewExpand" else "icons/actions/previewShrink",
					text = if var41 then var20.expand else var20.minimize,
					onActivated = var43
				}
			}
			local var63 = p0.moment.recommendationMetadata ~= nil and (p0.moment.recommendationMetadata.feedItemId ~= nil and p0.moment.recommendationMetadata.feedItemId ~= "")
			
			if p0.moment.creatorId ~= (if localPlayer then localPlayer.UserId else nil) and (not fFlagMomentsReportWithFeedId or var63) then
				table.insert(list, {
					id = "reportAbuse",
					icon = foundationModule.Enums.IconName.Flag,
					text = var20.report,
					onActivated = var46
				})
			elseif not fFlagMomentsPassFeedItemIdToBackendApis or var63 then
				table.insert(list, {
					id = "delete",
					icon = "icons/actions/delete",
					text = var20.delete,
					onActivated = var49
				})
			end
			if checkDebugAccessModule() then
				table.insert(list, {
					id = "debug",
					icon = "icons/logo/block",
					text = "Toggle Debug Mode",
					onActivated = var44
				})
			end
			return list
		end, {
			p0.moment, var40, var41, var20, var44, var42, var43, var46, var49
		}),
		onPressedOutside = var22.disable,
		side = foundationModule.Enums.PopoverSide.Left
	}, {
		ContextualMenuButton = reactModule.createElement(iconButton, {
			testId = "FeedContextualMenuButton",
			icon = threeDotsVertical,
			isDisabled = p0.isDisabled,
			onActivated = var35,
			size = foundationModule.Enums.InputSize.Large
		})
	})
	local var52 = if fFlagMomentsIPReporting then reactModule.createElement(reportMomentDialogModule, { isOpen = var23, onClose = var47, onSubmitReport = var45 }) else nil
	local var53 = if fFlagEnableReportingFlowForMomentsFeed and var27 then reactModule.createElement(ipReportConfirmationDialogModule, { reportCode = var29, onClose = var48 }) else nil
	
	return if p0.isFeedMuteEnabled then reactModule.createElement(view, {
		tag = "col align-x-right auto-xy",
		LayoutOrder = p0.layoutOrder
	}, {
		MuteAndMenuRow = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-x-right align-y-center gap-xsmall auto-xy"
		}, {
			FeedMuteButton = reactModule.createElement(iconButton, {
				testId = "FeedMuteButton",
				icon = if p0.playbackVolume.isMuted then speakerSlash else speaker,
				isDisabled = p0.isDisabled,
				onActivated = var50,
				size = foundationModule.Enums.InputSize.Medium
			}),
			ContextMenuPopover = var51
		}),
		ReportDialog = var52,
		IpConfirmationDialog = var53
	}) else reactModule.createElement(view, {
		tag = "col align-x-center auto-xy",
		LayoutOrder = p0.layoutOrder
	}, {
		ContextMenuPopover = var51,
		ReportDialog = var52,
		IpConfirmationDialog = var53
	})
end