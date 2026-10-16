local Parent = script.Parent.Parent
local PromiseModule = require(Parent.Promise)
local PurchaseWarningModule = require(Parent.Enums.PurchaseWarning)
local FFlagRefreshPriceOnRetryAfterUpsellModule = require(Parent.Flags.FFlagRefreshPriceOnRetryAfterUpsell)

local function getABTestGroup() --[[ Line: 13 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve(false)
end

local function getProductInfo(_, _) --[[ Line: 17 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve({
		AssetId = 1,
		AssetTypeId = 2,
		ContentRatingTypeId = 0,
		Description = "This item isn't real!",
		IconImageAssetId = 1,
		IsForSale = true,
		IsLimited = false,
		IsLimitedUnique = false,
		IsNew = false,
		IsPublicDomain = false,
		MinimumMembershipLevel = 0,
		Name = "Test Item",
		PriceInRobux = 100,
		ProductId = 1,
		Creator = {
			CreatorType = "Group",
			CreatorTargetId = 1,
			Name = "ROBLOX",
			Id = 1
		}
	})
end

local function getPlayerOwns(_, _, _) --[[ Line: 42 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve(false)
end

local function performPurchase(_, _, _, _) --[[ Line: 46 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve({
		success = true,
		purchased = true,
		receipt = "fake-receipt-hash"
	})
end

local function loadAssetForEquip(_) --[[ Line: 54 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve(Instance.new("Tool"))
end

local function getAccountInfo() --[[ Line: 58 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve({ isPremium = false })
end

local function getBalanceInfo() --[[ Line: 64 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve({ robux = 2147483647 })
end

local function getBundleDetails(_) --[[ Line: 70 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve({
		id = 1,
		name = "mock-name",
		description = "mock-description",
		items = {
			[1] = { id = 1, name = "outfit-name", type = "UserOutfit" }
		},
		creator = { id = 1, name = "ROBLOX", type = "User" },
		product = { id = 1, isForSale = true, priceInRobux = 100 }
	})
end

local function getProductPurchasableDetails(_) --[[ Line: 95 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve({ purchasable = false, reason = "mock-reason", price = 100 })
end

local function getCatalogItemDetails(_, _) --[[ Line: 103 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve({
		bundleType = 1,
		collectibleItemId = "random-collectible-item-id-123",
		creatorHasVerifiedBadge = true,
		creatorName = "mockRobloxCreator",
		creatorTargetId = 123,
		creatorType = "User",
		description = "Mock bundle",
		expectedSellerId = 123,
		favoriteCount = 908,
		hasReseller = false,
		id = 123456,
		isPurchasable = true,
		itemType = "Bundle",
		lowestPrice = 175,
		lowestResalePrice = 0,
		name = "Roblox Collectible Bundle",
		owned = false,
		price = 175,
		productId = 1234567890123456,
		purchaseCount = 0,
		saleLocationType = "ShopAndAllExperiences",
		totalQuantity = 0,
		unitsAvailableForConsumption = 0,
		bundledItems = {
			[1] = {
				id = 10001,
				name = "Mock bundle - Left Arm",
				owned = true,
				type = "Asset"
			},
			[2] = {
				id = 1002,
				name = "Mock bundle - Right Leg",
				owned = true,
				type = "Asset"
			},
			[3] = {
				id = 1003,
				name = "Mock bundle - Right Arm",
				owned = true,
				type = "Asset"
			},
			[4] = {
				id = 1004,
				name = "Mock bundle - Left Leg",
				owned = true,
				type = "Asset"
			},
			[5] = {
				id = 1005,
				name = "Mock bundle - Dynamic Head",
				owned = true,
				type = "Asset"
			},
			[6] = {
				id = 1006,
				name = "Default Mood",
				owned = true,
				type = "Asset"
			},
			[7] = {
				id = 1007,
				name = "Mock bundle - Torso",
				owned = true,
				type = "Asset"
			},
			[8] = {
				id = 1008,
				name = "Mock item",
				owned = true,
				type = "UserOutfit"
			},
			[9] = {
				id = 1009,
				name = "Mock bundle Head",
				owned = true,
				type = "UserOutfit"
			}
		},
		itemRestrictions = {},
		itemStatus = {}
	})
end

local function getResellers(_, _) --[[ Line: 189 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve({ nextPageCursor = nil, data = {} })
end

local function getRobuxUpsellProductWithUniverseItemInfo(_, _, _, _, _, _) --[[ Line: 196 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve({
		roblox_product_id = 50,
		provider_product_id = "robux50",
		roblox_product_name = "providerRobux50",
		robux_amount = 500
	})
end

local function postPremiumImpression() --[[ Line: 212 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve()
end

local function getPremiumUpsellPrecheck() --[[ Line: 216 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve(true)
end

local function getPurchaseWarning(_) --[[ Line: 220 ]]
	-- upvalues: PromiseModule (copy), PurchaseWarningModule (copy)
	return PromiseModule.resolve({ action = PurchaseWarningModule.NoAction })
end

local function postPurchaseWarningAcknowledge() --[[ Line: 226 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve()
end

local function checkUserPurchaseSettings() --[[ Line: 230 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve({ isEligible = false, failureReason = "PurchaseNotEnabled" })
end

local function getUnifiedPurchaseFlowUserEligibility() --[[ Line: 237 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve({
		isUserEligibleForUnifiedPurchaseFlow = true,
		expiresInSeconds = 120
	})
end

local function getSubscriptionProductInfo(_) --[[ Line: 244 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve({
		Name = "Mock Subscription",
		Description = "A mock developer subscription",
		IconImageAssetId = 12345,
		IsForSale = true,
		DisplayPrice = "$4.99",
		DisplaySubscriptionPeriod = "/month",
		SubscriptionProviderName = "MockGame",
		PriceTier = 499,
		PriceInRobux = 0
	})
end

local function GetLookDetailsV2ProductInfo(_) --[[ Line: 258 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve({
		look = {
			items = { { id = 1, itemType = "Asset", priceInRobux = 100 } }
		}
	})
end

local MockNetworkModule = {}
MockNetworkModule.__index = MockNetworkModule

function MockNetworkModule.new(p1, p2) --[[ Line: 275 ]]
	-- upvalues: PromiseModule (copy), FFlagRefreshPriceOnRetryAfterUpsellModule (copy), getABTestGroup (copy), getProductInfo (copy), getPlayerOwns (copy), performPurchase (copy), loadAssetForEquip (copy), getAccountInfo (copy), getBalanceInfo (copy), getBundleDetails (copy), getProductPurchasableDetails (copy), getCatalogItemDetails (copy), getResellers (copy), getRobuxUpsellProductWithUniverseItemInfo (copy), postPremiumImpression (copy), getPremiumUpsellPrecheck (copy), getPurchaseWarning (copy), postPurchaseWarningAcknowledge (copy), checkUserPurchaseSettings (copy), getUnifiedPurchaseFlowUserEligibility (copy), getSubscriptionProductInfo (copy), GetLookDetailsV2ProductInfo (copy)
	local config = nil
	if p2 or p1 then
		local function CheckUserPurchaseSettings() --[[ Line: 279 ]]
			-- upvalues: p1 (copy), PromiseModule (upval), p2 (copy)
			return if p1 then PromiseModule.resolve(p1) else PromiseModule.reject(p2)
		end
		
		config = {
			getABTestGroup = CheckUserPurchaseSettings,
			getProductInfo = CheckUserPurchaseSettings,
			getPlayerOwns = CheckUserPurchaseSettings,
			performPurchase = CheckUserPurchaseSettings,
			loadAssetForEquip = CheckUserPurchaseSettings,
			getAccountInfo = CheckUserPurchaseSettings,
			getBalanceInfo = CheckUserPurchaseSettings,
			getBundleDetails = CheckUserPurchaseSettings,
			getProductPurchasableDetails = CheckUserPurchaseSettings,
			getCatalogItemDetails = if FFlagRefreshPriceOnRetryAfterUpsellModule then CheckUserPurchaseSettings else nil,
			getResellers = if FFlagRefreshPriceOnRetryAfterUpsellModule then CheckUserPurchaseSettings else nil,
			getRobuxUpsellProductWithUniverseItemInfo = CheckUserPurchaseSettings,
			postPremiumImpression = CheckUserPurchaseSettings,
			getPremiumUpsellPrecheck = CheckUserPurchaseSettings,
			getPurchaseWarning = CheckUserPurchaseSettings,
			postPurchaseWarningAcknowledge = CheckUserPurchaseSettings,
			checkUserPurchaseSettings = CheckUserPurchaseSettings,
			getUnifiedPurchaseFlowUserEligibility = CheckUserPurchaseSettings,
			getSubscriptionProductInfo = CheckUserPurchaseSettings
		}
	else
		config = {
			getABTestGroup = getABTestGroup,
			getProductInfo = getProductInfo,
			getPlayerOwns = getPlayerOwns,
			performPurchase = performPurchase,
			loadAssetForEquip = loadAssetForEquip,
			getAccountInfo = getAccountInfo,
			getBalanceInfo = getBalanceInfo,
			getBundleDetails = getBundleDetails,
			getProductPurchasableDetails = getProductPurchasableDetails,
			getCatalogItemDetails = if FFlagRefreshPriceOnRetryAfterUpsellModule then getCatalogItemDetails else nil,
			getResellers = if FFlagRefreshPriceOnRetryAfterUpsellModule then getResellers else nil,
			getRobuxUpsellProductWithUniverseItemInfo = getRobuxUpsellProductWithUniverseItemInfo,
			postPremiumImpression = postPremiumImpression,
			getPremiumUpsellPrecheck = getPremiumUpsellPrecheck,
			getPurchaseWarning = getPurchaseWarning,
			postPurchaseWarningAcknowledge = postPurchaseWarningAcknowledge,
			checkUserPurchaseSettings = checkUserPurchaseSettings,
			getUnifiedPurchaseFlowUserEligibility = getUnifiedPurchaseFlowUserEligibility,
			getSubscriptionProductInfo = getSubscriptionProductInfo,
			GetLookDetailsV2ProductInfo = GetLookDetailsV2ProductInfo
		}
	end
	setmetatable(config, {
		__tostring = function(): string --[[ Line: 333 ]]
			return "MockService(Network)"
		end
	})
	
	return config
end

return MockNetworkModule