local HttpService = game:GetService("HttpService")
local SongDetails = script:FindFirstAncestor("SongDetails")
local Parent = SongDetails.Parent
local ReactModule = require(Parent.React)
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local CryoModule = require(Parent.Cryo)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local CreateNextOrderFunction = require(Parent.ReactUtils).createNextOrder
local DetailsPageComponentsModule = require(Parent.DetailsPageComponents)
local DetailsDescription = DetailsPageComponentsModule.DetailsDescription
local DetailsInfoTable = DetailsPageComponentsModule.DetailsInfoTable
local SongDetailRoduxModule = require(Parent.SongDetailRodux)
local UseFetchSongDetailFunction = SongDetailRoduxModule.useFetchSongDetail
local UseFetchArtistSongsFunction = SongDetailRoduxModule.useFetchArtistSongs
local UseFetchSongExperiencesFunction = SongDetailRoduxModule.useFetchSongExperiences
local UIBloxModule = require(Parent.UIBlox)
local LoadingStateContainer = UIBloxModule.App.Container.LoadingStateContainer
local RetrievalStatus1 = UIBloxModule.App.Loading.Enum.RetrievalStatus
local NavigateBackFunction = require(Parent.NavigationRodux).Thunks.NavigateBack
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local UsePageSideMarginFunction = require(Parent.CollectionViews).usePageSideMargin
local FFlagEnableTopSongsSort = require(Parent.SharedFlags).FFlagEnableTopSongsSort
local AppBloxModule = require(Parent.AppBlox)
local ContentPosition = AppBloxModule.ContentPosition
local DetailsPageTemplate = AppBloxModule.DetailsPageTemplate
local FullscreenPageWithSafeArea = AppBloxModule.FullscreenPageWithSafeArea
local UseDeviceTypeFunction = require(Parent.RobloxAppHooks).useDeviceType
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseSongInfoTableDataModule = require(SongDetails.Hooks.useSongInfoTableData)
local SongCollectionCarouselModule = require(SongDetails.SongCollectionCarousel)
local SongExperiencesCollectionCarouselModule = require(SongDetails.SongExperiencesCollectionCarousel)
local UseSongTileDataFunction = require(Parent.SongInfosRodux).useSongTileData
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseAssetFavoritingFunction = require(Parent.AssetFavorites).useAssetFavoriting
local SongbirdModule = require(Parent.Songbird)
local AudioPlayer = SongbirdModule.AudioPlayer
local AudioPlayerActions = SongbirdModule.AudioPlayerActions
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local FFlagSongCarouselPropUpdate = require(Parent.SharedFlags).FFlagSongCarouselPropUpdate
local FFlagSongEdpCarouselIxp = require(Parent.SharedFlags).FFlagSongEdpCarouselIxp
local FFlagUpdateSongCarouselClipDefault = require(Parent.SharedFlags).FFlagUpdateSongCarouselClipDefault
local FFlagLuaAppFixSDPLayout = require(Parent.SharedFlags).FFlagLuaAppFixSDPLayout
local SongDetailFallbackAudio = game:DefineFastFlag("SongDetailFallbackAudio", false)

local function getCombinedLoadingStatus(List, FetchStatus)
	-- upvalues: RetrievalStatus (copy)
	for _, value in List do
		if value == RetrievalStatus.NotStarted then
			return RetrievalStatus.NotStarted
		end
	end
	for _, value1 in List do
		if value1 == RetrievalStatus.Fetching then
			return RetrievalStatus.Fetching
		end
	end
	return FetchStatus or RetrievalStatus.NotStarted
end

return function(p1)
	-- upvalues: FFlagEnableTopSongsSort (copy), UseDispatchFunction (copy), CreateNextOrderFunction (copy), FFlagLuaAppFixSDPLayout (copy), UseTokensFunction (copy), ReactModule (copy), UsePageSideMarginFunction (copy), UseNavigationFocusFunction (copy), UseSongTileDataFunction (copy), UseFetchSongDetailFunction (copy), UseFetchSongExperiencesFunction (copy), UseSongInfoTableDataModule (copy), UseFetchArtistSongsFunction (copy), CryoModule (copy), UseAssetFavoritingFunction (copy), UseLocalizationFunction (copy), UseSelectorFunction (copy), UseDeviceTypeFunction (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), SongDetailFallbackAudio (copy), FoundationModule (copy), AudioPlayer (copy), HttpService (copy), ContentPosition (copy), AudioPlayerActions (copy), DetailsDescription (copy), RetrievalStatus1 (copy), SongExperiencesCollectionCarouselModule (copy), AppPage (copy), SongCollectionCarouselModule (copy), FFlagSongCarouselPropUpdate (copy), FFlagSongEdpCarouselIxp (copy), FFlagUpdateSongCarouselClipDefault (copy), DetailsInfoTable (copy), FullscreenPageWithSafeArea (copy), DetailsPageTemplate (copy), RetrievalStatus (copy), LoadingStateContainer (copy), getCombinedLoadingStatus (copy)
	assert(FFlagEnableTopSongsSort, "Song Sort is not enabled")
	local UseDispatchResult = UseDispatchFunction()
	local NextOrder = CreateNextOrderFunction()
	local UseTokensResult = if FFlagLuaAppFixSDPLayout then UseTokensFunction() else nil
	local UseRefResult = ReactModule.useRef(nil)
	local UsePageSideMarginResult = UsePageSideMarginFunction(UseRefResult.current)
	local UseNavigationFocusResult = UseNavigationFocusFunction()
	local SongId = (p1.navigation and p1.navigation.state and p1.navigation.state.params or {}).songId or nil
	local Number: number? = tonumber(SongId)
	local UseSongTileDataResult = UseSongTileDataFunction(SongId)
	local UseFetchSongDetailResult = UseFetchSongDetailFunction(SongId)
	local SongDetail = UseFetchSongDetailResult.songDetail
	local UseFetchSongExperiencesResult = UseFetchSongExperiencesFunction(SongId)
	local UseSongInfoTableDataModuleResult = UseSongInfoTableDataModule(SongDetail)
	local Rows = UseSongInfoTableDataModuleResult and UseSongInfoTableDataModuleResult.rows or nil
	local UseFetchArtistSongsResult = UseFetchArtistSongsFunction(SongId)
	local FilterResult = CryoModule.List.filter(UseFetchArtistSongsResult.artistSongIds, function(SongId1): boolean
		-- upvalues: SongId (copy)
		return SongId1 ~= SongId
	end)
	local UseAssetFavoritingResult = UseAssetFavoritingFunction(if Number then { Number } else {})
	local ByAssetId = if Number then UseAssetFavoritingResult.getByAssetId(Number) else false
	local UseLocalizationResult = UseLocalizationFunction({
		descriptionTitle = "Feature.SongDetails.Body.DescriptionTitle",
		reportAudio = "Feature.SongDetails.Action.ReportAudio",
		songsByArtistTitle = {
			"Feature.SongDetails.Label.SongsBy",
			artistName = SongDetail and SongDetail.artistName or ""
		},
		experiencesFeaturingTrackTitle = {
			"Feature.SongDetails.Label.ExperiencesFeaturingTrack",
			trackName = SongDetail and SongDetail.name or ""
		}
	})
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end)
	local IsXAbove: boolean = if UseSelectorResult then UseSelectorResult.X >= 850 else false
	local UseDeviceTypeResult = UseDeviceTypeFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval)
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.back()
			
			return
		else
			UseDispatchResult(NavigateBackFunction())
		end
	end, { UseDispatchResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: Number (copy), UseAssetFavoritingResult (copy)
		if Number then
			UseAssetFavoritingResult.toggleFavorite(Number)
		end
	end, { UseAssetFavoritingResult.toggleFavorite, Number })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseSongTileDataResult (copy), ByAssetId (copy), SongDetailFallbackAudio (upval), SongDetail (copy)
		return if UseSongTileDataResult.song then {
			assetId = UseSongTileDataResult.song.assetId,
			isLiked = ByAssetId,
			title = UseSongTileDataResult.song.title,
			artist = UseSongTileDataResult.song.artist,
			thumbnailAssetId = UseSongTileDataResult.song.albumArtAssetId,
			thumbnail = UseSongTileDataResult.thumbnail,
			isPrivate = UseSongTileDataResult.song.isPrivate or false
		} elseif SongDetailFallbackAudio and SongDetail then {
			isPrivate = false,
			assetId = SongDetail.assetId,
			isLiked = ByAssetId,
			title = SongDetail.name,
			artist = SongDetail.artistName,
			thumbnail = UseSongTileDataResult.thumbnail
		} else nil
	end, {
		UseSongTileDataResult.song,
		UseSongTileDataResult.thumbnail,
		ByAssetId,
		if SongDetailFallbackAudio then SongDetail else nil
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy), ReactModule (upval), FoundationModule (upval), AudioPlayer (upval), UseNavigationFocusResult (copy)
		return if UseMemoResult then ReactModule.createElement(FoundationModule.View, {
			tag = "row align-x-center",
			Size = UDim2.new(1, 0, 0, 500)
		}, {
			MusicPlayer = ReactModule.createElement(AudioPlayer, {
				analyticsSource = "song-details",
				audio = UseMemoResult,
				isNavigationFocus = UseNavigationFocusResult
			})
		}) else nil
	end, { UseMemoResult, UseNavigationFocusResult })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: SongId (copy), SongDetail (copy), HttpService (upval), UseSongTileDataResult (copy), UseSelectorResult (copy), UseMemoResult (copy), NextOrder (copy), ContentPosition (upval), ReactModule (upval), AudioPlayerActions (upval), UseResult1 (copy), DetailsDescription (upval), RetrievalStatus1 (upval), UseFetchSongDetailResult (copy), UseLocalizationResult (copy), UseFetchSongExperiencesResult (copy), SongExperiencesCollectionCarouselModule (upval), AppPage (upval), FilterResult (copy), SongCollectionCarouselModule (upval), FFlagSongCarouselPropUpdate (upval), FFlagSongEdpCarouselIxp (upval), FFlagUpdateSongCarouselClipDefault (upval), Rows (copy), DetailsInfoTable (upval), FullscreenPageWithSafeArea (upval), DetailsPageTemplate (upval), IsXAbove (copy), UseResult2 (copy), UseRefResult (copy), UseDeviceTypeResult (copy), UseResult (copy), UsePageSideMarginResult (copy), FFlagLuaAppFixSDPLayout (upval), UseTokensResult (copy)
		if SongId and SongDetail then
			local Text = tostring(SongId) .. tostring(HttpService:GenerateGUID())
			local HorizontalPadding: number = if UseSelectorResult and UseSelectorResult.X > 850 then 12 else 0
			local NumColumns = if UseSelectorResult and UseSelectorResult.X > 850 then 4 else nil
			local NumColumns1 = if UseSelectorResult and UseSelectorResult.X > 850 then 4 else nil
			
			return ReactModule.createElement(FullscreenPageWithSafeArea, { includeStatusBar = true, BackgroundTransparency = 1 }, {
				DetailsPageTemplate = ReactModule.createElement(DetailsPageTemplate, {
					gradientHeight = 320,
					dualPanelBreakpoint = 1e999,
					headerBarBackgroundHeight = 80,
					maxContentWidth = 850,
					startingOffsetPosition = 500,
					backgroundImageTransparency = 1,
					disableBackgroundAspectRatio = true,
					bannerImageUrl = if IsXAbove then `rbxthumb://type=Asset&id={SongId}&w=1440&h=456` else nil,
					renderCustomHeader = UseResult2,
					componentList = {
						Actions = if UseMemoResult then {
							portraitLayoutOrder = NextOrder(),
							landscapeLayoutOrder = NextOrder(),
							landscapePosition = ContentPosition.Left,
							renderComponent = function()
								-- upvalues: ReactModule (upval), AudioPlayerActions (upval), UseMemoResult (upval), UseResult1 (upval)
								return ReactModule.createElement(AudioPlayerActions, {
									analyticsSource = "song-details",
									audio = UseMemoResult,
									onLike = UseResult1,
									onUnlike = UseResult1
								})
							end
						} else nil,
						DetailsDescription = if SongDetail.description and #SongDetail.description > 0 then {
							portraitLayoutOrder = NextOrder(),
							landscapeLayoutOrder = NextOrder(),
							landscapePosition = ContentPosition.Left,
							renderComponent = function()
								-- upvalues: ReactModule (upval), DetailsDescription (upval), RetrievalStatus1 (upval), UseFetchSongDetailResult (upval), SongDetail (upval), UseLocalizationResult (upval)
								return ReactModule.createElement(DetailsDescription, {
									LayoutOrder = 1,
									dataStatus = RetrievalStatus1.fromRawValue(UseFetchSongDetailResult.fetchStatus),
									descriptionText = SongDetail.description,
									titleText = UseLocalizationResult.descriptionTitle
								})
							end
						} else nil,
						SongExperiencesCarousel = if UseFetchSongExperiencesResult.songExperiences and #UseFetchSongExperiencesResult.songExperiences > 0 then {
							portraitLayoutOrder = NextOrder(),
							landscapeLayoutOrder = NextOrder(),
							landscapePosition = ContentPosition.Left,
							renderComponent = function()
								-- upvalues: ReactModule (upval), SongExperiencesCollectionCarouselModule (upval), UseFetchSongExperiencesResult (upval), NumColumns1 (copy), UseLocalizationResult (upval), Text (copy), SongId (upval), AppPage (upval)
								return ReactModule.createElement(SongExperiencesCollectionCarouselModule, {
									fractionalItemAmount = 0,
									sideMargin = 0,
									layoutOrder = 2,
									items = UseFetchSongExperiencesResult.songExperiences,
									numColumns = NumColumns1,
									title = UseLocalizationResult.experiencesFeaturingTrackTitle,
									impressionsTag = "SongDetails_" .. "SongExperience" .. Text,
									songId = SongId,
									pageContext = AppPage.SongDetail
								})
							end
						} else nil,
						ArtistSongsCarousel = if #FilterResult > 0 then {
							portraitLayoutOrder = NextOrder(),
							landscapeLayoutOrder = NextOrder(),
							landscapePosition = ContentPosition.Left,
							renderComponent = function()
								-- upvalues: ReactModule (upval), SongCollectionCarouselModule (upval), FilterResult (upval), UseLocalizationResult (upval), Text (copy), NumColumns (copy), FFlagSongCarouselPropUpdate (upval), AppPage (upval), SongId (upval), FFlagSongEdpCarouselIxp (upval), FFlagUpdateSongCarouselClipDefault (upval)
								return ReactModule.createElement(SongCollectionCarouselModule, {
									fractionalItemAmount = 0,
									songIds = FilterResult,
									title = UseLocalizationResult.songsByArtistTitle,
									impressionsTag = "SongDetails_" .. "ArtistSong" .. Text,
									numColumns = NumColumns,
									collectionOrder = if FFlagSongCarouselPropUpdate then 3 else nil,
									layoutOrder = if FFlagSongCarouselPropUpdate then nil else 3,
									pageContext = AppPage.SongDetail,
									referralId = SongId,
									clipsDescendants = if FFlagSongEdpCarouselIxp or FFlagUpdateSongCarouselClipDefault then true else nil
								})
							end
						} else nil,
						DetailsInfoTable = if Rows and #Rows > 0 then {
							portraitLayoutOrder = NextOrder(),
							landscapeLayoutOrder = NextOrder(),
							landscapePosition = ContentPosition.Left,
							renderComponent = function()
								-- upvalues: ReactModule (upval), DetailsInfoTable (upval), HorizontalPadding (copy), Rows (upval)
								return ReactModule.createElement(DetailsInfoTable, {
									dividerStartOffset = 0,
									horizontalPadding = HorizontalPadding,
									rows = Rows
								})
							end
						} else nil
					},
					containerRef = UseRefResult,
					deviceType = UseDeviceTypeResult,
					onClose = UseResult,
					sideMargin = UsePageSideMarginResult,
					subTitleText = SongDetail.artistName,
					thumbnailImageUrl = UseSongTileDataResult.thumbnail,
					titleText = SongDetail.name,
					backgroundFrameSize = UDim2.new(1, 0, 0, 580),
					bodyContainerSafeAreaSize = if FFlagLuaAppFixSDPLayout then UDim2.fromScale(1, 1) else nil,
					backgroundImageSize = if FFlagLuaAppFixSDPLayout then UDim2.fromScale(1, 1) else nil,
					headerPadding = if FFlagLuaAppFixSDPLayout and UseTokensResult then 500 * UseTokensResult.Stroke.Standard else nil
				})
			})
		else
			return nil
		end
	end, {
		FilterResult, UseDeviceTypeResult, UseDispatchResult,
		UseLocalizationResult.descriptionTitle,
		UseLocalizationResult.experiencesFeaturingTrackTitle,
		UseLocalizationResult.songsByArtistTitle, UseResult, UseSelectorResult,
		UsePageSideMarginResult, SongDetail, UseFetchSongDetailResult.fetchStatus,
		UseFetchSongExperiencesResult.songExperiences, UseSongTileDataResult.thumbnail,
		SongId, Rows, UseResult2
	})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseFetchSongDetailResult (copy), RetrievalStatus (upval), UseFetchArtistSongsResult (copy), UseFetchSongExperiencesResult (copy)
		if UseFetchSongDetailResult.fetchStatus == RetrievalStatus.Failed then
			UseFetchSongDetailResult.refetchSongDetail()
		end
		if UseFetchArtistSongsResult.fetchStatus == RetrievalStatus.Failed then
			UseFetchArtistSongsResult.refetchArtistSongs()
		end
		if UseFetchSongExperiencesResult.fetchStatus == RetrievalStatus.Failed then
			UseFetchSongExperiencesResult.refetchSongExperiences()
		end
	end, {
		UseFetchSongDetailResult.refetchSongDetail,
		UseFetchArtistSongsResult.refetchArtistSongs,
		UseFetchSongExperiencesResult.refetchSongExperiences
	})
	
	return if SongId then ReactModule.createElement(LoadingStateContainer, {
		dataStatus = RetrievalStatus1.fromRawValue((getCombinedLoadingStatus({
			UseFetchSongDetailResult.fetchStatus,
			UseFetchArtistSongsResult.fetchStatus,
			UseFetchSongExperiencesResult.fetchStatus
		}, UseFetchSongDetailResult.fetchStatus))),
		onRetry = UseResult4,
		renderOnLoaded = UseResult3
	}) else nil
end