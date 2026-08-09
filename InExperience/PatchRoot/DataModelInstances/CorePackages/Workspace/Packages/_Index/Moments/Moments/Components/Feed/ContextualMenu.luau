local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local playersService = game:GetService("Players")
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local reactModule = require(parent.React)
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
local reportMomentModule = require(moments.Moderation.reportMoment)
local useFeed = require(moments.Components.Feed.FeedContext).useFeed
local useMomentsSession = require(moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)
local getModeratedItemsStoreModule = require(moments.Stores.GetModeratedItemsStore)
local getToastStoreModule = require(moments.Stores.GetToastStore)
local signalActionTypeModule = require(moments.Enums.SignalActionType)
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

return function(p0) --[[ line: 69 ]]
	-- upvalues: useLocalization (ref), t (ref), useFeed (ref), useToggleState (ref), reactModule (ref), useMomentsSession (ref), getMomentsPreferencesStoreModule (ref), getModeratedItemsStoreModule (ref), getToastStoreModule (ref), signalsReactModule (ref), fireAnalyticsEvent (ref), eventNames (ref), checkDebugAccessModule (ref), reportMomentModule (ref), signalActionTypeModule (ref), localPlayer (ref), menu (ref), foundationModule (ref), iconButton (ref), threeDotsVertical (ref), view (ref), speakerSlash (ref), speaker (ref)
	local var15 = useLocalization(t)
	local var16 = useFeed()
	local var17 = useToggleState()
	local var18 = reactModule.useCallback(function() --[[ line: 77 ]]
		-- upvalues: var17 (ref)
		if var17.enabled then
			var17.disable()
			
			return
		end
		var17.enable()
	end, { var17.enabled, var17.enable, var17.disable })
	local var19 = useMomentsSession()
	local var20 = getMomentsPreferencesStoreModule(false)
	local var21 = getModeratedItemsStoreModule(false)
	local var22 = getToastStoreModule(false)
	local var23 = signalsReactModule.useSignalState(var19.getHideDetails)
	local var24 = signalsReactModule.useSignalState(var20.getMinimized)
	local var25 = reactModule.useCallback(function() --[[ line: 93 ]]
		-- upvalues: var17 (ref), var19 (ref), fireAnalyticsEvent (copy), eventNames (copy), p0 (ref)
		var17.disable()
		var19.toggleFeedDetailVisibility()
		fireAnalyticsEvent(eventNames.FeedHideDetailsButtonPressed, { momentId = p0.moment.momentId })
	end, {
		p0.moment,
		var17.disable,
		var19.toggleFeedDetailVisibility
	})
	local var26 = reactModule.useCallback(function() --[[ line: 101 ]]
		-- upvalues: var17 (ref), var20 (ref), fireAnalyticsEvent (copy), eventNames (copy), p0 (ref)
		var17.disable()
		var20.toggleFeedScaleType()
		fireAnalyticsEvent(eventNames.FeedMinimizeButtonPressed, { momentId = p0.moment.momentId })
	end, { p0.moment, var17.disable, var20.toggleFeedScaleType })
	local var27 = reactModule.useCallback(function() --[[ line: 109 ]]
		-- upvalues: checkDebugAccessModule (copy), var20 (ref), var17 (ref)
		if checkDebugAccessModule() then
			var20.toggleFeedDebugMode()
		end
		var17.disable()
	end, { var17.disable, var20.toggleFeedDebugMode })
	local var28 = reactModule.useCallback(function() --[[ line: 117 ]]
		-- upvalues: var17 (ref), p0 (ref), reportMomentModule (copy), var16 (ref), signalActionTypeModule (copy), fireAnalyticsEvent (copy), eventNames (copy), var21 (ref), var22 (ref), var15 (ref)
		var17.disable()
		task.spawn(function() --[[ line: 119 ]]
			-- upvalues: p0 (copy), reportMomentModule (copy), var16 (copy), signalActionTypeModule (copy), fireAnalyticsEvent (copy), eventNames (copy), var21 (copy), var22 (copy), var15 (copy)
			if not p0.moment then return end
			local _, _ = pcall(function() --[[ line: 124 ]]
				-- upvalues: reportMomentModule (copy), p0 (copy)
				return reportMomentModule(p0.moment.momentId):await()
			end)
			local recommendationMetadata = p0.moment.recommendationMetadata
			
			if recommendationMetadata then
				local ok, status = pcall(function() --[[ line: 134 ]]
					-- upvalues: var16 (copy), signalActionTypeModule (copy), recommendationMetadata (ref)
					var16.logAction(signalActionTypeModule.Report, {
						itemId = recommendationMetadata.itemId,
						tracingId = recommendationMetadata.tracingId
					}, {})
				end)
				
				if not ok then
					warn("Failed to log action event", status)
				end
			end
			fireAnalyticsEvent(eventNames.FeedAbuseReported, { momentId = p0.moment.momentId })
			var21.markReported(p0.moment.momentId)
			var16.removeCurrentItem()
			var22.triggerToast({
				title = var15.reportSubmittedTitle,
				text = var15.reportSubmittedBody
			})
		end)
	end, {
		p0.moment, var16.logAction, var16.removeCurrentItem, var17.disable,
		var21.markReported, var22.triggerToast, var15
	})
	local var29 = reactModule.useCallback(function() --[[ line: 170 ]]
		-- upvalues: var17 (ref), var19 (ref), p0 (ref)
		var17.disable()
		var19.requestDeletion(p0.moment.momentId)
	end, { p0.moment, var17.disable, var19.requestDeletion })
	local var30 = reactModule.createElement(menu, {
		align = foundationModule.Enums.PopoverAlign.End,
		isOpen = var17.enabled,
		items = reactModule.useMemo(function() --[[ line: 215 ]]
			-- upvalues: var23 (ref), var15 (ref), var25 (ref), var24 (ref), var26 (ref), p0 (ref), localPlayer (copy), var28 (ref), var29 (ref), checkDebugAccessModule (copy), var27 (ref)
			local list = {
				{
					id = "details",
					icon = if var23 then "icons/actions/viewOn" else "icons/actions/viewOff",
					text = if var23 then var15.showDetails else var15.hideDetails,
					onActivated = var25
				},
				{
					id = "minimize",
					icon = if var24 then "icons/actions/previewExpand" else "icons/actions/previewShrink",
					text = if var24 then var15.expand else var15.minimize,
					onActivated = var26
				}
			}
			
			if p0.moment.creatorId == (if localPlayer then localPlayer.UserId else nil) then
				table.insert(list, {
					id = "delete",
					icon = "icons/actions/delete",
					text = var15.delete,
					onActivated = var29
				})
			else
				table.insert(list, {
					id = "reportAbuse",
					icon = "icons/actions/feedback",
					text = var15.report,
					onActivated = var28
				})
			end
			if checkDebugAccessModule() then
				table.insert(list, {
					id = "debug",
					icon = "icons/logo/block",
					text = "Toggle Debug Mode",
					onActivated = var27
				})
			end
			return list
		end, {
			p0.moment, var23, var24, var15, var27, var25, var26, var28, var29
		}),
		onPressedOutside = var17.disable,
		side = foundationModule.Enums.PopoverSide.Left
	}, {
		ContextualMenuButton = reactModule.createElement(iconButton, {
			testId = "FeedContextualMenuButton",
			icon = threeDotsVertical,
			isDisabled = p0.isDisabled,
			onActivated = var18,
			size = foundationModule.Enums.InputSize.Large
		})
	})
	
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
				onActivated = if p0.isFeedMuteButtonAnalyticsEnabled then reactModule.useCallback(function() --[[ line: 189 ]]
					-- upvalues: p0 (ref), fireAnalyticsEvent (copy), eventNames (copy)
					if p0.isDisabled then
						return
					end
					fireAnalyticsEvent(if p0.playbackVolume.isMuted then eventNames.FeedUnmuteButtonPressed else eventNames.FeedMuteButtonPressed, { momentId = p0.moment.momentId })
					p0.playbackVolume.toggle()
				end, { p0.isDisabled, p0.playbackVolume, p0.moment }) else reactModule.useCallback(function() --[[ line: 176 ]]
					-- upvalues: p0 (ref)
					if p0.isDisabled then
						return
					end
					p0.playbackVolume.toggle()
				end, { p0.isDisabled, p0.playbackVolume }),
				size = foundationModule.Enums.InputSize.Medium
			}),
			ContextMenuPopover = var30
		})
	}) else reactModule.createElement(view, {
		tag = "col align-x-center auto-xy",
		LayoutOrder = p0.layoutOrder
	}, { ContextMenuPopover = var30 })
end