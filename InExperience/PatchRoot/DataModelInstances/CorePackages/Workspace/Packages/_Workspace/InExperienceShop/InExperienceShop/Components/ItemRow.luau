local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local shopItemTileModule = require(inExperienceShop.Components.ShopItemTile)
local _ = require(inExperienceShop.Types)
local computeShopRowTileWidths = require(inExperienceShop.Components.computeShopRowTileWidths).computeShopRowTileWidths

local function defaultRenderTile(p1, p2, _, p3, p4, p5, p6)
	-- upvalues: reactModule (ref), shopItemTileModule (ref)
	return reactModule.createElement(shopItemTileModule, {
		itemId = p1.id,
		itemType = p1.itemType,
		name = p1.name,
		thumbnail = p1.thumbnail,
		price = p1.price,
		userBasePriceInRobux = p1.userBasePriceInRobux,
		universeId = p1.universeId,
		categoryId = p5,
		gridPositionRow = if p3 then p3.gridPositionRow else nil,
		gridPositionColumn = p2,
		onItemActivated = p4,
		shopPageType = p6,
		LayoutOrder = p2
	})
end

local function buildTileLayoutContext(p1, p2, p3, p4, p5, p6)
	-- upvalues: computeShopRowTileWidths (ref)
	local var1 = false
	
	for i, v in p1 do
		if p6(v, i) then
			var1 = true
			break
		end
	end
	local var2 = computeShopRowTileWidths(p3, p4, p2, var1)
	
	return {
		rowWidth = p3,
		gap = p4,
		shopWidth = var2.shopWidth,
		featuredRobuxWidth = var2.featuredRobuxWidth,
		gridPositionRow = p5,
		isFeaturedDoubleWidthRobux = p6
	}
end

local function _(p7)
	return "Item:" .. tostring(p7.itemType) .. ":" .. p12.id
end

return reactModule.memo(function(p7)
	-- upvalues: useTokens (ref), reactModule (ref), buildTileLayoutContext (ref), defaultRenderTile (ref), view (ref)
	local medium = useTokens().Gap.Medium
	local var3, var4 = reactModule.useState(0)
	local var5 = reactModule.useCallback(function(p8)
		-- upvalues: var4 (ref)
		local x = p8.AbsoluteSize.X
		
		if x == 0 then
			return
		end
		var4(x)
	end, {})
	local isFeaturedDoubleWidthRobux = p7.isFeaturedDoubleWidthRobux or function(_, _)
		return false
	end
	local var6 = reactModule.useMemo(function()
		-- upvalues: buildTileLayoutContext (copy), p7 (ref), var3 (ref), medium (ref), isFeaturedDoubleWidthRobux (ref)
		return buildTileLayoutContext(p7.items, p7.columnCount, var3, medium, p7.rowIndex, isFeaturedDoubleWidthRobux)
	end, {
		p7.items, p7.columnCount, var3, medium, p7.rowIndex,
		isFeaturedDoubleWidthRobux
	})
	local var7 = p7.renderTile ~= nil and var3 > 0
	local t = {}
	
	for i, v in p7.items do
		local text = "Item:" .. tostring(v.itemType) .. ":" .. v.id
		
		if p7.renderTile then
			t[text] = p7.renderTile(v, i, var6)
		else
			t[text] = defaultRenderTile(v, i, p7.columnCount, var6, p7.onItemActivated, p7.sectionId, p7.shopPageType)
		end
	end
	if not var7 then
		for i_1 = #p7.items + 1, p7.columnCount do
			t["Filler" .. i_1] = reactModule.createElement(view, { tag = "size-full-0", LayoutOrder = i_1 })
		end
	end
	return reactModule.createElement(view, {
		tag = "row flex-x-fill gap-medium size-full-0 auto-y",
		LayoutOrder = p7.LayoutOrder,
		onAbsoluteSizeChanged = var5
	}, t)
end)