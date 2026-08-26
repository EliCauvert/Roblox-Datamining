local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local _ = require(userList.Common.Types)
local enumsModule = require(userList.Common.Enums)
local useCompactTileHeightModule = require(userList.Common.useCompactTileHeight)
local cryoModule = require(parent.Cryo)
local collectionViewsModule = require(parent.CollectionViews)
local collectionCarousel = collectionViewsModule.CollectionCarousel
local useCollectionLayoutParams = collectionViewsModule.useCollectionLayoutParams
local usePageSideMargin = collectionViewsModule.usePageSideMargin
local collectionItemSize = collectionViewsModule.CollectionViewTypes.CollectionItemSize
local useEntitiesModule = require(userList.Hooks.useEntities)
local useEntitySelectionHandlerModule = require(userList.Hooks.useEntitySelectionHandler)
local useRenderEntityModule = require(userList.Hooks.useRenderEntity)
local useIsWideMode = require(parent.SocialCommon).Hooks.useIsWideMode
local adjustHorizontalUserListSizeForMobile = game:DefineFastFlag("AdjustHorizontalUserListSizeForMobile", false)
local fFlagLuaAppCompositionAlways = require(parent.SharedFlags).FFlagLuaAppCompositionAlways

return function(p1)
	-- upvalues: fFlagLuaAppCompositionAlways (ref), reactModule (ref), useIsWideMode (ref), adjustHorizontalUserListSizeForMobile (ref), collectionItemSize (ref), usePageSideMargin (ref), useCollectionLayoutParams (ref), useCompactTileHeightModule (ref), useEntitiesModule (ref), useEntitySelectionHandlerModule (ref), useRenderEntityModule (ref), enumsModule (ref), cryoModule (ref), view (ref), collectionCarousel (ref)
	local fFlagLuaAppCompositionAlways_1 = fFlagLuaAppCompositionAlways or p1.appCompositionEnabled
	local var1, var2 = reactModule.useState(nil)
	local scrollingFrameRef = p1.scrollingFrameRef or reactModule.useRef(nil)
	local var3 = if adjustHorizontalUserListSizeForMobile then if useIsWideMode() then collectionItemSize.Small else collectionItemSize.Medium else collectionItemSize.Small
	local var4 = useCollectionLayoutParams(var3, var1, true, {
		sideMargin = if fFlagLuaAppCompositionAlways_1 then nil elseif not fFlagLuaAppCompositionAlways then usePageSideMargin(var1) else nil
	})
	local var5 = useCompactTileHeightModule()
	local var6 = useRenderEntityModule({
		entitiesMap = useEntitiesModule(p1.entities).entitiesMap,
		onActivated = useEntitySelectionHandlerModule(p1.onRowSelected),
		renderRow = p1.renderRow,
		layoutMode = enumsModule.LayoutMode.Horizontal,
		configs = p1.listConfigs
	})
	
	return reactModule.createElement(view, {
		tag = "size-0-full auto-x row",
		LayoutOrder = p1.layoutOrder
	}, {
		reactModule.createElement(collectionCarousel, cryoModule.Dictionary.join({}, p1.collectionCarouselConfigs or {}, {
			title = if p1.header then p1.header.title else nil,
			onActivateHeader = if p1.header then p1.header.onTitleActivated else nil,
			containerRef = var2,
			scrollingFrameRef = scrollingFrameRef,
			items = reactModule.useMemo(function()
				-- upvalues: p1 (ref)
				local t = {}
				
				for i, v in p1.entities do
					table.insert(t, v.id)
				end
				return t
			end, { p1.entities }),
			renderItem = reactModule.useCallback(function(p2, p3, p4, _)
				-- upvalues: var6 (ref)
				return var6(p2, p3, p4), p2
			end, { var6 }),
			getItemHeight = reactModule.useCallback(function(_)
				-- upvalues: var5 (ref)
				return var5
			end, { var5 }),
			collectionItemSize = if fFlagLuaAppCompositionAlways_1 then var3 else nil,
			numColumns = if fFlagLuaAppCompositionAlways_1 then nil else var4.numColumns,
			fractionalItemAmount = if fFlagLuaAppCompositionAlways_1 then nil else var4.fractionalItemAmount,
			columnGap = if fFlagLuaAppCompositionAlways_1 then nil else var4.columnGap,
			sideMargin = if fFlagLuaAppCompositionAlways_1 then nil else var4.sideMargin,
			maxItemsToShow = var4.maxTilesToShow,
			scrollingEnabledOverride = p1.scrollEnabled
		}))
	})
end