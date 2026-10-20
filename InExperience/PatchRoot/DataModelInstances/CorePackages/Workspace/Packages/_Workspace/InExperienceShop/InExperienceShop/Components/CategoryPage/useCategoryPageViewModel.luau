local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local ShopItemTileModule = require(InExperienceShop.Components.ShopItemTile)
local RobuxPackageTileContainerModule = require(InExperienceShop.Components.RobuxPackageTileContainer)
local _ = require(InExperienceShop.Components.ItemRow)
local ComputeRobuxPackageMediaHeightScaleFunction = require(InExperienceShop.Components.computeShopRowTileWidths).computeRobuxPackageMediaHeightScale
local FFlagEnableInExperienceShopUnifiedLoggingModule = require(InExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
local FFlagEnableCategoryLoggingInShopModule = require(InExperienceShop.Flags.FFlagEnableCategoryLoggingInShop)
local FFlagEnableShopRobuxBuyTelemetryModule = require(InExperienceShop.Flags.FFlagEnableShopRobuxBuyTelemetry)
local FFlagShopRobuxTermsDisclosureModule = require(InExperienceShop.Flags.FFlagShopRobuxTermsDisclosure)
local ConstantsModule = require(InExperienceShop.Analytics.Constants)
local _ = require(InExperienceShop.Types)
local FindSectionModule = require(InExperienceShop.Utils.findSection)
local ShopPageType = if require(Parent.SharedFlags).FFlagPassShopPurchaseSurfaceToBuyModal then ConstantsModule.ShopPageType else nil
local ShopPageType1 = if FFlagEnableInExperienceShopUnifiedLoggingModule then ConstantsModule.ShopPageType else nil
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

local _ = function(GridPositionColumn, p1, CategoryId, CategoryType, StableCategoryId, CategoryGroup, CategoryName)
	return {
		categoryId = CategoryId,
		categoryType = CategoryType,
		stableCategoryId = StableCategoryId,
		categoryGroup = CategoryGroup,
		categoryName = CategoryName,
		gridPositionRow = if p1 then p1.gridPositionRow else nil,
		gridPositionColumn = GridPositionColumn
	}
end

return function(Frame)
	-- upvalues: ReactModule (copy), FindSectionModule (copy), t (copy), FFlagEnableCategoryLoggingInShopModule (copy), FFlagEnableShopRobuxBuyTelemetryModule (copy), tileWrapperProps (copy), View (copy), RobuxPackageTileContainerModule (copy), ComputeRobuxPackageMediaHeightScaleFunction (copy), ShopPageType1 (copy), ShopItemTileModule (copy), ShopPageType (copy), FFlagEnableInExperienceShopUnifiedLoggingModule (copy), FFlagShopRobuxTermsDisclosureModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FindSectionModule (upval), Frame (copy)
		return FindSectionModule(Frame.sections, Frame.sectionId)
	end, { Frame.sections, Frame.sectionId })
	local T = if UseMemoResult == nil then t else UseMemoResult.items
	local CategoryType = if FFlagEnableCategoryLoggingInShopModule and UseMemoResult ~= nil then UseMemoResult.categoryType else nil
	local StableCategoryId = if FFlagEnableCategoryLoggingInShopModule and UseMemoResult ~= nil then UseMemoResult.stableCategoryId else nil
	local CategoryGroup = if FFlagEnableCategoryLoggingInShopModule and UseMemoResult ~= nil then UseMemoResult.categoryGroup else nil
	local Name = if FFlagEnableCategoryLoggingInShopModule and UseMemoResult ~= nil then UseMemoResult.name else nil
	local RobuxPackages = if UseMemoResult == nil then nil else UseMemoResult.robuxPackages
	local FeaturedRobuxPackage = if UseMemoResult == nil then nil else UseMemoResult.featuredRobuxPackage
	local PaymentSessionId = if UseMemoResult == nil then nil else UseMemoResult.paymentSessionId
	local BonusJwt = if UseMemoResult == nil then nil else UseMemoResult.bonusJwt
	local CategoryType1 = if FFlagEnableShopRobuxBuyTelemetryModule and UseMemoResult ~= nil then UseMemoResult.categoryType else nil
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
		-- upvalues: Frame (copy), CategoryType (copy), StableCategoryId (copy), CategoryGroup (copy), Name (copy), UseMemoResult1 (copy), v1 (copy), HasFeaturedRobuxPackage (copy), tileWrapperProps (upval), ReactModule (upval), View (upval), RobuxPackageTileContainerModule (upval), PaymentSessionId (copy), BonusJwt (copy), OnItemActivated (copy), ComputeRobuxPackageMediaHeightScaleFunction (upval), CategoryType1 (copy), ShopPageType1 (upval), ShopItemTileModule (upval), OnItemActivated (copy), ShopPageType (upval)
		local config = {
			categoryId = Frame.sectionId,
			categoryType = CategoryType,
			stableCategoryId = StableCategoryId,
			categoryGroup = CategoryGroup,
			categoryName = Name,
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
					userBasePriceInRobux = p1.userBasePriceInRobux,
					universeId = p1.universeId,
					categoryId = config.categoryId,
					categoryType = config.categoryType,
					stableCategoryId = config.stableCategoryId,
					categoryGroup = config.categoryGroup,
					categoryName = config.categoryName,
					gridPositionRow = config.gridPositionRow,
					gridPositionColumn = config.gridPositionColumn,
					onItemActivated = OnItemActivated,
					shopPageType = if ShopPageType then ShopPageType.Category else nil
				})
			})
		else
			local V36 = v1 or HasFeaturedRobuxPackage and LayoutOrder == 1
			local TileWrapperPropsResult = tileWrapperProps(if p2 == nil or p2.rowWidth <= 0 then nil elseif p2.isFeaturedDoubleWidthRobux(p1, LayoutOrder) and p2.featuredRobuxWidth ~= nil then p2.featuredRobuxWidth else p2.shopWidth, if V36 then 2 else 1)
			
			return ReactModule.createElement(View, {
				tag = TileWrapperPropsResult.tag,
				Size = TileWrapperPropsResult.Size,
				flexItem = TileWrapperPropsResult.flexItem,
				LayoutOrder = LayoutOrder
			}, {
				Tile = ReactModule.createElement(RobuxPackageTileContainerModule, {
					pkg = UseMemoResultEntry,
					paymentSessionId = PaymentSessionId,
					bonusJwt = BonusJwt,
					onBonusItemActivated = OnItemActivated,
					mediaHeightScale = if p2 == nil or p2.shopWidth <= 0 then nil else ComputeRobuxPackageMediaHeightScaleFunction(p2.shopWidth, p2.gap),
					categoryId = config.categoryId,
					categoryType = if CategoryType1 == nil then config.categoryType else CategoryType1,
					stableCategoryId = config.stableCategoryId,
					categoryGroup = config.categoryGroup,
					categoryName = config.categoryName,
					gridPositionRow = config.gridPositionRow,
					gridPositionColumn = config.gridPositionColumn,
					shopPageType = if ShopPageType1 then ShopPageType1.Category else nil
				})
			})
		end
	end, {
		UseMemoResult1, OnItemActivated, OnItemActivated, v1, HasFeaturedRobuxPackage,
		PaymentSessionId, BonusJwt, CategoryType1, Frame.sectionId, CategoryType,
		StableCategoryId, CategoryGroup, Name
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
		showRobuxTermsDisclosure = FFlagShopRobuxTermsDisclosureModule and v1,
		LayoutOrder = Frame.LayoutOrder
	}
end