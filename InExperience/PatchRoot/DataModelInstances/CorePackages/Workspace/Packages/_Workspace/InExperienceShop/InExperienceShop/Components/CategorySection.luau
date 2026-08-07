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
local var8 = if fFlagEnableInExperienceShopUnifiedLoggingModule then require(inExperienceShop.Analytics) else nil
local var9 = if var8 then var8.Constants.ShopPageType else nil
local var10 = if fFlagPassShopPurchaseSurfaceToBuyModal then require(inExperienceShop.Analytics.Constants).ShopPageType else nil
local useShopImpressionsDetectorModule = require(inExperienceShop.Hooks.useShopImpressionsDetector)
local _ = require(inExperienceShop.Types)

local function _(p0) --[[ line: 52 | named "shopItemTileFlexItem" ]]
	return {
		ShrinkRatio = 1,
		FlexMode = Enum.UIFlexMode.Custom,
		GrowRatio = p0,
		ItemLineAlignment = Enum.ItemLineAlignment.Stretch
	}
end

local _ = function() --[[ line: 61 | named "explicitWidthFlexItem" ]]
	return {
		GrowRatio = 0,
		ShrinkRatio = 0,
		FlexMode = Enum.UIFlexMode.None,
		ItemLineAlignment = Enum.ItemLineAlignment.Stretch
	}
end

local _ = function(p1, p2, p3) --[[ line: 70 | named "resolveTileWidth" ]]
	return if p3 == nil or p3.rowWidth <= 0 then nil elseif p3.isFeaturedDoubleWidthRobux(p1, p2) and p3.featuredRobuxWidth ~= nil then p3.featuredRobuxWidth else p3.shopWidth
end

local _ = function(p4) --[[ line: 82 | named "resolveRobuxMediaHeightScale" ]]
	-- upvalues: computeRobuxPackageMediaHeightScale (ref)
	return if p4 == nil or p4.shopWidth <= 0 then nil else computeRobuxPackageMediaHeightScale(p4.shopWidth, p4.gap)
end

local function tileWrapperProps(p5, p6) --[[ line: 90 ]]
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

local _ = function(p7) --[[ line: 106 | named "shopItemFromRobuxPackage" ]]
	return {
		id = p7.id,
		name = tostring(p7.robuxAmount),
		thumbnail = p7.robuxImage
	}
end

local _ = function(p8, p9, p10) --[[ line: 114 | named "getTileLoggingProps" ]]
	return {
		categoryId = p10,
		gridPositionRow = if p9 then p9.gridPositionRow else nil,
		gridPositionColumn = p8
	}
end

return reactModule.memo(function(p11) --[[ line: 132 | named "CategorySection" ]]
	-- upvalues: useShopImpressionsDetectorModule (ref), var9 (ref), reactModule (ref), constantsModule (ref), tileWrapperProps (ref), view (ref), robuxPackageTileContainerModule (ref), computeRobuxPackageMediaHeightScale (ref), shopItemTileModule (ref), var10 (ref), sectionTitleModule (ref), itemGridModule (ref), fFlagEnableInExperienceShopUnifiedLoggingModule (ref)
	local var13 = p11.robuxPackages ~= nil and #p11.robuxPackages > 0
	local featuredRobuxPackage = p11.featuredRobuxPackage
	local var14 = featuredRobuxPackage ~= nil
	local onItemActivated = p11.onItemActivated
	local var15 = useShopImpressionsDetectorModule({
		pageType = if var9 then var9.Home else "",
		isPageActive = p11.isPageVisible ~= false,
		externalScrollSignal = p11.scrollImpressionsSignal
	})
	local var16 = reactModule.useMemo(function() --[[ line: 148 ]]
		-- upvalues: var13 (ref), p11 (ref), constantsModule (copy)
		if var13 then
			local robuxPackages = p11.robuxPackages
			local minValue = math.min(#robuxPackages, constantsModule.ITEMS_PER_SECTION, math.floor(p11.itemsPerRow / 2))
			local list = table.create(minValue)
			
			for i = 1, minValue do
				local var21 = robuxPackages[i]
				list[i] = {
					id = var21.id,
					name = tostring(var21.robuxAmount),
					thumbnail = var21.robuxImage
				}
			end
			return list
		elseif p11.featuredRobuxPackage == nil then
			return table.move(p11.items, 1, math.min(#p11.items, constantsModule.ITEMS_PER_SECTION, p11.itemsPerRow), 1, {})
		end
		local minValue = math.min(#p11.items, constantsModule.ITEMS_PER_SECTION, math.max(p11.itemsPerRow - 2, 0))
		local list = table.create(minValue + 1)
		local featuredRobuxPackage = p11.featuredRobuxPackage
		list[1] = {
			id = featuredRobuxPackage.id,
			name = tostring(featuredRobuxPackage.robuxAmount),
			thumbnail = featuredRobuxPackage.robuxImage
		}
		
		for i_1 = 1, minValue do
			list[i_1 + 1] = p11.items[i_1]
		end
		return list
	end, {
		p11.items, p11.robuxPackages, p11.featuredRobuxPackage, p11.itemsPerRow, var13,
		var14
	})
	local var17 = reactModule.useMemo(function() --[[ line: 189 ]]
		-- upvalues: var13 (ref), p11 (ref)
		if var13 then
			local t = {}
			
			for i, v in p11.robuxPackages do
				t[v.id] = v
			end
			return t
		elseif p11.featuredRobuxPackage == nil then
			return nil
		end
		local featuredRobuxPackage = p11.featuredRobuxPackage
		
		return { [featuredRobuxPackage.id] = featuredRobuxPackage }
	end, { p11.robuxPackages, p11.featuredRobuxPackage, var13 })
	local var18 = reactModule.useCallback(function(p12, p13, p14) --[[ line: 207 ]]
		-- upvalues: p11 (ref), var17 (ref), var13 (ref), var14 (ref), tileWrapperProps (copy), reactModule (copy), view (copy), robuxPackageTileContainerModule (copy), onItemActivated (ref), computeRobuxPackageMediaHeightScale (copy), shopItemTileModule (copy), onItemActivated (ref), var10 (copy)
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
					universeId = p12.universeId,
					categoryId = t.categoryId,
					gridPositionRow = t.gridPositionRow,
					gridPositionColumn = t.gridPositionColumn,
					onItemActivated = onItemActivated,
					shopPageType = if var10 then var10.Home else nil
				})
			})
		end
		local var27 = tileWrapperProps(if p14 == nil or p14.rowWidth <= 0 then nil elseif p14.isFeaturedDoubleWidthRobux(p12, p13) and p14.featuredRobuxWidth ~= nil then p14.featuredRobuxWidth else p14.shopWidth, if var13 or var14 and p13 == 1 then 2 else 1)
		
		return reactModule.createElement(view, {
			tag = var27.tag,
			Size = var27.Size,
			flexItem = var27.flexItem,
			LayoutOrder = p13
		}, {
			Tile = reactModule.createElement(robuxPackageTileContainerModule, {
				pkg = var26,
				paymentSessionId = p11.paymentSessionId,
				onBonusItemActivated = onItemActivated,
				mediaHeightScale = if p14 == nil or p14.shopWidth <= 0 then nil else computeRobuxPackageMediaHeightScale(p14.shopWidth, p14.gap),
				categoryId = t.categoryId,
				gridPositionRow = t.gridPositionRow,
				gridPositionColumn = t.gridPositionColumn
			})
		})
	end, {
		var17, onItemActivated, onItemActivated, var13, var14, p11.paymentSessionId,
		p11.sectionId
	})
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-bottom-xlarge",
		LayoutOrder = p11.LayoutOrder
	}, {
		Title = reactModule.createElement(sectionTitleModule, {
			LayoutOrder = 1,
			title = p11.title,
			onActivated = if p11.onCategoryActivated then reactModule.useCallback(function() --[[ line: 286 ]]
				-- upvalues: p11 (ref)
				if p11.onCategoryActivated then
					p11.onCategoryActivated(p11.sectionId)
				end
			end, { p11.sectionId, p11.onCategoryActivated }) else nil
		}),
		Grid = reactModule.createElement(itemGridModule, {
			LayoutOrder = 2,
			items = var16,
			itemsPerRow = p11.itemsPerRow,
			sectionId = p11.sectionId,
			onItemActivated = onItemActivated,
			renderTile = if fFlagEnableInExperienceShopUnifiedLoggingModule then var18 elseif var17 ~= nil then nil else var18,
			isFeaturedDoubleWidthRobux = reactModule.useMemo(function() --[[ line: 269 ]]
				-- upvalues: var13 (ref), var14 (ref), featuredRobuxPackage (ref)
				if var13 then
					return function(_, _) --[[ line: 271 ]]
						return true
					end
				elseif var14 then
					local id = featuredRobuxPackage.id
					
					return function(p15, p16) --[[ line: 281 ]]
						-- upvalues: id (ref)
						return p16 == 1 and p15.id == id
					end
				end
				return nil
			end, { var13, var14, featuredRobuxPackage }),
			gridRef = if fFlagEnableInExperienceShopUnifiedLoggingModule then var15.gridRef else nil,
			onGridLayoutChange = if fFlagEnableInExperienceShopUnifiedLoggingModule then var15.onLayoutChange else nil
		}),
		ImpressionsDetector = if fFlagEnableInExperienceShopUnifiedLoggingModule then var15.impressionsDetector else nil
	})
end)