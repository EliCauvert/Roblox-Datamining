local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local UIBloxModule = require(Parent.UIBlox)
local GridMetrics = UIBloxModule.App.Grid.GridMetrics
local UseStyle = UIBloxModule.Core.Style.useStyle
local UseTextSizeOffset = UIBloxModule.Core.Style.useTextSizeOffset
local GetExperienceTileRelativeHeightFunction = UIBloxModule.App.Tile.getExperienceTileRelativeHeight
local RoactModule = require(Parent.Roact)
local CryoModule = require(Parent.Cryo)
local GameTileModule = require(Parent.GameTile)
local GameTileTypes = GameTileModule.GameTileTypes
local AppGameTile = GameTileModule.AppGameTile
local GetTileBadgeByPositionConfigFromEntryFunction = GameTileModule.getTileBadgeByPositionConfigFromEntry
local GameTileViewConfig = GameTileModule.GameTileViewConfig
local RoactRoduxModule = require(Parent.RoactRodux)
local FormFactor = require(Parent.FormFactor).Enums.FormFactor
local OpenGameDetailsFunction = require(Parent.GameDetail).OpenGameDetails
local WithNavigationFunction = require(Parent.RoactNavigation).withNavigation
local UseDesignTokens = require(Parent.Style).useDesignTokens
local UseTokens = require(Parent.Foundation).Hooks.useTokens
local UseUiModeInfo = require(Parent.RobloxAppHooks).useUiModeInfo
local UseRoactService = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UiMode = require(Parent.RobloxAppEnums).UiMode
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local GameTileConstants = GameTileModule.GameTileConstants
local ResponsiveModule = require(Parent.Responsive)
local UseBreakpointXOrSmaller = ResponsiveModule.useBreakpointXOrSmaller
local UseCollectionLayout = require(Parent.CollectionViews).useCollectionLayout
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagRenameDeprecatedUIBloxTokens = SharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local FFlagLuaAppCompositionAlways = SharedFlagsModule.FFlagLuaAppCompositionAlways
local FFlagSduiEdpPrefetchPlayability = SharedFlagsModule.FFlagSduiEdpPrefetchPlayability
local FFlagLuaAppSduiEdpEnabled = SharedFlagsModule.FFlagLuaAppSduiEdpEnabled
local Modules = DiscoveryMonolith.Modules
local AppFeaturedGameTileTwoByTwoModule = require(Modules.LuaApp.Components.Games.AppFeaturedGameTileTwoByTwo)
local GridViewModule = require(Modules.LuaApp.Components.Generic.GridView)
local GetFFlagLuaAppUpdateGameSortGridRowHeight10ftModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppUpdateGameSortGridRowHeight10ft)
local LuaAppFixConsoleSeeAllGridContainment = game:DefineFastFlag("LuaAppFixConsoleSeeAllGridContainment", false)
local GameGrid = RoactModule.PureComponent:extend("GameGrid")
local GAMEGRIDCHILDPADDING = DiscoveryTypesModule.Constants.GAME_GRID_CHILD_PADDING
local GAMEGRIDTILEFOOTERHEIGHT = DiscoveryTypesModule.Constants.GAME_GRID_TILE_FOOTER_HEIGHT
local TilePlaceHolder = require(Parent.AppCommonLib).Symbol.named("TilePlaceHolder")
local Square = UIBloxModule.App.Tile.AspectRatioModeEnum.Square
GameGrid.defaultProps = {
	friendFooterEnabled = false,
	useGridTiles = false,
	searchResultGrid = false,
	gameEmphasis = false,
	source = nil,
	showFriendActivity = false,
	getItemMetrics = GridMetrics.getSmallMetrics,
	horizontalAlignment = Enum.HorizontalAlignment.Center,
	gameTileLayoutType = GameTileTypes.GameTileLayoutType.Narrow
}

function GameGrid.init(p1)
	-- upvalues: FFlagSduiEdpPrefetchPlayability (copy), FFlagLuaAppSduiEdpEnabled (copy), GameTileConstants (copy)
	function p1.navigateToGameDetails(p2, p3)
		-- upvalues: p1 (copy), FFlagSduiEdpPrefetchPlayability (upval), FFlagLuaAppSduiEdpEnabled (upval)
		p1.props.openGameDetails(p2, p3, p1.props.navigation, if FFlagSduiEdpPrefetchPlayability and FFlagLuaAppSduiEdpEnabled then p1.props.networking else nil)
	end
	
	p1.state = {
		numLinesForTitle = GameTileConstants.TileTextLines[p1.props.gameTileLayoutType].titleTextLines,
		numLinesForMetadata = if p1.props.metadataCompact then GameTileConstants.TileTextLines[p1.props.gameTileLayoutType].largeMetadataTextLines else GameTileConstants.TileTextLines[p1.props.gameTileLayoutType].metadataTextLines
	}
end

function GameGrid.didUpdate(p1, p2, _)
	-- upvalues: GameTileConstants (copy)
	if p2.metadataCompact ~= p1.props.metadataCompact then
		p1:setState({
			numLinesForMetadata = if p1.props.metadataCompact then GameTileConstants.TileTextLines[p1.props.gameTileLayoutType].largeMetadataTextLines else GameTileConstants.TileTextLines[p1.props.gameTileLayoutType].metadataTextLines
		})
	end
end

function GameGrid.renderItem(p1, Entry, Size, LayoutOrder, RowNum)
	-- upvalues: RoactModule (copy), AppFeaturedGameTileTwoByTwoModule (copy), TilePlaceHolder (copy), LuaAppFixConsoleSeeAllGridContainment (copy), UiMode (copy), AppGameTile (copy), GetTileBadgeByPositionConfigFromEntryFunction (copy)
	local ReportGameDetailOpened = p1.props.reportGameDetailOpened
	local ReportExperienceLaunched = p1.props.reportExperienceLaunched
	local Source = p1.props.source
	local HideGameStats = p1.props.hideGameStats
	
	if type(Entry) == "table" and Entry.featured then
		return RoactModule.createElement(AppFeaturedGameTileTwoByTwoModule, {
			layoutOrder = LayoutOrder,
			entry = Entry,
			size = Size,
			index = Entry.realGameEntryIndex or LayoutOrder,
			source = Source,
			reportGameDetailOpened = ReportGameDetailOpened,
			reportExperienceLaunched = ReportExperienceLaunched,
			impressionsTag = p1.props.impressionsTag,
			launchExperienceEventContext = p1.props.launchExperienceEventContext
		})
	elseif type(Entry) == "userdata" and Entry == TilePlaceHolder then
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = LayoutOrder,
			Size = UDim2.new(0, Size.X, 0, Size.Y)
		})
	else
		local IsUiModeMatch: boolean = LuaAppFixConsoleSeeAllGridContainment and (p1.props.uiModeInfo and p1.props.uiModeInfo.uiMode == UiMode.TenFoot)
		
		return RoactModule.createElement(AppGameTile, {
			layoutOrder = LayoutOrder,
			entry = Entry,
			Size = UDim2.new(0, Size.X, 0, Size.Y),
			index = Entry.realGameEntryIndex or LayoutOrder,
			source = Source,
			reportGameDetailOpened = ReportGameDetailOpened,
			reportExperienceLaunched = ReportExperienceLaunched,
			hideGameStats = HideGameStats,
			referralSource = p1.props.referralSource,
			rowNum = RowNum,
			showFriendActivity = p1.props.showFriendActivity,
			impressionsTag = p1.props.impressionsTag,
			friendFooterEnabled = if p1.props.useGridTiles then p1.props.friendFooterEnabled else nil,
			useGridTile = p1.props.useGridTiles,
			launchExperienceEventContext = p1.props.launchExperienceEventContext,
			playerCountStyle = p1.props.playerCountStyle,
			isSponsoredFooterAllowed = p1.props.isSponsoredFooterAllowed,
			topicId = p1.props.topicId,
			gameTileLayoutType = p1.props.gameTileLayoutType,
			navigateToGameDetails = p1.navigateToGameDetails,
			playButtonStyle = p1.props.playButtonStyle,
			isContained = if IsUiModeMatch then true else nil,
			textSizeOffset = p1.props.textSizeOffset,
			contentTextLineCount = p1.state.numLinesForTitle,
			metadataTextLineCount = p1.state.numLinesForMetadata,
			isNarrowScreenXSmall = p1.props.isNarrowScreenXSmall,
			badgeOverride = GetTileBadgeByPositionConfigFromEntryFunction(Entry)
		})
	end
end

function GameGrid.render(p1)
	-- upvalues: GridMetrics (copy), UiMode (copy), FFlagRenameDeprecatedUIBloxTokens (copy), FormFactor (copy), GameTileViewConfig (copy), GAMEGRIDTILEFOOTERHEIGHT (copy), GAMEGRIDCHILDPADDING (copy), GetFFlagLuaAppUpdateGameSortGridRowHeight10ftModule (copy), GetExperienceTileRelativeHeightFunction (copy), Square (copy), TilePlaceHolder (copy), CryoModule (copy), RoactModule (copy), GridViewModule (copy)
	local Entries = p1.props.entries
	local LayoutOrder = p1.props.LayoutOrder
	local NumberOfRowsToShow = p1.props.numberOfRowsToShow
	local WindowSize = p1.props.windowSize
	local ScreenSize = p1.props.screenSize
	local HorizontalAlignment = p1.props.horizontalAlignment
	local SearchResultGrid = p1.props.searchResultGrid
	local List = nil
	local GetMediumMetrics = SearchResultGrid and GridMetrics.getMediumMetrics or p1.props.getItemMetrics
	local ItemWidth = nil
	local _Vector2 = nil
	local TileHeight = nil
	
	if p1.props.useGridTiles then
		local ItemsPerRow = nil
		local Gutter = nil
		local VerticalGap = nil
		if p1.props.appCompositionActive then
			local CollectionLayout = p1.props.collectionLayout
			ItemsPerRow = CollectionLayout.itemsPerRow
			Gutter = CollectionLayout.gutter
			VerticalGap = CollectionLayout.verticalGap
		elseif p1.props.uiModeInfo.uiMode == UiMode.TenFoot then
			ItemsPerRow = 5
			Gutter = if FFlagRenameDeprecatedUIBloxTokens then p1.props.designTokens.Size.Size_600 else p1.props.designTokens.Global.Space_300
			VerticalGap = 51
		elseif p1.props.formFactor == FormFactor.WIDE then
			ItemsPerRow = 4
			Gutter = 8
			VerticalGap = 28
		else
			ItemsPerRow = 2
			Gutter = 8
			VerticalGap = 28
		end
		ItemWidth = GridMetrics.getMetricsForFixedColumns(WindowSize.X, Gutter, ItemsPerRow).itemWidth
		TileHeight = GameTileViewConfig.getTileHeight(p1.props.designTokens, ItemWidth, p1.props.gameTileLayoutType, false, false, false, p1.props.textSizeOffset, nil, p1.state.numLinesForTitle, p1.state.numLinesForMetadata)
		_Vector2 = Vector2.new(Gutter, VerticalGap)
	else
		local FooterHeight = GAMEGRIDTILEFOOTERHEIGHT
		_Vector2 = Vector2.new(GAMEGRIDCHILDPADDING, GAMEGRIDCHILDPADDING * 2)
		
		if p1.props.appCompositionActive then
			local CollectionLayout = p1.props.collectionLayout
			_Vector2 = Vector2.new(CollectionLayout.gutter, CollectionLayout.verticalGap)
			ItemWidth = GridMetrics.getMetricsForFixedColumns(WindowSize.X, CollectionLayout.gutter, CollectionLayout.itemsPerRow).itemWidth
			FooterHeight = GameTileViewConfig.getFooterHeight(p1.props.designTokens, false, false, false, p1.props.textSizeOffset, 0, p1.state.numLinesForTitle, p1.props.foundationTokens, true, p1.state.numLinesForMetadata)
		elseif p1.props.uiModeInfo.uiMode == UiMode.TenFoot then
			_Vector2 = Vector2.new(p1.props.cellSpacingHorizontal, p1.props.cellSpacingVertical)
			ItemWidth = GridMetrics.getMetricsForFixedColumns(WindowSize.X, _Vector2.X, 8).itemWidth
		else
			ItemWidth = GetMediumMetrics(WindowSize.X, GAMEGRIDCHILDPADDING).itemWidth
			FooterHeight = GameTileViewConfig.getFooterHeight(p1.props.designTokens, false, false, false, p1.props.textSizeOffset, 0, p1.state.numLinesForTitle, p1.props.foundationTokens, true, p1.state.numLinesForMetadata)
		end
		if GetFFlagLuaAppUpdateGameSortGridRowHeight10ftModule() then
			FooterHeight = GetExperienceTileRelativeHeightFunction(p1.props.style, Square, 2).Offset
		end
		TileHeight = math.floor(ItemWidth + FooterHeight)
	end
	local _Vector2_1 = Vector2.new(ItemWidth, TileHeight)
	
	if SearchResultGrid and #Entries > 0 and p1.props.gameEmphasis then
		List = {}
		table.insert(List, TilePlaceHolder)
		table.insert(List, TilePlaceHolder)
		local FlooredDelta = math.floor((WindowSize.X + _Vector2.X) / (_Vector2_1.X + _Vector2.X)) - 2
		local RealGameEntryIndex = 2
		while RealGameEntryIndex < FlooredDelta + 2 do
			if RealGameEntryIndex <= #Entries then
				table.insert(List, CryoModule.Dictionary.join(Entries[RealGameEntryIndex], { realGameEntryIndex = RealGameEntryIndex }))
			else
				table.insert(List, TilePlaceHolder)
			end
			RealGameEntryIndex += 1
		end
		table.insert(List, CryoModule.Dictionary.join(Entries[1], { featured = true, realGameEntryIndex = 1 }))
		table.insert(List, TilePlaceHolder)
		
		for i = RealGameEntryIndex, #Entries do
			table.insert(List, CryoModule.Dictionary.join(Entries[i], { realGameEntryIndex = i }))
		end
	end
	return RoactModule.createElement(GridViewModule, {
		layoutOrder = LayoutOrder,
		items = List or Entries,
		renderItem = function(...)
			-- upvalues: p1 (copy)
			return p1:renderItem(...)
		end,
		windowAbsoluteSize = WindowSize,
		screenSize = ScreenSize,
		itemAbsoluteSize = _Vector2_1,
		cellPaddingOffset = _Vector2,
		numberOfRowsToShow = NumberOfRowsToShow,
		horizontalAlignment = HorizontalAlignment,
		onItemsPerRowChanged = p1.props.onItemsPerRowChanged
	})
end

local WithNavigationResult = WithNavigationFunction((RoactRoduxModule.connect(function(p2, _)
	return { formFactor = p2.FormFactor }
end, function(Callback)
	-- upvalues: OpenGameDetailsFunction (copy), FFlagSduiEdpPrefetchPlayability (copy), FFlagLuaAppSduiEdpEnabled (copy)
	return {
		openGameDetails = function(p2, p3, p4, p5)
			-- upvalues: Callback (copy), OpenGameDetailsFunction (upval), FFlagSduiEdpPrefetchPlayability (upval), FFlagLuaAppSduiEdpEnabled (upval)
			Callback(OpenGameDetailsFunction(p2, p4, p3, if FFlagSduiEdpPrefetchPlayability and FFlagLuaAppSduiEdpEnabled then p5 else nil))
		end
	}
end)(GameGrid)))
local v1 = if GetFFlagLuaAppUpdateGameSortGridRowHeight10ftModule() then function(p2)
	-- upvalues: UseStyle (copy), UseTextSizeOffset (copy), CryoModule (copy), RoactModule (copy), v1 (copy)
	return RoactModule.createElement(v1, (CryoModule.Dictionary.join(p2, { style = UseStyle(), textSizeOffset = UseTextSizeOffset() })))
end else function(p2)
	-- upvalues: UseDesignTokens (copy), UseTokens (copy), UseUiModeInfo (copy), FFlagSduiEdpPrefetchPlayability (copy), FFlagLuaAppSduiEdpEnabled (copy), UseRoactService (copy), RoactNetworking (copy), UseTextSizeOffset (copy), UseBreakpointXOrSmaller (copy), ResponsiveModule (copy), GameTileTypes (copy), FFlagLuaAppCompositionAlways (copy), UseCollectionLayout (copy), GameTileModule (copy), CryoModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), RoactModule (copy), WithNavigationResult (copy)
	local DesignTokens = UseDesignTokens()
	local FoundationTokens = UseTokens()
	local UiModeInfo = UseUiModeInfo()
	local v2 = if FFlagSduiEdpPrefetchPlayability and FFlagLuaAppSduiEdpEnabled then UseRoactService(RoactNetworking) else nil
	local TextSizeOffset: number = UseTextSizeOffset()
	local v3 = UseBreakpointXOrSmaller(ResponsiveModule.Keys.Small)
	
	return RoactModule.createElement(WithNavigationResult, (CryoModule.Dictionary.join(p2, {
		uiModeInfo = UiModeInfo,
		networking = if FFlagSduiEdpPrefetchPlayability and FFlagLuaAppSduiEdpEnabled then v2 else nil,
		cellSpacingHorizontal = if FFlagRenameDeprecatedUIBloxTokens then DesignTokens.Size.Size_600 else DesignTokens.Global.Space_300,
		cellSpacingVertical = if FFlagRenameDeprecatedUIBloxTokens then DesignTokens.Size.Size_800 else DesignTokens.Global.Space_400,
		designTokens = DesignTokens,
		textSizeOffset = TextSizeOffset,
		foundationTokens = FoundationTokens,
		metadataCompact = if p2.gameTileLayoutType then v3 and (p2.gameTileLayoutType == GameTileTypes.GameTileLayoutType.Narrow and TextSizeOffset > 0) else v3 and TextSizeOffset > 0,
		isNarrowScreenXSmall = UseBreakpointXOrSmaller(ResponsiveModule.Keys.XSmall),
		appCompositionActive = FFlagLuaAppCompositionAlways or p2.appCompositionEnabled,
		collectionLayout = UseCollectionLayout(GameTileModule.getGameTileCollectionItemSize(p2.gameTileLayoutType or GameTileTypes.GameTileLayoutType.Narrow))
	})))
end

return v1