local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local DashModule = require(CorePackages.Packages.Dash)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local NavigateToBadgesSeeAllFunction = require(CorePackages.Workspace.Packages.Badges).navigateToBadgesSeeAll
local NavigateToDevStoreSeeAllFunction = require(CorePackages.Workspace.Packages.DevStore).navigateToDevStoreSeeAll
local UseUserExperimentFunction = require(CorePackages.Packages.RoactAppExperiment).useUserExperiment
local VerifiedBadgesModule = require(CorePackages.Workspace.Packages.VerifiedBadges)
local GetCommunityUrlFunction = require(CorePackages.Workspace.Packages.CommunityLinks).Utils.getCommunityUrl
local ApiFetchGameDetails = require(CorePackages.Workspace.Packages.GameDetailRodux).GameDetails.ApiFetchGameDetails
local AbbreviateCountFunction = require(CorePackages.Workspace.Packages.Localization).abbreviateCount
local ClickCommunityLinkEventFunction = require(CorePackages.Workspace.Packages.CommunityLinks).Analytics.Events.clickCommunityLinkEvent
local EnableCommunityProfilePageIXPModule = require(CorePackages.Workspace.Packages.ProfilePlatform.EnableCommunityProfilePageIXP)
local UseEdpServerIxpVariablesModule = require(script.Parent.useEdpServerIxpVariables)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppPageModule = require(Modules.LuaApp.AppPage)
local SafeGetModule = require(Modules.LuaApp.Common.safeGet)
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local UseLocalTimeModule = require(Modules.LuaApp.Hooks.useLocalTime)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AppEventIngestServiceModule = require(Modules.LuaApp.Services.AppEventIngestService)
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local FetchGameDetailsPageDataModule = require(Modules.LuaApp.Thunks.Games.FetchGameDetailsPageData)
local _ = require(Modules.LuaApp.Models.GamesApi.GameSocialLink)
local UseExperienceDetailsNavigationModule = require(script.Parent.Parent.useExperienceDetailsNavigation)
local ExperienceDetailsExperimentationModule = require(script.Parent.Parent.Parent.ExperienceDetails.ExperienceDetailsExperimentation)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local GuildedLogoWhiteAsset = require(CorePackages.Workspace.Packages.CommunityLinks).Constants.GuildedLogoWhiteAsset
local ApiFetchExperienceDetailsPageModule = require(Modules.LuaApp.Thunks.Games.ApiFetchExperienceDetailsPage)
local Constants = require(CorePackages.Workspace.Packages.CommunityLinks).Analytics.Constants
local UseGamePassesModule = require(Modules.LuaApp.Components.ExperienceDetails.Hooks.useGamePasses)
local GetFFlagRemoveVerifiedBadgeReducerModule = require(Modules.LuaApp.Flags.GetFFlagRemoveVerifiedBadgeReducer)
local GetFFlagGameDetailsSeparateChatFeatureRowsModule = require(Modules.LuaApp.Flags.GetFFlagGameDetailsSeparateChatFeatureRows)
local FStringLuaAppGenreOverrideModule = require(Modules.Personalization.Flags.FStringLuaAppGenreOverride)
local FFlagLuaAppEdpBackendV2HydrateLegacyDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local FFlagLuaAppEdpBackendV2SduiInterleaveDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault
local FFlagLuaAppEdpBackendV2SduiInterleaveIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp
local FFlagLuaAppUpdateContentDescriptorsTranslation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppUpdateContentDescriptorsTranslation
local FFlagLuaAppBadgesSeeAllEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppBadgesSeeAllEnabled
local FFlagLuaAppDevStoreSeeAllSduiEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppDevStoreSeeAllSduiEnabled
local LuaAppHideBadgesRowFix = game:DefineFastFlag("LuaAppHideBadgesRowFix", false)
local FFlagLuaAppHideEdpStoreForUnplayable = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppHideEdpStoreForUnplayable
local FFlagEnableBlackbirdPageCloseCallback = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableBlackbirdPageCloseCallback
local FFlagLuaAppGamePassesDataHydrationMigrationEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppGamePassesDataHydrationMigrationEnabled
local GetSubscriptionPurchaseCloseCallbackFunction = require(CorePackages.Workspace.Packages.RobloxSubscriptionPurchaseApp).Utils.getSubscriptionPurchaseCloseCallback

return function(UniverseId, p1, p2)
	-- upvalues: FFlagLuaAppBadgesSeeAllEnabled (copy), FFlagLuaAppDevStoreSeeAllSduiEnabled (copy), UseNavigationFunction (copy), FFlagLuaAppGamePassesDataHydrationMigrationEnabled (copy), UseGamePassesModule (copy), UseSelectorFunction (copy), SafeGetModule (copy), GetFFlagRemoveVerifiedBadgeReducerModule (copy), VerifiedBadgesModule (copy), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), ApiFetchExperienceDetailsPageModule (copy), ApiFetchGameDetails (copy), FFlagLuaAppHideEdpStoreForUnplayable (copy), UseDispatchFunction (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), UseEdpServerIxpVariablesModule (copy), UseExperienceDetailsNavigationModule (copy), EnableCommunityProfilePageIXPModule (copy), ReactModule (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), FetchGameDetailsPageDataModule (copy), AppEventIngestServiceModule (copy), UseAppPolicyModule (copy), UseLocalizationFunction (copy), UseUserExperimentFunction (copy), AppUserLayers (copy), GuildedLogoWhiteAsset (copy), GetCommunityUrlFunction (copy), ClickCommunityLinkEventFunction (copy), Constants (copy), AppPageModule (copy), UrlBuilderModule (copy), FStringLuaAppGenreOverrideModule (copy), UseLocalTimeModule (copy), GetFFlagGameDetailsSeparateChatFeatureRowsModule (copy), NavigateToDevStoreSeeAllFunction (copy), FFlagEnableBlackbirdPageCloseCallback (copy), GetSubscriptionPurchaseCloseCallbackFunction (copy), NavigateToBadgesSeeAllFunction (copy), LuaAppHideBadgesRowFix (copy), RoactLocalizationModule (copy), ExperienceDetailsExperimentationModule (copy), AbbreviateCountFunction (copy), FFlagLuaAppUpdateContentDescriptorsTranslation (copy), RetrievalStatus (copy), DashModule (copy)
	local UseNavigationResult = if FFlagLuaAppBadgesSeeAllEnabled or FFlagLuaAppDevStoreSeeAllSduiEnabled then UseNavigationFunction() else nil
	local v1: boolean? = nil
	
	if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then
		local UseGamePassesModuleResult = UseGamePassesModule(UniverseId)
		v1 = not UseGamePassesModuleResult or #UseGamePassesModuleResult > 0
	end
	local UseSelectorResult = UseSelectorFunction(function(p3)
		-- upvalues: FFlagLuaAppGamePassesDataHydrationMigrationEnabled (upval), UniverseId (copy), SafeGetModule (upval), GetFFlagRemoveVerifiedBadgeReducerModule (upval), VerifiedBadgesModule (upval), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p1 (copy), ApiFetchExperienceDetailsPageModule (upval), ApiFetchGameDetails (upval), FFlagLuaAppHideEdpStoreForUnplayable (upval)
		local GamePass = if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then nil else p3.GamePasses[UniverseId]
		local GameBadge = p3.GameBadges[UniverseId]
		local IsUserOptIn = p3.VoiceChatOptInStatus.isUserOptIn or false
		local IsUniverseEnabledForVoice = false
		local IsUniverseEnabledForAvatarVideo = false
		
		if p3.ShowAgeVerificationOverlay[UniverseId] then
			IsUniverseEnabledForVoice = p3.ShowAgeVerificationOverlay[UniverseId].isUniverseEnabledForVoice
			IsUniverseEnabledForAvatarVideo = p3.ShowAgeVerificationOverlay[UniverseId].isUniverseEnabledForAvatarVideo
		end
		return {
			dataStatus = if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p1 then ApiFetchExperienceDetailsPageModule.GetFetchingStatus(p3, UniverseId) else ApiFetchGameDetails.GetFetchingStatus(p3, UniverseId),
			gameDetail = if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p1 then p3.GameDetailsV2[UniverseId] or {} else p3.GameDetails[UniverseId] or {},
			creatorVerified = if GetFFlagRemoveVerifiedBadgeReducerModule() then nil else VerifiedBadgesModule.isCreatorOfGameVerified(p3, {
				universeId = UniverseId,
				shouldUseV2GameDetails = if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p1 then true else nil
			}),
			showPasses = not GamePass or #GamePass > 0,
			showBadges = not GameBadge or #GameBadge > 0,
			userVoiceEnabled = IsUserOptIn,
			experienceVoiceEnabled = IsUniverseEnabledForVoice,
			experienceVideoEnabled = IsUniverseEnabledForAvatarVideo,
			groupLink = SafeGetModule(p3.GameSocialLinks, UniverseId, "groupLink"),
			communityLink = p3.CommunityLinks.ExperienceCommunityLinks[UniverseId] or nil,
			isLocalUserUnder13 = p3.IsLocalUserUnder13,
			ageRecommendations = p3.AgeRecommendations[UniverseId],
			ageRecommendationHeader = p3.AgeRecommendationHeaders.headerDisplayName,
			isPlayable = if FFlagLuaAppHideEdpStoreForUnplayable then p3.PlayabilityStatus and (p3.PlayabilityStatus[UniverseId] and p3.PlayabilityStatus[UniverseId].isPlayable) else nil
		}
	end)
	local UseDispatchResult = UseDispatchFunction()
	local UseEdpServerIxpVariablesModuleResult = if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then UseEdpServerIxpVariablesModule() else nil
	local UseExperienceDetailsNavigationModuleResult = UseExperienceDetailsNavigationModule(if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1 else nil)
	local UseIsFeatureActiveResult = if EnableCommunityProfilePageIXPModule.FFlagIsSetupEnabled then EnableCommunityProfilePageIXPModule.useIsFeatureActive({ isExposureEnabled = false }) else nil
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseExperienceDetailsNavigationModuleResult (copy), UniverseId (copy), p2 (copy)
		UseExperienceDetailsNavigationModuleResult.openExperienceGuidelinesExplained(UniverseId, p2)
	end, {
		UseDispatchResult,
		UniverseId,
		UseExperienceDetailsNavigationModuleResult
	})
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), FetchGameDetailsPageDataModule (upval), UseRoactServiceModuleResult (copy), UniverseId (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p1 (copy)
		UseDispatchResult(FetchGameDetailsPageDataModule(UseRoactServiceModuleResult, UniverseId, nil, if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1 else nil))
	end, {
		UseDispatchResult,
		UseRoactServiceModuleResult,
		UniverseId,
		if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1 else nil
	})
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(AppEventIngestServiceModule)
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p3)
		return {
			showBadgesRow = p3.getGameInfoShowBadges(),
			showCreatedRow = p3.getGameInfoShowCreated(),
			showDeveloperRow = p3.getGameInfoListDeveloper(),
			showRNVDeveloper = p3.getGameInfoListShowRNVDeveloper(),
			showGamepassesRow = p3.getGameInfoShowGamepasses(),
			showGenreRow = p3.getGameInfoShowGenre(),
			showSubgenreRow = p3.getGameInfoShowSubgenre(),
			showMaxPlayersRow = p3.getGameInfoShowMaxPlayers(),
			showServersRow = p3.getGameInfoShowServers(),
			showUpdatedRow = p3.getGameInfoShowUpdated(),
			enableGroupLinks = p3.getSocialGroupLinks(),
			webViewSupport = p3.getWebViewSupport(),
			showAgeRecommendationRow = p3.getGameInfoShowAgeRecommendation()
		}
	end)
	local UseLocalizationResult = UseLocalizationFunction({
		yes = "Feature.GameDetails.Label.Yes",
		no = "Feature.GameDetails.Label.No",
		none = "Feature.GameDetails.Label.None",
		unavailable = "Feature.GameDetails.Label.Unavailable",
		contentMaturity = "Feature.GameDetails.Label.ContentMaturity",
		developer = "Feature.GameDetails.Label.Developer",
		maxPlayers = "Feature.GameDetails.Label.MaxPlayers",
		genre = "Feature.GameDetails.Label.Genre",
		created = "Feature.GameDetails.Label.Created",
		updated = "Feature.GameDetails.Label.Updated",
		voiceEnabled = "Feature.GameDetails.Label.VoiceEnabled",
		microphone = "Feature.GameDetails.Label.Microphone",
		camera = "Feature.GameDetails.Label.Camera",
		voiceChat = "Feature.GameDetails.Label.VoiceChat",
		supported = "Feature.GameDetails.Label.Supported",
		notSupported = "Feature.GameDetails.Label.NotSupported",
		chatFeatures = "Feature.GameDetails.Label.ChatFeatures",
		communication = "Feature.AccountSettings.Heading.Communication",
		passesAndGear = "Feature.GameDetails.Label.Store",
		badges = "CommonUI.Features.Label.Badges",
		servers = "Feature.GameDetails.Label.Servers",
		group = "Feature.GameDetails.Label.Group",
		community = "Feature.GameDetails.Label.Community",
		subgenre = "Feature.GameDetails.Label.Subgenre",
		age = "Feature.GameDetails.Label.Age",
		visits = if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then "Feature.GameDetails.Label.Visits" else nil,
		strongLanguage = if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then "Feature.AgeGuidelines.DisplayName.StrongLanguage" else nil,
		creatorEnabled = if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then "Feature.AgeGuidelines.Label.CreatorEnabled" else nil
	})
	local UseLocalizationResult1 = UseLocalizationFunction({
		All = "Feature.GameDetails.Label.GenreAll",
		Adventure = "Feature.GameDetails.Label.GenreAdventure",
		Building = "Feature.GameDetails.Label.GenreBuilding",
		Comedy = "Feature.GameDetails.Label.GenreComedy",
		Fighting = "Feature.GameDetails.Label.GenreFighting",
		FPS = "Feature.GameDetails.Label.GenreFPS",
		Horror = "Feature.GameDetails.Label.LabelGenreHorror",
		Medieval = "Feature.GameDetails.Label.GenreMedieval",
		Military = "Feature.GameDetails.Label.GenreMilitary",
		Naval = "Feature.GameDetails.Label.GenreNaval",
		RPG = "Feature.GameDetails.Label.GenreRPG",
		["Sci-Fi"] = "Feature.GameDetails.Label.GenreSciFi",
		Sports = "Feature.GameDetails.Label.LabelGenreSports",
		["Town and City"] = "Feature.GameDetails.Label.LabelGenreTownAndCity",
		Western = "Feature.GameDetails.Label.GenreWestern"
	})
	local UseUserExperimentResult = UseUserExperimentFunction({ AppUserLayers.EDPCommunityLinksLayer }, function(p3)
		-- upvalues: AppUserLayers (upval)
		return (p3[AppUserLayers.EDPCommunityLinksLayer] or {}).communityLinkDisplayConfig or {}
	end, false)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseUserExperimentResult (copy), UseSelectorResult (copy), UseLocalizationResult (copy), GuildedLogoWhiteAsset (upval), GetCommunityUrlFunction (upval), ClickCommunityLinkEventFunction (upval), UseRoactServiceModuleResult1 (copy), Constants (upval), UniverseId (copy)
		local LinkVariant = UseUserExperimentResult.linkVariant
		
		if not UseUserExperimentResult.inTreatment or not UseSelectorResult.communityLink or LinkVariant ~= "infolist" then return end
		return {
			testId = "--community-row-tail",
			infoName = UseLocalizationResult.community,
			infoIcon = GuildedLogoWhiteAsset,
			linkUrl = GetCommunityUrlFunction(UseSelectorResult.communityLink.communityId),
			linkClickCallback = function()
				-- upvalues: ClickCommunityLinkEventFunction (upval), UseRoactServiceModuleResult1 (upval), Constants (upval), UseSelectorResult (upval), UniverseId (upval)
				ClickCommunityLinkEventFunction(UseRoactServiceModuleResult1, Constants.Context.ExperienceInfoList, {
					entityType = "universe",
					guildedServerId = UseSelectorResult.communityLink.communityId,
					entityId = UniverseId
				})
			end
		}
	end, {
		UseLocalizationResult.community,
		UseSelectorResult.communityLink
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseAppPolicyModuleResult (copy), SafeGetModule (upval), UseSelectorResult (copy), UseLocalizationResult (copy), UseResult (copy), AppPageModule (upval)
		if not UseAppPolicyModuleResult.showAgeRecommendationRow then return end
		local Summary = SafeGetModule(UseSelectorResult.ageRecommendations, "summary", "ageRecommendation", "displayName")
		
		return {
			testId = "--content-maturity-row-tail",
			infoName = if UseSelectorResult.ageRecommendationHeader then UseSelectorResult.ageRecommendationHeader else UseLocalizationResult.contentMaturity,
			infoData = Summary or UseLocalizationResult.unavailable,
			navigateOverride = if Summary then UseResult else nil,
			analyticsSubPage = if Summary then AppPageModule.ExperienceGuidelinesExplained else nil
		}
	end, {
		UseAppPolicyModuleResult.showAgeRecommendationRow,
		UseLocalizationResult.contentMaturity, UseLocalizationResult.unavailable,
		UseSelectorResult.ageRecommendations,
		UseSelectorResult.ageRecommendationHeader, UseResult
	})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseAppPolicyModuleResult (copy), SafeGetModule (upval), UseSelectorResult (copy), UseLocalizationResult (copy)
		if UseAppPolicyModuleResult.showAgeRecommendationRow then
			local Summary = SafeGetModule(UseSelectorResult.ageRecommendations, "summary", "ageRecommendation", "minimumAgeDisplay")
			
			if Summary and Summary ~= "" then
				return {
					testId = "--age-row-tail",
					infoName = UseLocalizationResult.age,
					infoData = Summary
				}
			end
		end
	end, {
		UseAppPolicyModuleResult.showAgeRecommendationRow,
		UseLocalizationResult.age,
		UseSelectorResult.ageRecommendations
	})
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult (copy), UseAppPolicyModuleResult (copy), GetFFlagRemoveVerifiedBadgeReducerModule (upval), EnableCommunityProfilePageIXPModule (upval), UseIsFeatureActiveResult (copy), UseLocalizationResult (copy), UniverseId (copy), UseExperienceDetailsNavigationModuleResult (copy), UrlBuilderModule (upval)
		local Creator = UseSelectorResult.gameDetail.creator
		
		if not Creator or not UseAppPolicyModuleResult.showDeveloperRow and (not UseAppPolicyModuleResult.showRNVDeveloper or not Creator.isRNVAccount) then return end
		local Id = Creator.id
		local Name = Creator.name
		local Type = Creator.type
		local HasVerifiedBadge = (if GetFFlagRemoveVerifiedBadgeReducerModule() then Creator.hasVerifiedBadge else UseSelectorResult.creatorVerified) or false
		
		return if EnableCommunityProfilePageIXPModule.FFlagIsSetupEnabled and UseIsFeatureActiveResult and Type == Enum.CreatorType.Group.Name then {
			analyticsSubPage = "Developer",
			testId = "--developer-row-tail",
			infoName = UseLocalizationResult.developer,
			infoData = Name,
			infoDataOverride = function(Callback)
				-- upvalues: Name (copy), Id (copy), UniverseId (upval), HasVerifiedBadge (copy)
				return Callback(Name, Id, UniverseId, HasVerifiedBadge)
			end,
			navigateOverride = function()
				-- upvalues: UseExperienceDetailsNavigationModuleResult (upval), Id (copy)
				UseExperienceDetailsNavigationModuleResult.openCommunityProfilePage(Id, "ExperienceDetailsPage:Developer")
			end
		} elseif Type == Enum.CreatorType.User.Name then {
			analyticsSubPage = "Developer",
			testId = "--developer-row-tail",
			infoName = UseLocalizationResult.developer,
			infoData = Name,
			infoDataOverride = function(Callback)
				-- upvalues: Name (copy), Id (copy), UniverseId (upval), HasVerifiedBadge (copy)
				return Callback(Name, Id, UniverseId, HasVerifiedBadge)
			end,
			navigateOverride = function()
				-- upvalues: UseExperienceDetailsNavigationModuleResult (upval), Id (copy)
				UseExperienceDetailsNavigationModuleResult.openUserProfilePage(Id, "ExperienceDetailsPage:Developer")
			end
		} else {
			analyticsSubPage = "Developer",
			testId = "--developer-row-tail",
			infoName = UseLocalizationResult.developer,
			infoData = Name,
			infoDataOverride = function(Callback)
				-- upvalues: Name (copy), Id (copy), UniverseId (upval), HasVerifiedBadge (copy)
				return Callback(Name, Id, UniverseId, HasVerifiedBadge)
			end,
			linkPage = if UseAppPolicyModuleResult.webViewSupport then UrlBuilderModule.game.info.creator({ creatorType = Type, creatorId = Id }) else nil
		}
	end, {
		UseLocalizationResult.developer, UseAppPolicyModuleResult.showDeveloperRow,
		UseAppPolicyModuleResult.showRNVDeveloper,
		UseAppPolicyModuleResult.webViewSupport, UniverseId,
		UseSelectorResult.gameDetail, UseSelectorResult.creatorVerified,
		if EnableCommunityProfilePageIXPModule.FFlagIsSetupEnabled then UseIsFeatureActiveResult else nil
	})
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: UseAppPolicyModuleResult (copy), UseLocalizationResult (copy), UseSelectorResult (copy)
		if not UseAppPolicyModuleResult.showMaxPlayersRow then return end
		return {
			testId = "--server-size-row-tail",
			infoName = UseLocalizationResult.maxPlayers,
			infoData = tostring(UseSelectorResult.gameDetail.maxPlayers or "--")
		}
	end, {
		UseAppPolicyModuleResult.showMaxPlayersRow,
		UseSelectorResult.gameDetail
	})
	local UseMemoResult5 = ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult (copy), FStringLuaAppGenreOverrideModule (upval), UseLocalizationResult (copy), UseLocalizationResult1 (copy), UseAppPolicyModuleResult (copy)
		local All = nil
		
		if UseSelectorResult.gameDetail.genre_l1 and UseSelectorResult.gameDetail.genre_l1 ~= "" then
			All = UseSelectorResult.gameDetail.genre_l1
		elseif FStringLuaAppGenreOverrideModule == "N/A" then
			All = UseLocalizationResult.unavailable
		elseif FStringLuaAppGenreOverrideModule == "All" then
			All = UseLocalizationResult1.All
		end
		if not UseAppPolicyModuleResult.showGenreRow then return end
		return {
			testId = "--genre-row-tail",
			infoName = UseLocalizationResult.genre,
			infoData = (if All then All elseif UseSelectorResult.gameDetail.genre then UseLocalizationResult1[UseSelectorResult.gameDetail.genre] else nil) or "--"
		}
	end, {
		UseAppPolicyModuleResult.showGenreRow,
		UseSelectorResult.gameDetail
	})
	local UseMemoResult6 = ReactModule.useMemo(function()
		-- upvalues: UseAppPolicyModuleResult (copy), UseSelectorResult (copy), UseLocalizationResult (copy)
		if not UseAppPolicyModuleResult.showSubgenreRow or not UseSelectorResult.gameDetail.genre_l2 or UseSelectorResult.gameDetail.genre_l2 == "" then return end
		return {
			testId = "--subgenre-row-tail",
			infoName = UseLocalizationResult.subgenre,
			infoData = UseSelectorResult.gameDetail.genre_l2
		}
	end, {
		UseAppPolicyModuleResult.showSubgenreRow,
		UseSelectorResult.gameDetail
	})
	local UseLocalTimeModuleResult = UseLocalTimeModule(UseSelectorResult.gameDetail.created)
	local UseMemoResult7 = ReactModule.useMemo(function()
		-- upvalues: UseAppPolicyModuleResult (copy), UseLocalizationResult (copy), UseLocalTimeModuleResult (copy)
		if not UseAppPolicyModuleResult.showCreatedRow then return end
		return {
			testId = "--created-row-tail",
			infoName = UseLocalizationResult.created,
			infoData = UseLocalTimeModuleResult or "--"
		}
	end, {
		UseAppPolicyModuleResult.showCreatedRow,
		UseLocalTimeModuleResult
	})
	local UseLocalTimeModuleResult1 = UseLocalTimeModule(UseSelectorResult.gameDetail.updated)
	local UseMemoResult8 = ReactModule.useMemo(function()
		-- upvalues: UseAppPolicyModuleResult (copy), UseLocalizationResult (copy), UseLocalTimeModuleResult1 (copy)
		if not UseAppPolicyModuleResult.showUpdatedRow then return end
		return {
			testId = "--updated-row-tail",
			infoName = UseLocalizationResult.updated,
			infoData = UseLocalTimeModuleResult1 or "--"
		}
	end, {
		UseAppPolicyModuleResult.showUpdatedRow,
		UseLocalTimeModuleResult1
	})
	local UseMemoResult9 = nil
	local UseMemoResult10 = nil
	local UseMemoResult11 = nil
	
	if GetFFlagGameDetailsSeparateChatFeatureRowsModule() then
		UseMemoResult10 = ReactModule.useMemo(function()
			-- upvalues: UseLocalizationResult (copy), UseSelectorResult (copy)
			local NotSupported = UseLocalizationResult.notSupported
			
			if UseSelectorResult.isLocalUserUnder13 then
				return nil
			end
			if UseSelectorResult.experienceVoiceEnabled then
				NotSupported = UseLocalizationResult.supported
			end
			return {
				testId = "--voice-chat-row-tail",
				infoName = UseLocalizationResult.voiceChat,
				infoData = NotSupported
			}
		end, {
			UseSelectorResult.experienceVoiceEnabled,
			UseSelectorResult.isLocalUserUnder13
		})
		UseMemoResult11 = ReactModule.useMemo(function()
			-- upvalues: UseLocalizationResult (copy), UseSelectorResult (copy)
			return {
				testId = "--camera-row-tail",
				infoName = UseLocalizationResult.camera,
				infoData = if UseSelectorResult.experienceVideoEnabled then UseLocalizationResult.supported else UseLocalizationResult.notSupported
			}
		end, { UseSelectorResult.experienceVideoEnabled })
	else
		UseMemoResult9 = ReactModule.useMemo(function()
			-- upvalues: UseSelectorResult (copy), UseLocalizationResult (copy)
			local List = {}
			
			if UseSelectorResult.experienceVoiceEnabled and not UseSelectorResult.isLocalUserUnder13 then
				table.insert(List, UseLocalizationResult.microphone)
			end
			if UseSelectorResult.experienceVideoEnabled then
				table.insert(List, UseLocalizationResult.camera)
			end
			if #List < 1 then
				table.insert(List, UseLocalizationResult.none)
			end
			return {
				testId = "--communication-row-tail",
				infoName = UseLocalizationResult.communication,
				infoData = table.concat(List, ", ")
			}
		end, {
			UseSelectorResult.experienceVoiceEnabled,
			UseSelectorResult.experienceVideoEnabled,
			UseSelectorResult.isLocalUserUnder13
		})
	end
	local UseMemoResult12 = ReactModule.useMemo(function()
		-- upvalues: UseAppPolicyModuleResult (copy), FFlagLuaAppGamePassesDataHydrationMigrationEnabled (upval), v1 (ref), UseSelectorResult (copy), FFlagLuaAppHideEdpStoreForUnplayable (upval), FFlagLuaAppDevStoreSeeAllSduiEnabled (upval), UseLocalizationResult (copy), NavigateToDevStoreSeeAllFunction (upval), UseNavigationResult (copy), UniverseId (copy), UrlBuilderModule (upval), FFlagEnableBlackbirdPageCloseCallback (upval), GetSubscriptionPurchaseCloseCallbackFunction (upval)
		local NoFFlagLuaAppHideEdpStoreForUnplayable = UseAppPolicyModuleResult.showGamepassesRow and ((if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then v1 else UseSelectorResult.showPasses) and (not FFlagLuaAppHideEdpStoreForUnplayable or UseSelectorResult.isPlayable))
		
		if FFlagLuaAppDevStoreSeeAllSduiEnabled and NoFFlagLuaAppHideEdpStoreForUnplayable then
			return {
				analyticsSubPage = "PassesAndGear",
				testId = "--store-row-tail",
				infoName = UseLocalizationResult.passesAndGear,
				navigateOverride = function()
					-- upvalues: NavigateToDevStoreSeeAllFunction (upval), UseNavigationResult (upval), UniverseId (upval)
					NavigateToDevStoreSeeAllFunction(UseNavigationResult, UniverseId)
				end
			}
		elseif not UseAppPolicyModuleResult.webViewSupport or not NoFFlagLuaAppHideEdpStoreForUnplayable then return end
		return {
			analyticsSubPage = "PassesAndGear",
			testId = "--store-row-tail",
			infoName = UseLocalizationResult.passesAndGear,
			linkPage = UrlBuilderModule.game.info.store({ universeId = UniverseId }),
			onClose = if FFlagEnableBlackbirdPageCloseCallback and GetSubscriptionPurchaseCloseCallbackFunction then GetSubscriptionPurchaseCloseCallbackFunction() else nil
		}
	end, {
		UniverseId, UseAppPolicyModuleResult.webViewSupport,
		UseAppPolicyModuleResult.showGamepassesRow,
		if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then v1 else UseSelectorResult.showPasses,
		if FFlagLuaAppHideEdpStoreForUnplayable then UseSelectorResult.isPlayable else nil,
		if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then UseLocalizationResult.passesAndGear else nil,
		if FFlagLuaAppDevStoreSeeAllSduiEnabled then UseNavigationResult else nil
	})
	local UseMemoResult13 = ReactModule.useMemo(function()
		-- upvalues: FFlagLuaAppBadgesSeeAllEnabled (upval), UseAppPolicyModuleResult (copy), UseSelectorResult (copy), UseLocalizationResult (copy), NavigateToBadgesSeeAllFunction (upval), UseNavigationResult (copy), UniverseId (copy), UrlBuilderModule (upval)
		if FFlagLuaAppBadgesSeeAllEnabled and UseAppPolicyModuleResult.showBadgesRow and UseSelectorResult.showBadges then
			return {
				analyticsSubPage = "Badges",
				testId = "--badges-row-tail",
				infoName = UseLocalizationResult.badges,
				navigateOverride = function()
					-- upvalues: NavigateToBadgesSeeAllFunction (upval), UseNavigationResult (upval), UniverseId (upval)
					NavigateToBadgesSeeAllFunction(UseNavigationResult, UniverseId)
				end
			}
		elseif not UseAppPolicyModuleResult.webViewSupport or not UseAppPolicyModuleResult.showBadgesRow or not UseSelectorResult.showBadges then return end
		return {
			analyticsSubPage = "Badges",
			testId = "--badges-row-tail",
			infoName = UseLocalizationResult.badges,
			linkPage = UrlBuilderModule.game.info.badges({ universeId = UniverseId })
		}
	end, {
		UniverseId, UseAppPolicyModuleResult.webViewSupport,
		UseAppPolicyModuleResult.showBadgesRow,
		if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then nil else UseSelectorResult.showPasses,
		UseNavigationResult,
		if LuaAppHideBadgesRowFix then UseSelectorResult.showBadges else nil,
		if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then UseLocalizationResult.badges else nil
	})
	local UseMemoResult14 = ReactModule.useMemo(function()
		-- upvalues: UseAppPolicyModuleResult (copy), UseLocalizationResult (copy), UrlBuilderModule (upval), UniverseId (copy), FFlagEnableBlackbirdPageCloseCallback (upval), GetSubscriptionPurchaseCloseCallbackFunction (upval)
		if not UseAppPolicyModuleResult.webViewSupport or not UseAppPolicyModuleResult.showServersRow then return end
		return {
			analyticsSubPage = "Servers",
			testId = "--servers-row-tail",
			infoName = UseLocalizationResult.servers,
			linkPage = UrlBuilderModule.game.info.servers({ universeId = UniverseId }),
			onClose = if FFlagEnableBlackbirdPageCloseCallback and GetSubscriptionPurchaseCloseCallbackFunction then GetSubscriptionPurchaseCloseCallbackFunction() else nil
		}
	end, {
		UniverseId,
		UseAppPolicyModuleResult.webViewSupport,
		UseAppPolicyModuleResult.showServersRow
	})
	local UseMemoResult15 = ReactModule.useMemo(function()
		-- upvalues: EnableCommunityProfilePageIXPModule (upval), UseIsFeatureActiveResult (copy), UseAppPolicyModuleResult (copy), UseSelectorResult (copy), UseLocalizationResult (copy), UseExperienceDetailsNavigationModuleResult (copy)
		if EnableCommunityProfilePageIXPModule.FFlagIsSetupEnabled and UseIsFeatureActiveResult then
			if UseAppPolicyModuleResult.enableGroupLinks and UseSelectorResult.groupLink then
				if UseSelectorResult.groupLink.communityId ~= nil then
					return {
						analyticsSubPage = "Group",
						testId = "--group-row-tail",
						infoName = UseLocalizationResult.group,
						navigateOverride = function()
							-- upvalues: UseExperienceDetailsNavigationModuleResult (upval), UseSelectorResult (upval)
							UseExperienceDetailsNavigationModuleResult.openCommunityProfilePage(UseSelectorResult.groupLink.communityId, "ExperienceDetailsPage:Group")
						end
					}
				elseif UseAppPolicyModuleResult.webViewSupport then
					return {
						analyticsSubPage = "Group",
						testId = "--group-row-tail",
						infoName = UseLocalizationResult.group,
						linkPage = UseSelectorResult.groupLink.url
					}
				end
			end
		elseif UseAppPolicyModuleResult.webViewSupport and UseAppPolicyModuleResult.enableGroupLinks and UseSelectorResult.groupLink then
			return {
				analyticsSubPage = "Group",
				testId = "--group-row-tail",
				infoName = UseLocalizationResult.group,
				linkPage = UseSelectorResult.groupLink.url
			}
		end
	end, {
		UniverseId,
		UseAppPolicyModuleResult.webViewSupport,
		UseAppPolicyModuleResult.enableGroupLinks,
		UseSelectorResult.groupLink,
		if EnableCommunityProfilePageIXPModule.FFlagIsSetupEnabled then UseIsFeatureActiveResult else nil
	})
	local UseMemoResult16 = nil
	local UseMemoResult17 = nil
	
	if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then
		local Locale = UseRoactServiceModule(RoactLocalizationModule):GetLocale()
		UseMemoResult17 = ReactModule.useMemo(function()
			-- upvalues: FFlagLuaAppEdpBackendV2SduiInterleaveDefault (upval), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (upval), ExperienceDetailsExperimentationModule (upval), UseEdpServerIxpVariablesModuleResult (ref), UseSelectorResult (copy), AbbreviateCountFunction (upval), Locale (copy), UseLocalizationResult (copy)
			if not FFlagLuaAppEdpBackendV2SduiInterleaveDefault and (not FFlagLuaAppEdpBackendV2SduiInterleaveIxp or not ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) or (not UseEdpServerIxpVariablesModuleResult or UseEdpServerIxpVariablesModuleResult.showVisitsInInfoList ~= true) then return end
			local GameDetail = UseSelectorResult.gameDetail
			
			return {
				testId = "--visits-row-tail",
				infoName = UseLocalizationResult.visits,
				infoData = AbbreviateCountFunction(GameDetail and GameDetail.visits or 0, Locale) or "--"
			}
		end, {
			UseEdpServerIxpVariablesModuleResult,
			UseSelectorResult.gameDetail,
			UseLocalizationResult.visits,
			Locale
		})
		UseMemoResult16 = ReactModule.useMemo(function()
			-- upvalues: FFlagLuaAppEdpBackendV2SduiInterleaveDefault (upval), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (upval), ExperienceDetailsExperimentationModule (upval), UseEdpServerIxpVariablesModuleResult (ref), UseSelectorResult (copy), FFlagLuaAppUpdateContentDescriptorsTranslation (upval), UseLocalizationResult (copy)
			if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) and (UseEdpServerIxpVariablesModuleResult and UseEdpServerIxpVariablesModuleResult.showContentDescriptorsInInfoList == true and UseSelectorResult.ageRecommendations) then
				local DescriptorUsages = UseSelectorResult.ageRecommendations.descriptorUsages
				
				if DescriptorUsages and #DescriptorUsages > 0 then
					for _, descriptorUsage in ipairs(DescriptorUsages) do
						if descriptorUsage.name == "strong-language" and descriptorUsage.contains then
							return {
								testId = "--content-descriptors-row-tail",
								infoName = if FFlagLuaAppUpdateContentDescriptorsTranslation then UseLocalizationResult.creatorEnabled else UseLocalizationResult.communication,
								infoData = UseLocalizationResult.strongLanguage
							}
						end
					end
				end
			end
		end, {
			UseEdpServerIxpVariablesModuleResult,
			UseSelectorResult.ageRecommendations,
			UseLocalizationResult.contentDescriptors,
			UseLocalizationResult.containsStrongLanguage
		})
	end
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), RetrievalStatus (upval), UseResult1 (copy)
		if UseSelectorResult.dataStatus == RetrievalStatus.NotStarted then
			UseResult1()
		end
	end)
	
	return {
		rootPlaceId = tostring(UseSelectorResult.gameDetail.rootPlaceId),
		rows = DashModule.append({ UseMemoResult }, if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) and (UseEdpServerIxpVariablesModuleResult and UseEdpServerIxpVariablesModuleResult.showVisitsInInfoList == true and UseMemoResult17) then { UseMemoResult17 } else nil, { UseMemoResult1 }, { UseMemoResult2 }, if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) and (UseEdpServerIxpVariablesModuleResult and UseEdpServerIxpVariablesModuleResult.showContentDescriptorsInInfoList == true and UseMemoResult16) then { UseMemoResult16 } else nil, { UseMemoResult3 }, { UseMemoResult4 }, { UseMemoResult5 }, { UseMemoResult6 }, { UseMemoResult7 }, { UseMemoResult8 }, if GetFFlagGameDetailsSeparateChatFeatureRowsModule() then nil else { UseMemoResult9 }, if GetFFlagGameDetailsSeparateChatFeatureRowsModule() then { UseMemoResult10 } else nil, if GetFFlagGameDetailsSeparateChatFeatureRowsModule() then { UseMemoResult11 } else nil, { UseMemoResult12 }, { UseMemoResult13 }, { UseMemoResult14 }, { UseMemoResult15 })
	}, UseSelectorResult.dataStatus, UseResult1
end