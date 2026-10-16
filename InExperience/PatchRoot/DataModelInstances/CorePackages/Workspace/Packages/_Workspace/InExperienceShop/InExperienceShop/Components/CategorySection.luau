local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local SectionTitleModule = require(InExperienceShop.Components.SectionTitle)
local ItemGridModule = require(InExperienceShop.Components.ItemGrid)
local ShopItemTileModule = require(InExperienceShop.Components.ShopItemTile)
local RobuxPackageTileContainerModule = require(InExperienceShop.Components.RobuxPackageTileContainer)
local _ = require(InExperienceShop.Components.ItemRow)
local ConstantsModule = require(InExperienceShop.Constants)
local ComputeRobuxPackageMediaHeightScaleFunction = require(InExperienceShop.Components.computeShopRowTileWidths).computeRobuxPackageMediaHeightScale
local FFlagEnableInExperienceShopUnifiedLoggingModule = require(InExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
local FFlagEnableCategoryLoggingInShopModule = require(InExperienceShop.Flags.FFlagEnableCategoryLoggingInShop)
local FFlagPassShopPurchaseSurfaceToBuyModal = require(Parent.SharedFlags).FFlagPassShopPurchaseSurfaceToBuyModal
local AnalyticsModule = if FFlagEnableInExperienceShopUnifiedLoggingModule then require(InExperienceShop.Analytics) else nil
local ShopPageType = if AnalyticsModule then AnalyticsModule.Constants.ShopPageType else nil
local ShopPageType1 = if FFlagPassShopPurchaseSurfaceToBuyModal then require(InExperienceShop.Analytics.Constants).ShopPageType else nil
local UseShopImpressionsDetectorModule = require(InExperienceShop.Hooks.useShopImpressionsDetector)
local _ = require(InExperienceShop.Types)

local function _(GrowRatio) --[[ Line: 58 | Named "shopItemTileFlexItem" ]]
	return {
		ShrinkRatio = 1,
		FlexMode = Enum.UIFlexMode.Custom,
		GrowRatio = GrowRatio,
		ItemLineAlignment = Enum.ItemLineAlignment.Stretch
	}
end

local _ = function() --[[ Line: 67 | Named "explicitWidthFlexItem" ]]
	return {
		GrowRatio = 0,
		ShrinkRatio = 0,
		FlexMode = Enum.UIFlexMode.None,
		ItemLineAlignment = Enum.ItemLineAlignment.Stretch
	}
end

local _ = function(p1, p2, p3) --[[ Line: 76 | Named "resolveTileWidth" ]]
	return if p3 == nil or p3.rowWidth <= 0 then nil elseif p3.isFeaturedDoubleWidthRobux(p1, p2) and p3.featuredRobuxWidth ~= nil then p3.featuredRobuxWidth else p3.shopWidth
end

local _ = function(p1) --[[ Line: 88 | Named "resolveRobuxMediaHeightScale" ]]
	-- upvalues: ComputeRobuxPackageMediaHeightScaleFunction (copy)
	return if p1 == nil or p1.shopWidth <= 0 then nil else ComputeRobuxPackageMediaHeightScaleFunction(p1.shopWidth, p1.gap)
end

local function tileWrapperProps(XOffset: number, GrowRatio) --[[ Line: 96 ]]
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

local _ = function(p1) --[[ Line: 112 | Named "shopItemFromRobuxPackage" ]]
	return {
		id = p1.id,
		name = tostring(p1.robuxAmount),
		thumbnail = p1.robuxImage
	}
end

local _ = function(GridPositionColumn, p1, CategoryId, CategoryType, StableCategoryId, CategoryGroup, CategoryName) --[[ Line: 120 | Named "getTileLoggingProps" ]]
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

return ReactModule.memo(function(Frame) --[[ Line: 150 | Named "CategorySection" ]]
	-- upvalues: UseShopImpressionsDetectorModule (copy), ShopPageType (copy), ReactModule (copy), ConstantsModule (copy), FFlagEnableCategoryLoggingInShopModule (copy), tileWrapperProps (copy), View (copy), RobuxPackageTileContainerModule (copy), ComputeRobuxPackageMediaHeightScaleFunction (copy), ShopItemTileModule (copy), ShopPageType1 (copy), SectionTitleModule (copy), ItemGridModule (copy), FFlagEnableInExperienceShopUnifiedLoggingModule (copy)
	local v1: boolean = Frame.robuxPackages ~= nil and #Frame.robuxPackages > 0
	local FeaturedRobuxPackage = Frame.featuredRobuxPackage
	local HasFeaturedRobuxPackage = FeaturedRobuxPackage ~= nil
	local OnItemActivated = Frame.onItemActivated
	local UseShopImpressionsDetectorModuleResult = UseShopImpressionsDetectorModule({
		pageType = if ShopPageType then ShopPageType.Home else "",
		isPageActive = Frame.isPageVisible ~= false,
		externalScrollSignal = Frame.scrollImpressionsSignal
	})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 207 ]]
		-- upvalues: v1 (copy), Frame (copy)
		if v1 then
			local t = {}
			
			for _, robuxPackage in Frame.robuxPackages do
				t[robuxPackage.id] = robuxPackage
			end
			return t
		elseif Frame.featuredRobuxPackage == nil then
			return nil
		else
			local FeaturedRobuxPackage = Frame.featuredRobuxPackage
			
			return { [FeaturedRobuxPackage.id] = FeaturedRobuxPackage }
		end
	end, { Frame.robuxPackages, Frame.featuredRobuxPackage, v1 })
	local UseResult = ReactModule.useCallback(function(p1, LayoutOrder, p2) --[[ Line: 225 ]]
		-- upvalues: Frame (copy), FFlagEnableCategoryLoggingInShopModule (upval), UseMemoResult (copy), v1 (copy), HasFeaturedRobuxPackage (copy), tileWrapperProps (upval), ReactModule (upval), View (upval), RobuxPackageTileContainerModule (upval), OnItemActivated (copy), ComputeRobuxPackageMediaHeightScaleFunction (upval), ShopPageType (upval), ShopItemTileModule (upval), OnItemActivated (copy), ShopPageType1 (upval)
		local config = {
			categoryId = Frame.sectionId,
			categoryType = if FFlagEnableCategoryLoggingInShopModule then Frame.categoryType else nil,
			stableCategoryId = if FFlagEnableCategoryLoggingInShopModule then Frame.stableCategoryId else nil,
			categoryGroup = if FFlagEnableCategoryLoggingInShopModule then Frame.categoryGroup else nil,
			categoryName = if FFlagEnableCategoryLoggingInShopModule then Frame.categoryName else nil,
			gridPositionRow = if p2 then p2.gridPositionRow else nil,
			gridPositionColumn = LayoutOrder
		}
		local UseMemoResultEntry = if UseMemoResult == nil then nil else UseMemoResult[p1.id]
		
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
					shopPageType = if ShopPageType1 then ShopPageType1.Home else nil
				})
			})
		else
			local V25 = v1 or HasFeaturedRobuxPackage and LayoutOrder == 1
			local TileWrapperPropsResult = tileWrapperProps(if p2 == nil or p2.rowWidth <= 0 then nil elseif p2.isFeaturedDoubleWidthRobux(p1, LayoutOrder) and p2.featuredRobuxWidth ~= nil then p2.featuredRobuxWidth else p2.shopWidth, if V25 then 2 else 1)
			
			return ReactModule.createElement(View, {
				tag = TileWrapperPropsResult.tag,
				Size = TileWrapperPropsResult.Size,
				flexItem = TileWrapperPropsResult.flexItem,
				LayoutOrder = LayoutOrder
			}, {
				Tile = ReactModule.createElement(RobuxPackageTileContainerModule, {
					pkg = UseMemoResultEntry,
					paymentSessionId = Frame.paymentSessionId,
					bonusJwt = Frame.bonusJwt,
					onBonusItemActivated = OnItemActivated,
					mediaHeightScale = if p2 == nil or p2.shopWidth <= 0 then nil else ComputeRobuxPackageMediaHeightScaleFunction(p2.shopWidth, p2.gap),
					categoryId = config.categoryId,
					categoryType = Frame.categoryType,
					stableCategoryId = config.stableCategoryId,
					categoryGroup = config.categoryGroup,
					categoryName = config.categoryName,
					gridPositionRow = config.gridPositionRow,
					gridPositionColumn = config.gridPositionColumn,
					shopPageType = if ShopPageType then ShopPageType.Home else nil
				})
			})
		end
	end, {
		UseMemoResult, OnItemActivated, OnItemActivated, v1, HasFeaturedRobuxPackage,
		Frame.paymentSessionId, Frame.bonusJwt, Frame.sectionId, Frame.categoryType,
		Frame.stableCategoryId, Frame.categoryGroup, Frame.categoryName
	})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 328 ]]
		-- upvalues: Frame (copy)
		if Frame.onCategoryActivated then
			Frame.onCategoryActivated(Frame.sectionId)
		end
	end, { Frame.sectionId, Frame.onCategoryActivated })
	
	return ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y padding-bottom-xlarge",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Title = ReactModule.createElement(SectionTitleModule, {
			LayoutOrder = 1,
			title = Frame.title,
			onActivated = if Frame.onCategoryActivated then UseResult1 else nil
		}),
		Grid = ReactModule.createElement(ItemGridModule, {
			LayoutOrder = 2,
			items = ReactModule.useMemo(function() --[[ Line: 166 ]]
				-- upvalues: v1 (copy), Frame (copy), ConstantsModule (upval)
				if v1 then
					local RobuxPackages = Frame.robuxPackages
					local Smallest = math.min(#RobuxPackages, ConstantsModule.ITEMS_PER_SECTION, (math.floor(Frame.itemsPerRow / 2)))
					local Buffer = table.create(Smallest)
					
					for i = 1, Smallest do
						local RobuxPackage = RobuxPackages[i]
						Buffer[i] = {
							id = RobuxPackage.id,
							name = tostring(RobuxPackage.robuxAmount),
							thumbnail = RobuxPackage.robuxImage
						}
					end
					return Buffer
				else
					if Frame.featuredRobuxPackage == nil then
						return table.move(Frame.items, 1, math.min(#Frame.items, ConstantsModule.ITEMS_PER_SECTION, Frame.itemsPerRow), 1, {})
					end
					local Smallest = math.min(#Frame.items, ConstantsModule.ITEMS_PER_SECTION, (math.max(Frame.itemsPerRow - 2, 0)))
					local Buffer = table.create(Smallest + 1)
					local FeaturedRobuxPackage = Frame.featuredRobuxPackage
					Buffer[1] = {
						id = FeaturedRobuxPackage.id,
						name = tostring(FeaturedRobuxPackage.robuxAmount),
						thumbnail = FeaturedRobuxPackage.robuxImage
					}
					
					for i1 = 1, Smallest do
						Buffer[i1 + 1] = Frame.items[i1]
					end
					return Buffer
				end
			end, {
				Frame.items, Frame.robuxPackages, Frame.featuredRobuxPackage,
				Frame.itemsPerRow, v1, HasFeaturedRobuxPackage
			}),
			itemsPerRow = Frame.itemsPerRow,
			sectionId = Frame.sectionId,
			onItemActivated = OnItemActivated,
			renderTile = if FFlagEnableInExperienceShopUnifiedLoggingModule then UseResult elseif UseMemoResult == nil then nil else UseResult,
			isFeaturedDoubleWidthRobux = ReactModule.useMemo(function() --[[ Line: 311 ]]
				-- upvalues: v1 (copy), HasFeaturedRobuxPackage (copy), FeaturedRobuxPackage (copy)
				if v1 then
					return function(_, _): boolean --[[ Line: 313 ]]
						return true
					end
				elseif HasFeaturedRobuxPackage then
					local Id = FeaturedRobuxPackage.id
					
					return function(p1, p2): boolean --[[ Line: 323 ]]
						-- upvalues: Id (copy)
						return p2 == 1 and p1.id == Id
					end
				else
					return nil
				end
			end, { v1, HasFeaturedRobuxPackage, FeaturedRobuxPackage }),
			gridRef = if FFlagEnableInExperienceShopUnifiedLoggingModule then UseShopImpressionsDetectorModuleResult.gridRef else nil,
			onGridLayoutChange = if FFlagEnableInExperienceShopUnifiedLoggingModule then UseShopImpressionsDetectorModuleResult.onLayoutChange else nil
		}),
		ImpressionsDetector = if FFlagEnableInExperienceShopUnifiedLoggingModule then UseShopImpressionsDetectorModuleResult.impressionsDetector else nil
	})
end)