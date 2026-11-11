local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local RoactModule = require(CorePackages.Packages.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local TModule = require(CorePackages.Packages.t)
local GridView = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Components.Generic.GridView
local UseDesignTokens = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local GridMetrics = UIBloxModule.App.Grid.GridMetrics
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local UseUiModeInfo = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UseTextSizeOffset = UIBloxModule.Core.Style.useTextSizeOffset
local DiscoveryTypesModule = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local ContainerModule = require(Modules.LuaApp.Components.UserSearch.UserSearchTileUniversalWrapper.Container)
local GetTileRowInSortFunction = require(Modules.LuaApp.Components.UserSearch.api).Analytics.getTileRowInSort
local CalculateRowPositionFieldsFunction = require(CorePackages.Workspace.Packages.UnifiedLogging).calculateRowPositionFields
local FFlagLuaAppSearchPeopleUnifiedSchemaFields = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppSearchPeopleUnifiedSchemaFields
local PLAYERGRIDTILEFOOTERHEIGHT = require(Modules.LuaApp.Constants).PLAYER_GRID_TILE_FOOTER_HEIGHT
local PlayerGrid = RoactModule.PureComponent:extend("PlayerGrid")
PlayerGrid.validateProps = TModule.strictInterface({
	entries = TModule.table,
	LayoutOrder = TModule.optional(TModule.integer),
	numberOfRowsToShow = TModule.optional(TModule.integer),
	windowSize = TModule.Vector2,
	horizontalAlignment = TModule.optional(TModule.enum(Enum.HorizontalAlignment)),
	searchParameters = TModule.table,
	impressionsTag = TModule.string,
	mappedProfilesInsights = TModule.optional(TModule.table),
	uiModeInfo = TModule.table,
	cellSpacingHorizontal = TModule.number,
	cellSpacingVertical = TModule.number,
	tileHeightOffset = TModule.number,
	Analytics = TModule.any,
	shouldUseCompactTiles = TModule.optional(TModule.boolean),
	subpage = TModule.optional(TModule.string),
	onItemsPerRowChanged = TModule.optional(TModule.any),
	startRowNumber = TModule.optional(TModule.number),
	itemsPerRow = TModule.optional(TModule.number),
	textSizeOffset = TModule.number,
	enablePresenceIndicator = TModule.optional(TModule.boolean),
	enableOnlineFrequents = TModule.optional(TModule.boolean)
})
PlayerGrid.defaultProps = {
	horizontalAlignment = Enum.HorizontalAlignment.Center,
	mappedProfilesInsights = {}
}

function PlayerGrid.renderItem(p1, User, Vector, Index)
	-- upvalues: FFlagLuaAppSearchPeopleUnifiedSchemaFields (copy), CalculateRowPositionFieldsFunction (copy), RoactModule (copy), ContainerModule (copy), GetTileRowInSortFunction (copy)
	local RowPositionFields = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then CalculateRowPositionFieldsFunction(Index, p1.props.itemsPerRow, p1.props.startRowNumber) else nil
	
	return RoactModule.createElement(ContainerModule, {
		index = Index,
		user = User,
		size = UDim2.new(0, Vector.X, 0, Vector.Y),
		searchParameters = p1.props.searchParameters,
		hasEmphasis = User.featured or false,
		impressionsTag = p1.props.impressionsTag,
		profileInsight = p1.props.mappedProfilesInsights[User.id],
		Analytics = p1.props.Analytics,
		shouldUseCompactTiles = p1.props.shouldUseCompactTiles,
		enablePresenceIndicator = p1.props.enablePresenceIndicator,
		subpage = p1.props.subpage,
		rowInSort = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then RowPositionFields.rowInSort else GetTileRowInSortFunction(Index, p1.props.startRowNumber, p1.props.itemsPerRow),
		positionInRow = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then RowPositionFields.positionInRow else nil,
		feedRowNumber = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then RowPositionFields.rowOnPage else nil
	})
end

function PlayerGrid.getCardWidthForCompactTiles(p1, CellSpacingHorizontal)
	-- upvalues: GridMetrics (copy)
	local WindowSize = p1.props.windowSize
	local SmallMetrics = GridMetrics.getSmallMetrics(WindowSize.X, CellSpacingHorizontal)
	
	if WindowSize.X < WindowSize.Y then
		return SmallMetrics.itemWidth
	else
		local NewItemsPerRow = SmallMetrics.itemsPerRow + 1
		
		return (math.floor((WindowSize.X - (NewItemsPerRow - 1) * CellSpacingHorizontal) / NewItemsPerRow))
	end
end

function PlayerGrid.render(p1)
	-- upvalues: DiscoveryTypesModule (copy), GridMetrics (copy), PLAYERGRIDTILEFOOTERHEIGHT (copy), CryoModule (copy), UiMode (copy), RoactModule (copy), GridView (copy)
	local Entries = p1.props.entries
	local LayoutOrder = p1.props.LayoutOrder
	local NumberOfRowsToShow = p1.props.numberOfRowsToShow
	local WindowSize = p1.props.windowSize
	local HorizontalAlignment = p1.props.horizontalAlignment
	local v1 = nil
	local CellSpacingHorizontal = nil
	local _Vector2 = nil
	local CardWidthForCompactTiles = nil
	local v2 = nil
	
	if p1.props.shouldUseCompactTiles then
		CellSpacingHorizontal = p1.props.cellSpacingHorizontal
		_Vector2 = Vector2.new(CellSpacingHorizontal, p1.props.cellSpacingVertical)
		CardWidthForCompactTiles = p1:getCardWidthForCompactTiles(CellSpacingHorizontal)
		v2 = 60
	else
		CellSpacingHorizontal = DiscoveryTypesModule.Constants.GAME_GRID_CHILD_PADDING
		_Vector2 = Vector2.new(CellSpacingHorizontal, CellSpacingHorizontal * 2)
		CardWidthForCompactTiles = GridMetrics.getMediumMetrics(WindowSize.X, CellSpacingHorizontal).itemWidth
		v2 = PLAYERGRIDTILEFOOTERHEIGHT
	end
	local _Vector2_1 = Vector2.new(CardWidthForCompactTiles, (math.floor(CardWidthForCompactTiles + v2)))
	
	if not p1.props.shouldUseCompactTiles and #Entries == 1 then
		v1 = {
			CryoModule.Dictionary.join(Entries[1], { featured = true })
		}
		local ItemWidth = GridMetrics.getLargeMetrics(WindowSize.X, CellSpacingHorizontal).itemWidth
		_Vector2_1 = Vector2.new(ItemWidth, ItemWidth + PLAYERGRIDTILEFOOTERHEIGHT)
	end
	if p1.props.uiModeInfo.uiMode == UiMode.TenFoot then
		local ItemWidth = GridMetrics.getMetricsForFixedColumns(WindowSize.X, p1.props.cellSpacingHorizontal, 6).itemWidth
		_Vector2_1 = Vector2.new(ItemWidth, (math.floor(ItemWidth + p1.props.tileHeightOffset)))
		_Vector2 = Vector2.new(p1.props.cellSpacingHorizontal, p1.props.cellSpacingVertical)
	end
	return RoactModule.createElement(GridView, {
		layoutOrder = LayoutOrder,
		items = v1 or Entries,
		renderItem = function(...)
			-- upvalues: p1 (copy)
			return p1:renderItem(...)
		end,
		windowAbsoluteSize = WindowSize,
		itemAbsoluteSize = Vector2.new(_Vector2_1.X, _Vector2_1.Y + p1.props.textSizeOffset * 3),
		cellPaddingOffset = _Vector2,
		numberOfRowsToShow = NumberOfRowsToShow,
		horizontalAlignment = HorizontalAlignment,
		onItemsPerRowChanged = p1.props.onItemsPerRowChanged
	})
end

return function(p1)
	-- upvalues: UseDesignTokens (copy), UseUiModeInfo (copy), UseTextSizeOffset (copy), CryoModule (copy), RoactModule (copy), PlayerGrid (copy)
	local v1 = UseDesignTokens()
	
	return RoactModule.createElement(PlayerGrid, (CryoModule.Dictionary.join(p1, {
		uiModeInfo = UseUiModeInfo(),
		cellSpacingHorizontal = v1.Size.Size_600,
		cellSpacingVertical = if p1.shouldUseCompactTiles then v1.Size.Size_400 else v1.Size.Size_800,
		tileHeightOffset = v1.Size.Size_1600,
		textSizeOffset = UseTextSizeOffset()
	})))
end