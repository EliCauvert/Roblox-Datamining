local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local shopItemTileModule = require(inExperienceShop.Components.ShopItemTile)
local robuxPackageTileContainerModule = require(inExperienceShop.Components.RobuxPackageTileContainer)
local _ = require(inExperienceShop.Components.ItemRow)
local computeRobuxPackageMediaHeightScale = require(inExperienceShop.Components.computeShopRowTileWidths).computeRobuxPackageMediaHeightScale
local fFlagEnableInExperienceShopUnifiedLoggingModule = require(inExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
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

local _ = function(p1, p2, p3)
	return {
		categoryId = p3,
		gridPositionRow = if p2 then p2.gridPositionRow else nil,
		gridPositionColumn = p1
	}
end

return function(p1)
	-- upvalues: reactModule (ref), findSectionModule (ref), t (ref), fFlagEnableShopRobuxBuyTelemetryModule (ref), tileWrapperProps (ref), view (ref), robuxPackageTileContainerModule (ref), computeRobuxPackageMediaHeightScale (ref), var2 (ref), shopItemTileModule (ref), var1 (ref), fFlagEnableInExperienceShopUnifiedLoggingModule (ref), fFlagShopRobuxTermsDisclosureModule (ref)
	local var3 = reactModule.useMemo(function()
		-- upvalues: findSectionModule (copy), p1 (ref)
		return findSectionModule(p1.sections, p1.sectionId)
	end, { p1.sections, p1.sectionId })
	local var4 = if var3 ~= nil then t else var3.items
	local var5 = if var3 ~= nil then nil else var3.robuxPackages
	local var6 = if var3 ~= nil then nil else var3.featuredRobuxPackage
	local var7 = if var3 ~= nil then nil else var3.paymentSessionId
	local var8 = if var3 ~= nil then nil else var3.bonusJwt
	local var9 = if fFlagEnableShopRobuxBuyTelemetryModule and var3 ~= nil then var3.categoryType else nil
	local var10 = var5 ~= nil and #var5 > 0
	local var11 = var6 ~= nil
	local onItemActivated = p1.onItemActivated
	local var12 = reactModule.useMemo(function()
		-- upvalues: var10 (ref), var5 (ref), var6 (ref), var4 (ref)
		if var10 then
			local var13 = var5
			local list = table.create(#var13)
			
			for i = 1, #var13 do
				local var14 = var13[i]
				list[i] = {
					id = var14.id,
					name = tostring(var14.robuxAmount),
					thumbnail = var14.robuxImage
				}
			end
			return list
		elseif var6 == nil then
			return var4
		end
		local list = table.create(#var4 + 1)
		list[1] = {
			id = var6.id,
			name = tostring(var6.robuxAmount),
			thumbnail = var6.robuxImage
		}
		
		for i_1 = 1, #var4 do
			list[i_1 + 1] = var4[i_1]
		end
		return list
	end, { var4, var5, var6, var10 })
	local var15 = reactModule.useMemo(function()
		-- upvalues: var10 (ref), var5 (ref), var6 (ref)
		if var10 then
			local t = {}
			
			for i, v in var5 do
				t[v.id] = v
			end
			return t
		elseif var6 == nil then
			return nil
		end
		local var16 = var6
		
		return { [var16.id] = var16 }
	end, { var5, var6, var10 })
	local var17 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: p1 (ref), var15 (ref), var10 (ref), var11 (ref), tileWrapperProps (copy), reactModule (copy), view (copy), robuxPackageTileContainerModule (copy), var7 (ref), var8 (ref), onItemActivated (ref), computeRobuxPackageMediaHeightScale (copy), var9 (ref), var2 (copy), shopItemTileModule (copy), onItemActivated (ref), var1 (copy)
		local t = {
			categoryId = p1.sectionId,
			gridPositionRow = if p4 then p4.gridPositionRow else nil,
			gridPositionColumn = p3
		}
		local var18 = if var15 ~= nil then nil else var15[p2.id]
		
		if var18 == nil then
			local var19 = tileWrapperProps(if p4 == nil or p4.rowWidth <= 0 then nil elseif p4.isFeaturedDoubleWidthRobux(p2, p3) and p4.featuredRobuxWidth ~= nil then p4.featuredRobuxWidth else p4.shopWidth, 1)
			
			return reactModule.createElement(view, {
				tag = var19.tag,
				Size = var19.Size,
				flexItem = var19.flexItem,
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
		local var20 = tileWrapperProps(if p4 == nil or p4.rowWidth <= 0 then nil elseif p4.isFeaturedDoubleWidthRobux(p2, p3) and p4.featuredRobuxWidth ~= nil then p4.featuredRobuxWidth else p4.shopWidth, if var10 or var11 and p3 == 1 then 2 else 1)
		
		return reactModule.createElement(view, {
			tag = var20.tag,
			Size = var20.Size,
			flexItem = var20.flexItem,
			LayoutOrder = p3
		}, {
			Tile = reactModule.createElement(robuxPackageTileContainerModule, {
				pkg = var18,
				paymentSessionId = var7,
				bonusJwt = var8,
				onBonusItemActivated = onItemActivated,
				mediaHeightScale = if p4 == nil or p4.shopWidth <= 0 then nil else computeRobuxPackageMediaHeightScale(p4.shopWidth, p4.gap),
				categoryId = t.categoryId,
				categoryType = var9,
				gridPositionRow = t.gridPositionRow,
				gridPositionColumn = t.gridPositionColumn,
				shopPageType = if var2 then var2.Category else nil
			})
		})
	end, {
		var15, onItemActivated, onItemActivated, var10, var11, var7, var8, var9,
		p1.sectionId
	})
	
	return {
		items = var12,
		itemsPerRow = p1.itemsPerRow,
		sectionId = p1.sectionId,
		onItemActivated = onItemActivated,
		renderTile = if fFlagEnableInExperienceShopUnifiedLoggingModule then var17 elseif var15 ~= nil then nil else var17,
		isFeaturedDoubleWidthRobux = reactModule.useMemo(function()
			-- upvalues: var10 (ref), var11 (ref), var6 (ref)
			if var10 then
				return function(_, _)
					return true
				end
			elseif var11 then
				local id = var6.id
				
				return function(p2, p3)
					-- upvalues: id (ref)
					return p3 == 1 and p2.id == id
				end
			end
			return nil
		end, { var10, var11, var6 }),
		showRobuxTermsDisclosure = fFlagShopRobuxTermsDisclosureModule and var10,
		LayoutOrder = p1.LayoutOrder
	}
end