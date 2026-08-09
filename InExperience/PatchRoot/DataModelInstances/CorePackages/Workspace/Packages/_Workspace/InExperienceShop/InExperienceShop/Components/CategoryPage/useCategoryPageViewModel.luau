local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local shopItemTileModule = require(inExperienceShop.Components.ShopItemTile)
local robuxPackageTileContainerModule = require(inExperienceShop.Components.RobuxPackageTileContainer)
local _ = require(inExperienceShop.Components.ItemRow)
local computeRobuxPackageMediaHeightScale = require(inExperienceShop.Components.computeShopRowTileWidths).computeRobuxPackageMediaHeightScale
local fFlagEnableInExperienceShopUnifiedLoggingModule = require(inExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
local _ = require(inExperienceShop.Types)
local findSectionModule = require(inExperienceShop.Utils.findSection)
local _ = require(script.Parent.CategoryPageView)
local t = {}

local function _(p0) --[[ line: 46 | named "shopItemTileFlexItem" ]]
	return {
		ShrinkRatio = 1,
		FlexMode = Enum.UIFlexMode.Custom,
		GrowRatio = p0,
		ItemLineAlignment = Enum.ItemLineAlignment.Stretch
	}
end

local _ = function() --[[ line: 55 | named "explicitWidthFlexItem" ]]
	return {
		GrowRatio = 0,
		ShrinkRatio = 0,
		FlexMode = Enum.UIFlexMode.None,
		ItemLineAlignment = Enum.ItemLineAlignment.Stretch
	}
end

local _ = function(p1, p2, p3) --[[ line: 64 | named "resolveTileWidth" ]]
	return if p3 == nil or p3.rowWidth <= 0 then nil elseif p3.isFeaturedDoubleWidthRobux(p1, p2) and p3.featuredRobuxWidth ~= nil then p3.featuredRobuxWidth else p3.shopWidth
end

local _ = function(p4) --[[ line: 76 | named "resolveRobuxMediaHeightScale" ]]
	-- upvalues: computeRobuxPackageMediaHeightScale (ref)
	return if p4 == nil or p4.shopWidth <= 0 then nil else computeRobuxPackageMediaHeightScale(p4.shopWidth, p4.gap)
end

local function tileWrapperProps(p5, p6) --[[ line: 84 ]]
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

local _ = function(p7) --[[ line: 100 | named "shopItemFromRobuxPackage" ]]
	return {
		id = p7.id,
		name = tostring(p7.robuxAmount),
		thumbnail = p7.robuxImage
	}
end

local _ = function(p8, p9, p10) --[[ line: 108 | named "getTileLoggingProps" ]]
	return {
		categoryId = p10,
		gridPositionRow = if p9 then p9.gridPositionRow else nil,
		gridPositionColumn = p8
	}
end

return function(p11) --[[ line: 126 | named "useCategoryPageViewModel" ]]
	-- upvalues: reactModule (ref), findSectionModule (ref), t (ref), tileWrapperProps (ref), view (ref), robuxPackageTileContainerModule (ref), computeRobuxPackageMediaHeightScale (ref), shopItemTileModule (ref), fFlagEnableInExperienceShopUnifiedLoggingModule (ref)
	local var8 = reactModule.useMemo(function() --[[ line: 127 ]]
		-- upvalues: findSectionModule (copy), p11 (ref)
		return findSectionModule(p11.sections, p11.sectionId)
	end, { p11.sections, p11.sectionId })
	local var9 = if var8 ~= nil then t else var8.items
	local var10 = if var8 ~= nil then nil else var8.robuxPackages
	local var11 = if var8 ~= nil then nil else var8.featuredRobuxPackage
	local var12 = if var8 ~= nil then nil else var8.paymentSessionId
	local var13 = var10 ~= nil and #var10 > 0
	local var14 = var11 ~= nil
	local onItemActivated = p11.onItemActivated
	local var15 = reactModule.useMemo(function() --[[ line: 144 ]]
		-- upvalues: var13 (ref), var10 (ref), var11 (ref), var9 (ref)
		if var13 then
			local var18 = var10
			local list = table.create(#var18)
			
			for i = 1, #var18 do
				local var20 = var18[i]
				list[i] = {
					id = var20.id,
					name = tostring(var20.robuxAmount),
					thumbnail = var20.robuxImage
				}
			end
			return list
		elseif var11 == nil then
			return var9
		end
		local list = table.create(#var9 + 1)
		list[1] = {
			id = var11.id,
			name = tostring(var11.robuxAmount),
			thumbnail = var11.robuxImage
		}
		
		for i_1 = 1, #var9 do
			list[i_1 + 1] = var9[i_1]
		end
		return list
	end, { var9, var10, var11, var13 })
	local var16 = reactModule.useMemo(function() --[[ line: 166 ]]
		-- upvalues: var13 (ref), var10 (ref), var11 (ref)
		if var13 then
			local t = {}
			
			for i, v in var10 do
				t[v.id] = v
			end
			return t
		elseif var11 == nil then
			return nil
		end
		local var23 = var11
		
		return { [var23.id] = var23 }
	end, { var10, var11, var13 })
	local var17 = reactModule.useCallback(function(p12, p13, p14) --[[ line: 184 ]]
		-- upvalues: p11 (ref), var16 (ref), var13 (ref), var14 (ref), tileWrapperProps (copy), reactModule (copy), view (copy), robuxPackageTileContainerModule (copy), var12 (ref), onItemActivated (ref), computeRobuxPackageMediaHeightScale (copy), shopItemTileModule (copy), onItemActivated (ref)
		local t = {
			categoryId = p11.sectionId,
			gridPositionRow = if p14 then p14.gridPositionRow else nil,
			gridPositionColumn = p13
		}
		local var25 = if var16 ~= nil then nil else var16[p12.id]
		
		if var25 == nil then
			local var27 = tileWrapperProps(if p14 == nil or p14.rowWidth <= 0 then nil elseif p14.isFeaturedDoubleWidthRobux(p12, p13) and p14.featuredRobuxWidth ~= nil then p14.featuredRobuxWidth else p14.shopWidth, 1)
			
			return reactModule.createElement(view, {
				tag = var27.tag,
				Size = var27.Size,
				flexItem = var27.flexItem,
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
					onItemActivated = onItemActivated
				})
			})
		end
		local var26 = tileWrapperProps(if p14 == nil or p14.rowWidth <= 0 then nil elseif p14.isFeaturedDoubleWidthRobux(p12, p13) and p14.featuredRobuxWidth ~= nil then p14.featuredRobuxWidth else p14.shopWidth, if var13 or var14 and p13 == 1 then 2 else 1)
		
		return reactModule.createElement(view, {
			tag = var26.tag,
			Size = var26.Size,
			flexItem = var26.flexItem,
			LayoutOrder = p13
		}, {
			Tile = reactModule.createElement(robuxPackageTileContainerModule, {
				pkg = var25,
				paymentSessionId = var12,
				onBonusItemActivated = onItemActivated,
				mediaHeightScale = if p14 == nil or p14.shopWidth <= 0 then nil else computeRobuxPackageMediaHeightScale(p14.shopWidth, p14.gap),
				categoryId = t.categoryId,
				gridPositionRow = t.gridPositionRow,
				gridPositionColumn = t.gridPositionColumn
			})
		})
	end, {
		var16, onItemActivated, onItemActivated, var13, var14, var12, p11.sectionId
	})
	
	return {
		items = var15,
		itemsPerRow = p11.itemsPerRow,
		sectionId = p11.sectionId,
		onItemActivated = onItemActivated,
		renderTile = if fFlagEnableInExperienceShopUnifiedLoggingModule then var17 elseif var16 ~= nil then nil else var17,
		isFeaturedDoubleWidthRobux = reactModule.useMemo(function() --[[ line: 245 ]]
			-- upvalues: var13 (ref), var14 (ref), var11 (ref)
			if var13 then
				return function(_, _) --[[ line: 247 ]]
					return true
				end
			elseif var14 then
				local id = var11.id
				
				return function(p15, p16) --[[ line: 257 ]]
					-- upvalues: id (ref)
					return p16 == 1 and p15.id == id
				end
			end
			return nil
		end, { var13, var14, var11 }),
		LayoutOrder = p11.LayoutOrder
	}
end