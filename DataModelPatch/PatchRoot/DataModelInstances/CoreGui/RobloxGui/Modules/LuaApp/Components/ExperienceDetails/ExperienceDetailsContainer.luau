local GuiService = game:GetService("GuiService")
local CorePackages = game:GetService("CorePackages")
local IXPService = game:GetService("IXPService")
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local GetFirstFocusableDescendantFunction = require(CorePackages.Workspace.Packages.FocusNavigationUtils).getFirstFocusableDescendant
local GetSafeAreaSizeFunction = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local ReactModule = require(CorePackages.Packages.React)
local UseUserExperimentFunction = require(CorePackages.Packages.RoactAppExperiment).useUserExperiment
local _ = require(CorePackages.Workspace.Packages.PlayabilityRodux)
local PlayabilityStatusEnum = require(CorePackages.Workspace.Packages.DiscoveryTypes).PlayabilityStatusEnum
local PlayButtonStates = require(CorePackages.Workspace.Packages.GamePlayButton).PlayButtonStates
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local UsePlayWithRewardDataFunction = require(CorePackages.Workspace.Packages.PlayWithRewardComponent).usePlayWithRewardData
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local ExperienceDetailsExperimentationModule = require(script.Parent.ExperienceDetailsExperimentation)
local RobloxAppHooksModule = require(CorePackages.Workspace.Packages.RobloxAppHooks)
local UseUiModeInfoFunction = RobloxAppHooksModule.useUiModeInfo
local UseDeviceTypeFunction = RobloxAppHooksModule.useDeviceType
local UseRoactServiceFunction = RobloxAppHooksModule.useRoactService
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local AppEventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
local AppSessionService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppSessionService
local HasPageInCurrentRouteFunction = require(CorePackages.Workspace.Packages.DiscoveryRouting).hasPageInCurrentRoute
local NavigationRoduxModule = require(CorePackages.Workspace.Packages.NavigationRodux)
local SelectCurrentLegacyRoute = NavigationRoduxModule.Selectors.selectCurrentLegacyRoute
local FFlagSignalsNavP3fGameDetails = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3fGameDetails
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStoreFunction = NavigationRoduxModule.GetLegacyNavigationStore
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local SessionType = require(CorePackages.Workspace.Packages.RobloxAppSessionization).SessionType
local GameDetailsEvents = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents
local FollowFunction = GameDetailsEvents.Follow
local MediaGalleryActivatedFunction = GameDetailsEvents.MediaGalleryActivated
local MediaGalleryMediaChangedFunction = GameDetailsEvents.MediaGalleryMediaChanged
local MediaGalleryEnterFullscreenFunction = GameDetailsEvents.MediaGalleryEnterFullscreen
local MediaGalleryExitFullscreenFunction = GameDetailsEvents.MediaGalleryExitFullscreen
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UseExperienceDetailsStateModule = require(script.Parent.useExperienceDetailsState)
local UseExperienceDetailsFetchesModule = require(script.Parent.useExperienceDetailsFetches)
local UseExperienceDetailsDesignTokensModule = require(script.Parent.Hooks.useExperienceDetailsDesignTokens)
local UseExperienceDetailsNavigationModule = require(script.Parent.useExperienceDetailsNavigation)
local UseExperienceDetailsFocusNavigationBindingsModule = require(script.Parent.useExperienceDetailsFocusNavigationBindings)
local UseExperienceDetailsConfigurationModule = require(script.Parent.useExperienceDetailsConfiguration)
local UseEdpPerUniverseVisibilityVariablesForUniverseModule = require(Modules.LuaApp.Components.ExperienceDetails.Hooks.useEdpPerUniverseVisibilityVariablesForUniverse)
local ExperienceDetailsPageModule = require(Modules.LuaApp.Components.ExperienceDetails.ExperienceDetailsPage)
local SendGameFollowModule = require(Modules.LuaApp.Thunks.SendGameFollow)
local GetFFlagRemoveVerifiedBadgeReducerModule = require(Modules.LuaApp.Flags.GetFFlagRemoveVerifiedBadgeReducer)
local GetFFlagLuaAppLaunchConnectorFixModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppLaunchConnectorFix)
local GetFFlagEnableBigGameIconInDetailsPageModule = require(Modules.LuaApp.Flags.GetFFlagEnableBigGameIconInDetailsPage)
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local FFlagLuaAppEdpBackendV2SduiInterleaveIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp
local FFlagLuaAppEdpBackendV2SduiInterleaveDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault
local FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable
local GetNotificationsExperienceDetailsVariant = require(CorePackages.Workspace.Packages.SharedFlags).GetNotificationsExperienceDetailsVariant
local FFlagLuaAppEnablePlaySquadButton = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEnablePlaySquadButton
local FFlagLuaAppPlayButtonLoadingDurationTelemetry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppPlayButtonLoadingDurationTelemetry
local GetFFlagNotificationsForceEnableEDPDiscoverabilityFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagNotificationsForceEnableEDPDiscoverability
local FFlagLuaAppDesktopMediaGalleryTelemetry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppDesktopMediaGalleryTelemetry
local FFlagLuaAppEdpFixDefaultBanner = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpFixDefaultBanner
local FFlagLuaAppEdpMediaGalleryRedesignIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignIxp
local FFlagLuaAppEdpMediaGalleryVideoPreviewIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreviewIxp
local FFlagSongEdpCarouselIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSongEdpCarouselIxp
local FFlagEnableCreatorSubtitleNavigationModule = require(Modules.LuaApp.Flags.FFlagEnableCreatorSubtitleNavigation)
local FFlagLuaAppEdpMediaGalleryRedesignTelemetry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignTelemetry
local FFlagLuaAppUnifyPlayButtonNonMobileEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppUnifyPlayButtonNonMobileEdp
local FFlagLuaAppUnifyPlayButtonAllSurfacesIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local FFlagLuaAppAddUniverseIdToGameDetailsEvents = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddUniverseIdToGameDetailsEvents
local FFlagExtendScrollingFramesBySafeInsets = require(CorePackages.Workspace.Packages.SharedFlags).FFlagExtendScrollingFramesBySafeInsets
local FFlagEnablePlayWithRewardNonPeekviewEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnablePlayWithRewardNonPeekviewEdp
local FFlagLuaAppEdpKeepFullPageOnPortraitRotation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpKeepFullPageOnPortraitRotation
local FFlagLuaAppLogExposurePlayButtonUX = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppLogExposurePlayButtonUX

return (require(Modules.LuaApp.Common.Experience.Connectors.LaunchExperienceConnector).connect(function(p1)
	-- upvalues: FFlagLuaAppPlayButtonLoadingDurationTelemetry (copy)
	return {
		launchSource = "ExperienceDetailsPage",
		universeId = p1.universeId,
		referralSource = p1.referralSource,
		extraParams = if p1.experienceJoinData then p1.experienceJoinData else nil,
		placeId = p1.placeIdOverride,
		shouldReportLoadingDurationTelemetry = if FFlagLuaAppPlayButtonLoadingDurationTelemetry then true else nil
	}
end, function(p1, _)
	-- upvalues: FFlagLuaAppEnablePlaySquadButton (copy)
	return {
		playabilityStatus = p1.playabilityStatus,
		playButtonState = p1.playButtonState,
		onPlayButtonActivated = p1.onPlayButtonActivated,
		onPlaySquadButtonActivated = if FFlagLuaAppEnablePlaySquadButton then p1.onPlaySquadButtonActivated else nil,
		playButtonContextualMessage = p1.playButtonContextualMessage
	}
end)(function(p1)
	-- upvalues: UseAppPolicyFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), AppLinking (copy), AppEventIngestService (copy), AppSessionService (copy), UseSelectorFunction (copy), FFlagSignalsNavP3fGameDetails (copy), UseSignalStateFunction (copy), GetLegacyNavigationStoreFunction (copy), SelectCurrentLegacyRoute (copy), FFlagEnablePlayWithRewardNonPeekviewEdp (copy), PlayabilityStatusEnum (copy), PlayButtonStates (copy), ReactModule (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), ExperienceDetailsExperimentationModule (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable (copy), UseEdpPerUniverseVisibilityVariablesForUniverseModule (copy), IXPService (copy), AppUserLayers (copy), UseExperienceDetailsStateModule (copy), UseExperienceDetailsNavigationModule (copy), UseExperienceDetailsFetchesModule (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), UseDispatchFunction (copy), UseDeviceTypeFunction (copy), FFlagLuaAppEdpKeepFullPageOnPortraitRotation (copy), GetFFlagEnableBigGameIconInDetailsPageModule (copy), GetFFlagLuaAppLaunchConnectorFixModule (copy), UseUiModeInfoFunction (copy), UseUserExperimentFunction (copy), GetFFlagNotificationsForceEnableEDPDiscoverabilityFunction (copy), GetNotificationsExperienceDetailsVariant (copy), FFlagSongEdpCarouselIxp (copy), FFlagLuaAppEdpMediaGalleryRedesignIxp (copy), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy), FFlagLuaAppUnifyPlayButtonAllSurfacesIxp (copy), FFlagLuaAppLogExposurePlayButtonUX (copy), UsePlayWithRewardDataFunction (copy), RetrievalStatus (copy), SendGameFollowModule (copy), FollowFunction (copy), FFlagLuaAppDesktopMediaGalleryTelemetry (copy), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (copy), MediaGalleryActivatedFunction (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (copy), MediaGalleryMediaChangedFunction (copy), MediaGalleryEnterFullscreenFunction (copy), MediaGalleryExitFullscreenFunction (copy), HasPageInCurrentRouteFunction (copy), AppPage (copy), SessionType (copy), GuiService (copy), GetSafeAreaSizeFunction (copy), GetFFlagRemoveVerifiedBadgeReducerModule (copy), UseExperienceDetailsConfigurationModule (copy), UseExperienceDetailsDesignTokensModule (copy), GetFirstFocusableDescendantFunction (copy), UseExperienceDetailsFocusNavigationBindingsModule (copy), FFlagExtendScrollingFramesBySafeInsets (copy), ExperienceDetailsPageModule (copy), FFlagLuaAppUnifyPlayButtonNonMobileEdp (copy), FFlagLuaAppEdpFixDefaultBanner (copy), FFlagEnableCreatorSubtitleNavigationModule (copy), FFlagLuaAppEnablePlaySquadButton (copy), RoactNavigationModule (copy)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return {
			roundedCorners = p2.getUseRoundedCorners(),
			webViewSupport = p2.getWebViewSupport(),
			notificationsCanEnableExperience = p2.getNotificationsCanReceiveExperience(),
			experienceDetailsNoticeType = p2.getExperienceDetailsNoticeType()
		}
	end)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppLinking)
	local UseRoactServiceResult2 = UseRoactServiceFunction(AppEventIngestService)
	local UseRoactServiceResult3 = UseRoactServiceFunction(AppSessionService)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return {
			screenSize = p2.ScreenSize,
			globalGuiInset = p2.GlobalGuiInset
		}
	end)
	local UseSignalStateResult = nil
	UseSignalStateResult = if FFlagSignalsNavP3fGameDetails then UseSignalStateFunction(GetLegacyNavigationStoreFunction(false).getCurrentLegacyRoute) else UseSelectorFunction(SelectCurrentLegacyRoute)
	local IsPlayButtonStateMatch: boolean? = nil
	local v1 = nil
	local Callback = nil
	
	if FFlagEnablePlayWithRewardNonPeekviewEdp then
		IsPlayButtonStateMatch = p1.playabilityStatus ~= nil and (p1.playabilityStatus.playabilityStatus == PlayabilityStatusEnum.Playable and p1.playButtonState == PlayButtonStates.Playable)
		v1, Callback = ReactModule.useState(false)
	end
	local ShouldHydrateLegacy = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then ExperienceDetailsExperimentationModule.getShouldHydrateLegacy() else nil
	local ShouldInterleaveSdui = if FFlagLuaAppEdpBackendV2SduiInterleaveIxp then ExperienceDetailsExperimentationModule.getShouldInterleaveSdui() else nil
	local UseEdpPerUniverseVisibilityVariablesForUniverseModuleResult = if FFlagEnablePlayWithRewardNonPeekviewEdp and FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable then UseEdpPerUniverseVisibilityVariablesForUniverseModule(p1.universeId) else nil
	
	if FFlagLuaAppEdpBackendV2HydrateLegacyIxp or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then
		ReactModule.useEffect(function()
			-- upvalues: IXPService (upval), AppUserLayers (upval)
			IXPService:LogUserLayerExposure(AppUserLayers.ExperienceDetailsPageExposureLayer)
		end, {})
	end
	local UseExperienceDetailsStateModuleResult = UseExperienceDetailsStateModule(p1, if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then ShouldHydrateLegacy else nil)
	local UseExperienceDetailsNavigationModuleResult = UseExperienceDetailsNavigationModule(if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then ShouldHydrateLegacy else nil)
	local UseExperienceDetailsFetchesModuleResult = UseExperienceDetailsFetchesModule(if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then p1.universeId else nil, if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then ShouldHydrateLegacy else nil, if FFlagLuaAppEdpBackendV2SduiInterleaveIxp then ShouldInterleaveSdui else nil)
	local UseDispatchResult = UseDispatchFunction()
	local UseDeviceTypeResult = UseDeviceTypeFunction()
	local DeviceType = if FFlagLuaAppEdpKeepFullPageOnPortraitRotation and p1.deviceType then p1.deviceType else UseDeviceTypeResult
	local UseResult = nil
	
	if GetFFlagEnableBigGameIconInDetailsPageModule() and GetFFlagLuaAppLaunchConnectorFixModule() then
		local UseUiModeInfoResult = UseUiModeInfoFunction()
		UseResult = ReactModule.useCallback(function()
			-- upvalues: UseExperienceDetailsFetchesModuleResult (copy), UseRoactServiceResult (copy), p1 (copy), UseUiModeInfoResult (copy)
			return UseExperienceDetailsFetchesModuleResult.fetchGameDetailsPageData(UseRoactServiceResult, p1.universeId, UseUiModeInfoResult)
		end, {
			UseRoactServiceResult,
			p1.universeId,
			UseUiModeInfoResult
		})
	else
		UseResult = ReactModule.useCallback(function()
			-- upvalues: UseExperienceDetailsFetchesModuleResult (copy), UseRoactServiceResult (copy), p1 (copy)
			return UseExperienceDetailsFetchesModuleResult.fetchGameDetailsPageData(UseRoactServiceResult, p1.universeId, nil)
		end, { UseRoactServiceResult, p1.universeId })
	end
	local UseUserExperimentResult = UseUserExperimentFunction({ AppUserLayers.EDPCommunityLinksLayer }, function(p2)
		-- upvalues: AppUserLayers (upval)
		return (p2[AppUserLayers.EDPCommunityLinksLayer] or {}).communityLinkDisplayConfig or {}
	end, false)
	local UseUserExperimentResult1 = if GetFFlagNotificationsForceEnableEDPDiscoverabilityFunction() then true else UseUserExperimentFunction({ AppUserLayers.ExperienceDetailsPageLayer }, function(p2): boolean
		-- upvalues: AppUserLayers (upval), GetNotificationsExperienceDetailsVariant (upval)
		return ((p2[AppUserLayers.ExperienceDetailsPageLayer] or {})[GetNotificationsExperienceDetailsVariant.getNotificationsVariantFieldName] or -1) == 2
	end, true)
	local UseUserExperimentResult2 = if FFlagSongEdpCarouselIxp then UseUserExperimentFunction({ AppUserLayers.ExperienceDetailsPageExposureLayer }, function(p2)
		-- upvalues: AppUserLayers (upval)
		return (p2[AppUserLayers.ExperienceDetailsPageExposureLayer] or {}).showSongCarousel
	end, true) else nil
	local v2 = nil
	local v3 = nil
	
	if FFlagLuaAppEdpMediaGalleryRedesignIxp or FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then
		v2, v82 = UseUserExperimentFunction({ AppUserLayers.ExperienceDetailsPageExposureLayer }, function(p2)
			-- upvalues: AppUserLayers (upval), FFlagLuaAppEdpMediaGalleryRedesignIxp (upval), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (upval)
			local v4 = p2[AppUserLayers.ExperienceDetailsPageExposureLayer] or {}
			local MediaGalleryRedesignEnabled = if FFlagLuaAppEdpMediaGalleryRedesignIxp then v4.MediaGalleryRedesignEnabled else nil
			
			if FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then
				return MediaGalleryRedesignEnabled, v4.MediaGalleryVideoPreviewEnabled
			else
				return MediaGalleryRedesignEnabled, nil
			end
		end, true)
	end
	local v4 = nil
	local v5 = nil
	
	if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then
		v4, v84 = UseUserExperimentFunction({ AppUserLayers.PlayButtonUXExposureLayer }, function(p2)
			-- upvalues: AppUserLayers (upval)
			local v6 = p2[AppUserLayers.PlayButtonUXExposureLayer] or {}
			
			return v6.HasUnifiedPlayButton, v6.UnifyToUIBlox
		end, true)
	end
	if FFlagLuaAppLogExposurePlayButtonUX then
		ReactModule.useEffect(function()
			-- upvalues: IXPService (upval), AppUserLayers (upval)
			IXPService:LogUserLayerExposure(AppUserLayers.PlayButtonUXExposureLayer)
		end, {})
	end
	ReactModule.useEffect(function()
		-- upvalues: UseResult (ref)
		UseResult()
	end, { p1.universeId })
	local PlayWithRewardData = nil
	local ShowPlayWithReward = nil
	
	if FFlagEnablePlayWithRewardNonPeekviewEdp then
		local IsHidePlayWithReward: boolean = FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable and (if FFlagLuaAppEdpBackendV2SduiInterleaveDefault then UseEdpPerUniverseVisibilityVariablesForUniverseModuleResult and UseEdpPerUniverseVisibilityVariablesForUniverseModuleResult.hidePlayWithReward == true else FFlagLuaAppEdpBackendV2SduiInterleaveIxp and (ShouldInterleaveSdui and (UseEdpPerUniverseVisibilityVariablesForUniverseModuleResult and UseEdpPerUniverseVisibilityVariablesForUniverseModuleResult.hidePlayWithReward == true)))
		local UsePlayWithRewardDataResult = UsePlayWithRewardDataFunction({
			universeId = p1.universeId,
			shouldFetch = v1 and (UseExperienceDetailsStateModuleResult.gameDetailsPageDataStatus == RetrievalStatus.Done and not IsHidePlayWithReward),
			onFetchDispatched = ReactModule.useCallback(function()
				-- upvalues: Callback (ref)
				Callback(false)
			end, {})
		})
		PlayWithRewardData = UsePlayWithRewardDataResult.playWithRewardData
		ShowPlayWithReward = UsePlayWithRewardDataResult.showPlayWithReward
	end
	local UseResult1 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseExperienceDetailsStateModuleResult (copy), UseDispatchResult (copy), SendGameFollowModule (upval), UseRoactServiceResult (copy), UseUserExperimentResult1 (copy), FollowFunction (upval), UseRoactServiceResult2 (copy)
		local RootPlaceId = UseExperienceDetailsStateModuleResult.gameDetail and UseExperienceDetailsStateModuleResult.gameDetail.rootPlaceId or UseExperienceDetailsStateModuleResult.gameInfo and UseExperienceDetailsStateModuleResult.gameInfo.placeId
		
		if RootPlaceId ~= nil and p2 ~= nil then
			UseDispatchResult(SendGameFollowModule(UseRoactServiceResult, p2, p3, UseUserExperimentResult1, UseExperienceDetailsStateModuleResult.notificationsEnabled and UseExperienceDetailsStateModuleResult.notificationsEnabled.count or 0, UseExperienceDetailsStateModuleResult.notificationsEnabled and UseExperienceDetailsStateModuleResult.notificationsEnabled.limit or 0))
			FollowFunction(UseRoactServiceResult2, "ExperienceDetailsActionBar", RootPlaceId, not p3)
			
			return
		end
	end, {
		UseDispatchResult,
		UseRoactServiceResult,
		UseRoactServiceResult2,
		p1.universeId,
		UseExperienceDetailsStateModuleResult
	})
	local UseResult2 = nil
	local UseResult3 = nil
	
	if FFlagLuaAppDesktopMediaGalleryTelemetry and not FFlagLuaAppEdpMediaGalleryRedesignTelemetry then
		UseResult2 = ReactModule.useCallback(function(SelectedIndex)
			-- upvalues: UseExperienceDetailsStateModuleResult (copy), MediaGalleryActivatedFunction (upval), UseRoactServiceResult2 (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (upval), p1 (copy)
			local RootPlaceId = UseExperienceDetailsStateModuleResult.gameDetail and UseExperienceDetailsStateModuleResult.gameDetail.rootPlaceId or UseExperienceDetailsStateModuleResult.gameInfo and UseExperienceDetailsStateModuleResult.gameInfo.placeId
			
			if RootPlaceId then
				MediaGalleryActivatedFunction(UseRoactServiceResult2, "ExperienceDetailsPage", RootPlaceId, {
					selectedIndex = SelectedIndex,
					universeId = if FFlagLuaAppAddUniverseIdToGameDetailsEvents then p1.universeId else nil
				})
			end
		end, {
			UseRoactServiceResult2,
			UseExperienceDetailsStateModuleResult,
			if FFlagLuaAppAddUniverseIdToGameDetailsEvents then p1.universeId else nil
		})
		UseResult3 = ReactModule.useCallback(function(PreviousIndex, SelectedIndex)
			-- upvalues: UseExperienceDetailsStateModuleResult (copy), MediaGalleryMediaChangedFunction (upval), UseRoactServiceResult2 (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (upval), p1 (copy)
			local RootPlaceId = UseExperienceDetailsStateModuleResult.gameDetail and UseExperienceDetailsStateModuleResult.gameDetail.rootPlaceId or UseExperienceDetailsStateModuleResult.gameInfo and UseExperienceDetailsStateModuleResult.gameInfo.placeId
			
			if RootPlaceId and PreviousIndex ~= SelectedIndex then
				MediaGalleryMediaChangedFunction(UseRoactServiceResult2, "ExperienceDetailsPage", RootPlaceId, {
					previousIndex = PreviousIndex,
					selectedIndex = SelectedIndex,
					universeId = if FFlagLuaAppAddUniverseIdToGameDetailsEvents then p1.universeId else nil
				})
			end
		end, {
			UseRoactServiceResult2,
			UseExperienceDetailsStateModuleResult,
			if FFlagLuaAppAddUniverseIdToGameDetailsEvents then p1.universeId else nil
		})
	end
	local UseResult4 = nil
	local UseResult5 = nil
	local UseResult6 = nil
	
	if FFlagLuaAppEdpMediaGalleryRedesignTelemetry then
		UseResult4 = ReactModule.useCallback(function(ImageAssetId, VideoAssetId, IsYouTubeVideo, AutoAdvance)
			-- upvalues: UseExperienceDetailsStateModuleResult (copy), MediaGalleryMediaChangedFunction (upval), UseRoactServiceResult2 (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (upval), p1 (copy)
			local RootPlaceId = UseExperienceDetailsStateModuleResult.gameDetail and UseExperienceDetailsStateModuleResult.gameDetail.rootPlaceId or UseExperienceDetailsStateModuleResult.gameInfo and UseExperienceDetailsStateModuleResult.gameInfo.placeId
			
			if RootPlaceId then
				MediaGalleryMediaChangedFunction(UseRoactServiceResult2, "ExperienceDetailsPage", RootPlaceId, {
					imageAssetId = ImageAssetId,
					videoAssetId = VideoAssetId,
					isYouTubeVideo = IsYouTubeVideo,
					autoAdvance = AutoAdvance,
					universeId = if FFlagLuaAppAddUniverseIdToGameDetailsEvents then p1.universeId else nil
				})
			end
		end, {
			UseRoactServiceResult2,
			UseExperienceDetailsStateModuleResult,
			if FFlagLuaAppAddUniverseIdToGameDetailsEvents then p1.universeId else nil
		})
		UseResult5 = ReactModule.useCallback(function(SelectedIndex, IsVideo)
			-- upvalues: UseExperienceDetailsStateModuleResult (copy), MediaGalleryEnterFullscreenFunction (upval), UseRoactServiceResult2 (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (upval), p1 (copy)
			local RootPlaceId = UseExperienceDetailsStateModuleResult.gameDetail and UseExperienceDetailsStateModuleResult.gameDetail.rootPlaceId or UseExperienceDetailsStateModuleResult.gameInfo and UseExperienceDetailsStateModuleResult.gameInfo.placeId
			
			if RootPlaceId then
				MediaGalleryEnterFullscreenFunction(UseRoactServiceResult2, "ExperienceDetailsPage", RootPlaceId, {
					selectedIndex = SelectedIndex,
					isVideo = IsVideo,
					universeId = if FFlagLuaAppAddUniverseIdToGameDetailsEvents then p1.universeId else nil
				})
			end
		end, {
			UseRoactServiceResult2,
			UseExperienceDetailsStateModuleResult,
			if FFlagLuaAppAddUniverseIdToGameDetailsEvents then p1.universeId else nil
		})
		UseResult6 = ReactModule.useCallback(function(SelectedIndex, IsVideo)
			-- upvalues: UseExperienceDetailsStateModuleResult (copy), MediaGalleryExitFullscreenFunction (upval), UseRoactServiceResult2 (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (upval), p1 (copy)
			local RootPlaceId = UseExperienceDetailsStateModuleResult.gameDetail and UseExperienceDetailsStateModuleResult.gameDetail.rootPlaceId or UseExperienceDetailsStateModuleResult.gameInfo and UseExperienceDetailsStateModuleResult.gameInfo.placeId
			
			if RootPlaceId then
				MediaGalleryExitFullscreenFunction(UseRoactServiceResult2, "ExperienceDetailsPage", RootPlaceId, {
					selectedIndex = SelectedIndex,
					isVideo = IsVideo,
					universeId = if FFlagLuaAppAddUniverseIdToGameDetailsEvents then p1.universeId else nil
				})
			end
		end, {
			UseRoactServiceResult2,
			UseExperienceDetailsStateModuleResult,
			if FFlagLuaAppAddUniverseIdToGameDetailsEvents then p1.universeId else nil
		})
	end
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: UseExperienceDetailsNavigationModuleResult (copy), HasPageInCurrentRouteFunction (upval), UseSignalStateResult (ref), AppPage (upval), UseRoactServiceResult3 (copy), SessionType (upval)
		UseExperienceDetailsNavigationModuleResult.navigateBack()
		
		if not HasPageInCurrentRouteFunction(UseSignalStateResult, AppPage.GameDetail, true) and not HasPageInCurrentRouteFunction(UseSignalStateResult, AppPage.ExperienceDetail, true) then
			UseRoactServiceResult3:RemoveSession(SessionType.StructuralIdentifier.GameDetailSource)
		end
	end, {
		UseExperienceDetailsNavigationModuleResult,
		UseSignalStateResult
	})
	local SafeZoneOffsets = GuiService:GetSafeZoneOffsets()
	local Offset = GetSafeAreaSizeFunction(UseSelectorResult.screenSize, SafeZoneOffsets).Y.Offset
	local _UDim2: UDim2 = if UseAppPolicyResult.roundedCorners then UDim2.new(1, 0, 1, 0) else UDim2.new(1, 0, 1, 0)
	local Creator = UseExperienceDetailsStateModuleResult.gameDetail and UseExperienceDetailsStateModuleResult.gameDetail.creator
	local HasVerifiedBadge = if GetFFlagRemoveVerifiedBadgeReducerModule() then Creator and Creator.hasVerifiedBadge else UseExperienceDetailsStateModuleResult.creatorVerified
	local UseExperienceDetailsConfigurationModuleResult = UseExperienceDetailsConfigurationModule()
	local UseExperienceDetailsDesignTokensModuleResult = UseExperienceDetailsDesignTokensModule()
	local UseRefResult = ReactModule.useRef(nil)
	local UseExperienceDetailsFocusNavigationBindingsModuleResult, UseExperienceDetailsFocusNavigationBindingsModuleResult2 = UseExperienceDetailsFocusNavigationBindingsModule(ReactModule.useCallback(function(_)
		-- upvalues: p1 (copy)
		p1.onPlayButtonActivated()
	end, { p1.onPlayButtonActivated }), (ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), GuiService (upval), GetFirstFocusableDescendantFunction (upval)
		if UseRefResult.current then
			GuiService.SelectedCoreObject = GetFirstFocusableDescendantFunction(UseRefResult.current)
		end
	end, {})))
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = UseExperienceDetailsFocusNavigationBindingsModuleResult,
		AnchorPoint = Vector2.new(0, 0),
		Position = UDim2.new(0, 0, 0, SafeZoneOffsets.top),
		Size = _UDim2,
		ClipsDescendants = not FFlagExtendScrollingFramesBySafeInsets
	}, {
		ExperienceDetailsPage = ReactModule.createElement(p1.ExperienceDetailsPage or ExperienceDetailsPageModule, {
			universeId = p1.universeId,
			referralSource = p1.referralSource,
			experienceJoinData = if FFlagLuaAppUnifyPlayButtonNonMobileEdp or FFlagEnablePlayWithRewardNonPeekviewEdp then p1.experienceJoinData else nil,
			placeIdOverride = p1.placeIdOverride,
			onClose = UseResult7,
			statsAndInfoRef = UseRefResult,
			thumbnail = UseExperienceDetailsStateModuleResult.thumbnail,
			bannerImageId = UseExperienceDetailsStateModuleResult.bannerImageId,
			defaultBannerUrl = if FFlagLuaAppEdpFixDefaultBanner then UseExperienceDetailsStateModuleResult.defaultBannerUrl else nil,
			gameInfo = UseExperienceDetailsStateModuleResult.gameInfo,
			gameDetail = UseExperienceDetailsStateModuleResult.gameDetail,
			gameDetailError = UseExperienceDetailsStateModuleResult.gameDetailError,
			creatorVerified = HasVerifiedBadge,
			gameDetailsPageDataStatus = UseExperienceDetailsStateModuleResult.gameDetailsPageDataStatus,
			gameProductInfo = UseExperienceDetailsStateModuleResult.gameProductInfo,
			socialLinks = UseExperienceDetailsStateModuleResult.socialLinks,
			ageRecommendations = UseExperienceDetailsStateModuleResult.ageRecommendations,
			communityLink = UseExperienceDetailsStateModuleResult.communityLink,
			communityLinksEnabled = UseUserExperimentResult.inTreatment,
			communityLinkVariant = UseUserExperimentResult.linkVariant,
			gameFollowings = UseExperienceDetailsStateModuleResult.gameFollowings,
			enableNotificationsDiscoverability = UseUserExperimentResult1,
			mediaGalleryRedesignEnabledIxp = if FFlagLuaAppEdpMediaGalleryRedesignIxp then v2 else nil,
			mediaGalleryVideoPreviewEnabledIxp = if FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then v3 else nil,
			showSongCarousel = if FFlagSongEdpCarouselIxp then UseUserExperimentResult2 else nil,
			hasUnifiedPlayButtonIxp = if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then v4 else nil,
			unifyToUIBloxIxp = if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then v5 else nil,
			fetchGameDetailsPageData = UseResult,
			openLeaveRobloxAlertUIBlox = UseExperienceDetailsNavigationModuleResult.openLeaveRobloxAlertUIBlox,
			openVerifiedBadgeModal = UseExperienceDetailsNavigationModuleResult.openVerifiedBadgeModal,
			closeAlert = UseExperienceDetailsNavigationModuleResult.closeAlert,
			openMoreContextualMenu = UseExperienceDetailsNavigationModuleResult.openMoreContextualMenu,
			openShareContextualMenu = UseExperienceDetailsNavigationModuleResult.openShareContextualMenu,
			openCreatorPage = if FFlagEnableCreatorSubtitleNavigationModule then nil else UseExperienceDetailsNavigationModuleResult.openCreatorPage,
			openCommunityProfilePage = if FFlagEnableCreatorSubtitleNavigationModule then UseExperienceDetailsNavigationModuleResult.openCommunityProfilePage else nil,
			openUserProfilePage = if FFlagEnableCreatorSubtitleNavigationModule then UseExperienceDetailsNavigationModuleResult.openUserProfilePage else nil,
			openExperienceGuidelinesExplained = UseExperienceDetailsNavigationModuleResult.openExperienceGuidelinesExplained,
			setControllerBarNavigation = UseExperienceDetailsFocusNavigationBindingsModuleResult2,
			playabilityStatus = p1.playabilityStatus,
			playButtonState = p1.playButtonState,
			onPlayButtonActivated = p1.onPlayButtonActivated,
			onPlaySquadButtonActivated = if FFlagLuaAppEnablePlaySquadButton then p1.onPlaySquadButtonActivated else nil,
			playButtonContextualMessage = p1.playButtonContextualMessage,
			toggleFollowExperience = if UseUserExperimentResult1 then UseResult1 else nil,
			onMediaGalleryPreviewActivated = if FFlagLuaAppDesktopMediaGalleryTelemetry and not FFlagLuaAppEdpMediaGalleryRedesignTelemetry then UseResult2 else nil,
			onMediaGalleryThumbnailActivated = if FFlagLuaAppDesktopMediaGalleryTelemetry and not FFlagLuaAppEdpMediaGalleryRedesignTelemetry then UseResult3 else nil,
			onMediaGalleryMediaChanged = if FFlagLuaAppEdpMediaGalleryRedesignTelemetry then UseResult4 else nil,
			onMediaGalleryEnterFullscreen = if FFlagLuaAppEdpMediaGalleryRedesignTelemetry then UseResult5 else nil,
			onMediaGalleryExitFullscreen = if FFlagLuaAppEdpMediaGalleryRedesignTelemetry then UseResult6 else nil,
			openRefundPolicyLearnMorePage = UseExperienceDetailsNavigationModuleResult.openRefundPolicyLearnMorePage,
			openWebview = UseExperienceDetailsNavigationModuleResult.openWebview,
			linking = UseRoactServiceResult1,
			deviceType = DeviceType,
			viewHeight = Offset,
			detailsPageConfiguration = UseExperienceDetailsConfigurationModuleResult,
			tokens = UseExperienceDetailsDesignTokensModuleResult,
			webViewSupport = UseAppPolicyResult.webViewSupport,
			notificationsCanEnableExperience = UseAppPolicyResult.notificationsCanEnableExperience,
			experienceDetailsNoticeType = UseAppPolicyResult.experienceDetailsNoticeType,
			playWithRewardData = if FFlagEnablePlayWithRewardNonPeekviewEdp then PlayWithRewardData else nil,
			showPlayWithReward = if FFlagEnablePlayWithRewardNonPeekviewEdp then ShowPlayWithReward else nil,
			isPlayable = if FFlagEnablePlayWithRewardNonPeekviewEdp then IsPlayButtonStateMatch else nil
		}),
		NavigationEvents = if FFlagEnablePlayWithRewardNonPeekviewEdp then ReactModule.createElement(RoactNavigationModule.NavigationEvents, {
			onDidFocus = function()
				-- upvalues: Callback (ref)
				Callback(true)
			end
		}) else nil
	})
end))