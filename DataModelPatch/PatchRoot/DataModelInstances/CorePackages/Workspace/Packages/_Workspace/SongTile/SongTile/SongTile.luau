local Parent = script:FindFirstAncestor("SongTile").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local MediaPlaybackModule = require(Parent.MediaPlayback)
local TModule = require(Parent.t)
local ValidatePropsFunction = require(Parent.DiscoveryUtils).validateProps
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableTopSongsSort = SharedFlagsModule.FFlagEnableTopSongsSort
local GetFFlagLuaAppPersistentMusicPlayerFunction = SharedFlagsModule.GetFFlagLuaAppPersistentMusicPlayer
local UseSongTileDataFunction = require(Parent.SongInfosRodux).useSongTileData
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local GameTileView = require(Parent.GameTile).GameTileView
local GameTileViewConfig = require(Parent.GameTile).GameTileViewConfig
local GameTileConstants = require(Parent.GameTile).GameTileConstants
local UseImpressionsTaggerFunction = require(Parent.Impressions).useImpressionsTagger
local OpenSongDetailFunction = require(Parent.DiscoveryRouting).OpenSongDetail
local GetAudioPlaybackStoreFunction = MediaPlaybackModule.getAudioPlaybackStore
local UseAudioStoreFunction = MediaPlaybackModule.useAudioStore
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local StrictInterfaceResult = TModule.strictInterface({
	contentId = TModule.string,
	contentTextLineCount = TModule.optional(TModule.number),
	hasBackground = TModule.optional(TModule.boolean),
	hasOutline = TModule.optional(TModule.boolean),
	layoutOrder = TModule.optional(TModule.number),
	size = TModule.optional(TModule.UDim2),
	zIndex = TModule.optional(TModule.number),
	useLargerFooterFont = TModule.optional(TModule.boolean),
	impressionsTag = TModule.optional(TModule.string),
	reportTileOpened = TModule.optional(TModule.callback),
	isContained = TModule.optional(TModule.boolean)
})

return function(p1)
	-- upvalues: FFlagEnableTopSongsSort (copy), ValidatePropsFunction (copy), StrictInterfaceResult (copy), UseDispatchFunction (copy), UseStyleFunction (copy), UseSongTileDataFunction (copy), GetFFlagLuaAppPersistentMusicPlayerFunction (copy), UseAudioStoreFunction (copy), UseSignalStateFunction (copy), ReactModule (copy), GetAudioPlaybackStoreFunction (copy), UseTokensFunction (copy), OpenSongDetailFunction (copy), UseImpressionsTaggerFunction (copy), FoundationModule (copy), GameTileView (copy), GameTileConstants (copy), GameTileViewConfig (copy)
	assert(FFlagEnableTopSongsSort, "Song Sort is not enabled")
	ValidatePropsFunction(StrictInterfaceResult, p1)
	local UseDispatchResult = UseDispatchFunction()
	local UseStyleResult = UseStyleFunction()
	local UseSongTileDataResult = UseSongTileDataFunction(p1.contentId)
	local Song = UseSongTileDataResult.song
	local Thumbnail = UseSongTileDataResult.thumbnail
	local Size = p1.size or UDim2.fromScale(1, 1)
	local UseAudioStoreResult = if GetFFlagLuaAppPersistentMusicPlayerFunction() then UseAudioStoreFunction(p1.contentId) else nil
	local UseSignalStateResult = if GetFFlagLuaAppPersistentMusicPlayerFunction() then UseSignalStateFunction(UseAudioStoreResult.getIsPlaying) else nil
	local UseResult = if GetFFlagLuaAppPersistentMusicPlayerFunction() then ReactModule.useCallback(function()
		-- upvalues: GetAudioPlaybackStoreFunction (upval), UseSignalStateResult (copy), UseAudioStoreResult (copy)
		GetAudioPlaybackStoreFunction(false).stopAll()
		
		if not UseSignalStateResult then
			UseAudioStoreResult.play()
		end
	end, { UseSignalStateResult, UseAudioStoreResult.play }) else nil
	local UseTokensResult = UseTokensFunction()
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: Song (copy), UseTokensResult (copy), ReactModule (upval), UseStyleResult (copy)
		local TitleMedium = UseTokensResult.Typography.TitleMedium
		
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, TitleMedium.FontSize)
		}, {
			ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = false,
				Text = Song and Song.artist or "",
				Size = UDim2.new(1, 0, 0, TitleMedium.FontSize),
				Font = UseTokensResult.Typography.TitleMedium.Font,
				TextSize = TitleMedium.FontSize,
				TextColor3 = UseStyleResult.Theme.TextMuted.Color,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center
			})
		})
	end, { UseStyleResult, Song, UseTokensResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseDispatchResult (copy), OpenSongDetailFunction (upval)
		if p1.reportTileOpened then
			p1.reportTileOpened(p1.contentId)
		end
		UseDispatchResult(OpenSongDetailFunction(p1.contentId))
	end, { UseDispatchResult, p1.contentId, p1.reportTileOpened })
	local UseRefResult = ReactModule.useRef(nil)
	UseImpressionsTaggerFunction(UseRefResult, p1.impressionsTag or "", p1.layoutOrder)
	
	if Song and Thumbnail then
		local Element = if GetFFlagLuaAppPersistentMusicPlayerFunction() then ReactModule.createElement(FoundationModule.View, {
			tag = "size-full col align-x-right align-y-bottom padding-small",
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			},
			onActivated = UseResult
		}, {
			TogglePlaybackButton = ReactModule.createElement(FoundationModule.View, { tag = "auto-xy bg-over-media-100 radius-circle" }, {
				IconButton = ReactModule.createElement(FoundationModule.IconButton, {
					isCircular = true,
					icon = if UseSignalStateResult then FoundationModule.Enums.IconName.PauseLarge else FoundationModule.Enums.IconName.PlayLarge,
					size = FoundationModule.Enums.InputSize.Medium,
					variant = FoundationModule.Enums.ButtonVariant.Utility,
					onActivated = UseResult
				})
			})
		}) else nil
		
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = Size,
			LayoutOrder = p1.layoutOrder,
			ZIndex = p1.zIndex,
			ref = UseRefResult
		}, {
			Tile = ReactModule.createElement(GameTileView, {
				isUnifiedGameTile = true,
				hidePlayButton = true,
				isHovered = false,
				numLinesForTitle = GameTileConstants.TileTextLines.Narrow.titleTextLines,
				Size = UDim2.fromScale(1, 1),
				image = Thumbnail,
				title = Song.title,
				onActivated = UseResult2,
				footerMetadata = UseResult1(),
				containmentSidePadding = GameTileViewConfig.getContainmentSidePadding(UseStyleResult.Tokens, "Narrow"),
				isContained = if p1.isContained then true else false,
				imageAspectRatio = GameTileViewConfig.getImageAspectRatio("Narrow"),
				thumbnailOverlay = if GetFFlagLuaAppPersistentMusicPlayerFunction() then Element else nil
			})
		})
	else
		return nil
	end
end