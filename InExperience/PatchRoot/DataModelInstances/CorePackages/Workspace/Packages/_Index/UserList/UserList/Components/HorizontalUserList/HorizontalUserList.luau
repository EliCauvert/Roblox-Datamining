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

return function(p0)
	-- upvalues: fFlagLuaAppCompositionAlways (ref), reactModule (ref), useIsWideMode (ref), adjustHorizontalUserListSizeForMobile (ref), collectionItemSize (ref), usePageSideMargin (ref), useCollectionLayoutParams (ref), useCompactTileHeightModule (ref), useEntitiesModule (ref), useEntitySelectionHandlerModule (ref), useRenderEntityModule (ref), enumsModule (ref), cryoModule (ref), view (ref), collectionCarousel (ref)
	local fFlagLuaAppCompositionAlways_1 = fFlagLuaAppCompositionAlways or p0.appCompositionEnabled
	local var11, var12 = reactModule.useState(nil)
	local scrollingFrameRef = p0.scrollingFrameRef or reactModule.useRef(nil)
	local var14 = if adjustHorizontalUserListSizeForMobile then if useIsWideMode() then collectionItemSize.Small else collectionItemSize.Medium else collectionItemSize.Small
	local var15 = useCollectionLayoutParams(var14, var11, true, {
		sideMargin = if fFlagLuaAppCompositionAlways_1 then nil elseif not fFlagLuaAppCompositionAlways then usePageSideMargin(var11) else nil
	})
	local var16 = useCompactTileHeightModule()
	local var17 = useRenderEntityModule({
		entitiesMap = useEntitiesModule(p0.entities).entitiesMap,
		onActivated = useEntitySelectionHandlerModule(p0.onRowSelected),
		renderRow = p0.renderRow,
		layoutMode = enumsModule.LayoutMode.Horizontal,
		configs = p0.listConfigs
	})
	
	return reactModule.createElement(view, {
		tag = "size-0-full auto-x row",
		LayoutOrder = p0.layoutOrder
	}, {
		reactModule.createElement(collectionCarousel, cryoModule.Dictionary.join({}, p0.collectionCarouselConfigs or {}, {
			title = if p0.header then p0.header.title else nil,
			onActivateHeader = if p0.header then p0.header.onTitleActivated else nil,
			containerRef = var12,
			scrollingFrameRef = scrollingFrameRef,
			items = reactModule.useMemo(function()
				-- upvalues: p0 (ref)
				local t = {}
				
				for i, v in p0.entities do
					table.insert(t, v.id)
				end
				return t
			end, { p0.entities }),
			renderItem = reactModule.useCallback(function(p1, p2, p3, _)
				-- upvalues: var17 (ref)
				return var17(p1, p2, p3), p1
			end, { var17 }),
			getItemHeight = reactModule.useCallback(function(_)
				-- upvalues: var16 (ref)
				return var16
			end, { var16 }),
			collectionItemSize = if fFlagLuaAppCompositionAlways_1 then var14 else nil,
			numColumns = if fFlagLuaAppCompositionAlways_1 then nil else var15.numColumns,
			fractionalItemAmount = if fFlagLuaAppCompositionAlways_1 then nil else var15.fractionalItemAmount,
			columnGap = if fFlagLuaAppCompositionAlways_1 then nil else var15.columnGap,
			sideMargin = if fFlagLuaAppCompositionAlways_1 then nil else var15.sideMargin,
			maxItemsToShow = var15.maxTilesToShow,
			scrollingEnabledOverride = p0.scrollEnabled
		}))
	})
end