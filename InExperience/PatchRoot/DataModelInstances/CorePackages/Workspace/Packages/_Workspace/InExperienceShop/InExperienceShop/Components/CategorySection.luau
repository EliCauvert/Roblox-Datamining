local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local sectionTitleModule = require(inExperienceShop.Components.SectionTitle)
local itemGridModule = require(inExperienceShop.Components.ItemGrid)
local shopItemTileModule = require(inExperienceShop.Components.ShopItemTile)
local robuxPackageTileContainerModule = require(inExperienceShop.Components.RobuxPackageTileContainer)
local _ = require(inExperienceShop.Components.ItemRow)
local constantsModule = require(inExperienceShop.Constants)
local computeRobuxPackageMediaHeightScale = require(inExperienceShop.Components.computeShopRowTileWidths).computeRobuxPackageMediaHeightScale
local fFlagEnableInExperienceShopUnifiedLoggingModule = require(inExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
local fFlagPassShopPurchaseSurfaceToBuyModal = require(parent.SharedFlags).FFlagPassShopPurchaseSurfaceToBuyModal
local var1 = if fFlagEnableInExperienceShopUnifiedLoggingModule then require(inExperienceShop.Analytics) else nil
local var2 = if var1 then var1.Constants.ShopPageType else nil
local var3 = if fFlagPassShopPurchaseSurfaceToBuyModal then require(inExperienceShop.Analytics.Constants).ShopPageType else nil
local useShopImpressionsDetectorModule = require(inExperienceShop.Hooks.useShopImpressionsDetector)
local _ = require(inExperienceShop.Types)

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

return reactModule.memo(function(p1)
	-- upvalues: useShopImpressionsDetectorModule (ref), var2 (ref), reactModule (ref), constantsModule (ref), tileWrapperProps (ref), view (ref), robuxPackageTileContainerModule (ref), computeRobuxPackageMediaHeightScale (ref), shopItemTileModule (ref), var3 (ref), sectionTitleModule (ref), itemGridModule (ref), fFlagEnableInExperienceShopUnifiedLoggingModule (ref)
	local var4 = p1.robuxPackages ~= nil and #p1.robuxPackages > 0
	local featuredRobuxPackage = p1.featuredRobuxPackage
	local var5 = featuredRobuxPackage ~= nil
	local onItemActivated = p1.onItemActivated
	local var6 = useShopImpressionsDetectorModule({
		pageType = if var2 then var2.Home else "",
		isPageActive = p1.isPageVisible ~= false,
		externalScrollSignal = p1.scrollImpressionsSignal
	})
	local var7 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), p1 (ref), constantsModule (copy)
		if var4 then
			local robuxPackages = p1.robuxPackages
			local minValue = math.min(#robuxPackages, constantsModule.ITEMS_PER_SECTION, math.floor(p1.itemsPerRow / 2))
			local list = table.create(minValue)
			
			for i = 1, minValue do
				local var8 = robuxPackages[i]
				list[i] = {
					id = var8.id,
					name = tostring(var8.robuxAmount),
					thumbnail = var8.robuxImage
				}
			end
			return list
		elseif p1.featuredRobuxPackage == nil then
			return table.move(p1.items, 1, math.min(#p1.items, constantsModule.ITEMS_PER_SECTION, p1.itemsPerRow), 1, {})
		end
		local minValue = math.min(#p1.items, constantsModule.ITEMS_PER_SECTION, math.max(p1.itemsPerRow - 2, 0))
		local list = table.create(minValue + 1)
		local featuredRobuxPackage = p1.featuredRobuxPackage
		list[1] = {
			id = featuredRobuxPackage.id,
			name = tostring(featuredRobuxPackage.robuxAmount),
			thumbnail = featuredRobuxPackage.robuxImage
		}
		
		for i_1 = 1, minValue do
			list[i_1 + 1] = p1.items[i_1]
		end
		return list
	end, {
		p1.items, p1.robuxPackages, p1.featuredRobuxPackage, p1.itemsPerRow, var4,
		var5
	})
	local var9 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), p1 (ref)
		if var4 then
			local t = {}
			
			for i, v in p1.robuxPackages do
				t[v.id] = v
			end
			return t
		elseif p1.featuredRobuxPackage == nil then
			return nil
		end
		local featuredRobuxPackage = p1.featuredRobuxPackage
		
		return { [featuredRobuxPackage.id] = featuredRobuxPackage }
	end, { p1.robuxPackages, p1.featuredRobuxPackage, var4 })
	local var10 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: p1 (ref), var9 (ref), var4 (ref), var5 (ref), tileWrapperProps (copy), reactModule (copy), view (copy), robuxPackageTileContainerModule (copy), onItemActivated (ref), computeRobuxPackageMediaHeightScale (copy), shopItemTileModule (copy), onItemActivated (ref), var3 (copy)
		local t = {
			categoryId = p1.sectionId,
			gridPositionRow = if p4 then p4.gridPositionRow else nil,
			gridPositionColumn = p3
		}
		local var11 = if var9 ~= nil then nil else var9[p2.id]
		
		if var11 == nil then
			local var12 = tileWrapperProps(if p4 == nil or p4.rowWidth <= 0 then nil elseif p4.isFeaturedDoubleWidthRobux(p2, p3) and p4.featuredRobuxWidth ~= nil then p4.featuredRobuxWidth else p4.shopWidth, 1)
			
			return reactModule.createElement(view, {
				tag = var12.tag,
				Size = var12.Size,
				flexItem = var12.flexItem,
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
					shopPageType = if var3 then var3.Home else nil
				})
			})
		end
		local var13 = tileWrapperProps(if p4 == nil or p4.rowWidth <= 0 then nil elseif p4.isFeaturedDoubleWidthRobux(p2, p3) and p4.featuredRobuxWidth ~= nil then p4.featuredRobuxWidth else p4.shopWidth, if var4 or var5 and p3 == 1 then 2 else 1)
		
		return reactModule.createElement(view, {
			tag = var13.tag,
			Size = var13.Size,
			flexItem = var13.flexItem,
			LayoutOrder = p3
		}, {
			Tile = reactModule.createElement(robuxPackageTileContainerModule, {
				pkg = var11,
				paymentSessionId = p1.paymentSessionId,
				onBonusItemActivated = onItemActivated,
				mediaHeightScale = if p4 == nil or p4.shopWidth <= 0 then nil else computeRobuxPackageMediaHeightScale(p4.shopWidth, p4.gap),
				categoryId = t.categoryId,
				gridPositionRow = t.gridPositionRow,
				gridPositionColumn = t.gridPositionColumn
			})
		})
	end, {
		var9, onItemActivated, onItemActivated, var4, var5, p1.paymentSessionId,
		p1.sectionId
	})
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-bottom-xlarge",
		LayoutOrder = p1.LayoutOrder
	}, {
		Title = reactModule.createElement(sectionTitleModule, {
			LayoutOrder = 1,
			title = p1.title,
			onActivated = if p1.onCategoryActivated then reactModule.useCallback(function()
				-- upvalues: p1 (ref)
				if p1.onCategoryActivated then
					p1.onCategoryActivated(p1.sectionId)
				end
			end, { p1.sectionId, p1.onCategoryActivated }) else nil
		}),
		Grid = reactModule.createElement(itemGridModule, {
			LayoutOrder = 2,
			items = var7,
			itemsPerRow = p1.itemsPerRow,
			sectionId = p1.sectionId,
			onItemActivated = onItemActivated,
			renderTile = if fFlagEnableInExperienceShopUnifiedLoggingModule then var10 elseif var9 ~= nil then nil else var10,
			isFeaturedDoubleWidthRobux = reactModule.useMemo(function()
				-- upvalues: var4 (ref), var5 (ref), featuredRobuxPackage (ref)
				if var4 then
					return function(_, _)
						return true
					end
				elseif var5 then
					local id = featuredRobuxPackage.id
					
					return function(p2, p3)
						-- upvalues: id (ref)
						return p3 == 1 and p2.id == id
					end
				end
				return nil
			end, { var4, var5, featuredRobuxPackage }),
			gridRef = if fFlagEnableInExperienceShopUnifiedLoggingModule then var6.gridRef else nil,
			onGridLayoutChange = if fFlagEnableInExperienceShopUnifiedLoggingModule then var6.onLayoutChange else nil
		}),
		ImpressionsDetector = if fFlagEnableInExperienceShopUnifiedLoggingModule then var6.impressionsDetector else nil
	})
end)