local parent = script.Parent.Parent
local promiseModule = require(parent.Promise)
local purchaseWarningModule = require(parent.Enums.PurchaseWarning)
local fFlagRefreshPriceOnRetryAfterUpsellModule = require(parent.Flags.FFlagRefreshPriceOnRetryAfterUpsell)

local function getABTestGroup()
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve(false)
end

local function getProductInfo(_, _)
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve({
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

local function getPlayerOwns(_, _, _)
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve(false)
end

local function performPurchase(_, _, _, _)
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve({
		success = true,
		purchased = true,
		receipt = "fake-receipt-hash"
	})
end

local function loadAssetForEquip(_)
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve(Instance.new("Tool"))
end

local function getAccountInfo()
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve({ isPremium = false })
end

local function getBalanceInfo()
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve({ robux = 2147483647 })
end

local function getBundleDetails(_)
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve({
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

local function getProductPurchasableDetails(_)
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve({ purchasable = false, reason = "mock-reason", price = 100 })
end

local function getCatalogItemDetails(_, _)
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve({
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

local function getResellers(_, _)
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve({ nextPageCursor = nil, data = {} })
end

local function getRobuxUpsellProductWithUniverseItemInfo(_, _, _, _, _, _)
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve({
		roblox_product_id = 50,
		provider_product_id = "robux50",
		roblox_product_name = "providerRobux50",
		robux_amount = 500
	})
end

local function postPremiumImpression()
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve()
end

local function getPremiumUpsellPrecheck()
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve(true)
end

local function getPurchaseWarning(_)
	-- upvalues: promiseModule (ref), purchaseWarningModule (ref)
	return promiseModule.resolve({ action = purchaseWarningModule.NoAction })
end

local function postPurchaseWarningAcknowledge()
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve()
end

local function checkUserPurchaseSettings()
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve({ isEligible = false, failureReason = "PurchaseNotEnabled" })
end

local function getUnifiedPurchaseFlowUserEligibility()
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve({
		isUserEligibleForUnifiedPurchaseFlow = true,
		expiresInSeconds = 120
	})
end

local function getSubscriptionProductInfo(_)
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve({
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

local function GetLookDetailsV2ProductInfo(_)
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve({
		look = {
			items = { { id = 1, itemType = "Asset", priceInRobux = 100 } }
		}
	})
end

local t = {}
t.__index = t

function t.new(p1, p2)
	-- upvalues: promiseModule (ref), fFlagRefreshPriceOnRetryAfterUpsellModule (ref), getABTestGroup (ref), getProductInfo (ref), getPlayerOwns (ref), performPurchase (ref), loadAssetForEquip (ref), getAccountInfo (ref), getBalanceInfo (ref), getBundleDetails (ref), getProductPurchasableDetails (ref), getCatalogItemDetails (ref), getResellers (ref), getRobuxUpsellProductWithUniverseItemInfo (ref), postPremiumImpression (ref), getPremiumUpsellPrecheck (ref), getPurchaseWarning (ref), postPurchaseWarningAcknowledge (ref), checkUserPurchaseSettings (ref), getUnifiedPurchaseFlowUserEligibility (ref), getSubscriptionProductInfo (ref), GetLookDetailsV2ProductInfo (ref)
	local t
	local _ = nil
	
	if p2 or p1 then
		local var1 = function()
			-- upvalues: p1 (ref), promiseModule (copy), p2 (ref)
			return if p1 then promiseModule.resolve(p1) else promiseModule.reject(p2)
		end
		
		t = {
			getABTestGroup = var1,
			getProductInfo = var1,
			getPlayerOwns = var1,
			performPurchase = var1,
			loadAssetForEquip = var1,
			getAccountInfo = var1,
			getBalanceInfo = var1,
			getBundleDetails = var1,
			getProductPurchasableDetails = var1,
			getCatalogItemDetails = if fFlagRefreshPriceOnRetryAfterUpsellModule then var1 else nil,
			getResellers = if fFlagRefreshPriceOnRetryAfterUpsellModule then var1 else nil,
			getRobuxUpsellProductWithUniverseItemInfo = var1,
			postPremiumImpression = var1,
			getPremiumUpsellPrecheck = var1,
			getPurchaseWarning = var1,
			postPurchaseWarningAcknowledge = var1,
			checkUserPurchaseSettings = var1,
			getUnifiedPurchaseFlowUserEligibility = var1,
			getSubscriptionProductInfo = var1
		}
	else
		t = {
			getABTestGroup = getABTestGroup,
			getProductInfo = getProductInfo,
			getPlayerOwns = getPlayerOwns,
			performPurchase = performPurchase,
			loadAssetForEquip = loadAssetForEquip,
			getAccountInfo = getAccountInfo,
			getBalanceInfo = getBalanceInfo,
			getBundleDetails = getBundleDetails,
			getProductPurchasableDetails = getProductPurchasableDetails,
			getCatalogItemDetails = if fFlagRefreshPriceOnRetryAfterUpsellModule then getCatalogItemDetails else nil,
			getResellers = if fFlagRefreshPriceOnRetryAfterUpsellModule then getResellers else nil,
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
	setmetatable(t, {
		__tostring = function()
			return "MockService(Network)"
		end
	})
	
	return t
end

return t