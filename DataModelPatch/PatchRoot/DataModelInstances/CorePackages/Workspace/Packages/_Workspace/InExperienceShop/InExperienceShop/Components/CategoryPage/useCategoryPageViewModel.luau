local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local ShopItemTileModule = require(InExperienceShop.Components.ShopItemTile)
local RobuxPackageTileContainerModule = require(InExperienceShop.Components.RobuxPackageTileContainer)
local _ = require(InExperienceShop.Components.ItemRow)
local ComputeRobuxPackageMediaHeightScaleFunction = require(InExperienceShop.Components.computeShopRowTileWidths).computeRobuxPackageMediaHeightScale
local FFlagEnableInExperienceShopUnifiedLoggingModule = require(InExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
local _ = require(InExperienceShop.Types)
local FindSectionModule = require(InExperienceShop.Utils.findSection)
local _ = require(script.Parent.CategoryPageView)
local t = {}

local function _(GrowRatio)
	return {
		ShrinkRatio = 1,
		FlexMode = Enum.UIFlexMode.Custom,
		GrowRatio = GrowRatio,
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
	-- upvalues: ComputeRobuxPackageMediaHeightScaleFunction (copy)
	return if p1 == nil or p1.shopWidth <= 0 then nil else ComputeRobuxPackageMediaHeightScaleFunction(p1.shopWidth, p1.gap)
end

local function tileWrapperProps(XOffset: number, GrowRatio)
	return if XOffset == nil or XOffset <= 0 then {
		tag = "size-full-0 auto-y",
		Size = UDim2.fromOffset(0, 0),
		flexItem = {
			ShrinkRatio = 1,
			FlexMode = Enum.UIFlexMode.Custom,
			GrowRatio = GrowRatio,
			ItemLineAlignment = Enum.ItemLineAlignment.Stretch
		}
	} else {
		tag = "size-full-0 auto-y",
		Size = UDim2.fromOffset(XOffset, 0),
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

local _ = function(GridPositionColumn, p1, CategoryId)
	return {
		categoryId = CategoryId,
		gridPositionRow = if p1 then p1.gridPositionRow else nil,
		gridPositionColumn = GridPositionColumn
	}
end

return function(Frame)
	-- upvalues: ReactModule (copy), FindSectionModule (copy), t (copy), tileWrapperProps (copy), View (copy), RobuxPackageTileContainerModule (copy), ComputeRobuxPackageMediaHeightScaleFunction (copy), ShopItemTileModule (copy), FFlagEnableInExperienceShopUnifiedLoggingModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FindSectionModule (upval), Frame (copy)
		return FindSectionModule(Frame.sections, Frame.sectionId)
	end, { Frame.sections, Frame.sectionId })
	local T = if UseMemoResult == nil then t else UseMemoResult.items
	local RobuxPackages = if UseMemoResult == nil then nil else UseMemoResult.robuxPackages
	local FeaturedRobuxPackage = if UseMemoResult == nil then nil else UseMemoResult.featuredRobuxPackage
	local PaymentSessionId = if UseMemoResult == nil then nil else UseMemoResult.paymentSessionId
	local v1: boolean = RobuxPackages ~= nil and #RobuxPackages > 0
	local HasFeaturedRobuxPackage = FeaturedRobuxPackage ~= nil
	local OnItemActivated = Frame.onItemActivated
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: v1 (copy), RobuxPackages (copy), FeaturedRobuxPackage (copy)
		if not v1 then
			return if FeaturedRobuxPackage == nil then nil else { [FeaturedRobuxPackage.id] = FeaturedRobuxPackage }
		end
		local t = {}
		
		for _, robuxPackage in RobuxPackages do
			t[robuxPackage.id] = robuxPackage
		end
		return t
	end, { RobuxPackages, FeaturedRobuxPackage, v1 })
	local UseResult = ReactModule.useCallback(function(p1, LayoutOrder, p2)
		-- upvalues: Frame (copy), UseMemoResult1 (copy), v1 (copy), HasFeaturedRobuxPackage (copy), tileWrapperProps (upval), ReactModule (upval), View (upval), RobuxPackageTileContainerModule (upval), PaymentSessionId (copy), OnItemActivated (copy), ComputeRobuxPackageMediaHeightScaleFunction (upval), ShopItemTileModule (upval), OnItemActivated (copy)
		local config = {
			categoryId = Frame.sectionId,
			gridPositionRow = if p2 then p2.gridPositionRow else nil,
			gridPositionColumn = LayoutOrder
		}
		local UseMemoResultEntry = if UseMemoResult1 == nil then nil else UseMemoResult1[p1.id]
		
		if UseMemoResultEntry == nil then
			local TileWrapperPropsResult = tileWrapperProps(if p2 == nil or p2.rowWidth <= 0 then nil elseif p2.isFeaturedDoubleWidthRobux(p1, LayoutOrder) and p2.featuredRobuxWidth ~= nil then p2.featuredRobuxWidth else p2.shopWidth, 1)
			
			return ReactModule.createElement(View, {
				tag = TileWrapperPropsResult.tag,
				Size = TileWrapperPropsResult.Size,
				flexItem = TileWrapperPropsResult.flexItem,
				LayoutOrder = LayoutOrder
			}, {
				Tile = ReactModule.createElement(ShopItemTileModule, {
					itemId = p1.id,
					itemType = p1.itemType,
					name = p1.name,
					thumbnail = p1.thumbnail,
					price = p1.price,
					universeId = p1.universeId,
					categoryId = config.categoryId,
					gridPositionRow = config.gridPositionRow,
					gridPositionColumn = config.gridPositionColumn,
					onItemActivated = OnItemActivated
				})
			})
		else
			local V24 = v1 or HasFeaturedRobuxPackage and LayoutOrder == 1
			local TileWrapperPropsResult = tileWrapperProps(if p2 == nil or p2.rowWidth <= 0 then nil elseif p2.isFeaturedDoubleWidthRobux(p1, LayoutOrder) and p2.featuredRobuxWidth ~= nil then p2.featuredRobuxWidth else p2.shopWidth, if V24 then 2 else 1)
			
			return ReactModule.createElement(View, {
				tag = TileWrapperPropsResult.tag,
				Size = TileWrapperPropsResult.Size,
				flexItem = TileWrapperPropsResult.flexItem,
				LayoutOrder = LayoutOrder
			}, {
				Tile = ReactModule.createElement(RobuxPackageTileContainerModule, {
					pkg = UseMemoResultEntry,
					paymentSessionId = PaymentSessionId,
					onBonusItemActivated = OnItemActivated,
					mediaHeightScale = if p2 == nil or p2.shopWidth <= 0 then nil else ComputeRobuxPackageMediaHeightScaleFunction(p2.shopWidth, p2.gap),
					categoryId = config.categoryId,
					gridPositionRow = config.gridPositionRow,
					gridPositionColumn = config.gridPositionColumn
				})
			})
		end
	end, {
		UseMemoResult1, OnItemActivated, OnItemActivated, v1, HasFeaturedRobuxPackage,
		PaymentSessionId, Frame.sectionId
	})
	
	return {
		items = ReactModule.useMemo(function()
			-- upvalues: v1 (copy), RobuxPackages (copy), FeaturedRobuxPackage (copy), T (copy)
			if v1 then
				local Buffer = table.create(#RobuxPackages)
				
				for i = 1, #RobuxPackages do
					local RobuxPackage = RobuxPackages[i]
					Buffer[i] = {
						id = RobuxPackage.id,
						name = tostring(RobuxPackage.robuxAmount),
						thumbnail = RobuxPackage.robuxImage
					}
				end
				return Buffer
			else
				if FeaturedRobuxPackage == nil then
					return T
				end
				local Buffer = table.create(#T + 1)
				Buffer[1] = {
					id = FeaturedRobuxPackage.id,
					name = tostring(FeaturedRobuxPackage.robuxAmount),
					thumbnail = FeaturedRobuxPackage.robuxImage
				}
				
				for i1 = 1, #T do
					Buffer[i1 + 1] = T[i1]
				end
				return Buffer
			end
		end, { T, RobuxPackages, FeaturedRobuxPackage, v1 }),
		itemsPerRow = Frame.itemsPerRow,
		sectionId = Frame.sectionId,
		onItemActivated = OnItemActivated,
		renderTile = if FFlagEnableInExperienceShopUnifiedLoggingModule then UseResult elseif UseMemoResult1 == nil then nil else UseResult,
		isFeaturedDoubleWidthRobux = ReactModule.useMemo(function()
			-- upvalues: v1 (copy), HasFeaturedRobuxPackage (copy), FeaturedRobuxPackage (copy)
			if v1 then
				return function(_, _): boolean
					return true
				end
			elseif HasFeaturedRobuxPackage then
				local Id = FeaturedRobuxPackage.id
				
				return function(p1, p2): boolean
					-- upvalues: Id (copy)
					return p2 == 1 and p1.id == Id
				end
			else
				return nil
			end
		end, { v1, HasFeaturedRobuxPackage, FeaturedRobuxPackage }),
		LayoutOrder = Frame.LayoutOrder
	}
end