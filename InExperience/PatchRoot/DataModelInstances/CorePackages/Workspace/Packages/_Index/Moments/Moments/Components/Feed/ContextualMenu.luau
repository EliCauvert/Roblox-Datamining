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

return function(p0) --[[ line: 80 ]]
	-- upvalues: useLocalization (ref), t (ref), useFeed (ref), useMomentsHost (ref), useToggleState (ref), fFlagMomentsIPReporting (ref), reactModule (ref), useMomentsSession (ref), getMomentsPreferencesStoreModule (ref), getModeratedItemsStoreModule (ref), getToastStoreModule (ref), signalsReactModule (ref), fireAnalyticsEvent (ref), eventNames (ref), checkDebugAccessModule (ref), reportMomentModule (ref), fFlagMomentsReportWithFeedId (ref), makeRecommendationAttributionModule (ref), signalActionTypeModule (ref), makeFeedActionFieldsModule (ref), momentsCommonModule (ref), fFlagEnableReportingFlowForMomentsFeed (ref), getFFlagMomentsAnalyticsSchemaIdentity (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), localPlayer (ref), foundationModule (ref), menu (ref), iconButton (ref), threeDotsVertical (ref), reportMomentDialogModule (ref), view (ref), speakerSlash (ref), speaker (ref)
	local var19 = useLocalization(t)
	local var20 = useFeed()
	local openMomentsFeedReport = useMomentsHost().openMomentsFeedReport
	local var21 = useToggleState()
	local var22 = nil
	local var23 = nil
	
	if fFlagMomentsIPReporting then
		local var24, var25 = reactModule.useState(false)
		var22 = var24
		var23 = var25
	end
	local var26 = reactModule.useCallback(function() --[[ line: 95 ]]
		-- upvalues: var21 (ref)
		if var21.enabled then
			var21.disable()
			
			return
		end
		var21.enable()
	end, { var21.enabled, var21.enable, var21.disable })
	local var27 = useMomentsSession()
	local var28 = getMomentsPreferencesStoreModule(false)
	local var29 = getModeratedItemsStoreModule(false)
	local var30 = getToastStoreModule(false)
	local var31 = signalsReactModule.useSignalState(var27.getHideDetails)
	local var32 = signalsReactModule.useSignalState(var28.getMinimized)
	local var33 = reactModule.useCallback(function() --[[ line: 111 ]]
		-- upvalues: var21 (ref), var27 (ref), fireAnalyticsEvent (copy), eventNames (copy), p0 (ref)
		var21.disable()
		var27.toggleFeedDetailVisibility()
		fireAnalyticsEvent(eventNames.FeedHideDetailsButtonPressed, { momentId = p0.moment.momentId })
	end, {
		p0.moment,
		var21.disable,
		var27.toggleFeedDetailVisibility
	})
	local var34 = reactModule.useCallback(function() --[[ line: 119 ]]
		-- upvalues: var21 (ref), var28 (ref), fireAnalyticsEvent (copy), eventNames (copy), p0 (ref)
		var21.disable()
		var28.toggleFeedScaleType()
		fireAnalyticsEvent(eventNames.FeedMinimizeButtonPressed, { momentId = p0.moment.momentId })
	end, { p0.moment, var21.disable, var28.toggleFeedScaleType })
	local var35 = reactModule.useCallback(function() --[[ line: 127 ]]
		-- upvalues: checkDebugAccessModule (copy), var28 (ref), var21 (ref)
		if checkDebugAccessModule() then
			var28.toggleFeedDebugMode()
		end
		var21.disable()
	end, { var21.disable, var28.toggleFeedDebugMode })
	local var36 = reactModule.useCallback(function(p1, p2, p3) --[[ line: 135 ]]
		-- upvalues: p0 (ref), fFlagMomentsIPReporting (copy), reportMomentModule (copy), fFlagMomentsReportWithFeedId (copy), makeRecommendationAttributionModule (copy), var20 (ref), signalActionTypeModule (copy), makeFeedActionFieldsModule (copy), momentsCommonModule (copy), fireAnalyticsEvent (copy), eventNames (copy), var29 (ref), var30 (ref), var19 (ref)
		if not p0.moment then
			return nil
		end
		local var43 = true
		local var44 = true
		local var45 = nil
		
		if not p3 then
			local ok, status, var46 = pcall(function() --[[ line: 144 ]]
				-- upvalues: fFlagMomentsIPReporting (copy), reportMomentModule (copy), fFlagMomentsReportWithFeedId (copy), p0 (copy), p1 (ref)
				return if fFlagMomentsIPReporting then reportMomentModule(if fFlagMomentsReportWithFeedId then p0.moment.recommendationMetadata.feedItemId else p0.moment.momentId, p1):await() else reportMomentModule(if fFlagMomentsReportWithFeedId then p0.moment.recommendationMetadata.feedItemId else p0.moment.momentId):await()
			end)
			var43 = ok
			var44 = status
			var45 = var46
		end
		local recommendationMetadata = p0.moment.recommendationMetadata
		local var47 = makeRecommendationAttributionModule(recommendationMetadata)
		
		if var47 then
			local ok, status = pcall(function() --[[ line: 170 ]]
				-- upvalues: var20 (copy), signalActionTypeModule (copy), var47 (ref)
				var20.logAction(signalActionTypeModule.Report, var47, {})
			end)
			
			if not ok then
				warn("Failed to log action event", status)
			end
		end
		local var48 = makeFeedActionFieldsModule(p0.moment.momentId, recommendationMetadata and recommendationMetadata.feedItemId, recommendationMetadata and recommendationMetadata.tracingId, if momentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity() then "report" else nil)
		
		if var48 then
			fireAnalyticsEvent(eventNames.FeedAbuseReported, var48)
		end
		if not p2 then
			var29.markReported(p0.moment.momentId)
			var20.removeCurrentItem()
			var30.triggerToast({
				title = var19.reportSubmittedTitle,
				text = var19.reportSubmittedBody
			})
		end
		return if var43 and var44 and type(var45) == "table" then var45.reportCode else nil
	end, {
		p0.moment, var20.logAction, var20.removeCurrentItem, var29.markReported,
		var30.triggerToast, var19
	})
	local var37 = reactModule.useCallback(function() --[[ line: 217 ]]
		-- upvalues: var21 (ref), p0 (ref), fFlagEnableReportingFlowForMomentsFeed (copy), openMomentsFeedReport (ref), var36 (ref), fFlagMomentsIPReporting (copy), var23 (write)
		var21.disable()
		local feedItemId = p0.moment.recommendationMetadata and p0.moment.recommendationMetadata.feedItemId
		
		if fFlagEnableReportingFlowForMomentsFeed and feedItemId and (feedItemId ~= "" and openMomentsFeedReport) then
			openMomentsFeedReport({
				feedItemId = feedItemId,
				onSubmit = function() --[[ line: 226 ]]
					-- upvalues: var36 (copy)
					var36(nil, false, true)
				end
			})
			
			return
		elseif fFlagMomentsIPReporting then
			var23(true)
			
			return
		end
		task.spawn(function() --[[ line: 233 ]]
			-- upvalues: var36 (copy)
			var36(nil, false)
		end)
	end, { var21.disable, var36, openMomentsFeedReport, p0.moment })
	local var38 = if fFlagMomentsIPReporting then reactModule.useCallback(function() --[[ line: 240 ]]
		-- upvalues: var23 (write)
		var23(false)
	end, {}) else nil
	local var39 = reactModule.useCallback(function() --[[ line: 245 ]]
		-- upvalues: var21 (ref), getFFlagMomentsAnalyticsSchemaIdentity (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), var27 (ref), p0 (ref)
		var21.disable()
		local var50 = getFFlagMomentsAnalyticsSchemaIdentity()
		
		if not fFlagMomentsPassFeedItemIdToBackendApis and not var50 then
			var27.requestDeletion(p0.moment.momentId)
			
			return
		end
		var27.requestDeletion(p0.moment.momentId, p0.moment.recommendationMetadata and p0.moment.recommendationMetadata.feedItemId, if var50 and p0.moment.recommendationMetadata then p0.moment.recommendationMetadata.tracingId else nil)
	end, { p0.moment, var21.disable, var27.requestDeletion })
	local var40 = if p0.isFeedMuteButtonAnalyticsEnabled then reactModule.useCallback(function() --[[ line: 277 ]]
		-- upvalues: p0 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if p0.isDisabled then
			return
		end
		fireAnalyticsEvent(if p0.playbackVolume.isMuted then eventNames.FeedUnmuteButtonPressed else eventNames.FeedMuteButtonPressed, { momentId = p0.moment.momentId })
		p0.playbackVolume.toggle()
	end, { p0.isDisabled, p0.playbackVolume, p0.moment }) else reactModule.useCallback(function() --[[ line: 264 ]]
		-- upvalues: p0 (ref)
		if p0.isDisabled then
			return
		end
		p0.playbackVolume.toggle()
	end, { p0.isDisabled, p0.playbackVolume })
	local var41 = reactModule.createElement(menu, {
		align = foundationModule.Enums.PopoverAlign.End,
		isOpen = var21.enabled,
		items = reactModule.useMemo(function() --[[ line: 303 ]]
			-- upvalues: var31 (ref), var19 (ref), var33 (ref), var32 (ref), var34 (ref), p0 (ref), localPlayer (copy), fFlagMomentsReportWithFeedId (copy), foundationModule (copy), var37 (ref), fFlagMomentsPassFeedItemIdToBackendApis (copy), var39 (ref), checkDebugAccessModule (copy), var35 (ref)
			local list = {
				{
					id = "details",
					icon = if var31 then "icons/actions/viewOn" else "icons/actions/viewOff",
					text = if var31 then var19.showDetails else var19.hideDetails,
					onActivated = var33
				},
				{
					id = "minimize",
					icon = if var32 then "icons/actions/previewExpand" else "icons/actions/previewShrink",
					text = if var32 then var19.expand else var19.minimize,
					onActivated = var34
				}
			}
			local var52 = p0.moment.recommendationMetadata ~= nil and (p0.moment.recommendationMetadata.feedItemId ~= nil and p0.moment.recommendationMetadata.feedItemId ~= "")
			
			if p0.moment.creatorId ~= (if localPlayer then localPlayer.UserId else nil) and (not fFlagMomentsReportWithFeedId or var52) then
				table.insert(list, {
					id = "reportAbuse",
					icon = foundationModule.Enums.IconName.Flag,
					text = var19.report,
					onActivated = var37
				})
			elseif not fFlagMomentsPassFeedItemIdToBackendApis or var52 then
				table.insert(list, {
					id = "delete",
					icon = "icons/actions/delete",
					text = var19.delete,
					onActivated = var39
				})
			end
			if checkDebugAccessModule() then
				table.insert(list, {
					id = "debug",
					icon = "icons/logo/block",
					text = "Toggle Debug Mode",
					onActivated = var35
				})
			end
			return list
		end, {
			p0.moment, var31, var32, var19, var35, var33, var34, var37, var39
		}),
		onPressedOutside = var21.disable,
		side = foundationModule.Enums.PopoverSide.Left
	}, {
		ContextualMenuButton = reactModule.createElement(iconButton, {
			testId = "FeedContextualMenuButton",
			icon = threeDotsVertical,
			isDisabled = p0.isDisabled,
			onActivated = var26,
			size = foundationModule.Enums.InputSize.Large
		})
	})
	local var42 = if fFlagMomentsIPReporting then reactModule.createElement(reportMomentDialogModule, { isOpen = var22, onClose = var38, onSubmitReport = var36 }) else nil
	
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
				onActivated = var40,
				size = foundationModule.Enums.InputSize.Medium
			}),
			ContextMenuPopover = var41
		}),
		ReportDialog = var42
	}) else reactModule.createElement(view, {
		tag = "col align-x-center auto-xy",
		LayoutOrder = p0.layoutOrder
	}, { ContextMenuPopover = var41, ReportDialog = var42 })
end