local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local shopItemTileModule = require(inExperienceShop.Components.ShopItemTile)
local robuxPackageTileContainerModule = require(inExperienceShop.Components.RobuxPackageTileContainer)
local _ = require(inExperienceShop.Components.ItemRow)
local computeRobuxPackageMediaHeightScale = require(inExperienceShop.Components.computeShopRowTileWidths).computeRobuxPackageMediaHeightScale
local fFlagEnableInExperienceShopUnifiedLoggingModule = require(inExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
local fFlagPassShopPurchaseSurfaceToBuyModal = require(parent.SharedFlags).FFlagPassShopPurchaseSurfaceToBuyModal
local _ = require(inExperienceShop.Types)
local findSectionModule = require(inExperienceShop.Utils.findSection)
local var1 = if fFlagPassShopPurchaseSurfaceToBuyModal then require(inExperienceShop.Analytics.Constants).ShopPageType else nil
local _ = require(script.Parent.CategoryPageView)
local t = {}

local function _(p1)
	return {
		ShrinkRatio = 1,
		FlexMode = Enum.UIFlexMode.Custom,
		GrowRatio = p1,
		ItemLineAlignment = Enum.ItemLineAlignment.Stretch
	}
end

local _ = function()
	return {
		GrowRatio = 0,
		ShrinkRatio = 0,
		FlexMode = Enum.UIFlexMode.None,
		ItemLineAlignment = Enum.ItemLineAlignment.Stretch
	}
end

local _ = function(p1, p2, p3)
	return if p3 == nil or p3.rowWidth <= 0 then nil elseif p3.isFeaturedDoubleWidthRobux(p1, p2) and p3.featuredRobuxWidth ~= nil then p3.featuredRobuxWidth else p3.shopWidth
end

local _ = function(p1)
	-- upvalues: computeRobuxPackageMediaHeightScale (ref)
	return if p1 == nil or p1.shopWidth <= 0 then nil else computeRobuxPackageMediaHeightScale(p1.shopWidth, p1.gap)
end

local function tileWrapperProps(p1, p2)
	return if p1 == nil or p1 <= 0 then {
		tag = "size-full-0 auto-y",
		Size = UDim2.fromOffset(0, 0),
		flexItem = {
			ShrinkRatio = 1,
			FlexMode = Enum.UIFlexMode.Custom,
			GrowRatio = p2,
			ItemLineAlignment = Enum.ItemLineAlignment.Stretch
		}
	} else {
		tag = "size-full-0 auto-y",
		Size = UDim2.fromOffset(p1, 0),
		flexItem = {
			GrowRatio = 0,
			ShrinkRatio = 0,
			FlexMode = Enum.UIFlexMode.None,
			ItemLineAlignment = Enum.ItemLineAlignment.Stretch
		}
	}
end

local _ = function(p1)
	return {
		id = p1.id,
		name = tostring(p1.robuxAmount),
		thumbnail = p1.robuxImage
	}
end

local _ = function(p1, p2, p3)
	return {
		categoryId = p3,
		gridPositionRow = if p2 then p2.gridPositionRow else nil,
		gridPositionColumn = p1
	}
end

return function(p1)
	-- upvalues: reactModule (ref), findSectionModule (ref), t (ref), tileWrapperProps (ref), view (ref), robuxPackageTileContainerModule (ref), computeRobuxPackageMediaHeightScale (ref), shopItemTileModule (ref), var1 (ref), fFlagEnableInExperienceShopUnifiedLoggingModule (ref)
	local var2 = reactModule.useMemo(function()
		-- upvalues: findSectionModule (copy), p1 (ref)
		return findSectionModule(p1.sections, p1.sectionId)
	end, { p1.sections, p1.sectionId })
	local var3 = if var2 ~= nil then t else var2.items
	local var4 = if var2 ~= nil then nil else var2.robuxPackages
	local var5 = if var2 ~= nil then nil else var2.featuredRobuxPackage
	local var6 = if var2 ~= nil then nil else var2.paymentSessionId
	local var7 = var4 ~= nil and #var4 > 0
	local var8 = var5 ~= nil
	local onItemActivated = p1.onItemActivated
	local var9 = reactModule.useMemo(function()
		-- upvalues: var7 (ref), var4 (ref), var5 (ref), var3 (ref)
		if var7 then
			local var10 = var4
			local list = table.create(#var10)
			
			for i = 1, #var10 do
				local var11 = var10[i]
				list[i] = {
					id = var11.id,
					name = tostring(var11.robuxAmount),
					thumbnail = var11.robuxImage
				}
			end
			return list
		elseif var5 == nil then
			return var3
		end
		local list = table.create(#var3 + 1)
		list[1] = {
			id = var5.id,
			name = tostring(var5.robuxAmount),
			thumbnail = var5.robuxImage
		}
		
		for i_1 = 1, #var3 do
			list[i_1 + 1] = var3[i_1]
		end
		return list
	end, { var3, var4, var5, var7 })
	local var12 = reactModule.useMemo(function()
		-- upvalues: var7 (ref), var4 (ref), var5 (ref)
		if var7 then
			local t = {}
			
			for i, v in var4 do
				t[v.id] = v
			end
			return t
		elseif var5 == nil then
			return nil
		end
		local var13 = var5
		
		return { [var13.id] = var13 }
	end, { var4, var5, var7 })
	local var14 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: p1 (ref), var12 (ref), var7 (ref), var8 (ref), tileWrapperProps (copy), reactModule (copy), view (copy), robuxPackageTileContainerModule (copy), var6 (ref), onItemActivated (ref), computeRobuxPackageMediaHeightScale (copy), shopItemTileModule (copy), onItemActivated (ref), var1 (copy)
		local t = {
			categoryId = p1.sectionId,
			gridPositionRow = if p4 then p4.gridPositionRow else nil,
			gridPositionColumn = p3
		}
		local var15 = if var12 ~= nil then nil else var12[p2.id]
		
		if var15 == nil then
			local var16 = tileWrapperProps(if p4 == nil or p4.rowWidth <= 0 then nil elseif p4.isFeaturedDoubleWidthRobux(p2, p3) and p4.featuredRobuxWidth ~= nil then p4.featuredRobuxWidth else p4.shopWidth, 1)
			
			return reactModule.createElement(view, {
				tag = var16.tag,
				Size = var16.Size,
				flexItem = var16.flexItem,
				LayoutOrder = p3
			}, {
				Tile = reactModule.createElement(shopItemTileModule, {
					itemId = p2.id,
					itemType = p2.itemType,
					name = p2.name,
					thumbnail = p2.thumbnail,
					price = p2.price,
					userBasePriceInRobux = p2.userBasePriceInRobux,
					universeId = p2.universeId,
					categoryId = t.categoryId,
					gridPositionRow = t.gridPositionRow,
					gridPositionColumn = t.gridPositionColumn,
					onItemActivated = onItemActivated,
					shopPageType = if var1 then var1.Category else nil
				})
			})
		end
		local var17 = tileWrapperProps(if p4 == nil or p4.rowWidth <= 0 then nil elseif p4.isFeaturedDoubleWidthRobux(p2, p3) and p4.featuredRobuxWidth ~= nil then p4.featuredRobuxWidth else p4.shopWidth, if var7 or var8 and p3 == 1 then 2 else 1)
		
		return reactModule.createElement(view, {
			tag = var17.tag,
			Size = var17.Size,
			flexItem = var17.flexItem,
			LayoutOrder = p3
		}, {
			Tile = reactModule.createElement(robuxPackageTileContainerModule, {
				pkg = var15,
				paymentSessionId = var6,
				onBonusItemActivated = onItemActivated,
				mediaHeightScale = if p4 == nil or p4.shopWidth <= 0 then nil else computeRobuxPackageMediaHeightScale(p4.shopWidth, p4.gap),
				categoryId = t.categoryId,
				gridPositionRow = t.gridPositionRow,
				gridPositionColumn = t.gridPositionColumn
			})
		})
	end, {
		var12, onItemActivated, onItemActivated, var7, var8, var6, p1.sectionId
	})
	
	return {
		items = var9,
		itemsPerRow = p1.itemsPerRow,
		sectionId = p1.sectionId,
		onItemActivated = onItemActivated,
		renderTile = if fFlagEnableInExperienceShopUnifiedLoggingModule then var14 elseif var12 ~= nil then nil else var14,
		isFeaturedDoubleWidthRobux = reactModule.useMemo(function()
			-- upvalues: var7 (ref), var8 (ref), var5 (ref)
			if var7 then
				return function(_, _)
					return true
				end
			elseif var8 then
				local id = var5.id
				
				return function(p2, p3)
					-- upvalues: id (ref)
					return p3 == 1 and p2.id == id
				end
			end
			return nil
		end, { var7, var8, var5 }),
		LayoutOrder = p1.LayoutOrder
	}
end