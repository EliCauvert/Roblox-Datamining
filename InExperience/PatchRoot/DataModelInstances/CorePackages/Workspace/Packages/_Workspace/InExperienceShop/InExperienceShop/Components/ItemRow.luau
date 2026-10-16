local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local ShopItemTileModule = require(InExperienceShop.Components.ShopItemTile)
local _ = require(InExperienceShop.Types)
local ComputeShopRowTileWidthsFunction = require(InExperienceShop.Components.computeShopRowTileWidths).computeShopRowTileWidths

local function defaultRenderTile(p1, GridPositionColumn, _, UseMemoResult, OnItemActivated, CategoryId, ShopPageType) --[[ Line: 40 ]]
	-- upvalues: ReactModule (copy), ShopItemTileModule (copy)
	return ReactModule.createElement(ShopItemTileModule, {
		itemId = p1.id,
		itemType = p1.itemType,
		name = p1.name,
		thumbnail = p1.thumbnail,
		price = p1.price,
		userBasePriceInRobux = p1.userBasePriceInRobux,
		universeId = p1.universeId,
		categoryId = CategoryId,
		gridPositionRow = if UseMemoResult then UseMemoResult.gridPositionRow else nil,
		gridPositionColumn = GridPositionColumn,
		onItemActivated = OnItemActivated,
		shopPageType = ShopPageType,
		LayoutOrder = GridPositionColumn
	})
end

local function buildTileLayoutContext(Items, ColumnCount, RowWidth, Gap, GridPositionRow, Callback) --[[ Line: 68 ]]
	-- upvalues: ComputeShopRowTileWidthsFunction (copy)
	local Flag = false
	
	for i, item in Items do
		if Callback(item, i) then
			Flag = true
			break
		end
	end
	local ShopRowTileWidths = ComputeShopRowTileWidthsFunction(RowWidth, Gap, ColumnCount, Flag)
	
	return {
		rowWidth = RowWidth,
		gap = Gap,
		shopWidth = ShopRowTileWidths.shopWidth,
		featuredRobuxWidth = ShopRowTileWidths.featuredRobuxWidth,
		gridPositionRow = GridPositionRow,
		isFeaturedDoubleWidthRobux = Callback
	}
end

local function _(p1): string --[[ Line: 102 | Named "makeChildKey" ]]
	return "Item:" .. tostring(p1.itemType) .. ":" .. p1.id
end

return ReactModule.memo(function(Frame) --[[ Line: 106 | Named "ItemRow" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), buildTileLayoutContext (copy), defaultRenderTile (copy), View (copy)
	local Medium = UseTokensFunction().Gap.Medium
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 111 ]]
		-- upvalues: UseStateResult2 (copy)
		local X = Frame.AbsoluteSize.X
		
		if X ~= 0 then
			UseStateResult2(X)
			
			return
		end
	end, {})
	local IsFeaturedDoubleWidthRobux = Frame.isFeaturedDoubleWidthRobux or function(_, _): boolean --[[ Line: 120 ]]
		return false
	end
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 124 ]]
		-- upvalues: buildTileLayoutContext (upval), Frame (copy), UseStateResult (copy), Medium (copy), IsFeaturedDoubleWidthRobux (copy)
		return (buildTileLayoutContext(Frame.items, Frame.columnCount, UseStateResult, Medium, Frame.rowIndex, IsFeaturedDoubleWidthRobux))
	end, {
		Frame.items, Frame.columnCount, UseStateResult, Medium, Frame.rowIndex,
		IsFeaturedDoubleWidthRobux
	})
	local IsUseStateResultAbove: boolean = Frame.renderTile ~= nil and UseStateResult > 0
	local Elements = {}
	
	for i, item in Frame.items do
		local Text = "Item:" .. tostring(item.itemType) .. ":" .. item.id
		
		if Frame.renderTile then
			Elements[Text] = Frame.renderTile(item, i, UseMemoResult)
		else
			Elements[Text] = defaultRenderTile(item, i, Frame.columnCount, UseMemoResult, Frame.onItemActivated, Frame.sectionId, Frame.shopPageType)
		end
	end
	if not IsUseStateResultAbove then
		for i1 = #Frame.items + 1, Frame.columnCount do
			Elements["Filler" .. i1] = ReactModule.createElement(View, { tag = "size-full-0", LayoutOrder = i1 })
		end
	end
	return ReactModule.createElement(View, {
		tag = "row flex-x-fill gap-medium size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder,
		onAbsoluteSizeChanged = UseResult
	}, Elements)
end)