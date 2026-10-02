local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local shopItemTileModule = require(inExperienceShop.Components.ShopItemTile)
local robuxPackageTileContainerModule = require(inExperienceShop.Components.RobuxPackageTileContainer)
local _ = require(inExperienceShop.Components.ItemRow)
local computeRobuxPackageMediaHeightScale = require(inExperienceShop.Components.computeShopRowTileWidths).computeRobuxPackageMediaHeightScale
local fFlagEnableInExperienceShopUnifiedLoggingModule = require(inExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
local fFlagEnableCategoryLoggingInShopModule = require(inExperienceShop.Flags.FFlagEnableCategoryLoggingInShop)
local fFlagEnableShopRobuxBuyTelemetryModule = require(inExperienceShop.Flags.FFlagEnableShopRobuxBuyTelemetry)
local fFlagShopRobuxTermsDisclosureModule = require(inExperienceShop.Flags.FFlagShopRobuxTermsDisclosure)
local constantsModule = require(inExperienceShop.Analytics.Constants)
local fFlagPassShopPurchaseSurfaceToBuyModal = require(parent.SharedFlags).FFlagPassShopPurchaseSurfaceToBuyModal
local _ = require(inExperienceShop.Types)
local findSectionModule = require(inExperienceShop.Utils.findSection)
local var1 = if fFlagPassShopPurchaseSurfaceToBuyModal then constantsModule.ShopPageType else nil
local var2 = if fFlagEnableInExperienceShopUnifiedLoggingModule then constantsModule.ShopPageType else nil
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

local _ = function(p1, p2, p3, p4, p5, p6, p7)
	return {
		categoryId = p3,
		categoryType = p4,
		stableCategoryId = p5,
		categoryGroup = p6,
		categoryName = p7,
		gridPositionRow = if p2 then p2.gridPositionRow else nil,
		gridPositionColumn = p1
	}
end

return function(p1)
	-- upvalues: reactModule (ref), findSectionModule (ref), t (ref), fFlagEnableCategoryLoggingInShopModule (ref), fFlagEnableShopRobuxBuyTelemetryModule (ref), tileWrapperProps (ref), view (ref), robuxPackageTileContainerModule (ref), computeRobuxPackageMediaHeightScale (ref), var2 (ref), shopItemTileModule (ref), var1 (ref), fFlagEnableInExperienceShopUnifiedLoggingModule (ref), fFlagShopRobuxTermsDisclosureModule (ref)
	local var3 = reactModule.useMemo(function()
		-- upvalues: findSectionModule (copy), p1 (ref)
		return findSectionModule(p1.sections, p1.sectionId)
	end, { p1.sections, p1.sectionId })
	local var4 = if var3 ~= nil then t else var3.items
	local var5 = if fFlagEnableCategoryLoggingInShopModule and var3 ~= nil then var3.categoryType else nil
	local var6 = if fFlagEnableCategoryLoggingInShopModule and var3 ~= nil then var3.stableCategoryId else nil
	local var7 = if fFlagEnableCategoryLoggingInShopModule and var3 ~= nil then var3.categoryGroup else nil
	local var8 = if fFlagEnableCategoryLoggingInShopModule and var3 ~= nil then var3.name else nil
	local var9 = if var3 ~= nil then nil else var3.robuxPackages
	local var10 = if var3 ~= nil then nil else var3.featuredRobuxPackage
	local var11 = if var3 ~= nil then nil else var3.paymentSessionId
	local var12 = if var3 ~= nil then nil else var3.bonusJwt
	local var13 = if fFlagEnableShopRobuxBuyTelemetryModule and var3 ~= nil then var3.categoryType else nil
	local var14 = var9 ~= nil and #var9 > 0
	local var15 = var10 ~= nil
	local onItemActivated = p1.onItemActivated
	local var16 = reactModule.useMemo(function()
		-- upvalues: var14 (ref), var9 (ref), var10 (ref), var4 (ref)
		if var14 then
			local var17 = var9
			local list = table.create(#var17)
			
			for i = 1, #var17 do
				local var18 = var17[i]
				list[i] = {
					id = var18.id,
					name = tostring(var18.robuxAmount),
					thumbnail = var18.robuxImage
				}
			end
			return list
		elseif var10 == nil then
			return var4
		end
		local list = table.create(#var4 + 1)
		list[1] = {
			id = var10.id,
			name = tostring(var10.robuxAmount),
			thumbnail = var10.robuxImage
		}
		
		for i_1 = 1, #var4 do
			list[i_1 + 1] = var4[i_1]
		end
		return list
	end, { var4, var9, var10, var14 })
	local var19 = reactModule.useMemo(function()
		-- upvalues: var14 (ref), var9 (ref), var10 (ref)
		if var14 then
			local t = {}
			
			for i, v in var9 do
				t[v.id] = v
			end
			return t
		elseif var10 == nil then
			return nil
		end
		local var20 = var10
		
		return { [var20.id] = var20 }
	end, { var9, var10, var14 })
	local var21 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: p1 (ref), var5 (ref), var6 (ref), var7 (ref), var8 (ref), var19 (ref), var14 (ref), var15 (ref), tileWrapperProps (copy), reactModule (copy), view (copy), robuxPackageTileContainerModule (copy), var11 (ref), var12 (ref), onItemActivated (ref), computeRobuxPackageMediaHeightScale (copy), var13 (ref), var2 (copy), shopItemTileModule (copy), onItemActivated (ref), var1 (copy)
		local t = {
			categoryId = p1.sectionId,
			categoryType = var5,
			stableCategoryId = var6,
			categoryGroup = var7,
			categoryName = var8,
			gridPositionRow = if p4 then p4.gridPositionRow else nil,
			gridPositionColumn = p3
		}
		local var22 = if var19 ~= nil then nil else var19[p2.id]
		
		if var22 == nil then
			local var23 = tileWrapperProps(if p4 == nil or p4.rowWidth <= 0 then nil elseif p4.isFeaturedDoubleWidthRobux(p2, p3) and p4.featuredRobuxWidth ~= nil then p4.featuredRobuxWidth else p4.shopWidth, 1)
			
			return reactModule.createElement(view, {
				tag = var23.tag,
				Size = var23.Size,
				flexItem = var23.flexItem,
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
					categoryType = t.categoryType,
					stableCategoryId = t.stableCategoryId,
					categoryGroup = t.categoryGroup,
					categoryName = t.categoryName,
					gridPositionRow = t.gridPositionRow,
					gridPositionColumn = t.gridPositionColumn,
					onItemActivated = onItemActivated,
					shopPageType = if var1 then var1.Category else nil
				})
			})
		end
		local var24 = tileWrapperProps(if p4 == nil or p4.rowWidth <= 0 then nil elseif p4.isFeaturedDoubleWidthRobux(p2, p3) and p4.featuredRobuxWidth ~= nil then p4.featuredRobuxWidth else p4.shopWidth, if var14 or var15 and p3 == 1 then 2 else 1)
		
		return reactModule.createElement(view, {
			tag = var24.tag,
			Size = var24.Size,
			flexItem = var24.flexItem,
			LayoutOrder = p3
		}, {
			Tile = reactModule.createElement(robuxPackageTileContainerModule, {
				pkg = var22,
				paymentSessionId = var11,
				bonusJwt = var12,
				onBonusItemActivated = onItemActivated,
				mediaHeightScale = if p4 == nil or p4.shopWidth <= 0 then nil else computeRobuxPackageMediaHeightScale(p4.shopWidth, p4.gap),
				categoryId = t.categoryId,
				categoryType = if var13 ~= nil then t.categoryType else var13,
				stableCategoryId = t.stableCategoryId,
				categoryGroup = t.categoryGroup,
				categoryName = t.categoryName,
				gridPositionRow = t.gridPositionRow,
				gridPositionColumn = t.gridPositionColumn,
				shopPageType = if var2 then var2.Category else nil
			})
		})
	end, {
		var19, onItemActivated, onItemActivated, var14, var15, var11, var12, var13,
		p1.sectionId, var5, var6, var7, var8
	})
	
	return {
		items = var16,
		itemsPerRow = p1.itemsPerRow,
		sectionId = p1.sectionId,
		onItemActivated = onItemActivated,
		renderTile = if fFlagEnableInExperienceShopUnifiedLoggingModule then var21 elseif var19 ~= nil then nil else var21,
		isFeaturedDoubleWidthRobux = reactModule.useMemo(function()
			-- upvalues: var14 (ref), var15 (ref), var10 (ref)
			if var14 then
				return function(_, _)
					return true
				end
			elseif var15 then
				local id = var10.id
				
				return function(p2, p3)
					-- upvalues: id (ref)
					return p3 == 1 and p2.id == id
				end
			end
			return nil
		end, { var14, var15, var10 }),
		showRobuxTermsDisclosure = fFlagShopRobuxTermsDisclosureModule and var14,
		LayoutOrder = p1.LayoutOrder
	}
end