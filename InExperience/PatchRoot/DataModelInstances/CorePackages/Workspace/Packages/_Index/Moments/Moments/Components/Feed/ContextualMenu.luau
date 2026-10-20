local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
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
local GetPostFeedItemIdModule = require(Moments.Utils.getPostFeedItemId)
local FireAnalyticsEventFunction = MomentsCommonModule.Analytics.fireAnalyticsEvent
local ReportMomentsEngagementFunction = MomentsCommonModule.Analytics.reportMomentsEngagement
local EventNames = MomentsCommonModule.Analytics.EventNames
local ReportModalCovering = MomentsCommonModule.Media.reportModalCovering
local MakeFeedActionFieldsModule = require(Moments.Analytics.makeFeedActionFields)
local MakeRecommendationAttributionModule = require(Moments.Analytics.makeRecommendationAttribution)
local ReportMomentModule = require(Moments.Moderation.reportMoment)
local UseFeedFunction = require(Moments.Components.Feed.FeedContext).useFeed
local UseMomentsSessionFunction = require(Moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local GetMomentsPreferencesStoreModule = require(Moments.Stores.GetMomentsPreferencesStore)
local GetModeratedItemsStoreModule = require(Moments.Stores.GetModeratedItemsStore)
local GetToastStoreModule = require(Moments.Stores.GetToastStore)
local SignalActionTypeModule = require(Moments.Enums.SignalActionType)
local FFlagMomentsOptimisticProfilePending = SharedFlagsModule.FFlagMomentsOptimisticProfilePending
local FFlagMomentsPassFeedItemIdToBackendApis = SharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local FFlagMomentsServeEDPVideos = SharedFlagsModule.FFlagMomentsServeEDPVideos
local MomentsUseSmallOverflowMenu = game:DefineFastFlag("MomentsUseSmallOverflowMenu", false)
local MomentsReportButtonAnalytics = game:DefineFastFlag("MomentsReportButtonAnalytics", false)
local FFlagMomentsCreatorAnalyticsModule = require(Moments.Flags.FFlagMomentsCreatorAnalytics)
local GetPostInsightsPageStoreModule = require(Moments.Components.PostInsights.getPostInsightsPageStore)
local PostInsightsStringsModule = require(Moments.Components.PostInsights.postInsightsStrings)
local PostInsightsCoachmarkModule = require(Moments.Components.PostInsights.PostInsightsCoachmark)
local DismissPostInsightsCoachmarkModule = require(Moments.Components.PostInsights.dismissPostInsightsCoachmark)
local GetFFlagMomentsCoachmarkPersistenceFunction = MomentsCommonModule.Flags.GetFFlagMomentsCoachmarkPersistence
local _ = require(Moments.Components.Feed.Items.Moment.createMomentStore)
local ReportMomentDialogModule = require(Moments.Components.Feed.ReportMomentDialog)
local IpReportConfirmationDialogModule = require(Moments.Components.Feed.IpReportConfirmationDialog)
local UseMomentsHostFunction = require(Moments.MomentsHostContext).useMomentsHost
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

return function(p1) --[[ Line: 96 ]]
	-- upvalues: UseLocalizationFunction (copy), config (copy), FFlagMomentsCreatorAnalyticsModule (copy), PostInsightsStringsModule (copy), UseFeedFunction (copy), FFlagMomentsServeEDPVideos (copy), UseMomentsHostFunction (copy), UseToggleStateFunction (copy), ReactModule (copy), UseMomentsSessionFunction (copy), GetMomentsPreferencesStoreModule (copy), GetModeratedItemsStoreModule (copy), GetToastStoreModule (copy), SignalsReactModule (copy), FireAnalyticsEventFunction (copy), EventNames (copy), CheckDebugAccessModule (copy), ReportMomentModule (copy), MakeRecommendationAttributionModule (copy), SignalActionTypeModule (copy), MakeFeedActionFieldsModule (copy), MomentsReportButtonAnalytics (copy), ReportMomentsEngagementFunction (copy), GetPostFeedItemIdModule (copy), ReportModalCovering (copy), Moments (copy), GetFFlagMomentsCoachmarkPersistenceFunction (copy), DismissPostInsightsCoachmarkModule (copy), GetPostInsightsPageStoreModule (copy), LocalPlayer (copy), FoundationModule (copy), FFlagMomentsPassFeedItemIdToBackendApis (copy), FFlagMomentsOptimisticProfilePending (copy), Menu (copy), MomentsUseSmallOverflowMenu (copy), IconButton (copy), ThreeDotsVertical (copy), PostInsightsCoachmarkModule (copy), ReportMomentDialogModule (copy), IpReportConfirmationDialogModule (copy), View (copy), SpeakerSlash (copy), Speaker (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local Analytics = if FFlagMomentsCreatorAnalyticsModule then UseLocalizationFunction(PostInsightsStringsModule.MENU_KEYS).analytics else ""
	local UseFeedResult = UseFeedFunction()
	local IsEdpVideo: boolean = FFlagMomentsServeEDPVideos and p1.moment.entityType == "edpVideo"
	local OpenMomentsFeedReportFunction = UseMomentsHostFunction().openMomentsFeedReport
	local UseToggleStateResult = UseToggleStateFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local ReportCode, v1 = ReactModule.useState("------")
	local UseResult = ReactModule.useCallback(function() --[[ Line: 121 ]]
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
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 137 ]]
		-- upvalues: UseToggleStateResult (copy), UseMomentsSessionResult (copy), FireAnalyticsEventFunction (upval), EventNames (upval), p1 (copy)
		UseToggleStateResult.disable()
		UseMomentsSessionResult.toggleFeedDetailVisibility()
		FireAnalyticsEventFunction(EventNames.FeedHideDetailsButtonPressed, { momentId = p1.moment.momentId })
	end, {
		p1.moment,
		UseToggleStateResult.disable,
		UseMomentsSessionResult.toggleFeedDetailVisibility
	})
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 145 ]]
		-- upvalues: UseToggleStateResult (copy), MomentsPreferencesStoreModule (copy), FireAnalyticsEventFunction (upval), EventNames (upval), p1 (copy)
		UseToggleStateResult.disable()
		MomentsPreferencesStoreModule.toggleFeedScaleType()
		FireAnalyticsEventFunction(EventNames.FeedMinimizeButtonPressed, { momentId = p1.moment.momentId })
	end, {
		p1.moment,
		UseToggleStateResult.disable,
		MomentsPreferencesStoreModule.toggleFeedScaleType
	})
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 153 ]]
		-- upvalues: CheckDebugAccessModule (upval), MomentsPreferencesStoreModule (copy), UseToggleStateResult (copy)
		if CheckDebugAccessModule() then
			MomentsPreferencesStoreModule.toggleFeedDebugMode()
		end
		UseToggleStateResult.disable()
	end, {
		UseToggleStateResult.disable,
		MomentsPreferencesStoreModule.toggleFeedDebugMode
	})
	local UseResult4 = ReactModule.useCallback(function(p2, p3, p4) --[[ Line: 161 ]]
		-- upvalues: p1 (copy), ReportMomentModule (upval), MakeRecommendationAttributionModule (upval), UseFeedResult (copy), SignalActionTypeModule (upval), MakeFeedActionFieldsModule (upval), FireAnalyticsEventFunction (upval), EventNames (upval), ModeratedItemsStoreModule (copy), ToastStoreModule (copy), UseLocalizationResult (copy)
		if not p1.moment then
			return nil
		end
		local v2 = true
		local v3 = true
		local v4 = nil
		
		if not p4 then
			v2, v3, v76 = pcall(function() --[[ Line: 170 ]]
				-- upvalues: ReportMomentModule (upval), p1 (upval), p2 (copy)
				return ReportMomentModule(p1.moment.recommendationMetadata.feedItemId, p2):await()
			end)
		end
		local RecommendationMetadata = p1.moment.recommendationMetadata
		local RecommendationAttributionModule = MakeRecommendationAttributionModule(RecommendationMetadata)
		
		if RecommendationAttributionModule then
			local Success, Result = pcall(function() --[[ Line: 183 ]]
				-- upvalues: UseFeedResult (upval), SignalActionTypeModule (upval), RecommendationAttributionModule (copy)
				UseFeedResult.logAction(SignalActionTypeModule.Report, RecommendationAttributionModule, {})
			end)
			
			if not Success then
				warn("Failed to log action event", Result)
			end
		end
		local Report = MakeFeedActionFieldsModule(p1.moment.momentId, RecommendationMetadata and RecommendationMetadata.feedItemId, RecommendationMetadata and RecommendationMetadata.tracingId, "report")
		
		if Report then
			FireAnalyticsEventFunction(EventNames.FeedAbuseReported, Report)
		end
		if not p3 then
			ModeratedItemsStoreModule.markReported(p1.moment.momentId)
			UseFeedResult.removeCurrentItem()
			ToastStoreModule.triggerToast({
				title = UseLocalizationResult.reportSubmittedTitle,
				text = UseLocalizationResult.reportSubmittedBody
			})
		end
		return if v2 and v3 and type(v4) == "table" then v4.reportCode else nil
	end, {
		p1.moment, UseFeedResult.logAction, UseFeedResult.removeCurrentItem,
		ModeratedItemsStoreModule.markReported, ToastStoreModule.triggerToast,
		UseLocalizationResult
	})
	local UseResult5 = ReactModule.useCallback(function() --[[ Line: 229 ]]
		-- upvalues: UseToggleStateResult (copy), MomentsReportButtonAnalytics (upval), ReportMomentsEngagementFunction (upval), GetPostFeedItemIdModule (upval), p1 (copy), FFlagMomentsServeEDPVideos (upval), IsEdpVideo (copy), OpenMomentsFeedReportFunction (copy), ReportModalCovering (upval), UseResult4 (copy), v1 (copy), UseStateResult2_1 (copy), Moments (upval), UseStateResult2 (copy)
		UseToggleStateResult.disable()
		
		if MomentsReportButtonAnalytics then
			ReportMomentsEngagementFunction("report_click")
		end
		local PostFeedItemIdModule = GetPostFeedItemIdModule(p1.moment)
		local FeedItemId = if FFlagMomentsServeEDPVideos and IsEdpVideo then p1.moment.recommendationMetadata.feedItemId else PostFeedItemIdModule
		
		if FeedItemId and OpenMomentsFeedReportFunction then
			ReportModalCovering.setCovering(true)
			OpenMomentsFeedReportFunction({
				feedItemId = FeedItemId,
				momentId = p1.moment.momentId,
				onSubmit = function() --[[ Line: 247 ]]
					-- upvalues: UseResult4 (upval)
					UseResult4(nil, false, true)
				end,
				onClose = function() --[[ Line: 250 ]]
					-- upvalues: ReportModalCovering (upval)
					ReportModalCovering.setCovering(false)
				end,
				onIpReportCode = function(p2) --[[ Line: 254 ]]
					-- upvalues: UseResult4 (upval), v1 (upval), UseStateResult2_1 (upval)
					UseResult4(nil, true, true)
					v1(if p2 and p2 ~= "" then p2 else "------")
					UseStateResult2_1(true)
				end,
				onCustomSubmit = if FFlagMomentsServeEDPVideos and IsEdpVideo then require(Moments.Moderation.reportEdpVideo) else nil
			})
			
			return
		end
		if not FFlagMomentsServeEDPVideos or not IsEdpVideo then
			UseStateResult2(true)
			
			return
		end
	end, {
		UseToggleStateResult.disable,
		UseResult4,
		OpenMomentsFeedReportFunction,
		p1.moment,
		if FFlagMomentsServeEDPVideos then IsEdpVideo else false
	})
	local UseResult6 = ReactModule.useCallback(function() --[[ Line: 282 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult7 = ReactModule.useCallback(function() --[[ Line: 286 ]]
		-- upvalues: UseStateResult2_1 (copy)
		if UseStateResult2_1 then
			UseStateResult2_1(false)
		end
	end, {})
	local UseResult8 = ReactModule.useCallback(function() --[[ Line: 292 ]]
		-- upvalues: UseToggleStateResult (copy), UseMomentsSessionResult (copy), p1 (copy)
		UseToggleStateResult.disable()
		UseMomentsSessionResult.requestDeletion(p1.moment.momentId, p1.moment.recommendationMetadata and p1.moment.recommendationMetadata.feedItemId, if p1.moment.recommendationMetadata then p1.moment.recommendationMetadata.tracingId else nil)
	end, {
		p1.moment,
		UseToggleStateResult.disable,
		UseMomentsSessionResult.requestDeletion
	})
	local UseResult9 = if FFlagMomentsCreatorAnalyticsModule then ReactModule.useCallback(function() --[[ Line: 306 ]]
		-- upvalues: UseToggleStateResult (copy), GetFFlagMomentsCoachmarkPersistenceFunction (upval), DismissPostInsightsCoachmarkModule (upval), p1 (copy), GetPostInsightsPageStoreModule (upval)
		UseToggleStateResult.disable()
		
		if GetFFlagMomentsCoachmarkPersistenceFunction() then
			DismissPostInsightsCoachmarkModule()
		end
		if p1.momentStore ~= nil then
			GetPostInsightsPageStoreModule(false).open({ moment = p1.moment, momentStore = p1.momentStore })
		end
	end, {
		p1.moment,
		p1.momentStore or false,
		UseToggleStateResult.disable
	}) else nil
	local UseResult10 = ReactModule.useCallback(function() --[[ Line: 318 ]]
		-- upvalues: p1 (copy)
		if not p1.isDisabled then
			p1.playbackVolume.toggle()
			
			return
		end
	end, { p1.isDisabled, p1.playbackVolume })
	local UseResult11 = ReactModule.useCallback(function() --[[ Line: 331 ]]
		-- upvalues: p1 (copy), FireAnalyticsEventFunction (upval), EventNames (upval)
		if not p1.isDisabled then
			FireAnalyticsEventFunction(if p1.playbackVolume.isMuted then EventNames.FeedUnmuteButtonPressed else EventNames.FeedMuteButtonPressed, { momentId = p1.moment.momentId })
			p1.playbackVolume.toggle()
			
			return
		end
	end, { p1.isDisabled, p1.playbackVolume, p1.moment })
	local UseResult12 = if p1.isFeedMuteButtonAnalyticsEnabled then UseResult11 else UseResult10
	local Element = ReactModule.createElement(Menu, {
		align = FoundationModule.Enums.PopoverAlign.End,
		isOpen = UseToggleStateResult.enabled,
		items = ReactModule.useMemo(function() --[[ Line: 357 ]]
			-- upvalues: UseSignalStateResult (copy), UseLocalizationResult (copy), UseResult1 (copy), UseSignalStateResult1 (copy), UseResult2 (copy), p1 (copy), FFlagMomentsServeEDPVideos (upval), IsEdpVideo (copy), LocalPlayer (upval), FoundationModule (upval), UseResult5 (copy), FFlagMomentsPassFeedItemIdToBackendApis (upval), FFlagMomentsOptimisticProfilePending (upval), UseResult8 (copy), FFlagMomentsCreatorAnalyticsModule (upval), Analytics (ref), UseResult9 (ref), CheckDebugAccessModule (upval), UseResult3 (copy)
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
			local IsNotFeedItemIdMatch: boolean = p1.moment.recommendationMetadata ~= nil and (p1.moment.recommendationMetadata.feedItemId ~= nil and p1.moment.recommendationMetadata.feedItemId ~= "")
			
			if FFlagMomentsServeEDPVideos and IsEdpVideo or p1.moment.creatorId ~= (if LocalPlayer then LocalPlayer.UserId else nil) and IsNotFeedItemIdMatch then
				table.insert(List, {
					id = "reportAbuse",
					icon = FoundationModule.Enums.IconName.Flag,
					text = UseLocalizationResult.report,
					onActivated = UseResult5
				})
			elseif (not FFlagMomentsPassFeedItemIdToBackendApis or IsNotFeedItemIdMatch) and (not FFlagMomentsOptimisticProfilePending or p1.moment.status ~= "Pending") then
				table.insert(List, {
					id = "delete",
					icon = "icons/actions/delete",
					text = UseLocalizationResult.delete,
					onActivated = UseResult8
				})
			end
			if FFlagMomentsCreatorAnalyticsModule and p1.momentStore ~= nil and p1.moment.creatorId == (if LocalPlayer then LocalPlayer.UserId else nil) then
				table.insert(List, {
					id = "postInsights",
					icon = FoundationModule.Enums.IconName.ChartThreeVerticalBars,
					text = Analytics,
					onActivated = UseResult9
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
			UseResult3, UseResult1, UseResult2, UseResult5, UseResult8,
			if FFlagMomentsServeEDPVideos then IsEdpVideo else false,
			FFlagMomentsCreatorAnalyticsModule and p1.momentStore or false,
			FFlagMomentsCreatorAnalyticsModule and UseResult9 or false,
			if FFlagMomentsCreatorAnalyticsModule then Analytics else false
		}),
		onPressedOutside = UseToggleStateResult.disable,
		side = FoundationModule.Enums.PopoverSide.Left,
		size = if MomentsUseSmallOverflowMenu then FoundationModule.Enums.InputSize.Small else nil
	}, {
		ContextualMenuButton = ReactModule.createElement(IconButton, {
			testId = "FeedContextualMenuButton",
			icon = ThreeDotsVertical,
			isDisabled = p1.isDisabled,
			onActivated = UseResult,
			size = FoundationModule.Enums.InputSize.Large
		})
	})
	
	if FFlagMomentsCreatorAnalyticsModule and GetFFlagMomentsCoachmarkPersistenceFunction() and p1.momentStore ~= nil and p1.moment.creatorId == (if LocalPlayer then LocalPlayer.UserId else nil) then
		Element = ReactModule.createElement(PostInsightsCoachmarkModule, {
			moment = p1.moment,
			momentStore = p1.momentStore,
			isDisabled = p1.isDisabled,
			isMenuOpen = UseToggleStateResult.enabled
		}, Element)
	end
	local Element1 = ReactModule.createElement(ReportMomentDialogModule, {
		isOpen = UseStateResult,
		onClose = UseResult6,
		onSubmitReport = UseResult4
	})
	local Element2 = if UseStateResult1 then ReactModule.createElement(IpReportConfirmationDialogModule, { reportCode = ReportCode, onClose = UseResult7 }) else nil
	
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
				onActivated = UseResult12,
				size = FoundationModule.Enums.InputSize.Medium
			}),
			ContextMenuPopover = Element
		}),
		ReportDialog = Element1,
		IpConfirmationDialog = Element2
	}) else ReactModule.createElement(View, {
		tag = "col align-x-center auto-xy",
		LayoutOrder = p1.layoutOrder
	}, {
		ContextMenuPopover = Element,
		ReportDialog = Element1,
		IpConfirmationDialog = Element2
	})
end