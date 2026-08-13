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
local var6 = if fFlagPassShopPurchaseSurfaceToBuyModal then require(inExperienceShop.Analytics.Constants).ShopPageType else nil
local _ = require(script.Parent.CategoryPageView)
local t = {}

local function _(p0) --[[ line: 51 | named "shopItemTileFlexItem" ]]
	return {
		ShrinkRatio = 1,
		FlexMode = Enum.UIFlexMode.Custom,
		GrowRatio = p0,
		ItemLineAlignment = Enum.ItemLineAlignment.Stretch
	}
end

local _ = function() --[[ line: 60 | named "explicitWidthFlexItem" ]]
	return {
		GrowRatio = 0,
		ShrinkRatio = 0,
		FlexMode = Enum.UIFlexMode.None,
		ItemLineAlignment = Enum.ItemLineAlignment.Stretch
	}
end

local _ = function(p1, p2, p3) --[[ line: 69 | named "resolveTileWidth" ]]
	return if p3 == nil or p3.rowWidth <= 0 then nil elseif p3.isFeaturedDoubleWidthRobux(p1, p2) and p3.featuredRobuxWidth ~= nil then p3.featuredRobuxWidth else p3.shopWidth
end

local _ = function(p4) --[[ line: 81 | named "resolveRobuxMediaHeightScale" ]]
	-- upvalues: computeRobuxPackageMediaHeightScale (ref)
	return if p4 == nil or p4.shopWidth <= 0 then nil else computeRobuxPackageMediaHeightScale(p4.shopWidth, p4.gap)
end

local function tileWrapperProps(p5, p6) --[[ line: 89 ]]
	return if p5 == nil or p5 <= 0 then {
		tag = "size-full-0 auto-y",
		Size = UDim2.fromOffset(0, 0),
		flexItem = {
			ShrinkRatio = 1,
			FlexMode = Enum.UIFlexMode.Custom,
			GrowRatio = p6,
			ItemLineAlignment = Enum.ItemLineAlignment.Stretch
		}
	} else {
		tag = "size-full-0 auto-y",
		Size = UDim2.fromOffset(p5, 0),
		flexItem = {
			GrowRatio = 0,
			ShrinkRatio = 0,
			FlexMode = Enum.UIFlexMode.None,
			ItemLineAlignment = Enum.ItemLineAlignment.Stretch
		}
	}
end

local _ = function(p7) --[[ line: 105 | named "shopItemFromRobuxPackage" ]]
	return {
		id = p7.id,
		name = tostring(p7.robuxAmount),
		thumbnail = p7.robuxImage
	}
end

local _ = function(p8, p9, p10) --[[ line: 113 | named "getTileLoggingProps" ]]
	return {
		categoryId = p10,
		gridPositionRow = if p9 then p9.gridPositionRow else nil,
		gridPositionColumn = p8
	}
end

return function(p11) --[[ line: 131 | named "useCategoryPageViewModel" ]]
	-- upvalues: reactModule (ref), findSectionModule (ref), t (ref), tileWrapperProps (ref), view (ref), robuxPackageTileContainerModule (ref), computeRobuxPackageMediaHeightScale (ref), shopItemTileModule (ref), var6 (ref), fFlagEnableInExperienceShopUnifiedLoggingModule (ref)
	local var9 = reactModule.useMemo(function() --[[ line: 132 ]]
		-- upvalues: findSectionModule (copy), p11 (ref)
		return findSectionModule(p11.sections, p11.sectionId)
	end, { p11.sections, p11.sectionId })
	local var10 = if var9 ~= nil then t else var9.items
	local var11 = if var9 ~= nil then nil else var9.robuxPackages
	local var12 = if var9 ~= nil then nil else var9.featuredRobuxPackage
	local var13 = if var9 ~= nil then nil else var9.paymentSessionId
	local var14 = var11 ~= nil and #var11 > 0
	local var15 = var12 ~= nil
	local onItemActivated = p11.onItemActivated
	local var16 = reactModule.useMemo(function() --[[ line: 149 ]]
		-- upvalues: var14 (ref), var11 (ref), var12 (ref), var10 (ref)
		if var14 then
			local var19 = var11
			local list = table.create(#var19)
			
			for i = 1, #var19 do
				local var21 = var19[i]
				list[i] = {
					id = var21.id,
					name = tostring(var21.robuxAmount),
					thumbnail = var21.robuxImage
				}
			end
			return list
		elseif var12 == nil then
			return var10
		end
		local list = table.create(#var10 + 1)
		list[1] = {
			id = var12.id,
			name = tostring(var12.robuxAmount),
			thumbnail = var12.robuxImage
		}
		
		for i_1 = 1, #var10 do
			list[i_1 + 1] = var10[i_1]
		end
		return list
	end, { var10, var11, var12, var14 })
	local var17 = reactModule.useMemo(function() --[[ line: 171 ]]
		-- upvalues: var14 (ref), var11 (ref), var12 (ref)
		if var14 then
			local t = {}
			
			for i, v in var11 do
				t[v.id] = v
			end
			return t
		elseif var12 == nil then
			return nil
		end
		local var24 = var12
		
		return { [var24.id] = var24 }
	end, { var11, var12, var14 })
	local var18 = reactModule.useCallback(function(p12, p13, p14) --[[ line: 189 ]]
		-- upvalues: p11 (ref), var17 (ref), var14 (ref), var15 (ref), tileWrapperProps (copy), reactModule (copy), view (copy), robuxPackageTileContainerModule (copy), var13 (ref), onItemActivated (ref), computeRobuxPackageMediaHeightScale (copy), shopItemTileModule (copy), onItemActivated (ref), var6 (copy)
		local t = {
			categoryId = p11.sectionId,
			gridPositionRow = if p14 then p14.gridPositionRow else nil,
			gridPositionColumn = p13
		}
		local var26 = if var17 ~= nil then nil else var17[p12.id]
		
		if var26 == nil then
			local var28 = tileWrapperProps(if p14 == nil or p14.rowWidth <= 0 then nil elseif p14.isFeaturedDoubleWidthRobux(p12, p13) and p14.featuredRobuxWidth ~= nil then p14.featuredRobuxWidth else p14.shopWidth, 1)
			
			return reactModule.createElement(view, {
				tag = var28.tag,
				Size = var28.Size,
				flexItem = var28.flexItem,
				LayoutOrder = p13
			}, {
				Tile = reactModule.createElement(shopItemTileModule, {
					itemId = p12.id,
					itemType = p12.itemType,
					name = p12.name,
					thumbnail = p12.thumbnail,
					price = p12.price,
					userBasePriceInRobux = p12.userBasePriceInRobux,
					universeId = p12.universeId,
					categoryId = t.categoryId,
					gridPositionRow = t.gridPositionRow,
					gridPositionColumn = t.gridPositionColumn,
					onItemActivated = onItemActivated,
					shopPageType = if var6 then var6.Category else nil
				})
			})
		end
		local var27 = tileWrapperProps(if p14 == nil or p14.rowWidth <= 0 then nil elseif p14.isFeaturedDoubleWidthRobux(p12, p13) and p14.featuredRobuxWidth ~= nil then p14.featuredRobuxWidth else p14.shopWidth, if var14 or var15 and p13 == 1 then 2 else 1)
		
		return reactModule.createElement(view, {
			tag = var27.tag,
			Size = var27.Size,
			flexItem = var27.flexItem,
			LayoutOrder = p13
		}, {
			Tile = reactModule.createElement(robuxPackageTileContainerModule, {
				pkg = var26,
				paymentSessionId = var13,
				onBonusItemActivated = onItemActivated,
				mediaHeightScale = if p14 == nil or p14.shopWidth <= 0 then nil else computeRobuxPackageMediaHeightScale(p14.shopWidth, p14.gap),
				categoryId = t.categoryId,
				gridPositionRow = t.gridPositionRow,
				gridPositionColumn = t.gridPositionColumn
			})
		})
	end, {
		var17, onItemActivated, onItemActivated, var14, var15, var13, p11.sectionId
	})
	
	return {
		items = var16,
		itemsPerRow = p11.itemsPerRow,
		sectionId = p11.sectionId,
		onItemActivated = onItemActivated,
		renderTile = if fFlagEnableInExperienceShopUnifiedLoggingModule then var18 elseif var17 ~= nil then nil else var18,
		isFeaturedDoubleWidthRobux = reactModule.useMemo(function() --[[ line: 252 ]]
			-- upvalues: var14 (ref), var15 (ref), var12 (ref)
			if var14 then
				return function(_, _) --[[ line: 254 ]]
					return true
				end
			elseif var15 then
				local id = var12.id
				
				return function(p15, p16) --[[ line: 264 ]]
					-- upvalues: id (ref)
					return p16 == 1 and p15.id == id
				end
			end
			return nil
		end, { var14, var15, var12 }),
		LayoutOrder = p11.LayoutOrder
	}
end