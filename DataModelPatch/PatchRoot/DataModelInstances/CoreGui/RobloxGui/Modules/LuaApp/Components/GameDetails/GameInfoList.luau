local CorePackages = game:GetService("CorePackages")
local IXPService = game:GetService("IXPService")
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local FFlagSignalsNavP3fGameDetails = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3fGameDetails
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3fGameDetails then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local MemoizeModule = require(Modules.Common.memoize)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AppEventIngestServiceModule = require(Modules.LuaApp.Services.AppEventIngestService)
local CryoModule = require(CorePackages.Packages.Cryo)
local AppCommonLibModule = require(CorePackages.Workspace.Packages.AppCommonLib)
local ImpressionsTagUtility = require(CorePackages.Workspace.Packages.Impressions).ImpressionsTagUtility
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local AppPageModule = require(Modules.LuaApp.AppPage)
local ApiFetchGamePassesModule = require(Modules.LuaApp.Thunks.Games.ApiFetchGamePasses)
local OpenCentralOverlayForLeaveRobloxAlertModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local GameInfoRowModule = require(Modules.LuaApp.Components.GameDetails.GameInfoRow)
local PassesGridModule = require(Modules.LuaApp.Components.Passes.PassesGrid)
local EdpSocialLinksImpressionsDetectorModule = require(Modules.LuaApp.Components.ExperienceDetails.EdpSocialLinksImpressionsDetector)
local CommunityLinksModule = require(CorePackages.Workspace.Packages.CommunityLinks)
local ExperienceCommunityLink = CommunityLinksModule.Components.ExperienceCommunityLink
local GetCommunityUrlFunction = CommunityLinksModule.Utils.getCommunityUrl
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local UseTextSizeOffsetFunction = UIBloxModule.Core.Style.useTextSizeOffset
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local SocialMediaGroupModule = require(Modules.LuaApp.Components.GameDetails.SocialMediaGroup)
local VerifiedBadgesModule = require(CorePackages.Workspace.Packages.VerifiedBadges)
local GuildedLogoWhiteAsset = require(CorePackages.Workspace.Packages.CommunityLinks).Constants.GuildedLogoWhiteAsset
local Constants = require(CorePackages.Workspace.Packages.CommunityLinks).Analytics.Constants
local ClickCommunityLinkEventFunction = require(CorePackages.Workspace.Packages.CommunityLinks).Analytics.Events.clickCommunityLinkEvent
local ExperienceDetailsExperimentationModule = require(Modules.LuaApp.Components.ExperienceDetails.ExperienceDetailsExperimentation)
local GetFFlagGameDetailsSeparateChatFeatureRowsModule = require(Modules.LuaApp.Flags.GetFFlagGameDetailsSeparateChatFeatureRows)
local GetFFlagLuaAppFixExperienceInfoShowServersPolicyModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppFixExperienceInfoShowServersPolicy)
local FStringLuaAppGenreOverrideModule = require(Modules.Personalization.Flags.FStringLuaAppGenreOverride)
local EnableCommunityProfilePageIXPModule = require(CorePackages.Workspace.Packages.ProfilePlatform.EnableCommunityProfilePageIXP)
local FFlagLuaAppUseExperienceLogoTrayInGameInfoList = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppUseExperienceLogoTrayInGameInfoList
local FFlagLuaAppEdpBackendV2HydrateLegacyDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local ExperienceLogoTrayModule = require(Modules.LuaApp.Components.ExperienceDetails.ExperienceLogoTray)
local FFlagLuaAppUpdateContentDescriptorsTranslation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppUpdateContentDescriptorsTranslation
local EdpStoreAnalyticsModule = require(CorePackages.Workspace.Packages.EdpStoreAnalytics)
local Constants1 = EdpStoreAnalyticsModule.Constants
local EdpStoreImpressionsDetector = EdpStoreAnalyticsModule.EdpStoreImpressionsDetector
local GetFFlagEnableEdpStoreClickLoggingModule = require(Modules.LuaApp.Flags.GetFFlagEnableEdpStoreClickLogging)
local AbbreviateCountFunction = require(CorePackages.Workspace.Packages.Localization).abbreviateCount
local FFlagLuaAppEdpBackendV2SduiInterleaveDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault
local FFlagLuaAppEdpBackendV2SduiInterleaveIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp
local UseEdpServerIxpVariablesModule = require(Modules.LuaApp.Components.ExperienceDetails.Hooks.useEdpServerIxpVariables)
local GetFFlagEnableEdpStoreGridPositionLoggingModule = require(Modules.LuaApp.Flags.GetFFlagEnableEdpStoreGridPositionLogging)
local FFlagLuaAppBadgesSeeAllEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppBadgesSeeAllEnabled
local FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp
local FFlagLuaAppAddSocialLinkClickTelemetryToEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkClickTelemetryToEdp
local FFlagLuaAppHideEdpStoreForUnplayable = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppHideEdpStoreForUnplayable
local FFlagEnableBlackbirdPageCloseCallback = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableBlackbirdPageCloseCallback
local GetSubscriptionPurchaseCloseCallbackFunction = require(CorePackages.Workspace.Packages.RobloxSubscriptionPurchaseApp).Utils.getSubscriptionPurchaseCloseCallback
local FFlagLuaAppGamePassesDataHydrationMigrationEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppGamePassesDataHydrationMigrationEnabled
local DataHydrationModule = require(CorePackages.Workspace.Packages.DataHydration)
local UseGamePassesModule = require(Modules.LuaApp.Components.ExperienceDetails.Hooks.useGamePasses)
local GameInfoList = RoactModule.PureComponent:extend("GameInfoList")
local config = {
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
}
GameInfoList.defaultProps = { leftPadding = 0, rightPadding = 0 }

function GameInfoList.init(p1)
	-- upvalues: RoactModule (copy), AppCommonLibModule (copy), EdpStoreImpressionsDetector (copy), Constants1 (copy), ImpressionsTagUtility (copy), GameInfoRowModule (copy), GetFFlagEnableEdpStoreGridPositionLoggingModule (copy), PassesGridModule (copy), GetFFlagEnableEdpStoreClickLoggingModule (copy), IXPService (copy), AppUserLayers (copy)
	function p1.createGamePassPreviewRow(UniverseId, LayoutOrder, p2, TextSizeOffset)
		-- upvalues: p1 (copy), RoactModule (upval), AppCommonLibModule (upval), EdpStoreImpressionsDetector (upval), Constants1 (upval), ImpressionsTagUtility (upval), GameInfoRowModule (upval), GetFFlagEnableEdpStoreGridPositionLoggingModule (upval), PassesGridModule (upval), GetFFlagEnableEdpStoreClickLoggingModule (upval)
		local RootPlaceId = p1.props.gameDetail and p1.props.gameDetail.rootPlaceId
		local Passes = p1.props.passes
		
		if not Passes or not RootPlaceId then return end
		local LeftPadding = p1.props.leftPadding
		local RightPadding = p1.props.rightPadding
		local Width = p1.props.width
		local Ref = RoactModule.createRef()
		local Ref1 = RoactModule.createRef()
		Ref1.current = AppCommonLibModule.Signal.new()
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			LayoutOrder = LayoutOrder
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, 10),
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			}),
			PassesAndGears = RoactModule.createElement(GameInfoRowModule, {
				LayoutOrder = 1,
				topPadding = 10,
				bottomPadding = 10,
				Size = UDim2.new(1, 0, 0, 57),
				useVerifiedBadgeEmojiWrapper = p2.useVerifiedBadgeEmojiWrapper,
				viewWidth = if GetFFlagEnableEdpStoreGridPositionLoggingModule() then Width else nil,
				placeId = RootPlaceId,
				infoName = p2.infoName,
				infoData = p2.infoData,
				linkPage = p2.linkPage,
				linkView = p2.linkView,
				universeId = UniverseId,
				leftPadding = LeftPadding,
				rightPadding = RightPadding,
				analyticsSubPage = p2.analyticsSubPage,
				testId = p2.testId
			}),
			GamePassPreview = RoactModule.createElement("Frame", {
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 0),
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				[RoactModule.Ref] = function(Current)
					-- upvalues: Ref (copy), ImpressionsTagUtility (upval), Constants1 (upval), LayoutOrder (copy)
					Ref.current = Current
					ImpressionsTagUtility.AddTag(Ref, Constants1.ImpressionsTags.Preview, LayoutOrder)
				end,
				[RoactModule.Change.AbsolutePosition] = function(_)
					-- upvalues: Ref1 (copy)
					Ref1.current:fire()
				end
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				Padding = RoactModule.createElement("UIPadding", {
					PaddingBottom = UDim.new(0, 20),
					PaddingLeft = UDim.new(0, LeftPadding),
					PaddingRight = UDim.new(0, RightPadding)
				}),
				Grid = RoactModule.createElement(PassesGridModule, {
					numRows = 1,
					universeId = UniverseId,
					passes = Passes,
					viewWidth = Width,
					textSizeOffset = TextSizeOffset,
					locationType = if GetFFlagEnableEdpStoreClickLoggingModule() then Constants1.StoreEnums.LocationType.Edp else nil
				})
			}),
			ImpressionsDetecter = RoactModule.createElement(EdpStoreImpressionsDetector, {
				parentRef = Ref,
				scrollViewPositionChangedSignal = Ref1,
				impressionsTag = Constants1.ImpressionsTags.Preview,
				parameters = {
					universeId = UniverseId,
					productType = Constants1.StoreEnums.ProductType.GamePasses,
					locationType = Constants1.StoreEnums.LocationType.Edp
				}
			})
		})
	end
	
	function p1.checkCommunityLinkExposureLogging()
		-- upvalues: p1 (copy), IXPService (upval), AppUserLayers (upval)
		if p1.props.communityLink then
			IXPService:LogUserLayerExposure(AppUserLayers.EDPCommunityLinksLayer)
		end
	end
end

function GameInfoList.makeGameInfoListData(p1)
	-- upvalues: GetFFlagLuaAppFixExperienceInfoShowServersPolicyModule (copy), FFlagLuaAppHideEdpStoreForUnplayable (copy), AppPageModule (copy), GuildedLogoWhiteAsset (copy), GetCommunityUrlFunction (copy), ClickCommunityLinkEventFunction (copy), Constants (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), ExperienceDetailsExperimentationModule (copy), AbbreviateCountFunction (copy), FFlagLuaAppUpdateContentDescriptorsTranslation (copy), EnableCommunityProfilePageIXPModule (copy), UrlBuilderModule (copy), FStringLuaAppGenreOverrideModule (copy), config (copy), GetFFlagGameDetailsSeparateChatFeatureRowsModule (copy), FFlagLuaAppBadgesSeeAllEnabled (copy), FFlagEnableBlackbirdPageCloseCallback (copy), GetSubscriptionPurchaseCloseCallbackFunction (copy)
	local Localization = p1.props.localization
	local UniverseId = p1.props.universeId
	local MaxPlayers = p1.props.gameDetail.maxPlayers
	local Creator = p1.props.gameDetail.creator
	local Id = p1.props.gameDetail.creator.id
	local Type = p1.props.gameDetail.creator.type
	local Name = p1.props.gameDetail.creator.name
	local CreatorVerified = p1.props.creatorVerified
	local Genre = p1.props.gameDetail.genre
	local GenreL1 = p1.props.gameDetail.genre_l1
	local GenreL2 = p1.props.gameDetail.genre_l2
	local _DateTime = DateTime.fromIsoDate(p1.props.gameDetail.created)
	local _DateTime1 = DateTime.fromIsoDate(p1.props.gameDetail.updated)
	local ShowPasses = p1.props.showPasses
	local ShowSubscriptionProducts = p1.props.showSubscriptionProducts
	local ShowDeveloperProducts = p1.props.showDeveloperProducts
	local ShowBadges = p1.props.showBadges
	local GroupLink = p1.props.groupLink
	local DisplayName = nil
	local MinimumAgeDisplay = nil
	
	if p1.props.ageRecommendations then
		local Summary = p1.props.ageRecommendations.summary
		DisplayName = if Summary and Summary.ageRecommendation then Summary.ageRecommendation.displayName else nil
		MinimumAgeDisplay = if Summary and Summary.ageRecommendation then Summary.ageRecommendation.minimumAgeDisplay else nil
	end
	local EnableGroupLinks = p1.props.enableGroupLinks
	local ShowCreatedRow = p1.props.showCreatedRow
	local ShowDeveloperRow = p1.props.showDeveloperRow
	local ShowRNVDeveloper = p1.props.showRNVDeveloper
	local ShowGamepassesRow = p1.props.showGamepassesRow
	local ShowGenreRow = p1.props.showGenreRow
	local ShowSubgenreRow = p1.props.showSubgenreRow
	local ShowMaxPlayersRow = p1.props.showMaxPlayersRow
	local ShowServersRow = if GetFFlagLuaAppFixExperienceInfoShowServersPolicyModule() then p1.props.showServersRow else p1.props.showGamepassesRow
	local ShowUpdatedRow = p1.props.showUpdatedRow
	local ExperienceVoiceEnabled = p1.props.experienceVoiceEnabled
	local ExperienceVideoEnabled = p1.props.experienceVideoEnabled
	local EnableGamePassPreview = p1.props.enableGamePassPreview
	
	if p1.props.showBadgesRow == false then
		ShowBadges = false
	end
	if ShowGamepassesRow == false then
		ShowPasses = false
		ShowSubscriptionProducts = false
		ShowDeveloperProducts = false
	end
	p1.gameInfoListData = {}
	local Locale = Localization:GetLocale()
	local L = _DateTime:FormatLocalTime("l", Locale)
	local L1 = _DateTime1:FormatLocalTime("l", Locale)
	
	if ShowPasses and EnableGamePassPreview and (not FFlagLuaAppHideEdpStoreForUnplayable or p1.props.isPlayable) then
		table.insert(p1.gameInfoListData, {
			renderFunction = p1.createGamePassPreviewRow,
			itemInfo = {
				infoName = "Feature.GameDetails.Label.Store",
				infoData = "",
				analyticsSubPage = "PassesAndGear",
				testId = "--store-row-tail",
				linkView = AppPageModule.PassesPage
			}
		})
	end
	local CommunityLink = p1.props.communityLink
	local CommunityLinkVariant = p1.props.communityLinkVariant
	
	if p1.props.communityLinksEnabled and CommunityLinkVariant == "infolist" and CommunityLink then
		table.insert(p1.gameInfoListData, {
			infoName = "Feature.GameDetails.Label.Community",
			infoData = "",
			testId = "--community-row-tail",
			infoIcon = GuildedLogoWhiteAsset,
			linkUrl = GetCommunityUrlFunction(CommunityLink.communityId),
			linkClickCallback = function()
				-- upvalues: ClickCommunityLinkEventFunction (upval), p1 (copy), Constants (upval), CommunityLink (copy), UniverseId (copy)
				ClickCommunityLinkEventFunction(p1.props.eventIngest, Constants.Context.ExperienceInfoList, {
					entityType = "universe",
					guildedServerId = CommunityLink.communityId,
					entityId = UniverseId
				})
			end
		})
	end
	local EdpServerIxpVariables = p1.props.edpServerIxpVariables
	
	if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) and (EdpServerIxpVariables and EdpServerIxpVariables.showVisitsInInfoList == true) then
		table.insert(p1.gameInfoListData, {
			infoName = "Feature.GameDetails.Label.Visits",
			testId = "--visits-row-tail",
			infoData = AbbreviateCountFunction(p1.props.gameDetail and p1.props.gameDetail.visits or 0, Locale) or "--"
		})
	end
	table.insert(p1.gameInfoListData, {
		testId = "--content-maturity-row-tail",
		infoName = if p1.props.ageRecommendationHeader then p1.props.ageRecommendationHeader else "Feature.GameDetails.Label.ContentMaturity",
		infoData = if DisplayName then DisplayName else Localization:Format("Feature.GameDetails.Label.Unavailable"),
		linkView = if DisplayName then AppPageModule.ExperienceGuidelinesExplained else nil,
		analyticsSubPage = AppPageModule.ExperienceGuidelinesExplained,
		disableInfoNameLocalization = p1.props.ageRecommendationHeader ~= nil
	})
	
	if MinimumAgeDisplay and MinimumAgeDisplay ~= "" then
		table.insert(p1.gameInfoListData, {
			infoName = "Feature.GameDetails.Label.Age",
			testId = "--age-row-tail",
			infoData = MinimumAgeDisplay
		})
	end
	if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) and (EdpServerIxpVariables and EdpServerIxpVariables.showContentDescriptorsInInfoList == true and p1.props.ageRecommendations and p1.props.ageRecommendations.descriptorUsages and #p1.props.ageRecommendations.descriptorUsages > 0) then
		for _, descriptorUsage in ipairs(p1.props.ageRecommendations.descriptorUsages) do
			if descriptorUsage.name == "strong-language" and descriptorUsage.contains then
				table.insert(p1.gameInfoListData, {
					testId = "--content-descriptors-row-tail",
					infoName = if FFlagLuaAppUpdateContentDescriptorsTranslation then "Feature.AgeGuidelines.Label.CreatorEnabled" else "Feature.AccountSettings.Heading.Communication",
					infoData = Localization:Format("Feature.AgeGuidelines.DisplayName.StrongLanguage")
				})
				break
			end
		end
	end
	if ShowDeveloperRow or ShowRNVDeveloper and Creator.isRNVAccount then
		if EnableCommunityProfilePageIXPModule.FFlagIsSetupEnabled and p1.props.communityProfilePageEnabled and Type == Enum.CreatorType.Group.Name then
			table.insert(p1.gameInfoListData, {
				infoName = "Feature.GameDetails.Label.Developer",
				linkView = "CommunityProfilePlatform",
				analyticsSubPage = "Developer",
				testId = "--developer-row-tail",
				infoData = Name,
				linkViewData = Id,
				useVerifiedBadgeEmojiWrapper = CreatorVerified
			})
		elseif Type == Enum.CreatorType.User.Name then
			table.insert(p1.gameInfoListData, {
				infoName = "Feature.GameDetails.Label.Developer",
				linkView = "UserProfilePlatform",
				analyticsSubPage = "Developer",
				testId = "--developer-row-tail",
				infoData = Name,
				linkViewData = Id,
				useVerifiedBadgeEmojiWrapper = CreatorVerified
			})
		else
			table.insert(p1.gameInfoListData, {
				infoName = "Feature.GameDetails.Label.Developer",
				analyticsSubPage = "Developer",
				testId = "--developer-row-tail",
				infoData = Name,
				linkPage = UrlBuilderModule.game.info.creator({ creatorType = Type, creatorId = Id }),
				useVerifiedBadgeEmojiWrapper = CreatorVerified
			})
		end
	end
	if ShowMaxPlayersRow then
		table.insert(p1.gameInfoListData, {
			infoName = "Feature.GameDetails.Label.MaxPlayers",
			testId = "--server-size-row-tail",
			infoData = tostring(MaxPlayers)
		})
	end
	local GenreL = if GenreL1 and GenreL1 ~= "" then GenreL1 elseif FStringLuaAppGenreOverrideModule == "N/A" then Localization:Format("Feature.GameDetails.Label.Unavailable") elseif FStringLuaAppGenreOverrideModule == "All" then Localization:Format("Feature.GameDetails.Label.GenreAll") else nil
	local Entry = config[Genre]
	
	if GenreL then
		Genre = GenreL
	elseif Entry ~= nil then
		Genre = Localization:Format(Entry)
	end
	if ShowGenreRow then
		table.insert(p1.gameInfoListData, {
			infoName = "Feature.GameDetails.Label.Genre",
			testId = "--genre-row-tail",
			infoData = Genre
		})
	end
	if ShowSubgenreRow and GenreL2 and GenreL2 ~= "" then
		table.insert(p1.gameInfoListData, {
			infoName = "Feature.GameDetails.Label.Subgenre",
			testId = "--subgenre-row-tail",
			infoData = GenreL2
		})
	end
	if ShowCreatedRow then
		table.insert(p1.gameInfoListData, {
			infoName = "Feature.GameDetails.Label.Created",
			testId = "--created-row-tail",
			infoData = L
		})
	end
	if ShowUpdatedRow then
		table.insert(p1.gameInfoListData, {
			infoName = "Feature.GameDetails.Label.Updated",
			testId = "--updated-row-tail",
			infoData = L1
		})
	end
	if GetFFlagGameDetailsSeparateChatFeatureRowsModule() then
		local FeatureGameDetailsLabelNotSupported = Localization:Format("Feature.GameDetails.Label.NotSupported")
		local FeatureGameDetailsLabelSupported = if ExperienceVideoEnabled then Localization:Format("Feature.GameDetails.Label.Supported") else Localization:Format("Feature.GameDetails.Label.NotSupported")
		
		if ExperienceVoiceEnabled then
			FeatureGameDetailsLabelNotSupported = Localization:Format("Feature.GameDetails.Label.Supported")
		end
		if not p1.props.isLocalUserUnder13 then
			table.insert(p1.gameInfoListData, {
				infoName = "Feature.GameDetails.Label.VoiceChat",
				testId = "--voice-chat-row-tail",
				infoData = FeatureGameDetailsLabelNotSupported
			})
		end
		table.insert(p1.gameInfoListData, {
			infoName = "Feature.GameDetails.Label.Camera",
			testId = "--camera-row-tail",
			infoData = FeatureGameDetailsLabelSupported
		})
	else
		local List = {}
		
		if ExperienceVoiceEnabled and not p1.props.isLocalUserUnder13 then
			table.insert(List, Localization:Format("Feature.GameDetails.Label.Microphone"))
		end
		if ExperienceVideoEnabled then
			table.insert(List, Localization:Format("Feature.GameDetails.Label.Camera"))
		end
		if #List < 1 then
			table.insert(List, Localization:Format("Feature.GameDetails.Label.None"))
		end
		table.insert(p1.gameInfoListData, {
			infoName = "Feature.AccountSettings.Heading.Communication",
			testId = "--communication-row-tail",
			infoData = table.concat(List, ", ")
		})
	end
	if not EnableGamePassPreview and (ShowPasses or ShowSubscriptionProducts or ShowDeveloperProducts) and (not FFlagLuaAppHideEdpStoreForUnplayable or p1.props.isPlayable) then
		table.insert(p1.gameInfoListData, {
			infoName = "Feature.GameDetails.Label.Store",
			infoData = "",
			analyticsSubPage = "PassesAndGear",
			testId = "--store-row-tail",
			linkView = AppPageModule.PassesPage
		})
	end
	if ShowBadges then
		table.insert(p1.gameInfoListData, {
			infoName = "CommonUI.Features.Label.Badges",
			infoData = "",
			analyticsSubPage = "Badges",
			testId = "--badges-row-tail",
			linkPage = if FFlagLuaAppBadgesSeeAllEnabled then nil else UrlBuilderModule.game.info.badges({ universeId = UniverseId }),
			linkView = if FFlagLuaAppBadgesSeeAllEnabled then AppPageModule.BadgesSeeAll else nil
		})
	end
	if ShowServersRow then
		table.insert(p1.gameInfoListData, {
			infoName = "Feature.GameDetails.Label.Servers",
			infoData = "",
			analyticsSubPage = "Servers",
			testId = "--servers-row-tail",
			linkPage = UrlBuilderModule.game.info.servers({ universeId = UniverseId }),
			onClose = if FFlagEnableBlackbirdPageCloseCallback and GetSubscriptionPurchaseCloseCallbackFunction then GetSubscriptionPurchaseCloseCallbackFunction() else nil
		})
	end
	if GroupLink and EnableGroupLinks then
		if EnableCommunityProfilePageIXPModule.FFlagIsSetupEnabled and p1.props.communityProfilePageEnabled and GroupLink.communityId ~= nil then
			table.insert(p1.gameInfoListData, {
				infoName = "Feature.GameDetails.Label.Group",
				infoData = "",
				linkView = "CommunityProfilePlatform",
				analyticsSubPage = "Group",
				testId = "--group-row-tail",
				linkViewData = GroupLink.communityId
			})
			
			return
		end
		table.insert(p1.gameInfoListData, {
			infoName = "Feature.GameDetails.Label.Group",
			infoData = "",
			analyticsSubPage = "Group",
			testId = "--group-row-tail",
			linkPage = GroupLink.url
		})
	end
end

function GameInfoList.createSocialMediaRow(p2, UniverseId, LayoutOrder)
	-- upvalues: FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp (copy), RoactModule (copy), AppCommonLibModule (copy), EdpSocialLinksImpressionsDetectorModule (copy), AppPageModule (copy), FFlagLuaAppUseExperienceLogoTrayInGameInfoList (copy), ExperienceLogoTrayModule (copy), FFlagLuaAppAddSocialLinkClickTelemetryToEdp (copy), SocialMediaGroupModule (copy)
	local EXPERIENCEName = if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then `EXPERIENCE_SOCIAL_LINKS_{UniverseId}` else nil
	local Ref = if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then RoactModule.createRef() else nil
	local NewResult = if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then AppCommonLibModule.Signal.new() else nil
	local v1 = if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then function(_)
		-- upvalues: NewResult (copy)
		NewResult:fire()
	end else nil
	
	return RoactModule.createElement("Frame", {
		LayoutOrder = LayoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		[RoactModule.Ref] = if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then Ref else nil,
		[RoactModule.Change.AbsolutePosition] = if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then v1 else nil
	}, {
		ListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Padding = RoactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, p2.props.leftPadding),
			PaddingRight = UDim.new(0, p2.props.rightPadding),
			PaddingTop = UDim.new(0, 10),
			PaddingBottom = UDim.new(0, 10)
		}),
		EdpSocialLinksImpressionsDetector = if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then RoactModule.createElement(EdpSocialLinksImpressionsDetectorModule, {
			parentRef = Ref,
			scrollViewPositionChangedSignal = NewResult,
			pageContext = AppPageModule.GameDetail,
			impressionsTag = EXPERIENCEName,
			socialLinks = if p2.props.socialLinks then p2.props.socialLinks.externalLinks else nil,
			universeId = UniverseId
		}) else nil,
		SocialLinks = if FFlagLuaAppUseExperienceLogoTrayInGameInfoList then if p2.props.socialLinks and p2.props.socialLinks.externalLinks then RoactModule.createElement(ExperienceLogoTrayModule, {
			socialLinks = p2.props.socialLinks.externalLinks,
			linking = p2.props.linking,
			openLeaveRobloxAlertUIBlox = p2.props.openLeaveRobloxAlertUIBlox,
			closeAlert = p2.props.closeAlert,
			impressionsTag = if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then EXPERIENCEName else nil,
			universeId = if FFlagLuaAppAddSocialLinkClickTelemetryToEdp then p2.props.universeId else nil
		}) else nil else RoactModule.createElement(SocialMediaGroupModule, {
			universeId = UniverseId,
			impressionsTag = if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then EXPERIENCEName else nil
		})
	})
end

function GameInfoList.createCommunityRow(p2, LayoutOrder)
	-- upvalues: RoactModule (copy), ExperienceCommunityLink (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = LayoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		Padding = RoactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, p2.props.leftPadding),
			PaddingRight = UDim.new(0, p2.props.rightPadding),
			PaddingTop = UDim.new(0, 30),
			PaddingBottom = UDim.new(0, 10)
		}),
		ExperienceCommunityLink = RoactModule.createElement(ExperienceCommunityLink, {
			communityInfo = p2.props.communityLink,
			experienceName = p2.props.gameDetail.name,
			universeId = p2.props.universeId
		})
	})
end

function GameInfoList.render(p2)
	-- upvalues: RoactModule (copy), WithStyleFunction (copy), GameInfoRowModule (copy), EnableCommunityProfilePageIXPModule (copy), FFlagEnableBlackbirdPageCloseCallback (copy)
	local TextSizeOffset = p2.props.textSizeOffset
	p2:makeGameInfoListData()
	local RootPlaceId = p2.props.gameDetail.rootPlaceId
	local UniverseId = p2.props.universeId
	local ShowSocial = p2.props.showSocial
	local LayoutOrder = p2.props.LayoutOrder
	local LeftPadding = p2.props.leftPadding
	local RightPadding = p2.props.rightPadding
	local config = {
		Layout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Right
		})
	}
	
	return WithStyleFunction(function(p3)
		-- upvalues: p2 (copy), config (copy), UniverseId (copy), TextSizeOffset (copy), RoactModule (upval), GameInfoRowModule (upval), RootPlaceId (copy), EnableCommunityProfilePageIXPModule (upval), LeftPadding (copy), RightPadding (copy), FFlagEnableBlackbirdPageCloseCallback (upval), ShowSocial (copy), LayoutOrder (copy)
		local Color = p3.Theme.Divider.Color
		local Transparency = p3.Theme.Divider.Transparency
		local LayoutOrder1 = 0
		local CountGameInfoListData = #p2.gameInfoListData
		
		for i, value in ipairs(p2.gameInfoListData) do
			local RenderFunctionFunction = value.renderFunction
			local NewLayoutOrder = LayoutOrder1 + 1
			
			if RenderFunctionFunction then
				config["GameInfoRow" .. i] = RenderFunctionFunction(UniverseId, NewLayoutOrder, value.itemInfo, TextSizeOffset)
			else
				config["GameInfoRow" .. i] = RoactModule.createElement(GameInfoRowModule, {
					topPadding = 10,
					bottomPadding = 10,
					Size = UDim2.new(1, 0, 0, 57),
					useVerifiedBadgeEmojiWrapper = value.useVerifiedBadgeEmojiWrapper,
					LayoutOrder = NewLayoutOrder,
					placeId = RootPlaceId,
					infoName = value.infoName,
					infoData = value.infoData,
					infoIcon = value.infoIcon,
					linkPage = value.linkPage,
					linkView = value.linkView,
					linkViewData = if EnableCommunityProfilePageIXPModule.FFlagIsSetupEnabled then value.linkViewData else nil,
					linkUrl = value.linkUrl,
					linkClickCallback = value.linkClickCallback,
					universeId = UniverseId,
					leftPadding = LeftPadding,
					rightPadding = RightPadding,
					analyticsSubPage = value.analyticsSubPage,
					disableInfoNameLocalization = value.disableInfoNameLocalization,
					testId = value.testId,
					onClose = if FFlagEnableBlackbirdPageCloseCallback then value.onClose else nil
				})
			end
			LayoutOrder1 = NewLayoutOrder + 1
			config["Divider" .. i] = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, -LeftPadding, 0, 1),
				BackgroundColor3 = Color,
				BackgroundTransparency = Transparency,
				LayoutOrder = LayoutOrder1
			})
		end
		local CommunityLinkVariant = p2.props.communityLinkVariant
		
		if p2.props.communityLinksEnabled and CommunityLinkVariant == "banner" then
			local CommunityRow = p2.props.communityLink and p2:createCommunityRow(LayoutOrder1 + 1) or nil
			
			if CommunityRow ~= nil then
				CountGameInfoListData += 1
				LayoutOrder1 += 1
				config["GameInfoRow" .. CountGameInfoListData] = CommunityRow
			end
		end
		local SocialMediaRow = ShowSocial and p2:createSocialMediaRow(UniverseId, LayoutOrder1 + 1) or nil
		
		if SocialMediaRow ~= nil then
			config["GameInfoRow" .. CountGameInfoListData + 1] = SocialMediaRow
		end
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Size = UDim2.new(1, LeftPadding + RightPadding, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = LayoutOrder
		}, config)
	end)
end

function GameInfoList.didMount(p3)
	p3.checkCommunityLinkExposureLogging()
end

function GameInfoList.didUpdate(p3, p4, _)
	-- upvalues: AppPageModule (copy), FFlagLuaAppGamePassesDataHydrationMigrationEnabled (copy), DataHydrationModule (copy)
	local TopPage = p4.topPage
	
	if p3.props.topPage.name ~= TopPage.name and TopPage.name == AppPageModule.GenericWebPage and (if TopPage.extraProps then TopPage.extraProps.passOwned else nil) == false then
		if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then
			DataHydrationModule.Game.getGamePassStore(false).fetchPassesForUniverse(p3.props.universeId)
		else
			p3.props.fetchGamePasses(p3.props.networking, p3.props.universeId)
		end
	end
	if not p4.communityLink then
		p3.checkCommunityLinkExposureLogging()
	end
end

local Callback = MemoizeModule(function(List)
	local List1 = {}
	
	if not List then
		return List1
	end
	for _, value in ipairs(List) do
		if value.price ~= nil then
			table.insert(List1, value)
		end
	end
	return List1
end)

local function _(p3)
	-- upvalues: FFlagUseNavigationSelectors (copy), Selectors (copy)
	local SelectLegacyHistoryResult = if FFlagUseNavigationSelectors then Selectors.selectLegacyHistory(p3) else p3.Navigation.history
	local SelectLegacyHistoryResultEntry = SelectLegacyHistoryResult[#SelectLegacyHistoryResult]
	
	return SelectLegacyHistoryResultEntry[#SelectLegacyHistoryResultEntry]
end

local v1 = RoactServices.connect({
	localization = RoactLocalizationModule,
	networking = RoactNetworkingModule,
	eventIngest = AppEventIngestServiceModule,
	linking = if FFlagLuaAppUseExperienceLogoTrayInGameInfoList then AppLinking else nil
})((RoactAppPolicy.connect(function(p3, _)
	return {
		enableGroupLinks = p3.getSocialGroupLinks(),
		showBadgesRow = p3.getGameInfoShowBadges(),
		showCreatedRow = p3.getGameInfoShowCreated(),
		showDeveloperRow = p3.getGameInfoListDeveloper(),
		showRNVDeveloper = p3.getGameInfoListShowRNVDeveloper(),
		showGamepassesRow = p3.getGameInfoShowGamepasses(),
		showGenreRow = p3.getGameInfoShowGenre(),
		showSubgenreRow = p3.getGameInfoShowSubgenre(),
		showMaxPlayersRow = p3.getGameInfoShowMaxPlayers(),
		showServersRow = p3.getGameInfoShowServers(),
		showUpdatedRow = p3.getGameInfoShowUpdated()
	}
end)((RoactAppExperimentModule.connectUserLayer({
	AppUserLayers.EDPCommunityLinksLayer,
	EnableCommunityProfilePageIXPModule.EnableCommunityProfilePageExperimentLayer
}, function(p3)
	-- upvalues: AppUserLayers (copy), EnableCommunityProfilePageIXPModule (copy)
	local CommunityLinkDisplayConfig = (p3[AppUserLayers.EDPCommunityLinksLayer] or {}).communityLinkDisplayConfig or {}
	local IsFeatureActive = if EnableCommunityProfilePageIXPModule.FFlagIsSetupEnabled then EnableCommunityProfilePageIXPModule.isFeatureActive(p3) else nil
	
	return {
		communityLinksEnabled = CommunityLinkDisplayConfig.inTreatment,
		communityLinkVariant = CommunityLinkDisplayConfig.linkVariant,
		communityProfilePageEnabled = if EnableCommunityProfilePageIXPModule.FFlagIsSetupEnabled then IsFeatureActive else nil
	}
end, false)((RoactRoduxModule.connect(function(p3, p4)
	-- upvalues: Callback (copy), VerifiedBadgesModule (copy), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), FFlagLuaAppGamePassesDataHydrationMigrationEnabled (copy), FFlagSignalsNavP3fGameDetails (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp (copy), FFlagLuaAppUseExperienceLogoTrayInGameInfoList (copy), FFlagLuaAppHideEdpStoreForUnplayable (copy)
	local CallbackResult = p3.GamePasses and Callback(p3.GamePasses[p4.universeId])
	local GameSubscriptionProduct = p3.GameSubscriptionProducts[p4.universeId]
	local GameDeveloperProduct = p3.GameDeveloperProducts[p4.universeId]
	local GameBadge = p3.GameBadges[p4.universeId]
	local Flag = true
	local ShowSubscriptionProducts: boolean = GameSubscriptionProduct and #GameSubscriptionProduct > 0
	local ShowDeveloperProducts: boolean = GameDeveloperProduct and #GameDeveloperProduct > 0
	local ShowBadges = true
	local GameSocialLink = p3.GameSocialLinks[p4.universeId]
	local GroupLink = GameSocialLink and GameSocialLink.groupLink
	local IsUniverseEnabledForVoice = false
	local IsCreatorOfGameVerified = VerifiedBadgesModule.isCreatorOfGameVerified(p3, if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p4.shouldHydrateLegacyIxp then {
		shouldUseV2GameDetails = true,
		universeId = p4.universeId
	} else p4)
	local ExperienceCommunityLink = p3.CommunityLinks.ExperienceCommunityLinks[p4.universeId] or nil
	
	if CallbackResult and #CallbackResult == 0 then
		Flag = false
	end
	if GameBadge and #GameBadge == 0 then
		ShowBadges = false
	end
	local IsUserOptIn = p3.VoiceChatOptInStatus.isUserOptIn or false
	local IsUniverseEnabledForAvatarVideo = false
	
	if p3.ShowAgeVerificationOverlay[p4.universeId] ~= nil then
		IsUniverseEnabledForVoice = p3.ShowAgeVerificationOverlay[p4.universeId].isUniverseEnabledForVoice or false
		IsUniverseEnabledForAvatarVideo = p3.ShowAgeVerificationOverlay[p4.universeId].isUniverseEnabledForAvatarVideo or false
	end
	local config = {
		gameDetail = if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p4.shouldHydrateLegacyIxp then p3.GameDetailsV2[p4.universeId] else p3.GameDetails[p4.universeId],
		creatorVerified = IsCreatorOfGameVerified,
		showPasses = if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then nil else Flag,
		passes = if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then nil else CallbackResult,
		showSubscriptionProducts = ShowSubscriptionProducts,
		showDeveloperProducts = ShowDeveloperProducts,
		showBadges = ShowBadges,
		groupLink = GroupLink,
		communityLink = ExperienceCommunityLink,
		userVoiceEnabled = IsUserOptIn,
		experienceVoiceEnabled = IsUniverseEnabledForVoice,
		experienceVideoEnabled = IsUniverseEnabledForAvatarVideo,
		isLocalUserUnder13 = p3.IsLocalUserUnder13
	}
	local TopPage = nil
	
	if FFlagSignalsNavP3fGameDetails then
		TopPage = nil
	else
		local SelectLegacyHistoryResult = if FFlagUseNavigationSelectors then Selectors.selectLegacyHistory(p3) else p3.Navigation.history
		local SelectLegacyHistoryResultEntry = SelectLegacyHistoryResult[#SelectLegacyHistoryResult]
		TopPage = SelectLegacyHistoryResultEntry[#SelectLegacyHistoryResultEntry]
	end
	config.topPage = TopPage
	config.ageRecommendationHeader = p3.AgeRecommendationHeaders.headerDisplayName
	config.socialLinks = if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp or FFlagLuaAppUseExperienceLogoTrayInGameInfoList then GameSocialLink else nil
	config.isPlayable = if FFlagLuaAppHideEdpStoreForUnplayable then p3.PlayabilityStatus and (p3.PlayabilityStatus[p4.universeId] and p3.PlayabilityStatus[p4.universeId].isPlayable) else nil
	
	return config
end, function(Callback)
	-- upvalues: FFlagLuaAppGamePassesDataHydrationMigrationEnabled (copy), ApiFetchGamePassesModule (copy), FFlagLuaAppUseExperienceLogoTrayInGameInfoList (copy), OpenCentralOverlayForLeaveRobloxAlertModule (copy), CloseCentralOverlayModule (copy)
	return {
		fetchGamePasses = if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then nil else function(p3, p4)
			-- upvalues: Callback (copy), ApiFetchGamePassesModule (upval)
			return Callback(ApiFetchGamePassesModule(p3, p4))
		end,
		openLeaveRobloxAlertUIBlox = if FFlagLuaAppUseExperienceLogoTrayInGameInfoList then function(p3)
			-- upvalues: Callback (copy), OpenCentralOverlayForLeaveRobloxAlertModule (upval)
			Callback(OpenCentralOverlayForLeaveRobloxAlertModule(p3))
		end else nil,
		closeAlert = if FFlagLuaAppUseExperienceLogoTrayInGameInfoList then function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			Callback(CloseCentralOverlayModule())
		end else nil
	}
end)(GameInfoList)))))))

return function(p3)
	-- upvalues: UseTextSizeOffsetFunction (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), UseEdpServerIxpVariablesModule (copy), FFlagLuaAppGamePassesDataHydrationMigrationEnabled (copy), UseGamePassesModule (copy), Callback (copy), FFlagSignalsNavP3fGameDetails (copy), GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), CryoModule (copy), ExperienceDetailsExperimentationModule (copy), RoactModule (copy), v1 (ref)
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local UseEdpServerIxpVariablesModuleResult = if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then UseEdpServerIxpVariablesModule() else nil
	local v2 = nil
	local v3: boolean? = nil
	
	if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then
		local UseGamePassesModuleResult = UseGamePassesModule(p3.universeId)
		v2 = if UseGamePassesModuleResult then Callback(UseGamePassesModuleResult) else nil
		v3 = v2 == nil or #v2 > 0
	end
	local UseSignalStateResult = if FFlagSignalsNavP3fGameDetails then UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentPage) else nil
	
	return RoactModule.createElement(v1, (CryoModule.Dictionary.join(p3, {
		textSizeOffset = UseTextSizeOffsetResult,
		edpServerIxpVariables = if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui() then UseEdpServerIxpVariablesModuleResult else nil,
		passes = if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then v2 else nil,
		showPasses = if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then v3 else nil,
		topPage = if FFlagSignalsNavP3fGameDetails then UseSignalStateResult else nil
	})))
end