local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local shopItemTileModule = require(inExperienceShop.Components.ShopItemTile)
local _ = require(inExperienceShop.Types)
local computeShopRowTileWidths = require(inExperienceShop.Components.computeShopRowTileWidths).computeShopRowTileWidths

local function defaultRenderTile(p0, p1, _, p2, p3, p4, p5) --[[ line: 40 ]]
	-- upvalues: reactModule (ref), shopItemTileModule (ref)
	return reactModule.createElement(shopItemTileModule, {
		itemId = p0.id,
		itemType = p0.itemType,
		name = p0.name,
		thumbnail = p0.thumbnail,
		price = p0.price,
		userBasePriceInRobux = p0.userBasePriceInRobux,
		universeId = p0.universeId,
		categoryId = p4,
		gridPositionRow = if p2 then p2.gridPositionRow else nil,
		gridPositionColumn = p1,
		onItemActivated = p3,
		shopPageType = p5,
		LayoutOrder = p1
	})
end

local function buildTileLayoutContext(p6, p7, p8, p9, p10, p11) --[[ line: 68 ]]
	-- upvalues: computeShopRowTileWidths (ref)
	local var6 = false
	
	for i, v in p6 do
		if p11(v, i) then
			var6 = true
			break
		end
	end
	local var7 = computeShopRowTileWidths(p8, p9, p7, var6)
	
	return {
		rowWidth = p8,
		gap = p9,
		shopWidth = var7.shopWidth,
		featuredRobuxWidth = var7.featuredRobuxWidth,
		gridPositionRow = p10,
		isFeaturedDoubleWidthRobux = p11
	}
end

local function _(p12) --[[ line: 102 | named "makeChildKey" ]]
	return "Item:" .. tostring(p12.itemType) .. ":" .. p12.id
end

return reactModule.memo(function(p13) --[[ line: 106 | named "ItemRow" ]]
	-- upvalues: useTokens (ref), reactModule (ref), buildTileLayoutContext (ref), defaultRenderTile (ref), view (ref)
	local medium = useTokens().Gap.Medium
	local var8, var9 = reactModule.useState(0)
	local var10 = reactModule.useCallback(function(p14) --[[ line: 111 ]]
		-- upvalues: var9 (ref)
		local x = p14.AbsoluteSize.X
		
		if x == 0 then
			return
		end
		var9(x)
	end, {})
	local isFeaturedDoubleWidthRobux = p13.isFeaturedDoubleWidthRobux or function(_, _) --[[ line: 120 ]]
		return false
	end
	local var12 = reactModule.useMemo(function() --[[ line: 124 ]]
		-- upvalues: buildTileLayoutContext (copy), p13 (ref), var8 (ref), medium (ref), isFeaturedDoubleWidthRobux (ref)
		return buildTileLayoutContext(p13.items, p13.columnCount, var8, medium, p13.rowIndex, isFeaturedDoubleWidthRobux)
	end, {
		p13.items, p13.columnCount, var8, medium, p13.rowIndex,
		isFeaturedDoubleWidthRobux
	})
	local var13 = p13.renderTile ~= nil and var8 > 0
	local t = {}
	
	for i, v in p13.items do
		local text = "Item:" .. tostring(v.itemType) .. ":" .. v.id
		
		if p13.renderTile then
			t[text] = p13.renderTile(v, i, var12)
		else
			t[text] = defaultRenderTile(v, i, p13.columnCount, var12, p13.onItemActivated, p13.sectionId, p13.shopPageType)
		end
	end
	if not var13 then
		for i_1 = #p13.items + 1, p13.columnCount do
			t["Filler" .. i_1] = reactModule.createElement(view, { tag = "size-full-0", LayoutOrder = i_1 })
		end
	end
	return reactModule.createElement(view, {
		tag = "row flex-x-fill gap-medium size-full-0 auto-y",
		LayoutOrder = p13.LayoutOrder,
		onAbsoluteSizeChanged = var10
	}, t)
end)