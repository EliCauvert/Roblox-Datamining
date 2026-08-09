local gameCollections = script:FindFirstAncestor("GameCollections")
local parent = gameCollections.Parent
local reactModule = require(parent.React)
local gameTileConstants = require(parent.GameTile).GameTileConstants
local responsiveModule = require(parent.Responsive)
local usePreferredInput = responsiveModule.usePreferredInput
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local collectionViewsModule = require(parent.CollectionViews)
local collectionGrid = collectionViewsModule.CollectionGrid
local useCollectionLayout = collectionViewsModule.useCollectionLayout
local useGetGameTileHeightModule = require(gameCollections.useGetGameTileHeight)
local useGameCollectionLayoutParamsModule = require(gameCollections.useGameCollectionLayoutParams)
local getGameTileCollectionItemSize = require(parent.GameTile).getGameTileCollectionItemSize
local fFlagLuaAppCompositionSupport = require(parent.SharedFlags).FFlagLuaAppCompositionSupport
local fFlagLuaAppCompositionAlways = require(parent.SharedFlags).FFlagLuaAppCompositionAlways
local fFlagLuaAppSearchPlaceholderGrid = require(parent.SharedFlags).FFlagLuaAppSearchPlaceholderGrid
local t = {}

local function renderItem(_, _, _, _) --[[ line: 43 ]]
	return nil, "placeholder"
end

return reactModule.memo(function(p0) --[[ line: 50 | named "PlaceholderGameGrid" ]]
	-- upvalues: useAppPolicy (ref), usePreferredInput (ref), responsiveModule (ref), fFlagLuaAppCompositionAlways (ref), fFlagLuaAppCompositionSupport (ref), getGameTileCollectionItemSize (ref), reactModule (ref), useGameCollectionLayoutParamsModule (ref), useCollectionLayout (ref), gameTileConstants (ref), useGetGameTileHeightModule (ref), t (ref), collectionGrid (ref), fFlagLuaAppSearchPlaceholderGrid (ref), renderItem (ref)
	local var8 = useAppPolicy(function(p1) --[[ line: 52 ]]
		return p1.useGridPageLayout()
	end)
	local var9 = p0.isHoverSupportEnabled and (var8 and usePreferredInput() == responsiveModule.Input.Pointer)
	local gameTileLayoutType = p0.gameTileLayoutType or "Narrow"
	local fFlagLuaAppCompositionAlways_1 = fFlagLuaAppCompositionAlways or fFlagLuaAppCompositionSupport and p0.appCompositionEnabled
	local var12 = if fFlagLuaAppCompositionAlways_1 then getGameTileCollectionItemSize(gameTileLayoutType) else nil
	local var13, var14 = reactModule.useState(nil)
	reactModule.useRef(var13).current = var13
	local var15 = useGameCollectionLayoutParamsModule(gameTileLayoutType, var13, false, if var8 then nil else { sideMargin = p0.sideMargin })
	local var16 = if fFlagLuaAppCompositionAlways_1 then if fFlagLuaAppCompositionSupport then useCollectionLayout(var12).itemsPerRow else nil else var15.numColumns
	local var17 = useGetGameTileHeightModule(var9, gameTileLayoutType, p0.containedTile or false, p0.shouldHideTileMetadata or false, p0.shouldHideTileTitle or false, nil, nil, gameTileConstants.TileTextLines[gameTileLayoutType] and gameTileConstants.TileTextLines[gameTileLayoutType].titleTextLines)
	
	if not fFlagLuaAppCompositionAlways then
		local var18 = reactModule.useRef(0)
		reactModule.useEffect(function() --[[ line: 107 ]]
			-- upvalues: fFlagLuaAppCompositionAlways_1 (ref), var15 (ref), var18 (ref), p0 (ref)
			if not fFlagLuaAppCompositionAlways_1 and var15.numColumns ~= var18.current then
				var18.current = var15.numColumns
				
				if p0.onItemsPerRowChanged then
					p0.onItemsPerRowChanged(var15.numColumns)
				end
			end
		end, {
			var15.numColumns,
			p0.onItemsPerRowChanged,
			var18,
			if fFlagLuaAppCompositionSupport then fFlagLuaAppCompositionAlways_1 else nil
		})
	end
	local clampedValue = math.clamp(p0.numRows, 0, 4)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		GameGrid = reactModule.createElement(collectionGrid, {
			hideHeaderButton = true,
			collectionItemSize = if fFlagLuaAppCompositionAlways_1 then var12 else nil,
			title = if clampedValue > 0 then p0.title else nil,
			headerComponent = if fFlagLuaAppSearchPlaceholderGrid then p0.headerComponent else nil,
			containerRef = var14,
			verticalScrollingFrameRef = p0.verticalScrollingFrameRef,
			items = reactModule.useMemo(function() --[[ line: 130 ]]
				-- upvalues: var16 (ref), clampedValue (ref), t (copy)
				local t_1 = {}
				
				for _ = 1, var16 * clampedValue do
					table.insert(t_1, t)
				end
				return t_1
			end, {
				if fFlagLuaAppCompositionSupport then var16 else var15.numColumns,
				clampedValue
			}),
			renderItem = renderItem,
			getItemHeight = var17,
			numColumns = if fFlagLuaAppCompositionAlways_1 then nil else var15.numColumns,
			columnGap = if fFlagLuaAppCompositionAlways_1 then nil else var15.columnGap,
			sideMargin = if fFlagLuaAppCompositionAlways_1 then nil else var15.sideMargin
		})
	})
end)