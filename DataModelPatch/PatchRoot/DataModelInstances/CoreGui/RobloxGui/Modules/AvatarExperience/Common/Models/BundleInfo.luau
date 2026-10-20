local CorePackages = game:GetService("CorePackages")
local TutilsModule = require(CorePackages.Packages.tutils)
local GenerateStringIdFunction = require(CorePackages.Workspace.Packages.AppCommonLib).GenerateStringId
local ItemTileEnums = require(CorePackages.Packages.UIBlox).Tile.ItemTileEnums
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.Common.Types)
local ModelsUtilsModule = require(script.Parent.ModelsUtils)
local FixEmptyLimitedBadgesForBundles = game:DefineFastFlag("FixEmptyLimitedBadgesForBundles", false)
local AXFixBundleVerifiedBadgeInWidgets = game:DefineFastFlag("AXFixBundleVerifiedBadgeInWidgets", false)
local AXFixFreeBundlePriceText = game:DefineFastFlag("AXFixFreeBundlePriceText", false)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)

local function getBundleType(BundleType)
	-- upvalues: ConstantsModule (copy)
	return if BundleType == Enum.BundleType.BodyParts.Name then ConstantsModule.BundleTypeIdStrings.BodyParts elseif BundleType == "AvatarAnimaions" then ConstantsModule.BundleTypeIdStrings.Animations elseif BundleType == Enum.BundleType.Animations.Name then ConstantsModule.BundleTypeIdStrings.Animations elseif BundleType == Enum.BundleType.DynamicHead.Name then ConstantsModule.BundleTypeIdStrings.DynamicHead elseif BundleType == Enum.BundleType.Shoes.Name then ConstantsModule.BundleTypeIdStrings.Shoes else tostring(BundleType)
end

return {
	mock = function()
		-- upvalues: GenerateStringIdFunction (copy)
		return {
			receivedCatalogData = false,
			receivedRecommendedData = false,
			receivedFromRecommendedData = false,
			name = "",
			description = "",
			bundleType = "",
			id = "",
			items = {},
			creator = {
				name = "",
				type = "",
				hasVerifiedBadge = false,
				id = GenerateStringIdFunction()
			},
			priceInRobux = 1,
			isPublicDomain = true,
			product = {
				type = "",
				isForSale = true,
				id = GenerateStringIdFunction()
			},
			recommendedItemSummaries = {},
			favoriteCount = 0,
			priceStatus = "",
			itemRestrictions = {},
			itemStatus = {},
			lowestPrice = nil,
			numberRobloxHasAvailable = nil,
			isForRent = false,
			isOwned = false,
			isPurchasable = false,
			expectedSellerId = GenerateStringIdFunction(),
			collectibleItemId = "0",
			totalQuantity = nil,
			soldCount = 0,
			averagePrice = 0,
			originalPrice = 0,
			premiumPricing = nil
		}
	end,
	fromGetRecommendedItemsDataV2 = function(p1, p2)
		-- upvalues: getBundleType (copy), ModelsUtilsModule (copy)
		local ItemDataFromBundleInfoResult = ModelsUtilsModule.itemDataFromBundleInfo(p1, getBundleType(p1.bundleType), p2)
		ItemDataFromBundleInfoResult.receivedFromRecommendedData = true
		
		return ItemDataFromBundleInfoResult
	end,
	fromHydrateWidgetInfo = function(p1, p2)
		-- upvalues: TutilsModule (copy), AXFixBundleVerifiedBadgeInWidgets (copy), getBundleType (copy), FixEmptyLimitedBadgesForBundles (copy), ItemTileEnums (copy), AXFixFreeBundlePriceText (copy)
		local DeepCopyResult = TutilsModule.deepCopy(if p2 then p2 else {})
		DeepCopyResult.id = tostring(p1.id)
		
		if p1.failedToHydrate then
			DeepCopyResult.failedToHydrate = true
			
			return DeepCopyResult
		end
		DeepCopyResult.name = p1.name
		
		if p1.creatorName then
			DeepCopyResult.creator = {
				name = p1.creatorName,
				hasVerifiedBadge = if AXFixBundleVerifiedBadgeInWidgets and p1.creator then p1.creator.hasVerifiedBadge else nil
			}
		end
		DeepCopyResult.bundleType = getBundleType(p1.bundleType)
		DeepCopyResult.priceInRobux = p1.price
		DeepCopyResult.receivedWidgetHydration = true
		DeepCopyResult.tileRestrictionsMap = if p1.isLimited or p1.isLimitedUnique or p1.isCollectible then {
			[ItemTileEnums.Restriction.Limited] = if p1.isLimited then true else false,
			[ItemTileEnums.Restriction.LimitedUnique] = if p1.isLimitedUnique then true else false,
			[ItemTileEnums.Restriction.Collectible] = if p1.isCollectible then true else false
		} elseif FixEmptyLimitedBadgesForBundles then nil else {}
		
		if AXFixFreeBundlePriceText then
			DeepCopyResult.priceStatus = p1.priceStatus
		end
		return DeepCopyResult
	end,
	fromGetCatalogItemData = function(p1, p2)
		-- upvalues: ModelsUtilsModule (copy), getBundleType (copy)
		local ItemDataFromBundleInfoResult = ModelsUtilsModule.itemDataFromBundleInfo(p1, getBundleType(p1.bundleType), p2)
		ItemDataFromBundleInfoResult.receivedCatalogData = true
		
		return ItemDataFromBundleInfoResult
	end,
	fromRecommendedItemSummaries = function(RecommendedItemSummaries, p1)
		-- upvalues: TutilsModule (copy)
		local DeepCopyResult = TutilsModule.deepCopy(if p1 then p1 else {})
		DeepCopyResult.receivedRecommendedData = true
		DeepCopyResult.recommendedItemSummaries = RecommendedItemSummaries
		
		return DeepCopyResult
	end,
	fromSortResults = function(p1, p2)
		-- upvalues: ModelsUtilsModule (copy), getBundleType (copy)
		local ItemDataFromBundleInfoResult = ModelsUtilsModule.itemDataFromBundleInfo(p1, getBundleType(p1.bundleType), p2)
		ItemDataFromBundleInfoResult.receivedFromSortResults = true
		
		return ItemDataFromBundleInfoResult
	end,
	fromIsOwned = function(IsOwned, p1)
		-- upvalues: TutilsModule (copy)
		local DeepCopyResult = TutilsModule.deepCopy(if p1 then p1 else {})
		DeepCopyResult.isOwned = IsOwned
		
		return DeepCopyResult
	end
}