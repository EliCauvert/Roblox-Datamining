local GameCollections = script:FindFirstAncestor("GameCollections")
local Parent = GameCollections.Parent
local ReactModule = require(Parent.React)
local GameTileConstants = require(Parent.GameTile).GameTileConstants
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local CollectionViewsModule = require(Parent.CollectionViews)
local CollectionGrid = CollectionViewsModule.CollectionGrid
local UseCollectionLayoutFunction = CollectionViewsModule.useCollectionLayout
local UseGetGameTileHeightModule = require(GameCollections.useGetGameTileHeight)
local UseGameCollectionLayoutParamsModule = require(GameCollections.useGameCollectionLayoutParams)
local GetGameTileCollectionItemSizeFunction = require(Parent.GameTile).getGameTileCollectionItemSize
local FFlagLuaAppCompositionAlways = require(Parent.SharedFlags).FFlagLuaAppCompositionAlways
local t = {}

local function renderItem(_, _, _, _) --[[ Line: 41 ]]
	return nil, "placeholder"
end

return ReactModule.memo(function(p1) --[[ Line: 48 | Named "PlaceholderGameGrid" ]]
	-- upvalues: UseAppPolicyFunction (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), FFlagLuaAppCompositionAlways (copy), GetGameTileCollectionItemSizeFunction (copy), ReactModule (copy), UseGameCollectionLayoutParamsModule (copy), UseCollectionLayoutFunction (copy), GameTileConstants (copy), UseGetGameTileHeightModule (copy), t (copy), CollectionGrid (copy), renderItem (copy)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2) --[[ Line: 50 ]]
		return p2.useGridPageLayout()
	end)
	local UsePreferredInputResult = UsePreferredInputFunction()
	local IsUsePreferredInputResultMatch: boolean = p1.isHoverSupportEnabled and (UseAppPolicyResult and UsePreferredInputResult == ResponsiveModule.Input.Pointer)
	local GameTileLayoutType = p1.gameTileLayoutType or "Narrow"
	local FFlagLuaAppCompositionAlways1 = FFlagLuaAppCompositionAlways or p1.appCompositionEnabled
	local GameTileCollectionItemSize = if FFlagLuaAppCompositionAlways1 then GetGameTileCollectionItemSizeFunction(GameTileLayoutType) else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useRef(UseStateResult).current = UseStateResult
	local UseGameCollectionLayoutParamsModuleResult = UseGameCollectionLayoutParamsModule(GameTileLayoutType, UseStateResult, false, if UseAppPolicyResult then nil else { sideMargin = p1.sideMargin })
	local ItemsPerRow = UseCollectionLayoutFunction(GameTileCollectionItemSize).itemsPerRow
	local ItemsPerRow1 = if FFlagLuaAppCompositionAlways1 then ItemsPerRow else UseGameCollectionLayoutParamsModuleResult.numColumns
	local UseGetGameTileHeightModuleResult = UseGetGameTileHeightModule(IsUsePreferredInputResultMatch, GameTileLayoutType, p1.containedTile or false, p1.shouldHideTileMetadata or false, p1.shouldHideTileTitle or false, nil, nil, GameTileConstants.TileTextLines[GameTileLayoutType] and GameTileConstants.TileTextLines[GameTileLayoutType].titleTextLines)
	
	if not FFlagLuaAppCompositionAlways then
		local UseRefResult = ReactModule.useRef(0)
		ReactModule.useEffect(function() --[[ Line: 101 ]]
			-- upvalues: FFlagLuaAppCompositionAlways1 (copy), UseGameCollectionLayoutParamsModuleResult (copy), UseRefResult (copy), p1 (copy)
			if not FFlagLuaAppCompositionAlways1 and UseGameCollectionLayoutParamsModuleResult.numColumns ~= UseRefResult.current then
				UseRefResult.current = UseGameCollectionLayoutParamsModuleResult.numColumns
				
				if p1.onItemsPerRowChanged then
					p1.onItemsPerRowChanged(UseGameCollectionLayoutParamsModuleResult.numColumns)
				end
			end
		end, {
			UseGameCollectionLayoutParamsModuleResult.numColumns,
			p1.onItemsPerRowChanged,
			UseRefResult,
			FFlagLuaAppCompositionAlways1
		})
	end
	local ClampedValue = math.clamp(p1.numRows, 0, 4)
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		GameGrid = ReactModule.createElement(CollectionGrid, {
			hideHeaderButton = true,
			collectionItemSize = if FFlagLuaAppCompositionAlways1 then GameTileCollectionItemSize else nil,
			title = if ClampedValue > 0 then p1.title else nil,
			headerComponent = p1.headerComponent,
			containerRef = UseStateResult2,
			verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
			items = ReactModule.useMemo(function() --[[ Line: 124 ]]
				-- upvalues: ItemsPerRow1 (copy), ClampedValue (copy), t (upval)
				local List = {}
				
				for _ = 1, ItemsPerRow1 * ClampedValue do
					table.insert(List, t)
				end
				return List
			end, { ItemsPerRow1, ClampedValue }),
			renderItem = renderItem,
			getItemHeight = UseGetGameTileHeightModuleResult,
			numColumns = if FFlagLuaAppCompositionAlways1 then nil else UseGameCollectionLayoutParamsModuleResult.numColumns,
			columnGap = if FFlagLuaAppCompositionAlways1 then nil else UseGameCollectionLayoutParamsModuleResult.columnGap,
			sideMargin = if FFlagLuaAppCompositionAlways1 then nil else UseGameCollectionLayoutParamsModuleResult.sideMargin
		})
	})
end)