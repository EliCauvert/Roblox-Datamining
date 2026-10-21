local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local _ = require(UserList.Common.Types)
local EnumsModule = require(UserList.Common.Enums)
local UseCompactTileHeightModule = require(UserList.Common.useCompactTileHeight)
local CryoModule = require(Parent.Cryo)
local CollectionViewsModule = require(Parent.CollectionViews)
local CollectionCarousel = CollectionViewsModule.CollectionCarousel
local UseCollectionLayoutParamsFunction = CollectionViewsModule.useCollectionLayoutParams
local UsePageSideMarginFunction = CollectionViewsModule.usePageSideMargin
local CollectionItemSize = CollectionViewsModule.CollectionViewTypes.CollectionItemSize
local UseEntitiesModule = require(UserList.Hooks.useEntities)
local UseEntitySelectionHandlerModule = require(UserList.Hooks.useEntitySelectionHandler)
local UseRenderEntityModule = require(UserList.Hooks.useRenderEntity)
local UseIsWideModeFunction = require(Parent.SocialCommon).Hooks.useIsWideMode
local AdjustHorizontalUserListSizeForMobile = game:DefineFastFlag("AdjustHorizontalUserListSizeForMobile", false)
local FFlagLuaAppCompositionAlways = require(Parent.SharedFlags).FFlagLuaAppCompositionAlways
local FFlagUserListRowSelectionOriginSourceModule = require(UserList.Flags.FFlagUserListRowSelectionOriginSource)

return function(p1)
	-- upvalues: FFlagLuaAppCompositionAlways (copy), ReactModule (copy), UseIsWideModeFunction (copy), AdjustHorizontalUserListSizeForMobile (copy), CollectionItemSize (copy), UsePageSideMarginFunction (copy), UseCollectionLayoutParamsFunction (copy), UseCompactTileHeightModule (copy), UseEntitiesModule (copy), UseEntitySelectionHandlerModule (copy), FFlagUserListRowSelectionOriginSourceModule (copy), UseRenderEntityModule (copy), EnumsModule (copy), CryoModule (copy), View (copy), CollectionCarousel (copy)
	local FFlagLuaAppCompositionAlways1 = FFlagLuaAppCompositionAlways or p1.appCompositionEnabled
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local ScrollingFrameRef = p1.scrollingFrameRef or UseRefResult
	local UseIsWideModeResult = UseIsWideModeFunction()
	local Small = if AdjustHorizontalUserListSizeForMobile then if UseIsWideModeResult then CollectionItemSize.Small else CollectionItemSize.Medium else CollectionItemSize.Small
	local UsePageSideMarginResult = if FFlagLuaAppCompositionAlways then nil else UsePageSideMarginFunction(UseStateResult)
	local UseCollectionLayoutParamsResult = UseCollectionLayoutParamsFunction(Small, UseStateResult, true, {
		sideMargin = if FFlagLuaAppCompositionAlways1 then nil else UsePageSideMarginResult
	})
	local UseCompactTileHeightModuleResult = UseCompactTileHeightModule()
	local UseResult = ReactModule.useCallback(function(_)
		-- upvalues: UseCompactTileHeightModuleResult (copy)
		return UseCompactTileHeightModuleResult
	end, { UseCompactTileHeightModuleResult })
	local UseRenderEntityModuleResult = UseRenderEntityModule({
		entitiesMap = UseEntitiesModule(p1.entities).entitiesMap,
		onActivated = UseEntitySelectionHandlerModule(p1.onRowSelected, if FFlagUserListRowSelectionOriginSourceModule then p1.rowSelectionConfig else nil),
		renderRow = p1.renderRow,
		layoutMode = EnumsModule.LayoutMode.Horizontal,
		configs = p1.listConfigs
	})
	
	return ReactModule.createElement(View, {
		tag = "size-0-full auto-x row",
		LayoutOrder = p1.layoutOrder
	}, {
		ReactModule.createElement(CollectionCarousel, (CryoModule.Dictionary.join({}, p1.collectionCarouselConfigs or {}, {
			title = p1.header and p1.header.title or nil,
			onActivateHeader = p1.header and p1.header.onTitleActivated or nil,
			containerRef = UseStateResult2,
			scrollingFrameRef = ScrollingFrameRef,
			items = ReactModule.useMemo(function()
				-- upvalues: p1 (copy)
				local Ids = {}
				
				for _, entity in p1.entities do
					table.insert(Ids, entity.id)
				end
				return Ids
			end, { p1.entities }),
			renderItem = ReactModule.useCallback(function(p2, p3, p4, _)
				-- upvalues: UseRenderEntityModuleResult (copy)
				return UseRenderEntityModuleResult(p2, p3, p4), p2
			end, { UseRenderEntityModuleResult }),
			getItemHeight = UseResult,
			collectionItemSize = if FFlagLuaAppCompositionAlways1 then Small else nil,
			numColumns = if FFlagLuaAppCompositionAlways1 then nil else UseCollectionLayoutParamsResult.numColumns,
			fractionalItemAmount = if FFlagLuaAppCompositionAlways1 then nil else UseCollectionLayoutParamsResult.fractionalItemAmount,
			columnGap = if FFlagLuaAppCompositionAlways1 then nil else UseCollectionLayoutParamsResult.columnGap,
			sideMargin = if FFlagLuaAppCompositionAlways1 then nil else UseCollectionLayoutParamsResult.sideMargin,
			maxItemsToShow = UseCollectionLayoutParamsResult.maxTilesToShow,
			scrollingEnabledOverride = p1.scrollEnabled
		})))
	})
end