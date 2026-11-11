local CorePackages = game:GetService("CorePackages")
local AdService = game:GetService("AdService")
local IXPService = game:GetService("IXPService")
local RoactModule = require(CorePackages.Packages.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local UsePlayButtonStateFunction = require(CorePackages.Workspace.Packages.GamePlayButton).usePlayButtonState
local PlayButtonStates = require(CorePackages.Workspace.Packages.GamePlayButton).PlayButtonStates
local ApiFetchGameDetails = require(CorePackages.Workspace.Packages.GameDetailRodux).GameDetails.ApiFetchGameDetails
local FetchGamePlayabilityAndProductInfo = require(CorePackages.Workspace.Packages.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local PlayabilityStatusEnum = require(CorePackages.Workspace.Packages.DiscoveryTypes).PlayabilityStatusEnum
local EnumGameDetailErrorTypes = require(CorePackages.Workspace.Packages.DiscoveryTypes).EnumGameDetailErrorTypes
local GetSafeAreaSizeFunction = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local NextDataExpirationTimeRoduxModule = require(CorePackages.Workspace.Packages.NextDataExpirationTimeRodux)
local NextDataExpirationTimeReducer = NextDataExpirationTimeRoduxModule.NextDataExpirationTimeReducer
local ExpirationTimeNamespace = NextDataExpirationTimeRoduxModule.ExpirationTimeNamespace
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local ReactModule = require(CorePackages.Packages.React)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local AppEventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local ExperienceDetailsExperimentationModule = require(script.Parent.Parent.ExperienceDetails.ExperienceDetailsExperimentation)
local GameInfosReducer = require(CorePackages.Workspace.Packages.GameInfosRodux).GameInfosReducer
local ExperienceDetailsNoticeType = require(CorePackages.Workspace.Packages.DiscoveryTypes).ExperienceDetailsNoticeType
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local WithStyleFunction = UIBloxModule.Style.withStyle
local LoadingStateContainer = UIBloxModule.App.Container.LoadingStateContainer
local RetrievalStatus1 = UIBloxModule.App.Loading.Enum.RetrievalStatus
local EmptyState = UIBloxModule.App.Indicator.EmptyState
local PlayWithRewardComponent = require(CorePackages.Workspace.Packages.PlayWithRewardComponent).PlayWithRewardComponent
local FetchPlayWithRewardStateFunction = require(CorePackages.Workspace.Packages.PlayWithRewardComponent).FetchPlayWithRewardState
local SetPlayWithRewardStateFunction = require(CorePackages.Workspace.Packages.PlayWithRewardState).SetPlayWithRewardState
local UseEdpServerIxpVariablesModule = require(script.Parent.Parent.ExperienceDetails.Hooks.useEdpServerIxpVariables)
local UseEdpPerUniverseVisibilityVariablesForUniverseModule = require(script.Parent.Parent.ExperienceDetails.Hooks.useEdpPerUniverseVisibilityVariablesForUniverse)
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local MediaGallerySwipedFunction = Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents.MediaGallerySwiped
local MediaGalleryMediaChangedFunction = Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents.MediaGalleryMediaChanged
local CheckAndFormatPossibleLinkFunction = require(CorePackages.Workspace.Packages.CollectionViews).checkAndFormatPossibleLink
local Modules1 = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules1.LuaApp.Constants)
local ApiFetchExperienceDetailsPageModule = require(Modules1.LuaApp.Thunks.Games.ApiFetchExperienceDetailsPage)
local ApiFetchExperienceDetailsPageCountersModule = require(Modules1.LuaApp.Thunks.ApiFetchExperienceDetailsPageCounters)
local LoadingSkeletonModule = require(Modules1.LuaApp.Components.LoadingSkeleton)
local GameInfoListModule = require(Modules1.LuaApp.Components.GameDetails.GameInfoList)
local GameHeaderModule = require(Modules1.LuaApp.Components.GameDetails.GameHeader)
local GamePlaysAndRatingsModule = require(Modules1.LuaApp.Components.GameDetails.GamePlaysAndRatings)
local FetchGameDetailsPageDataModule = require(Modules1.LuaApp.Thunks.Games.FetchGameDetailsPageData)
local RecommendedGamesModule = require(Modules1.LuaApp.Thunks.Games.RecommendedGames)
local EventsListWrapperModule = require(Modules1.LuaApp.Components.VirtualEvents.EventsListWrapper)
local GameStatsCarouselModule = require(Modules1.LuaApp.Components.ExperienceDetails.GameStatsCarousel)
local ExperienceTagsContainerModule = require(Modules1.LuaApp.Components.ExperienceDetails.ExperienceTagsContainer)
local ExperienceDescriptionModule = require(Modules1.LuaApp.Components.ExperienceDetails.ExperienceDescription)
local ExperienceMediaGalleryModule = require(Modules1.LuaApp.Components.ExperienceDetails.ExperienceMediaGallery)
local IgrsRatingLabelModule = require(Modules1.LuaApp.Components.ExperienceDetails.IgrsRatingLabel)
local GameRefundPolicyModule = require(Modules1.LuaApp.Components.GameDetails.GameRefundPolicy)
local OpenRefundPolicyLearnMorePageModule = require(Modules1.LuaApp.Thunks.OpenRefundPolicyLearnMorePage)
local OpenWebviewModule = require(Modules1.LuaApp.Thunks.OpenWebview)
local ExperienceSongsCarouselModule = require(Modules1.LuaApp.Components.ExperienceDetails.ExperienceSongsCarousel)
local RecommendedExperienceCarouselModule = require(Modules1.LuaApp.Components.ExperienceDetails.RecommendedExperienceCarousel)
local EdpSduiUtilsModule = require(script.Parent.Parent.ExperienceDetails.EdpSduiUtils)
local ServerDrivenUiModule = require(CorePackages.Workspace.Packages.ServerDrivenUi)
local GameDetailTelemetryModule = require(CorePackages.Workspace.Packages.GameDetailTelemetry)
local EDPTTIConstants = GameDetailTelemetryModule.EDPTTIConstants
local FFlagEDPTTITrackingEnabled = GameDetailTelemetryModule.FFlagEDPTTITrackingEnabled
local UseEDPTTITrackingModule = require(Modules1.LuaApp.Components.ExperienceDetails.useEDPTTITracking)
local UseFirstMediaCarouselImageUriFunction = require(Modules1.LuaApp.Components.ExperienceDetails.useFirstMediaCarouselImageUri).useFirstMediaCarouselImageUri
local FFlagLuaAppExperienceDetailsLayoutOrderConfig = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppExperienceDetailsLayoutOrderConfig
local FFlagSongEdpCarouselIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSongEdpCarouselIxp
local LuaAppFixNoticeLocalization = game:DefineFastFlag("LuaAppFixNoticeLocalization", false)
local FFlagLuaAppEnableConsolidatedGameRefundPolicy = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEnableConsolidatedGameRefundPolicy
local FFlagLuaAppEdpMediaGalleryRedesignIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignIxp
local FFlagLuaAppEdpMediaGalleryVideoPreviewIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreviewIxp
local FFlagLuaAppEdpMediaGalleryRedesignTelemetry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignTelemetry
local FFlagLuaAppEdpBackendV2HydrateLegacyDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local FFlagEnablePlayWithRewardComponent = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnablePlayWithRewardComponent
local FFlagLuaAppEdpBackendV2SduiInterleaveDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault
local FFlagLuaAppEdpBackendV2SduiInterleaveIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp
local FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable
local FFlagLuaAppAddUniverseIdToGameDetailsEvents = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddUniverseIdToGameDetailsEvents
local FFlagLuaAppExpandableTextImpressionsEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppExpandableTextImpressionsEnabled
local FFlagLuaAppEdpKeepCachedDetailsOnRefetch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpKeepCachedDetailsOnRefetch
local FFlagLuaAppEdpMediaGalleryHeightJitterFix = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryHeightJitterFix
local Panels = {
	[1] = { Size = UDim2.new(0.5, 0, 0, 35) },
	[2] = { Size = UDim2.new(0.25, 0, 0, 24) },
	[3] = { Size = UDim2.new(1, 0, 0, 200) },
	[4] = { Size = UDim2.new(1, 0, 0, 24) },
	[5] = { Size = UDim2.new(0.6, 0, 0, 24) }
}
local Callback: ((any, any, any, any) -> any)? = nil

if FFlagLuaAppEdpKeepCachedDetailsOnRefetch then
	local function _(p1, p2): boolean
		-- upvalues: NextDataExpirationTimeReducer (copy), ExpirationTimeNamespace (copy)
		local PersonalizationEntry = p1.Personalization[NextDataExpirationTimeReducer.key][ExpirationTimeNamespace.GameDetailPage]
		local PersonalizationEntry1 = PersonalizationEntry and PersonalizationEntry[p2]
		
		return PersonalizationEntry1 ~= nil and tick() <= PersonalizationEntry1
	end
	
	Callback = function(p1, UniverseId, FetchingStatus, GameDetailsVEntry)
		-- upvalues: RetrievalStatus (copy), NextDataExpirationTimeReducer (copy), ExpirationTimeNamespace (copy)
		local IsFetchingStatusMatch: boolean = FetchingStatus == RetrievalStatus.Fetching or FetchingStatus == RetrievalStatus.NotStarted
		
		if GameDetailsVEntry ~= nil and IsFetchingStatusMatch then
			local PersonalizationEntry = p1.Personalization[NextDataExpirationTimeReducer.key][ExpirationTimeNamespace.GameDetailPage]
			local PersonalizationEntry1 = PersonalizationEntry and PersonalizationEntry[UniverseId]
			
			if PersonalizationEntry1 ~= nil and PersonalizationEntry1 >= tick() then
				return RetrievalStatus.Done
			end
		end
		return FetchingStatus
	end
end
local _ = function(p1: number): number
	return if p1 < 600 then 20 else 40
end

local _ = function()
	local v1 = 0
	
	return function(): number
		-- upvalues: v1 (ref)
		v1 += 1
		
		return v1
	end
end

local LandscapeLayoutConfig = {
	Header = 100,
	MediaGallery = 125,
	StatsCarousel = 200,
	TagSection = 300,
	MovedEventsList = 400,
	Description = 500,
	IgrsRatingLabel = 550,
	PlaysAndRatings = 600,
	InfoList = 700,
	RefundPolicy = 900,
	Notice = 1000,
	RecommendedGames = 1100,
	ExperienceSongsCarousel = 1200,
	SduiFeedItemsDefault = 1500
}
local GameDetailsCard = RoactModule.PureComponent:extend("GameDetailsCard")

function GameDetailsCard.init(p1)
	-- upvalues: FFlagEnablePlayWithRewardComponent (copy), ArgCheckModule (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (copy), MediaGallerySwipedFunction (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (copy), MediaGalleryMediaChangedFunction (copy), MemoizeFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), CheckAndFormatPossibleLinkFunction (copy), RoactModule (copy), RetrievalStatus (copy), FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable (copy)
	if FFlagEnablePlayWithRewardComponent then
		p1.state = { didFocus = false }
		
		function p1.onDidFocus()
			-- upvalues: p1 (copy)
			p1:setState({ didFocus = true })
		end
	end
	ArgCheckModule.isType(p1.props.universeId, "string", "GameDetailsCard.init.universeId")
	
	function p1.fetchGameDetailsPageData()
		-- upvalues: p1 (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (upval), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (upval)
		return p1.props.fetchGameDetailsPageData(p1.props.networking, p1.props.universeId, if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.props.shouldHydrateLegacyIxp else nil, if FFlagLuaAppEdpBackendV2SduiInterleaveIxp then p1.props.shouldInterleaveSduiIxp else nil, if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and p1.props.shouldInterleaveSduiIxp then p1.props.sduiDataUpdatedTimestamp else nil)
	end
	
	p1.onMediaGallerySwiped = if FFlagLuaAppEdpMediaGalleryRedesignTelemetry then nil else function()
		-- upvalues: p1 (copy), MediaGallerySwipedFunction (upval), FFlagLuaAppAddUniverseIdToGameDetailsEvents (upval)
		local RootPlaceId = p1.props.gameDetail and p1.props.gameDetail.rootPlaceId or nil
		
		if RootPlaceId then
			MediaGallerySwipedFunction(p1.props.eventIngest, "GameDetailsCard", RootPlaceId, if FFlagLuaAppAddUniverseIdToGameDetailsEvents then { universeId = p1.props.universeId } else nil)
		end
	end
	p1.onMediaGalleryMediaChanged = if FFlagLuaAppEdpMediaGalleryRedesignTelemetry then function(ImageAssetId, VideoAssetId, IsYouTubeVideo, AutoAdvance)
		-- upvalues: p1 (copy), MediaGalleryMediaChangedFunction (upval), FFlagLuaAppAddUniverseIdToGameDetailsEvents (upval)
		local RootPlaceId = p1.props.gameDetail and p1.props.gameDetail.rootPlaceId or nil
		
		if RootPlaceId then
			MediaGalleryMediaChangedFunction(p1.props.eventIngest, "GameDetailsCard", RootPlaceId, {
				imageAssetId = ImageAssetId,
				videoAssetId = VideoAssetId,
				isYouTubeVideo = IsYouTubeVideo,
				autoAdvance = AutoAdvance,
				universeId = if FFlagLuaAppAddUniverseIdToGameDetailsEvents then p1.props.universeId else nil
			})
		end
	end else nil
	p1.linkStartStyle = MemoizeFunction(function(p2): string
		-- upvalues: FFlagRenameDeprecatedUIBloxTokens (upval)
		local _Color3 = (if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Color.Content.Link else p2.Tokens.Semantic.Color.Text.Link).Color3
		
		return `<font color="{string.format("rgb(%d, %d, %d)", math.round(_Color3.R * 255), math.round(_Color3.G * 255), (math.round(_Color3.B * 255)))}"><b>`
	end)
	p1.checkAndFormatPossibleLink = MemoizeFunction(function(p2, p3)
		-- upvalues: CheckAndFormatPossibleLinkFunction (upval), p1 (copy)
		return CheckAndFormatPossibleLinkFunction(p3, nil, nil, p1.linkStartStyle(p2), "</b></font>")
	end)
	
	function p1.renderRefundPolicy(p2, RefundPolicy, LayoutOrder)
		-- upvalues: FFlagRenameDeprecatedUIBloxTokens (upval), p1 (copy), RoactModule (upval)
		local BodyLarge = if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Typography.BodyLarge else p2.Tokens.Semantic.Typography.Body
		local Muted = if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Color.Content.Muted else p2.Tokens.Semantic.Color.Text.Muted
		local CheckAndFormatPossibleLinkResult, CheckAndFormatPossibleLinkResult2 = p1.checkAndFormatPossibleLink(p2, RefundPolicy.policyText)
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = LayoutOrder
		}, {
			RefundPolicy = RoactModule.createElement("TextButton", {
				BackgroundTransparency = 1,
				Text = CheckAndFormatPossibleLinkResult2,
				AutomaticSize = Enum.AutomaticSize.XY,
				Font = BodyLarge.Font,
				TextSize = BodyLarge.FontSize,
				TextColor3 = Muted.Color3,
				TextTransparency = Muted.Transparency,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				RichText = CheckAndFormatPossibleLinkResult,
				[RoactModule.Event.Activated] = function(_)
					-- upvalues: p1 (upval), RefundPolicy (copy)
					p1.props.openRefundPolicyLearnMorePage(RefundPolicy.learnMoreUrl)
				end
			})
		})
	end
	
	p1.maybeFetchPlayWithReward = if FFlagEnablePlayWithRewardComponent then function()
		-- upvalues: p1 (copy), RetrievalStatus (upval), FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable (upval), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (upval), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (upval)
		if p1.state.didFocus ~= true or p1.props.gameDetailsPageDataStatus ~= RetrievalStatus.Done then return end
		if FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable and (if FFlagLuaAppEdpBackendV2SduiInterleaveDefault then p1.props.edpPerUniverseVisibilityVariables and p1.props.edpPerUniverseVisibilityVariables.hidePlayWithReward == true else FFlagLuaAppEdpBackendV2SduiInterleaveIxp and (p1.props.shouldInterleaveSduiIxp and (p1.props.edpPerUniverseVisibilityVariables and p1.props.edpPerUniverseVisibilityVariables.hidePlayWithReward == true))) then return end
		local Number: number? = tonumber(p1.props.localUserId)
		
		if not Number then return end
		if not p1.props.playWithRewardData or p1.props.playWithRewardData.universeId ~= p1.props.universeId then
			p1:setState({ didFocus = false })
			p1.props.fetchPlayWithReward(p1.props.universeId, Number):catch(function() end)
			
			return
		end
	end else nil
end

function GameDetailsCard:renderOnLoading(Offset)
	-- upvalues: RoactModule (copy), LoadingSkeletonModule (copy), Panels (copy)
	return RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		Padding = RoactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 0),
			PaddingLeft = UDim.new(0, Offset),
			PaddingRight = UDim.new(0, Offset)
		}),
		Skeleton = RoactModule.createElement(LoadingSkeletonModule, {
			Size = UDim2.new(1, 0, 1, 0),
			createLayout = function()
				-- upvalues: RoactModule (upval)
				return RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 15)
				})
			end,
			panels = Panels
		})
	})
end

function GameDetailsCard.renderOnLoaded(p1, Width, Offset, p2, p3)
	-- upvalues: FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), ExperienceDetailsExperimentationModule (copy), FFlagEnablePlayWithRewardComponent (copy), FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable (copy), WithStyleFunction (copy), RoactModule (copy), FFlagLuaAppExperienceDetailsLayoutOrderConfig (copy), GameHeaderModule (copy), LandscapeLayoutConfig (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), ExperienceMediaGalleryModule (copy), FFlagLuaAppEdpMediaGalleryHeightJitterFix (copy), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (copy), FFlagLuaAppEdpMediaGalleryRedesignIxp (copy), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy), GameStatsCarouselModule (copy), ExperienceTagsContainerModule (copy), EventsListWrapperModule (copy), ExperienceDescriptionModule (copy), RetrievalStatus1 (copy), FFlagRenameDeprecatedUIBloxTokens (copy), FFlagLuaAppExpandableTextImpressionsEnabled (copy), AppPage (copy), IgrsRatingLabelModule (copy), ConstantsModule (copy), GamePlaysAndRatingsModule (copy), GameInfoListModule (copy), FFlagLuaAppEnableConsolidatedGameRefundPolicy (copy), GameRefundPolicyModule (copy), ExperienceDetailsNoticeType (copy), LuaAppFixNoticeLocalization (copy), RetrievalStatus (copy), RecommendedExperienceCarouselModule (copy), FFlagSongEdpCarouselIxp (copy), ExperienceSongsCarouselModule (copy), PlayWithRewardComponent (copy)
	local UniverseId = p1.props.universeId
	local GameDetail = p1.props.gameDetail
	local GameInfo = p1.props.gameInfo
	local RootPlaceId = GameDetail and GameDetail.rootPlaceId or GameInfo and GameInfo.placeId
	local EnableRecommendedGames = p1.props.showRecommendedGames and p1.props.enableRecommendedGames
	local EnableSocial = GameDetail and p1.props.enableSocial
	local EnableGameInfoList = GameDetail and p1.props.enableGameInfoList
	local EnableGamePlaysAndRatings = p1.props.enableGamePlaysAndRatings
	local EnableGamePassPreview = p1.props.enableGamePassPreview
	
	if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) and (p1.props.edpServerIxpVariables and p1.props.edpServerIxpVariables.hideGameRatings == true) then
		EnableGamePlaysAndRatings = false
	end
	local IsNotDescriptionMatch: boolean = GameDetail and (GameDetail.description ~= nil and GameDetail.description ~= "")
	local ShowGlobalCounters = p1.props.showGlobalCounters
	local ShowLikesFavoritesCount = p1.props.showLikesFavoritesCount
	local AgeRecommendations = p1.props.ageRecommendations
	local IgrsRating = if AgeRecommendations and AgeRecommendations.summary and AgeRecommendations.summary.ageRecommendation and AgeRecommendations.summary.ageRecommendation.igrsRating and AgeRecommendations.summary.ageRecommendation.igrsRating ~= "" then AgeRecommendations.summary.ageRecommendation.igrsRating else nil
	local IgrsRatingDisplayMessage = if AgeRecommendations and AgeRecommendations.summary and AgeRecommendations.summary.ageRecommendation and AgeRecommendations.summary.ageRecommendation.igrsRatingDisplayMessage then AgeRecommendations.summary.ageRecommendation.igrsRatingDisplayMessage else nil
	local NotificationsCanAccessExperience = p1.props.notificationsCanAccessExperience
	
	if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) and (p1.props.edpServerIxpVariables and p1.props.edpServerIxpVariables.hideNotifyButton == true) then
		NotificationsCanAccessExperience = false
	end
	local v1 = 0
	
	local function v121(): number
		-- upvalues: v1 (ref)
		v1 += 1
		
		return v1
	end
	
	local HasRefundPolicy: boolean = p1.props.webViewSupport and (GameDetail ~= nil and GameDetail.refundPolicy ~= nil)
	local IsPlayabilitySettledAndPlayable = if FFlagEnablePlayWithRewardComponent then p1.props.isPlayabilitySettledAndPlayable else nil
	local IsHidePlayWithReward: boolean = FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable and (if FFlagLuaAppEdpBackendV2SduiInterleaveDefault then p1.props.edpPerUniverseVisibilityVariables and p1.props.edpPerUniverseVisibilityVariables.hidePlayWithReward == true else FFlagLuaAppEdpBackendV2SduiInterleaveIxp and (p1.props.shouldInterleaveSduiIxp and (p1.props.edpPerUniverseVisibilityVariables and p1.props.edpPerUniverseVisibilityVariables.hidePlayWithReward == true)))
	local NoIsHidePlayWithReward = if FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable then FFlagEnablePlayWithRewardComponent and (IsPlayabilitySettledAndPlayable and not IsHidePlayWithReward) else nil
	
	return WithStyleFunction(function(p4)
		-- upvalues: RoactModule (upval), Offset (copy), FFlagLuaAppExperienceDetailsLayoutOrderConfig (upval), GameHeaderModule (upval), LandscapeLayoutConfig (upval), UniverseId (copy), NotificationsCanAccessExperience (ref), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p1 (copy), v121 (copy), ExperienceMediaGalleryModule (upval), FFlagLuaAppEdpMediaGalleryHeightJitterFix (upval), Width (copy), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (upval), FFlagLuaAppEdpMediaGalleryRedesignIxp (upval), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (upval), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (upval), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (upval), ExperienceDetailsExperimentationModule (upval), GameStatsCarouselModule (upval), ExperienceTagsContainerModule (upval), EventsListWrapperModule (upval), RootPlaceId (copy), IsNotDescriptionMatch (copy), ExperienceDescriptionModule (upval), RetrievalStatus1 (upval), p2 (copy), GameDetail (copy), FFlagRenameDeprecatedUIBloxTokens (upval), FFlagLuaAppExpandableTextImpressionsEnabled (upval), AppPage (upval), IgrsRating (copy), IgrsRatingLabelModule (upval), IgrsRatingDisplayMessage (copy), ConstantsModule (upval), p3 (copy), EnableGamePlaysAndRatings (ref), GamePlaysAndRatingsModule (upval), ShowGlobalCounters (copy), ShowLikesFavoritesCount (copy), EnableGameInfoList (copy), GameInfoListModule (upval), EnableSocial (copy), AgeRecommendations (copy), EnableGamePassPreview (copy), HasRefundPolicy (copy), FFlagLuaAppEnableConsolidatedGameRefundPolicy (upval), GameRefundPolicyModule (upval), ExperienceDetailsNoticeType (upval), LuaAppFixNoticeLocalization (upval), RetrievalStatus (upval), EnableRecommendedGames (copy), RecommendedExperienceCarouselModule (upval), FFlagSongEdpCarouselIxp (upval), ExperienceSongsCarouselModule (upval), GameInfo (copy), FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable (upval), NoIsHidePlayWithReward (copy), FFlagEnablePlayWithRewardComponent (upval), IsPlayabilitySettledAndPlayable (copy), PlayWithRewardComponent (upval)
		local NoIsHidePlayWithReward1 = if FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable then NoIsHidePlayWithReward else FFlagEnablePlayWithRewardComponent and IsPlayabilitySettledAndPlayable
		local config = {
			ListLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 20)
			}),
			PagePadding = RoactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, Offset),
				PaddingRight = UDim.new(0, Offset),
				PaddingTop = UDim.new(0, 0),
				PaddingBottom = UDim.new(0, 20)
			}),
			Header = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then RoactModule.createElement(GameHeaderModule, {
				LayoutOrder = LandscapeLayoutConfig.Header,
				universeId = UniverseId,
				showNotificationButton = NotificationsCanAccessExperience,
				shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.props.shouldHydrateLegacyIxp else nil
			}) else RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = v121(),
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				ListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 20)
				}),
				MediaGalleryFrame = RoactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Position = UDim2.new(0, 0, 0, 0),
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					MediaGallery = RoactModule.createElement(ExperienceMediaGalleryModule, {
						deviceType = "Phone",
						showYouTubeVideoFirst = false,
						universeId = UniverseId,
						initialWidth = if FFlagLuaAppEdpMediaGalleryHeightJitterFix then Width - Offset * 2 else nil,
						onSwipe = if FFlagLuaAppEdpMediaGalleryRedesignTelemetry then nil else p1.onMediaGallerySwiped,
						onMediaGalleryMediaChanged = if FFlagLuaAppEdpMediaGalleryRedesignTelemetry then p1.onMediaGalleryMediaChanged else nil,
						mediaGalleryRedesignEnabledIxp = if FFlagLuaAppEdpMediaGalleryRedesignIxp then p1.props.mediaGalleryRedesignEnabledIxp else nil,
						mediaGalleryVideoPreviewEnabledIxp = if FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then p1.props.mediaGalleryVideoPreviewEnabledIxp else nil,
						shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.props.shouldHydrateLegacyIxp else nil
					}),
					SizeConstraint = RoactModule.createElement("UISizeConstraint", {
						MinSize = Vector2.new(0, (Width - Offset * 2) / 1.7777777777777777)
					})
				}),
				Header = RoactModule.createElement(GameHeaderModule, {
					LayoutOrder = 1,
					universeId = UniverseId,
					showNotificationButton = NotificationsCanAccessExperience,
					shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.props.shouldHydrateLegacyIxp else nil
				})
			}),
			MediaGalleryFrame = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = LandscapeLayoutConfig.MediaGallery,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				MediaGallery = RoactModule.createElement(ExperienceMediaGalleryModule, {
					deviceType = "Phone",
					showYouTubeVideoFirst = false,
					universeId = UniverseId,
					initialWidth = if FFlagLuaAppEdpMediaGalleryHeightJitterFix then Width - Offset * 2 else nil,
					onSwipe = if FFlagLuaAppEdpMediaGalleryRedesignTelemetry then nil else p1.onMediaGallerySwiped,
					onMediaGalleryMediaChanged = if FFlagLuaAppEdpMediaGalleryRedesignTelemetry then p1.onMediaGalleryMediaChanged else nil,
					mediaGalleryRedesignEnabledIxp = if FFlagLuaAppEdpMediaGalleryRedesignIxp then p1.props.mediaGalleryRedesignEnabledIxp else nil,
					mediaGalleryVideoPreviewEnabledIxp = if FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then p1.props.mediaGalleryVideoPreviewEnabledIxp else nil,
					shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.props.shouldHydrateLegacyIxp else nil
				}),
				SizeConstraint = RoactModule.createElement("UISizeConstraint", {
					MinSize = Vector2.new(0, (Width - Offset * 2) / 1.7777777777777777)
				})
			}) else nil,
			StatsCarousel = if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) and (p1.props.edpServerIxpVariables and p1.props.edpServerIxpVariables.hideStatsCarousel == true) then nil else RoactModule.createElement(GameStatsCarouselModule, {
				LayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.StatsCarousel else v121(),
				universeId = UniverseId,
				shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.props.shouldHydrateLegacyIxp else nil
			}),
			TagSection = RoactModule.createElement(ExperienceTagsContainerModule, {
				LayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.TagSection else v121(),
				universeId = UniverseId,
				shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.props.shouldHydrateLegacyIxp else nil,
				hideContentDescriptors = (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) and (p1.props.edpServerIxpVariables and p1.props.edpServerIxpVariables.showContentDescriptorsInInfoList == true) or nil
			}),
			MovedEventsList = RoactModule.createElement(EventsListWrapperModule, {
				referralSource = "expDetailsPage",
				peekViewFormat = true,
				layoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.MovedEventsList else v121(),
				universeId = UniverseId,
				defaultThumbnail = if RootPlaceId then ("rbxthumb://type=GameThumbnail&id=%d&w=768&h=432"):format(RootPlaceId) else nil
			}),
			Description = if IsNotDescriptionMatch then RoactModule.createElement(ExperienceDescriptionModule, {
				expandable = true,
				dataStatus = RetrievalStatus1.fromRawValue(p2),
				descriptionText = GameDetail and GameDetail.description,
				listPadding = if FFlagRenameDeprecatedUIBloxTokens then p4.Tokens.Size.Size_250 else p4.Tokens.Global.Space_125,
				LayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.Description else v121(),
				universeId = if FFlagLuaAppExpandableTextImpressionsEnabled then UniverseId else nil,
				pageContext = if FFlagLuaAppExpandableTextImpressionsEnabled then AppPage.GameDetail else nil,
				componentType = if FFlagLuaAppExpandableTextImpressionsEnabled then "gameDescription" else nil,
				viewportBoundsOffset = if FFlagLuaAppExpandableTextImpressionsEnabled then p1.props.viewportBoundsOffset else nil
			}) else nil,
			IgrsRatingLabel = if IgrsRating then RoactModule.createElement(IgrsRatingLabelModule, {
				igrsRating = IgrsRating,
				igrsRatingDisplayMessage = IgrsRatingDisplayMessage,
				onActivated = function()
					-- upvalues: p1 (upval), ConstantsModule (upval), p3 (upval)
					p1.props.openWebview(ConstantsModule.INDONESIAN_CONTENT_MATURITY_URL, p3.contentMaturityHeader)
				end,
				LayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.IgrsRatingLabel else v121()
			}) else nil,
			PlaysAndRatings = EnableGamePlaysAndRatings and RoactModule.createElement(GamePlaysAndRatingsModule, {
				rowPadding = 20,
				hideVisits = true,
				LayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.PlaysAndRatings else v121(),
				universeId = UniverseId,
				containerWidth = Width - 2 * Offset,
				showGlobalCounters = ShowGlobalCounters,
				showLikesFavoritesCount = ShowLikesFavoritesCount,
				shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.props.shouldHydrateLegacyIxp else nil
			}),
			InfoList = EnableGameInfoList and RoactModule.createElement(GameInfoListModule, {
				LayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.InfoList else v121(),
				universeId = UniverseId,
				leftPadding = Offset,
				rightPadding = Offset,
				showSocial = EnableSocial,
				ageRecommendations = AgeRecommendations,
				width = Width,
				enableGamePassPreview = EnableGamePassPreview,
				shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.props.shouldHydrateLegacyIxp else nil
			}),
			RefundPolicy = if HasRefundPolicy then if FFlagLuaAppEnableConsolidatedGameRefundPolicy then RoactModule.createElement(GameRefundPolicyModule, {
				refundPolicy = GameDetail.refundPolicy,
				layoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.RefundPolicy else v121()
			}) else p1.renderRefundPolicy(p4, GameDetail.refundPolicy, if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.RefundPolicy else v121()) else nil,
			Notice = if p1.props.experienceDetailsNoticeType == ExperienceDetailsNoticeType.InExperiencePurchase then RoactModule.createElement(ExperienceDescriptionModule, {
				expandable = false,
				dataStatus = if LuaAppFixNoticeLocalization then RetrievalStatus1.fromRawValue(RetrievalStatus.Done) else RetrievalStatus1.fromRawValue(p2),
				headerText = p3.noticeHeader,
				descriptionText = p3.noticeText,
				listPadding = if FFlagRenameDeprecatedUIBloxTokens then p4.Tokens.Size.Size_250 else p4.Tokens.Global.Space_125,
				LayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.Notice else v121(),
				universeId = if FFlagLuaAppExpandableTextImpressionsEnabled then UniverseId else nil,
				pageContext = if FFlagLuaAppExpandableTextImpressionsEnabled then AppPage.GameDetail else nil,
				componentType = if FFlagLuaAppExpandableTextImpressionsEnabled then "gameNotice" else nil,
				viewportBoundsOffset = if FFlagLuaAppExpandableTextImpressionsEnabled then p1.props.viewportBoundsOffset else nil
			}) else nil,
			RecommendedGames = EnableRecommendedGames and RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.RecommendedGames else v121(),
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Carousel = RoactModule.createElement(RecommendedExperienceCarouselModule, {
					scrollingEnabled = true,
					universeId = UniverseId,
					pageContext = AppPage.GameDetail,
					onPeekViewClosed = p1.props.onPeekViewClosed,
					shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.props.shouldHydrateLegacyIxp else nil
				})
			}),
			ExperienceSongsCarousel = if FFlagSongEdpCarouselIxp and p1.props.showSongCarousel then RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = if FFlagLuaAppExperienceDetailsLayoutOrderConfig then LandscapeLayoutConfig.ExperienceSongsCarousel else v121()
			}, {
				RoactModule.createElement(ExperienceSongsCarouselModule, {
					collectionOrder = 2,
					clipsDescendants = false,
					universeId = UniverseId,
					universeTitle = GameDetail and GameDetail.name or (GameInfo and GameInfo.name or "")
				})
			}) else nil,
			PlayWithRewardComponent = if NoIsHidePlayWithReward1 then RoactModule.createElement(PlayWithRewardComponent, {
				universeId = UniverseId,
				placeId = RootPlaceId,
				placeIdOverride = p1.props.placeIdOverride,
				experienceJoinData = p1.props.experienceJoinData,
				flowId = if p1.props.playWithRewardData then p1.props.playWithRewardData.flowId else "",
				fetchedUniverseId = if p1.props.playWithRewardData then p1.props.playWithRewardData.universeId else nil,
				isAdDataExpected = if p1.props.playWithRewardData then p1.props.playWithRewardData.isAdDataExpected else false,
				playWithRewardAdData = if p1.props.playWithRewardData then p1.props.playWithRewardData.adData else nil
			}) else nil
		}
		
		if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and p1.props.shouldInterleaveSduiIxp) and p1.props.sduiFeedItemConfigs then
			for i, sduiFeedItemConfig in p1.props.sduiFeedItemConfigs do
				config[`SduiFeedItem_{i}`] = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					LayoutOrder = sduiFeedItemConfig.portraitLayoutOrder
				}, { SduiComponent = sduiFeedItemConfig.renderComponent() })
			end
		end
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, config)
	end)
end

function GameDetailsCard.renderOnFailed(p4, p5, p6, Offset: number)
	-- upvalues: EnumGameDetailErrorTypes (copy), RoactModule (copy), EmptyState (copy)
	if p4.props.gameInfo then
		return p4:renderOnLoaded(p6, Offset, nil, p5)
	else
		local IsErrorTypeMatch: boolean = p4.props.gameDetailError and p4.props.gameDetailError.errorType == EnumGameDetailErrorTypes.ExperienceUnavailable
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Padding = RoactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 100),
				PaddingLeft = UDim.new(0, Offset),
				PaddingRight = UDim.new(0, Offset),
				PaddingBottom = UDim.new(0, 20)
			}),
			EmptyState = RoactModule.createElement(EmptyState, {
				onActivated = if IsErrorTypeMatch then nil else p4.fetchGameDetailsPageData,
				text = if IsErrorTypeMatch then p5.experienceUnavailableMessage else p5.failedMessage,
				maxSizeTextLabel = Vector2.new(p6 - 2 * Offset, 1e999)
			})
		})
	end
end

function GameDetailsCard:getImageSize(p4, p5: number, p6, p7): Vector2
	local v2 = p7 / p6
	local Largest = math.max(p5 * 1.8, p4 * v2)
	
	return Vector2.new(Largest / v2, Largest)
end

function GameDetailsCard.render(p4)
	-- upvalues: GetSafeAreaSizeFunction (copy), RoactModule (copy), WithLocalizationFunction (copy), LoadingStateContainer (copy), RetrievalStatus1 (copy), FFlagEnablePlayWithRewardComponent (copy), RoactNavigationModule (copy)
	local GameDetailsPageDataStatus = p4.props.gameDetailsPageDataStatus
	local SafeAreaSize = GetSafeAreaSizeFunction(p4.props.screenSize, p4.props.globalGuiInset)
	local Smallest = math.min(SafeAreaSize.X.Offset, 640)
	local v2: number = if Smallest < 600 then 20 else 40
	local Frame = RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = UDim2.new(0, 0, 0, 0)
	}, {
		GameDetails = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			Background = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 1,
				Size = UDim2.new(1, 0, 0, SafeAreaSize.Y.Offset),
				Position = UDim2.new(0, 0, 0, 0)
			}),
			LoadingState = WithLocalizationFunction({
				failedMessage = "Feature.EmptyStatePage.Message.NoInternet",
				experienceUnavailableMessage = "Feature.GamePage.QuickLaunch.LaunchError.TemporarilyUnavailable",
				noticeHeader = "Feature.ExperienceDetails.Body.NotesTitle",
				noticeText = "Feature.ExperienceDetails.Notes.InExperiencePurchase",
				contentMaturityHeader = "Feature.GameDetails.Label.ContentMaturity"
			})(function(p5)
				-- upvalues: RoactModule (upval), LoadingStateContainer (upval), RetrievalStatus1 (upval), GameDetailsPageDataStatus (copy), p4 (copy), Smallest (copy), v2 (copy)
				return RoactModule.createElement("Frame", {
					ZIndex = 2,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					Position = UDim2.new(0, 0, 0, 0)
				}, {
					LoadingStateContainer = RoactModule.createElement(LoadingStateContainer, {
						dataStatus = RetrievalStatus1.fromRawValue(GameDetailsPageDataStatus),
						renderOnFailed = function()
							-- upvalues: p4 (upval), p5 (copy), Smallest (upval), v2 (upval)
							return p4:renderOnFailed(p5, Smallest, v2)
						end,
						renderOnLoading = function()
							-- upvalues: p4 (upval), v2 (upval)
							return p4:renderOnLoading(v2)
						end,
						renderOnLoaded = function()
							-- upvalues: p4 (upval), Smallest (upval), v2 (upval), GameDetailsPageDataStatus (upval), p5 (copy)
							return p4:renderOnLoaded(Smallest, v2, GameDetailsPageDataStatus, p5)
						end
					})
				})
			end)
		})
	})
	
	return if FFlagEnablePlayWithRewardComponent then RoactModule.createFragment({
		Content = Frame,
		NavigationEvents = RoactModule.createElement(RoactNavigationModule.NavigationEvents, { onDidFocus = p4.onDidFocus })
	}) else Frame
end

function GameDetailsCard.didMount(p4)
	-- upvalues: FFlagEnablePlayWithRewardComponent (copy)
	p4.fetchGameDetailsPageData()
	
	if FFlagEnablePlayWithRewardComponent then
		p4.maybeFetchPlayWithReward()
	end
end

function GameDetailsCard.didUpdate(p4)
	-- upvalues: FFlagEnablePlayWithRewardComponent (copy)
	if FFlagEnablePlayWithRewardComponent then
		p4.maybeFetchPlayWithReward()
	end
end

function GameDetailsCard.willUnmount(p4)
	-- upvalues: FFlagEnablePlayWithRewardComponent (copy)
	local EventIngest = p4.props.eventIngest
	local UniverseId = p4.props.universeId
	local RootPlaceId = p4.props.gameDetail and p4.props.gameDetail.rootPlaceId or nil
	local Source = p4.props.source or "None"
	local Index = p4.props.index or -1
	
	if EventIngest ~= nil and UniverseId ~= nil and RootPlaceId ~= nil then
		EventIngest:setRBXEventStream("GameDetailsCard", "viewClose", {
			universeId = UniverseId,
			rootPlaceId = RootPlaceId,
			source = Source,
			index = Index
		})
	end
	if FFlagEnablePlayWithRewardComponent then
		p4.props.clearPlayWithReward()
	end
end

local MemoizeResult = MemoizeFunction(function(Done, p4): boolean
	-- upvalues: RetrievalStatus (copy)
	return Done ~= RetrievalStatus.Done or p4 ~= nil and #p4 ~= 0
end)
local v2: (any) -> any = if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then function(p4)
	-- upvalues: FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), ServerDrivenUiModule (copy), EdpSduiUtilsModule (copy), LandscapeLayoutConfig (copy), ApiFetchExperienceDetailsPageCountersModule (copy), ReactModule (copy), SignalsReactModule (copy), UseEdpServerIxpVariablesModule (copy), FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable (copy), UseEdpPerUniverseVisibilityVariablesForUniverseModule (copy), RoactModule (copy), v2 (copy), CryoModule (copy)
	local UseSduiEdpFeedItemConfigsResult = nil
	local UseSignalStateResult = nil
	local EdpServerIxpVariables = nil
	local EdpPerUniverseVisibilityVariables = nil
	
	if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then
		UseSduiEdpFeedItemConfigsResult = ServerDrivenUiModule.useSduiEdpFeedItemConfigs({
			sduiContext = ServerDrivenUiModule.useSduiContextFromSignalAndProcessConfigs(EdpSduiUtilsModule.getUnprocessedEdpStoreKey((tostring(p4.universeId))), EdpSduiUtilsModule.getEdpStoreKey((tostring(p4.universeId))), FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and p4.shouldInterleaveSduiIxp),
			storeKey = EdpSduiUtilsModule.getEdpStoreKey((tostring(p4.universeId))),
			portraitLayoutConfig = LandscapeLayoutConfig,
			landscapeLayoutConfig = LandscapeLayoutConfig,
			defaultLayoutOrder = LandscapeLayoutConfig.SduiFeedItemsDefault,
			logLayoutConflictFn = ApiFetchExperienceDetailsPageCountersModule.logSduiLayoutOrderConflict,
			shouldInterleaveSdui = FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and p4.shouldInterleaveSduiIxp
		})
		UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: FFlagLuaAppEdpBackendV2SduiInterleaveDefault (upval), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (upval), p4 (copy), ServerDrivenUiModule (upval), EdpSduiUtilsModule (upval)
			return function(p5)
				-- upvalues: FFlagLuaAppEdpBackendV2SduiInterleaveDefault (upval), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (upval), p4 (upval), ServerDrivenUiModule (upval), EdpSduiUtilsModule (upval)
				return if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and p4.shouldInterleaveSduiIxp) and p4.universeId then ServerDrivenUiModule.getSduiFeedStore(EdpSduiUtilsModule.getEdpStoreKey((tostring(p4.universeId)))).getDataUpdatedTimestamp(p5) else nil
			end
		end, { p4.universeId, p4.shouldInterleaveSduiIxp })))
		EdpServerIxpVariables = UseEdpServerIxpVariablesModule()
		EdpPerUniverseVisibilityVariables = if FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable then UseEdpPerUniverseVisibilityVariablesForUniverseModule(p4.universeId) else nil
	end
	return RoactModule.createElement(v2, CryoModule.Dictionary.join(p4, {
		currentSduiDataTimestamp = UseSignalStateResult,
		sduiFeedItemConfigs = UseSduiEdpFeedItemConfigsResult,
		edpServerIxpVariables = EdpServerIxpVariables,
		edpPerUniverseVisibilityVariables = EdpPerUniverseVisibilityVariables
	}))
end else RoactAppPolicy.connect(function(p4, _)
	return {
		enableRecommendedGames = p4.getRecommendedGames(),
		enableSocial = p4.getSocialLinks(),
		enableGameInfoList = p4.getGameInfoList(),
		enableGamePlaysAndRatings = p4.getGamePlaysAndRatings(),
		showGlobalCounters = p4.getShowGlobalCounters(),
		showLikesFavoritesCount = p4.getEnableAggregateLikesFavoritesCount(),
		enableGamePassPreview = p4.getShowPassesOnExperienceDetails(),
		webViewSupport = p4.getWebViewSupport(),
		notificationsCanAccessExperience = p4.getNotificationsCanReceiveExperience(),
		experienceDetailsNoticeType = p4.getExperienceDetailsNoticeType()
	}
end)((RoactServices.connect({
	networking = RoactNetworking,
	eventIngest = AppEventIngestService
})((RoactRoduxModule.connect(function(p4, p5)
	-- upvalues: FFlagEnablePlayWithRewardComponent (copy), FetchGamePlayabilityAndProductInfo (copy), RetrievalStatus (copy), PlayabilityStatusEnum (copy), PlayButtonStates (copy), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), ApiFetchExperienceDetailsPageModule (copy), ApiFetchGameDetails (copy), RecommendedGamesModule (copy), FFlagLuaAppEdpKeepCachedDetailsOnRefetch (copy), Callback (ref), GameInfosReducer (copy), MemoizeResult (copy)
	local FetchingStatus = if FFlagEnablePlayWithRewardComponent then FetchGamePlayabilityAndProductInfo.GetFetchingStatus(p4, p5.universeId) else nil
	local PlayabilityStatusEntry = FFlagEnablePlayWithRewardComponent and (p4.PlayabilityStatus and p4.PlayabilityStatus[p5.universeId]) or nil
	local IsPlayButtonStateMatch = if FFlagEnablePlayWithRewardComponent then FetchingStatus == RetrievalStatus.Done and (PlayabilityStatusEntry ~= nil and (PlayabilityStatusEntry.playabilityStatus == PlayabilityStatusEnum.Playable and p5.playButtonState == PlayButtonStates.Playable)) else nil
	local FetchingStatus1 = nil
	local FetchingStatus11 = nil
	
	if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p5.shouldHydrateLegacyIxp then
		FetchingStatus1 = ApiFetchExperienceDetailsPageModule.GetFetchingStatus(p4, p5.universeId)
		FetchingStatus11 = ApiFetchExperienceDetailsPageModule.GetFetchingStatus(p4, p5.universeId)
	else
		FetchingStatus1 = ApiFetchGameDetails.GetFetchingStatus(p4, p5.universeId)
		FetchingStatus11 = RecommendedGamesModule.GetFetchingStatus(p4, p5.universeId)
	end
	local GameDetailsVEntry = nil
	local v3 = nil
	
	if FFlagLuaAppEdpKeepCachedDetailsOnRefetch then
		GameDetailsVEntry = if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p5.shouldHydrateLegacyIxp then p4.GameDetailsV2[p5.universeId] else p4.GameDetails[p5.universeId]
		v3 = Callback(p4, p5.universeId, FetchingStatus1, GameDetailsVEntry)
	end
	local PlayWithRewardState = if FFlagEnablePlayWithRewardComponent and p4.PlayWithRewardState.universeId == p5.universeId then p4.PlayWithRewardState else nil
	
	return {
		topBarHeight = 0,
		gameDetail = if FFlagLuaAppEdpKeepCachedDetailsOnRefetch then GameDetailsVEntry elseif FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p5.shouldHydrateLegacyIxp then p4.GameDetailsV2[p5.universeId] else p4.GameDetails[p5.universeId],
		gameDetailError = p4.GameDetailErrors[p5.universeId],
		gameDetailsPageDataStatus = if FFlagLuaAppEdpKeepCachedDetailsOnRefetch then v3 else FetchingStatus1,
		gameInfo = p4.Personalization[GameInfosReducer.key][p5.universeId],
		screenSize = p4.ScreenSize,
		globalGuiInset = p4.GlobalGuiInset,
		showLoadingBackground = (if FFlagLuaAppEdpKeepCachedDetailsOnRefetch then v3 else FetchingStatus1) ~= RetrievalStatus.Done,
		showRecommendedGames = MemoizeResult(FetchingStatus11, p4.RecommendedGameEntries[p5.universeId]),
		ageRecommendations = p4.AgeRecommendations[p5.universeId],
		playWithRewardData = if FFlagEnablePlayWithRewardComponent then PlayWithRewardState else nil,
		isPlayabilitySettledAndPlayable = if FFlagEnablePlayWithRewardComponent then IsPlayButtonStateMatch else nil,
		localUserId = if FFlagEnablePlayWithRewardComponent then p4.LocalUserId else nil
	}
end, function(Callback)
	-- upvalues: FetchGameDetailsPageDataModule (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagEnablePlayWithRewardComponent (copy), SetPlayWithRewardStateFunction (copy), FetchPlayWithRewardStateFunction (copy), AdService (copy), OpenRefundPolicyLearnMorePageModule (copy), OpenWebviewModule (copy)
	return {
		fetchGameDetailsPageData = function(p4, p5, p6, p7, p8)
			-- upvalues: Callback (copy), FetchGameDetailsPageDataModule (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (upval), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (upval)
			return Callback(FetchGameDetailsPageDataModule(p4, p5, nil, if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p6 else nil, if FFlagLuaAppEdpBackendV2SduiInterleaveIxp then p7 else nil, if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and p7 then p8 else nil))
		end,
		clearPlayWithReward = if FFlagEnablePlayWithRewardComponent then function()
			-- upvalues: Callback (copy), SetPlayWithRewardStateFunction (upval)
			return Callback(SetPlayWithRewardStateFunction("", "", false, nil))
		end else nil,
		fetchPlayWithReward = if FFlagEnablePlayWithRewardComponent then function(p4, p5)
			-- upvalues: Callback (copy), FetchPlayWithRewardStateFunction (upval), AdService (upval)
			return Callback(FetchPlayWithRewardStateFunction(AdService, p4, p5))
		end else nil,
		openRefundPolicyLearnMorePage = function(p4)
			-- upvalues: Callback (copy), OpenRefundPolicyLearnMorePageModule (upval)
			return Callback(OpenRefundPolicyLearnMorePageModule(p4))
		end,
		openWebview = function(p4, p5)
			-- upvalues: Callback (copy), OpenWebviewModule (upval)
			return Callback(OpenWebviewModule(p4, p5))
		end
	}
end)(GameDetailsCard)))))

if FFlagSongEdpCarouselIxp or (FFlagLuaAppEdpMediaGalleryRedesignIxp or FFlagLuaAppEdpMediaGalleryVideoPreviewIxp) then
	v2 = RoactAppExperimentModule.connectUserLayer({ AppUserLayers.ExperienceDetailsPageExposureLayer }, function(p4, _)
		-- upvalues: AppUserLayers (copy), FFlagSongEdpCarouselIxp (copy), FFlagLuaAppEdpMediaGalleryRedesignIxp (copy), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy)
		local v3 = p4[AppUserLayers.ExperienceDetailsPageExposureLayer] or {}
		
		return {
			showSongCarousel = if FFlagSongEdpCarouselIxp then v3.showSongCarousel else nil,
			mediaGalleryRedesignEnabledIxp = if FFlagLuaAppEdpMediaGalleryRedesignIxp then v3.MediaGalleryRedesignEnabled else nil,
			mediaGalleryVideoPreviewEnabledIxp = if FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then v3.MediaGalleryVideoPreviewEnabled else nil
		}
	end, true)(v2)
end
if FFlagLuaAppEdpBackendV2HydrateLegacyIxp or (FFlagLuaAppEdpBackendV2SduiInterleaveIxp or FFlagEDPTTITrackingEnabled or FFlagEnablePlayWithRewardComponent) then
	v2 = function(p4)
		-- upvalues: FFlagEDPTTITrackingEnabled (copy), UseFirstMediaCarouselImageUriFunction (copy), UseEDPTTITrackingModule (copy), EDPTTIConstants (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), ExperienceDetailsExperimentationModule (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), FFlagEnablePlayWithRewardComponent (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UsePlayButtonStateFunction (copy), ReactModule (copy), IXPService (copy), AppUserLayers (copy), RoactModule (copy), v2 (copy), CryoModule (copy)
		if FFlagEDPTTITrackingEnabled then
			UseEDPTTITrackingModule(EDPTTIConstants.EDP_IMPLEMENTATION.LEGACY_PEEK_VIEW, p4.universeId, (UseFirstMediaCarouselImageUriFunction(p4.universeId)))
		end
		local ShouldHydrateLegacy = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then ExperienceDetailsExperimentationModule.getShouldHydrateLegacy() else nil
		local ShouldInterleaveSdui = if FFlagLuaAppEdpBackendV2SduiInterleaveIxp then ExperienceDetailsExperimentationModule.getShouldInterleaveSdui() else nil
		local PlayButtonState = if FFlagEnablePlayWithRewardComponent then UsePlayButtonStateFunction(UseRoactServiceFunction(RoactNetworking), p4.universeId, nil).playButtonState else nil
		
		if FFlagLuaAppEdpBackendV2HydrateLegacyIxp or FFlagLuaAppEdpBackendV2SduiInterleaveIxp or FFlagEDPTTITrackingEnabled then
			ReactModule.useEffect(function()
				-- upvalues: IXPService (upval), AppUserLayers (upval)
				IXPService:LogUserLayerExposure(AppUserLayers.ExperienceDetailsPageExposureLayer)
			end, {})
		end
		return RoactModule.createElement(v2, CryoModule.Dictionary.join(p4, {
			shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then ShouldHydrateLegacy else nil,
			shouldInterleaveSduiIxp = if FFlagLuaAppEdpBackendV2SduiInterleaveIxp then ShouldInterleaveSdui else nil,
			playButtonState = if FFlagEnablePlayWithRewardComponent then PlayButtonState else nil
		}))
	end
end
return v2