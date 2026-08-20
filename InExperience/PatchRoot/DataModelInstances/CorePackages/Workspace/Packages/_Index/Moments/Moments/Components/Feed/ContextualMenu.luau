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

return function(p0) --[[ line: 85 ]]
	-- upvalues: useLocalization (ref), t (ref), useFeed (ref), useMomentsHost (ref), useToggleState (ref), fFlagMomentsIPReporting (ref), reactModule (ref), fFlagEnableReportingFlowForMomentsFeed (ref), useMomentsSession (ref), getMomentsPreferencesStoreModule (ref), getModeratedItemsStoreModule (ref), getToastStoreModule (ref), signalsReactModule (ref), fireAnalyticsEvent (ref), eventNames (ref), checkDebugAccessModule (ref), reportMomentModule (ref), fFlagMomentsReportWithFeedId (ref), makeRecommendationAttributionModule (ref), signalActionTypeModule (ref), makeFeedActionFieldsModule (ref), momentsCommonModule (ref), getPostFeedItemIdModule (ref), reportModalCovering (ref), getFFlagMomentsAnalyticsSchemaIdentity (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), localPlayer (ref), foundationModule (ref), menu (ref), iconButton (ref), threeDotsVertical (ref), reportMomentDialogModule (ref), ipReportConfirmationDialogModule (ref), view (ref), speakerSlash (ref), speaker (ref)
	local var21 = useLocalization(t)
	local var22 = useFeed()
	local openMomentsFeedReport = useMomentsHost().openMomentsFeedReport
	local var23 = useToggleState()
	local var24 = nil
	local var25 = nil
	
	if fFlagMomentsIPReporting then
		local var26, var27 = reactModule.useState(false)
		var24 = var26
		var25 = var27
	end
	local var28 = nil
	local var29 = nil
	local var30 = nil
	local var31 = nil
	
	if fFlagEnableReportingFlowForMomentsFeed then
		local var32, var33 = reactModule.useState(false)
		var28 = var32
		var29 = var33
		local var34, var35 = reactModule.useState("------")
		var30 = var34
		var31 = var35
	end
	local var36 = reactModule.useCallback(function() --[[ line: 110 ]]
		-- upvalues: var23 (ref)
		if var23.enabled then
			var23.disable()
			
			return
		end
		var23.enable()
	end, { var23.enabled, var23.enable, var23.disable })
	local var37 = useMomentsSession()
	local var38 = getMomentsPreferencesStoreModule(false)
	local var39 = getModeratedItemsStoreModule(false)
	local var40 = getToastStoreModule(false)
	local var41 = signalsReactModule.useSignalState(var37.getHideDetails)
	local var42 = signalsReactModule.useSignalState(var38.getMinimized)
	local var43 = reactModule.useCallback(function() --[[ line: 126 ]]
		-- upvalues: var23 (ref), var37 (ref), fireAnalyticsEvent (copy), eventNames (copy), p0 (ref)
		var23.disable()
		var37.toggleFeedDetailVisibility()
		fireAnalyticsEvent(eventNames.FeedHideDetailsButtonPressed, { momentId = p0.moment.momentId })
	end, {
		p0.moment,
		var23.disable,
		var37.toggleFeedDetailVisibility
	})
	local var44 = reactModule.useCallback(function() --[[ line: 134 ]]
		-- upvalues: var23 (ref), var38 (ref), fireAnalyticsEvent (copy), eventNames (copy), p0 (ref)
		var23.disable()
		var38.toggleFeedScaleType()
		fireAnalyticsEvent(eventNames.FeedMinimizeButtonPressed, { momentId = p0.moment.momentId })
	end, { p0.moment, var23.disable, var38.toggleFeedScaleType })
	local var45 = reactModule.useCallback(function() --[[ line: 142 ]]
		-- upvalues: checkDebugAccessModule (copy), var38 (ref), var23 (ref)
		if checkDebugAccessModule() then
			var38.toggleFeedDebugMode()
		end
		var23.disable()
	end, { var23.disable, var38.toggleFeedDebugMode })
	local var46 = reactModule.useCallback(function(p1, p2, p3) --[[ line: 150 ]]
		-- upvalues: p0 (ref), fFlagMomentsIPReporting (copy), reportMomentModule (copy), fFlagMomentsReportWithFeedId (copy), makeRecommendationAttributionModule (copy), var22 (ref), signalActionTypeModule (copy), makeFeedActionFieldsModule (copy), momentsCommonModule (copy), fireAnalyticsEvent (copy), eventNames (copy), var39 (ref), var40 (ref), var21 (ref)
		if not p0.moment then
			return nil
		end
		local var55 = true
		local var56 = true
		local var57 = nil
		
		if not p3 then
			local ok, status, var58 = pcall(function() --[[ line: 159 ]]
				-- upvalues: fFlagMomentsIPReporting (copy), reportMomentModule (copy), fFlagMomentsReportWithFeedId (copy), p0 (copy), p1 (ref)
				return if fFlagMomentsIPReporting then reportMomentModule(if fFlagMomentsReportWithFeedId then p0.moment.recommendationMetadata.feedItemId else p0.moment.momentId, p1):await() else reportMomentModule(if fFlagMomentsReportWithFeedId then p0.moment.recommendationMetadata.feedItemId else p0.moment.momentId):await()
			end)
			var55 = ok
			var56 = status
			var57 = var58
		end
		local recommendationMetadata = p0.moment.recommendationMetadata
		local var59 = makeRecommendationAttributionModule(recommendationMetadata)
		
		if var59 then
			local ok, status = pcall(function() --[[ line: 185 ]]
				-- upvalues: var22 (copy), signalActionTypeModule (copy), var59 (ref)
				var22.logAction(signalActionTypeModule.Report, var59, {})
			end)
			
			if not ok then
				warn("Failed to log action event", status)
			end
		end
		local var60 = makeFeedActionFieldsModule(p0.moment.momentId, recommendationMetadata and recommendationMetadata.feedItemId, recommendationMetadata and recommendationMetadata.tracingId, if momentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity() then "report" else nil)
		
		if var60 then
			fireAnalyticsEvent(eventNames.FeedAbuseReported, var60)
		end
		if not p2 then
			var39.markReported(p0.moment.momentId)
			var22.removeCurrentItem()
			var40.triggerToast({
				title = var21.reportSubmittedTitle,
				text = var21.reportSubmittedBody
			})
		end
		return if var55 and var56 and type(var57) == "table" then var57.reportCode else nil
	end, {
		p0.moment, var22.logAction, var22.removeCurrentItem, var39.markReported,
		var40.triggerToast, var21
	})
	local var47 = reactModule.useCallback(function() --[[ line: 232 ]]
		-- upvalues: var23 (ref), getPostFeedItemIdModule (copy), p0 (ref), fFlagEnableReportingFlowForMomentsFeed (copy), openMomentsFeedReport (ref), reportModalCovering (copy), var46 (ref), var31 (write), var29 (write), fFlagMomentsIPReporting (copy), var25 (write)
		var23.disable()
		local var61 = getPostFeedItemIdModule(p0.moment)
		
		if fFlagEnableReportingFlowForMomentsFeed and var61 and openMomentsFeedReport then
			reportModalCovering.setCovering(true)
			openMomentsFeedReport({
				feedItemId = var61,
				momentId = p0.moment.momentId,
				onSubmit = function() --[[ line: 248 ]]
					-- upvalues: var46 (copy)
					var46(nil, false, true)
				end,
				onClose = function() --[[ line: 251 ]]
					-- upvalues: reportModalCovering (copy)
					reportModalCovering.setCovering(false)
				end,
				onIpReportCode = function(p4) --[[ line: 255 ]]
					-- upvalues: var46 (copy), var31 (copy), var29 (copy)
					var46(nil, true, true)
					var31(if p4 and p4 ~= "" then p4 else "------")
					var29(true)
				end
			})
			
			return
		elseif fFlagMomentsIPReporting then
			var25(true)
			
			return
		end
		task.spawn(function() --[[ line: 267 ]]
			-- upvalues: var46 (copy)
			var46(nil, false)
		end)
	end, { var23.disable, var46, openMomentsFeedReport, p0.moment })
	local var48 = if fFlagMomentsIPReporting then reactModule.useCallback(function() --[[ line: 274 ]]
		-- upvalues: var25 (write)
		var25(false)
	end, {}) else nil
	local var49 = reactModule.useCallback(function() --[[ line: 279 ]]
		-- upvalues: var29 (write)
		if var29 then
			var29(false)
		end
	end, {})
	local var50 = reactModule.useCallback(function() --[[ line: 285 ]]
		-- upvalues: var23 (ref), getFFlagMomentsAnalyticsSchemaIdentity (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), var37 (ref), p0 (ref)
		var23.disable()
		local var62 = getFFlagMomentsAnalyticsSchemaIdentity()
		
		if not fFlagMomentsPassFeedItemIdToBackendApis and not var62 then
			var37.requestDeletion(p0.moment.momentId)
			
			return
		end
		var37.requestDeletion(p0.moment.momentId, p0.moment.recommendationMetadata and p0.moment.recommendationMetadata.feedItemId, if var62 and p0.moment.recommendationMetadata then p0.moment.recommendationMetadata.tracingId else nil)
	end, { p0.moment, var23.disable, var37.requestDeletion })
	local var51 = if p0.isFeedMuteButtonAnalyticsEnabled then reactModule.useCallback(function() --[[ line: 317 ]]
		-- upvalues: p0 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if p0.isDisabled then
			return
		end
		fireAnalyticsEvent(if p0.playbackVolume.isMuted then eventNames.FeedUnmuteButtonPressed else eventNames.FeedMuteButtonPressed, { momentId = p0.moment.momentId })
		p0.playbackVolume.toggle()
	end, { p0.isDisabled, p0.playbackVolume, p0.moment }) else reactModule.useCallback(function() --[[ line: 304 ]]
		-- upvalues: p0 (ref)
		if p0.isDisabled then
			return
		end
		p0.playbackVolume.toggle()
	end, { p0.isDisabled, p0.playbackVolume })
	local var52 = reactModule.createElement(menu, {
		align = foundationModule.Enums.PopoverAlign.End,
		isOpen = var23.enabled,
		items = reactModule.useMemo(function() --[[ line: 343 ]]
			-- upvalues: var41 (ref), var21 (ref), var43 (ref), var42 (ref), var44 (ref), p0 (ref), localPlayer (copy), fFlagMomentsReportWithFeedId (copy), foundationModule (copy), var47 (ref), fFlagMomentsPassFeedItemIdToBackendApis (copy), var50 (ref), checkDebugAccessModule (copy), var45 (ref)
			local list = {
				{
					id = "details",
					icon = if var41 then "icons/actions/viewOn" else "icons/actions/viewOff",
					text = if var41 then var21.showDetails else var21.hideDetails,
					onActivated = var43
				},
				{
					id = "minimize",
					icon = if var42 then "icons/actions/previewExpand" else "icons/actions/previewShrink",
					text = if var42 then var21.expand else var21.minimize,
					onActivated = var44
				}
			}
			local var64 = p0.moment.recommendationMetadata ~= nil and (p0.moment.recommendationMetadata.feedItemId ~= nil and p0.moment.recommendationMetadata.feedItemId ~= "")
			
			if p0.moment.creatorId ~= (if localPlayer then localPlayer.UserId else nil) and (not fFlagMomentsReportWithFeedId or var64) then
				table.insert(list, {
					id = "reportAbuse",
					icon = foundationModule.Enums.IconName.Flag,
					text = var21.report,
					onActivated = var47
				})
			elseif not fFlagMomentsPassFeedItemIdToBackendApis or var64 then
				table.insert(list, {
					id = "delete",
					icon = "icons/actions/delete",
					text = var21.delete,
					onActivated = var50
				})
			end
			if checkDebugAccessModule() then
				table.insert(list, {
					id = "debug",
					icon = "icons/logo/block",
					text = "Toggle Debug Mode",
					onActivated = var45
				})
			end
			return list
		end, {
			p0.moment, var41, var42, var21, var45, var43, var44, var47, var50
		}),
		onPressedOutside = var23.disable,
		side = foundationModule.Enums.PopoverSide.Left
	}, {
		ContextualMenuButton = reactModule.createElement(iconButton, {
			testId = "FeedContextualMenuButton",
			icon = threeDotsVertical,
			isDisabled = p0.isDisabled,
			onActivated = var36,
			size = foundationModule.Enums.InputSize.Large
		})
	})
	local var53 = if fFlagMomentsIPReporting then reactModule.createElement(reportMomentDialogModule, { isOpen = var24, onClose = var48, onSubmitReport = var46 }) else nil
	local var54 = if fFlagEnableReportingFlowForMomentsFeed and var28 then reactModule.createElement(ipReportConfirmationDialogModule, { reportCode = var30, onClose = var49 }) else nil
	
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
				onActivated = var51,
				size = foundationModule.Enums.InputSize.Medium
			}),
			ContextMenuPopover = var52
		}),
		ReportDialog = var53,
		IpConfirmationDialog = var54
	}) else reactModule.createElement(view, {
		tag = "col align-x-center auto-xy",
		LayoutOrder = p0.layoutOrder
	}, {
		ContextMenuPopover = var52,
		ReportDialog = var53,
		IpConfirmationDialog = var54
	})
end