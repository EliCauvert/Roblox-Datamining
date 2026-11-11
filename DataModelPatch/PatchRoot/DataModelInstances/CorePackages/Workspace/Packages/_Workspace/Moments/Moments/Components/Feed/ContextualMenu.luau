local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local Speaker = BuilderIconsModule.Icon.Speaker
local SpeakerSlash = BuilderIconsModule.Icon.SpeakerSlash
local ThreeDotsVertical = BuilderIconsModule.Icon.ThreeDotsVertical
local IconButton = FoundationModule.IconButton
local Menu = FoundationModule.Menu
local View = FoundationModule.View
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseToggleStateFunction = MomentsCommonModule.Hooks.useToggleState
local CheckDebugAccessModule = require(Moments.Utils.checkDebugAccess)
local FireAnalyticsEventFunction = MomentsCommonModule.Analytics.fireAnalyticsEvent
local EventNames = MomentsCommonModule.Analytics.EventNames
local GetFFlagMomentsAnalyticsSchemaIdentityFunction = MomentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity
local MakeFeedActionFieldsModule = require(Moments.Analytics.makeFeedActionFields)
local MakeRecommendationAttributionModule = require(Moments.Analytics.makeRecommendationAttribution)
local ReportMomentModule = require(Moments.Moderation.reportMoment)
local UseFeedFunction = require(Moments.Components.Feed.FeedContext).useFeed
local UseMomentsSessionFunction = require(Moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local GetMomentsPreferencesStoreModule = require(Moments.Stores.GetMomentsPreferencesStore)
local GetModeratedItemsStoreModule = require(Moments.Stores.GetModeratedItemsStore)
local GetToastStoreModule = require(Moments.Stores.GetToastStore)
local SignalActionTypeModule = require(Moments.Enums.SignalActionType)
local LocalPlayer = game:GetService("Players").LocalPlayer
local config = {
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
	-- upvalues: UseLocalizationFunction (copy), config (copy), UseFeedFunction (copy), UseToggleStateFunction (copy), ReactModule (copy), UseMomentsSessionFunction (copy), GetMomentsPreferencesStoreModule (copy), GetModeratedItemsStoreModule (copy), GetToastStoreModule (copy), SignalsReactModule (copy), FireAnalyticsEventFunction (copy), EventNames (copy), CheckDebugAccessModule (copy), ReportMomentModule (copy), GetFFlagMomentsAnalyticsSchemaIdentityFunction (copy), MakeRecommendationAttributionModule (copy), SignalActionTypeModule (copy), MakeFeedActionFieldsModule (copy), MomentsCommonModule (copy), LocalPlayer (copy), Menu (copy), FoundationModule (copy), IconButton (copy), ThreeDotsVertical (copy), View (copy), SpeakerSlash (copy), Speaker (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseFeedResult = UseFeedFunction()
	local UseToggleStateResult = UseToggleStateFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseToggleStateResult (copy)
		if UseToggleStateResult.enabled then
			UseToggleStateResult.disable()
			
			return
		else
			UseToggleStateResult.enable()
		end
	end, {
		UseToggleStateResult.enabled,
		UseToggleStateResult.enable,
		UseToggleStateResult.disable
	})
	local UseMomentsSessionResult = UseMomentsSessionFunction()
	local MomentsPreferencesStoreModule = GetMomentsPreferencesStoreModule(false)
	local ModeratedItemsStoreModule = GetModeratedItemsStoreModule(false)
	local ToastStoreModule = GetToastStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMomentsSessionResult.getHideDetails)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(MomentsPreferencesStoreModule.getMinimized)
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseToggleStateResult (copy), UseMomentsSessionResult (copy), FireAnalyticsEventFunction (upval), EventNames (upval), p1 (copy)
		UseToggleStateResult.disable()
		UseMomentsSessionResult.toggleFeedDetailVisibility()
		FireAnalyticsEventFunction(EventNames.FeedHideDetailsButtonPressed, { momentId = p1.moment.momentId })
	end, {
		p1.moment,
		UseToggleStateResult.disable,
		UseMomentsSessionResult.toggleFeedDetailVisibility
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseToggleStateResult (copy), MomentsPreferencesStoreModule (copy), FireAnalyticsEventFunction (upval), EventNames (upval), p1 (copy)
		UseToggleStateResult.disable()
		MomentsPreferencesStoreModule.toggleFeedScaleType()
		FireAnalyticsEventFunction(EventNames.FeedMinimizeButtonPressed, { momentId = p1.moment.momentId })
	end, {
		p1.moment,
		UseToggleStateResult.disable,
		MomentsPreferencesStoreModule.toggleFeedScaleType
	})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: CheckDebugAccessModule (upval), MomentsPreferencesStoreModule (copy), UseToggleStateResult (copy)
		if CheckDebugAccessModule() then
			MomentsPreferencesStoreModule.toggleFeedDebugMode()
		end
		UseToggleStateResult.disable()
	end, {
		UseToggleStateResult.disable,
		MomentsPreferencesStoreModule.toggleFeedDebugMode
	})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseToggleStateResult (copy), p1 (copy), ReportMomentModule (upval), GetFFlagMomentsAnalyticsSchemaIdentityFunction (upval), MakeRecommendationAttributionModule (upval), UseFeedResult (copy), SignalActionTypeModule (upval), MakeFeedActionFieldsModule (upval), MomentsCommonModule (upval), FireAnalyticsEventFunction (upval), EventNames (upval), ModeratedItemsStoreModule (copy), ToastStoreModule (copy), UseLocalizationResult (copy)
		UseToggleStateResult.disable()
		task.spawn(function()
			-- upvalues: p1 (upval), ReportMomentModule (upval), GetFFlagMomentsAnalyticsSchemaIdentityFunction (upval), MakeRecommendationAttributionModule (upval), UseFeedResult (upval), SignalActionTypeModule (upval), MakeFeedActionFieldsModule (upval), MomentsCommonModule (upval), FireAnalyticsEventFunction (upval), EventNames (upval), ModeratedItemsStoreModule (upval), ToastStoreModule (upval), UseLocalizationResult (upval)
			if not p1.moment then return end
			local _, _ = pcall(function()
				-- upvalues: ReportMomentModule (upval), p1 (upval)
				return ReportMomentModule(p1.moment.momentId):await()
			end)
			local RecommendationMetadata = p1.moment.recommendationMetadata
			
			if GetFFlagMomentsAnalyticsSchemaIdentityFunction() then
				local RecommendationAttributionModule = MakeRecommendationAttributionModule(RecommendationMetadata)
				
				if RecommendationAttributionModule then
					local Success, Result = pcall(function()
						-- upvalues: UseFeedResult (upval), SignalActionTypeModule (upval), RecommendationAttributionModule (copy)
						UseFeedResult.logAction(SignalActionTypeModule.Report, RecommendationAttributionModule, {})
					end)
					
					if not Success then
						warn("Failed to log action event", Result)
					end
				end
			elseif RecommendationMetadata then
				local Success1, Result1 = pcall(function()
					-- upvalues: UseFeedResult (upval), SignalActionTypeModule (upval), RecommendationMetadata (copy)
					UseFeedResult.logAction(SignalActionTypeModule.Report, {
						itemId = RecommendationMetadata.itemId,
						tracingId = RecommendationMetadata.tracingId
					}, {})
				end)
				
				if not Success1 then
					warn("Failed to log action event", Result1)
				end
			end
			local FeedActionFieldsModule = MakeFeedActionFieldsModule(p1.moment.momentId, RecommendationMetadata and RecommendationMetadata.feedItemId, RecommendationMetadata and RecommendationMetadata.tracingId, if MomentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity() then "report" else nil)
			
			if FeedActionFieldsModule then
				FireAnalyticsEventFunction(EventNames.FeedAbuseReported, FeedActionFieldsModule)
			end
			ModeratedItemsStoreModule.markReported(p1.moment.momentId)
			UseFeedResult.removeCurrentItem()
			ToastStoreModule.triggerToast({
				title = UseLocalizationResult.reportSubmittedTitle,
				text = UseLocalizationResult.reportSubmittedBody
			})
		end)
	end, {
		p1.moment, UseFeedResult.logAction, UseFeedResult.removeCurrentItem,
		UseToggleStateResult.disable, ModeratedItemsStoreModule.markReported,
		ToastStoreModule.triggerToast, UseLocalizationResult
	})
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseToggleStateResult (copy), UseMomentsSessionResult (copy), p1 (copy)
		UseToggleStateResult.disable()
		UseMomentsSessionResult.requestDeletion(p1.moment.momentId, p1.moment.recommendationMetadata and p1.moment.recommendationMetadata.feedItemId, p1.moment.recommendationMetadata and p1.moment.recommendationMetadata.tracingId)
	end, {
		p1.moment,
		UseToggleStateResult.disable,
		UseMomentsSessionResult.requestDeletion
	})
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if not p1.isDisabled then
			p1.playbackVolume.toggle()
			
			return
		end
	end, { p1.isDisabled, p1.playbackVolume })
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), FireAnalyticsEventFunction (upval), EventNames (upval)
		if not p1.isDisabled then
			FireAnalyticsEventFunction(if p1.playbackVolume.isMuted then EventNames.FeedUnmuteButtonPressed else EventNames.FeedMuteButtonPressed, { momentId = p1.moment.momentId })
			p1.playbackVolume.toggle()
			
			return
		end
	end, { p1.isDisabled, p1.playbackVolume, p1.moment })
	local UseResult8 = if p1.isFeedMuteButtonAnalyticsEnabled then UseResult7 else UseResult6
	local Element = ReactModule.createElement(Menu, {
		align = FoundationModule.Enums.PopoverAlign.End,
		isOpen = UseToggleStateResult.enabled,
		items = ReactModule.useMemo(function()
			-- upvalues: UseSignalStateResult (copy), UseLocalizationResult (copy), UseResult1 (copy), UseSignalStateResult1 (copy), UseResult2 (copy), p1 (copy), LocalPlayer (upval), UseResult4 (copy), UseResult5 (copy), CheckDebugAccessModule (upval), UseResult3 (copy)
			local List = {
				{
					id = "details",
					icon = if UseSignalStateResult then "icons/actions/viewOn" else "icons/actions/viewOff",
					text = if UseSignalStateResult then UseLocalizationResult.showDetails else UseLocalizationResult.hideDetails,
					onActivated = UseResult1
				},
				{
					id = "minimize",
					icon = if UseSignalStateResult1 then "icons/actions/previewExpand" else "icons/actions/previewShrink",
					text = if UseSignalStateResult1 then UseLocalizationResult.expand else UseLocalizationResult.minimize,
					onActivated = UseResult2
				}
			}
			
			if p1.moment.creatorId == (if LocalPlayer then LocalPlayer.UserId else nil) then
				table.insert(List, {
					id = "delete",
					icon = "icons/actions/delete",
					text = UseLocalizationResult.delete,
					onActivated = UseResult5
				})
			else
				table.insert(List, {
					id = "reportAbuse",
					icon = "icons/actions/feedback",
					text = UseLocalizationResult.report,
					onActivated = UseResult4
				})
			end
			if CheckDebugAccessModule() then
				table.insert(List, {
					id = "debug",
					icon = "icons/logo/block",
					text = "Toggle Debug Mode",
					onActivated = UseResult3
				})
			end
			return List
		end, {
			p1.moment, UseSignalStateResult, UseSignalStateResult1, UseLocalizationResult,
			UseResult3, UseResult1, UseResult2, UseResult4, UseResult5
		}),
		onPressedOutside = UseToggleStateResult.disable,
		side = FoundationModule.Enums.PopoverSide.Left
	}, {
		ContextualMenuButton = ReactModule.createElement(IconButton, {
			testId = "FeedContextualMenuButton",
			icon = ThreeDotsVertical,
			isDisabled = p1.isDisabled,
			onActivated = UseResult,
			size = FoundationModule.Enums.InputSize.Large
		})
	})
	
	return if p1.isFeedMuteEnabled then ReactModule.createElement(View, {
		tag = "col align-x-right auto-xy",
		LayoutOrder = p1.layoutOrder
	}, {
		MuteAndMenuRow = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-x-right align-y-center gap-xsmall auto-xy"
		}, {
			FeedMuteButton = ReactModule.createElement(IconButton, {
				testId = "FeedMuteButton",
				icon = if p1.playbackVolume.isMuted then SpeakerSlash else Speaker,
				isDisabled = p1.isDisabled,
				onActivated = UseResult8,
				size = FoundationModule.Enums.InputSize.Medium
			}),
			ContextMenuPopover = Element
		})
	}) else ReactModule.createElement(View, {
		tag = "col align-x-center auto-xy",
		LayoutOrder = p1.layoutOrder
	}, { ContextMenuPopover = Element })
end