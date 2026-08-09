local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local shopItemTileModule = require(inExperienceShop.Components.ShopItemTile)
local _ = require(inExperienceShop.Types)
local computeShopRowTileWidths = require(inExperienceShop.Components.computeShopRowTileWidths).computeShopRowTileWidths

local function defaultRenderTile(p0, p1, _, p2, p3, p4) --[[ line: 39 ]]
	-- upvalues: reactModule (ref), shopItemTileModule (ref)
	return reactModule.createElement(shopItemTileModule, {
		itemId = p0.id,
		itemType = p0.itemType,
		name = p0.name,
		thumbnail = p0.thumbnail,
		price = p0.price,
		universeId = p0.universeId,
		categoryId = p4,
		gridPositionRow = if p2 then p2.gridPositionRow else nil,
		gridPositionColumn = p1,
		onItemActivated = p3,
		LayoutOrder = p1
	})
end

local function buildTileLayoutContext(p5, p6, p7, p8, p9, p10) --[[ line: 64 ]]
	-- upvalues: computeShopRowTileWidths (ref)
	local var6 = false
	
	for i, v in p5 do
		if p10(v, i) then
			var6 = true
			break
		end
	end
	local var7 = computeShopRowTileWidths(p7, p8, p6, var6)
	
	return {
		rowWidth = p7,
		gap = p8,
		shopWidth = var7.shopWidth,
		featuredRobuxWidth = var7.featuredRobuxWidth,
		gridPositionRow = p9,
		isFeaturedDoubleWidthRobux = p10
	}
end

local function _(p11) --[[ line: 98 | named "makeChildKey" ]]
	return "Item:" .. tostring(p11.itemType) .. ":" .. p11.id
end

return reactModule.memo(function(p12) --[[ line: 102 | named "ItemRow" ]]
	-- upvalues: useTokens (ref), reactModule (ref), buildTileLayoutContext (ref), defaultRenderTile (ref), view (ref)
	local medium = useTokens().Gap.Medium
	local var8, var9 = reactModule.useState(0)
	local var10 = reactModule.useCallback(function(p13) --[[ line: 107 ]]
		-- upvalues: var9 (ref)
		local x = p13.AbsoluteSize.X
		
		if x == 0 then
			return
		end
		var9(x)
	end, {})
	local isFeaturedDoubleWidthRobux = p12.isFeaturedDoubleWidthRobux or function(_, _) --[[ line: 116 ]]
		return false
	end
	local var12 = reactModule.useMemo(function() --[[ line: 120 ]]
		-- upvalues: buildTileLayoutContext (copy), p12 (ref), var8 (ref), medium (ref), isFeaturedDoubleWidthRobux (ref)
		return buildTileLayoutContext(p12.items, p12.columnCount, var8, medium, p12.rowIndex, isFeaturedDoubleWidthRobux)
	end, {
		p12.items, p12.columnCount, var8, medium, p12.rowIndex,
		isFeaturedDoubleWidthRobux
	})
	local var13 = p12.renderTile ~= nil and var8 > 0
	local t = {}
	
	for i, v in p12.items do
		local text = "Item:" .. tostring(v.itemType) .. ":" .. v.id
		
		if p12.renderTile then
			t[text] = p12.renderTile(v, i, var12)
		else
			t[text] = defaultRenderTile(v, i, p12.columnCount, var12, p12.onItemActivated, p12.sectionId)
		end
	end
	if not var13 then
		for i_1 = #p12.items + 1, p12.columnCount do
			t["Filler" .. i_1] = reactModule.createElement(view, { tag = "size-full-0", LayoutOrder = i_1 })
		end
	end
	return reactModule.createElement(view, {
		tag = "row flex-x-fill gap-medium size-full-0 auto-y",
		LayoutOrder = p12.LayoutOrder,
		onAbsoluteSizeChanged = var10
	}, t)
end)