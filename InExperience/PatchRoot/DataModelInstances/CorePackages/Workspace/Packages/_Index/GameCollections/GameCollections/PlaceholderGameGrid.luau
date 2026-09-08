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
local fFlagLuaAppCompositionAlways = require(parent.SharedFlags).FFlagLuaAppCompositionAlways
local t = {}

local function renderItem(_, _, _, _)
	return nil, "placeholder"
end

return reactModule.memo(function(p1)
	-- upvalues: useAppPolicy (ref), usePreferredInput (ref), responsiveModule (ref), fFlagLuaAppCompositionAlways (ref), getGameTileCollectionItemSize (ref), reactModule (ref), useGameCollectionLayoutParamsModule (ref), useCollectionLayout (ref), gameTileConstants (ref), useGetGameTileHeightModule (ref), t (ref), collectionGrid (ref), renderItem (ref)
	local var1 = useAppPolicy(function(p2)
		return p2.useGridPageLayout()
	end)
	local var2 = p1.isHoverSupportEnabled and (var1 and usePreferredInput() == responsiveModule.Input.Pointer)
	local gameTileLayoutType = p1.gameTileLayoutType or "Narrow"
	local fFlagLuaAppCompositionAlways_1 = fFlagLuaAppCompositionAlways or p1.appCompositionEnabled
	local var3 = if fFlagLuaAppCompositionAlways_1 then getGameTileCollectionItemSize(gameTileLayoutType) else nil
	local var4, var5 = reactModule.useState(nil)
	reactModule.useRef(var4).current = var4
	local var6 = useGameCollectionLayoutParamsModule(gameTileLayoutType, var4, false, if var1 then nil else { sideMargin = p1.sideMargin })
	local var7 = if fFlagLuaAppCompositionAlways_1 then useCollectionLayout(var3).itemsPerRow else var6.numColumns
	local var8 = useGetGameTileHeightModule(var2, gameTileLayoutType, p1.containedTile or false, p1.shouldHideTileMetadata or false, p1.shouldHideTileTitle or false, nil, nil, gameTileConstants.TileTextLines[gameTileLayoutType] and gameTileConstants.TileTextLines[gameTileLayoutType].titleTextLines)
	
	if not fFlagLuaAppCompositionAlways then
		local var9 = reactModule.useRef(0)
		reactModule.useEffect(function()
			-- upvalues: fFlagLuaAppCompositionAlways_1 (ref), var6 (ref), var9 (ref), p1 (ref)
			if not fFlagLuaAppCompositionAlways_1 and var6.numColumns ~= var9.current then
				var9.current = var6.numColumns
				
				if p1.onItemsPerRowChanged then
					p1.onItemsPerRowChanged(var6.numColumns)
				end
			end
		end, {
			var6.numColumns,
			p1.onItemsPerRowChanged,
			var9,
			fFlagLuaAppCompositionAlways_1
		})
	end
	local clampedValue = math.clamp(p1.numRows, 0, 4)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		GameGrid = reactModule.createElement(collectionGrid, {
			hideHeaderButton = true,
			collectionItemSize = if fFlagLuaAppCompositionAlways_1 then var3 else nil,
			title = if clampedValue > 0 then p1.title else nil,
			headerComponent = p1.headerComponent,
			containerRef = var5,
			verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
			items = reactModule.useMemo(function()
				-- upvalues: var7 (ref), clampedValue (ref), t (copy)
				local t_1 = {}
				
				for _ = 1, var7 * clampedValue do
					table.insert(t_1, t)
				end
				return t_1
			end, { var7, clampedValue }),
			renderItem = renderItem,
			getItemHeight = var8,
			numColumns = if fFlagLuaAppCompositionAlways_1 then nil else var6.numColumns,
			columnGap = if fFlagLuaAppCompositionAlways_1 then nil else var6.columnGap,
			sideMargin = if fFlagLuaAppCompositionAlways_1 then nil else var6.sideMargin
		})
	})
end)