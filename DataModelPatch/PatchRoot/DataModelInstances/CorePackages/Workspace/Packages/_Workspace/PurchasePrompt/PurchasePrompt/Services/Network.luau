local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local InsertService = game:GetService("InsertService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local CreatorStoreService = game:GetService("CreatorStoreService")
local UrlBuilder = require(Parent.PurchasePromptDeps).UrlBuilder.UrlBuilder
local PromiseModule = require(PurchasePrompt.Promise)
local PremiumProductModule = require(PurchasePrompt.Models.PremiumProduct)
local _ = require(PurchasePrompt.types)
local DebugLogModule = require(PurchasePrompt.Utils.debugLog)
local SerializeTableModule = require(PurchasePrompt.Utils.serializeTable)
local IsGenericChallengeResponseModule = require(PurchasePrompt.Utils.isGenericChallengeResponse)
local EnablePlayerOwnsBundleApiEngineFeature = game:GetEngineFeature("EnablePlayerOwnsBundleApi")
local EnableDevSubscriptionPurchaseWithRobuxEngineFeature = game:GetEngineFeature("EnableDevSubscriptionPurchaseWithRobux")
local GetFFlagEnablePromptPurchaseRequestedV2Module = require(PurchasePrompt.Flags.GetFFlagEnablePromptPurchaseRequestedV2)
local GetFFlagEnablePromptPurchaseRequestedV2Take2Module = require(PurchasePrompt.Flags.GetFFlagEnablePromptPurchaseRequestedV2Take2)
local GetFFlagEnableCreatorStorePurchasingCutoverModule = require(PurchasePrompt.Flags.GetFFlagEnableCreatorStorePurchasingCutover)
local FFlagEnableUnifiedProductPurchaseFlow = require(Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule = require(PurchasePrompt.Flags.FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsell)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = SharedFlagsModule.FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local FFlagEnablePurchasePayloadInExperienceShop = SharedFlagsModule.FFlagEnablePurchasePayloadInExperienceShop
local FFlagRefreshPriceOnRetryAfterUpsellModule = require(PurchasePrompt.Flags.FFlagRefreshPriceOnRetryAfterUpsell)
local FFlagPurchasePromptCartPricingEnabledModule = require(PurchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local Replaced = string.gsub(string.gsub(game:GetService("ContentProvider").BaseUrl:lower(), "/m.", "/www."), "http:", "https:")
local _ = string.gsub(Replaced, "https://www", "https://api")
local Replaced1 = string.gsub(Replaced, "https://www", "https://apis")
local Replaced2 = string.gsub(Replaced, "https://www", "https://games")
local Replaced3 = string.gsub(Replaced, "https://www", "https://abtesting")
local Replaced4 = string.gsub(Replaced, "https://www.", "https://catalog.")
local Replaced5 = string.gsub(Replaced, "https://www.", "https://economy.")
local Replaced6 = string.gsub(Replaced, "https://www.", "https://premiumfeatures.")
local Replaced7 = string.gsub(Replaced, "https://www.", "https://economycreatorstats.")
local Replaced8 = string.gsub(Replaced, "https://www", "https://users")

local function request(Options, Callback1, Callback)
	-- upvalues: DebugLogModule (copy), SerializeTableModule (copy), HttpService (copy)
	DebugLogModule(function(): string
		-- upvalues: Options (copy), SerializeTableModule (upval)
		return "Request " .. Options.Url .. "\n" .. SerializeTableModule(Options)
	end)
	
	return HttpService:RequestInternal(Options):Start(function(p1, p2)
		-- upvalues: DebugLogModule (upval), Options (copy), SerializeTableModule (upval), HttpService (upval), Callback1 (copy), Callback (copy)
		DebugLogModule(function(): string
			-- upvalues: Options (upval), SerializeTableModule (upval), p2 (copy)
			return "Response " .. Options.Url .. "\n" .. SerializeTableModule(p2)
		end)
		
		if not p1 then
			Callback((tostring(p2.StatusMessage)))
			
			return
		end
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, p2.Body)
		
		if Success then
			Callback1(Result)
			
			return
		else
			Callback("Could not parse JSON.")
		end
	end)
end

local function getABTestGroup(SubjectTargetId, ExperimentName)
	-- upvalues: PromiseModule (copy), request (copy), Replaced3 (copy), HttpService (copy)
	local Input = {
		{
			SubjectType = 1,
			ExperimentName = ExperimentName,
			SubjectTargetId = SubjectTargetId
		}
	}
	
	return PromiseModule.new(function(p1, p2)
		-- upvalues: request (upval), Replaced3 (upval), HttpService (upval), Input (copy)
		return request({
			Method = "POST",
			Url = Replaced3 .. "v1/get-enrollments",
			Body = HttpService:JSONEncode(Input),
			Headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}, p1, p2)
	end)
end

local function getProductInfo(AssetId, InfoType)
	-- upvalues: MarketplaceService (copy)
	return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then MarketplaceService:GetProductInfoAsync(AssetId, InfoType) else MarketplaceService:GetProductInfo(AssetId, InfoType)
end

local function getSubscriptionProductInfo(SubscriptionId)
	-- upvalues: MarketplaceService (copy)
	return MarketplaceService:GetSubscriptionProductInfoAsync(SubscriptionId)
end

local function getPremiumProductInfo()
	-- upvalues: PromiseModule (copy), request (copy), Replaced6 (copy), PremiumProductModule (copy), UserInputService (copy)
	return PromiseModule.new(function(Callback, p1)
		-- upvalues: request (upval), Replaced6 (upval), PremiumProductModule (upval), UserInputService (upval)
		request({
			Method = "GET",
			Url = Replaced6 .. "v1/products?typeName=Subscription"
		}, function(p2)
			-- upvalues: PremiumProductModule (upval), UserInputService (upval), Callback (copy)
			local v1 = nil
			
			for _, product in ipairs(p2.products) do
				local PremiumProductModuleResult = PremiumProductModule(product)
				
				if PremiumProductModuleResult ~= nil and (v1 == nil or PremiumProductModuleResult.robuxAmount < v1.robuxAmount) then
					v1 = PremiumProductModuleResult
				end
			end
			if UserInputService:GetPlatform() == Enum.Platform.Android and v1 ~= nil and v1.mobileProductId ~= nil then
				v1.mobileProductId = v1.mobileProductId:lower()
			end
			Callback(v1)
		end, p1)
	end)
end

local function getPlayerOwns(Player, GamePassId, InfoType)
	-- upvalues: MarketplaceService (copy), EnablePlayerOwnsBundleApiEngineFeature (copy)
	return if InfoType == Enum.InfoType.Asset then if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then MarketplaceService:PlayerOwnsAssetAsync(Player, GamePassId) else MarketplaceService:PlayerOwnsAsset(Player, GamePassId) elseif EnablePlayerOwnsBundleApiEngineFeature and InfoType == Enum.InfoType.Bundle then if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then MarketplaceService:PlayerOwnsBundleAsync(Player, GamePassId) else MarketplaceService:PlayerOwnsBundle(Player, GamePassId) elseif InfoType == Enum.InfoType.GamePass then MarketplaceService:UserOwnsGamePassAsync(Player.UserId, GamePassId) else InfoType == Enum.InfoType.Subscription and MarketplaceService:IsPlayerSubscribed(Player, GamePassId)
end

local function performPurchase(InfoType, ProductId, ExpectedPrice, RequestId, IsRobloxPurchase, CollectibleItemId, CollectibleProductId, IdempotencyKey, PurchaseAuthToken, TimedOptionsDays, PurchasePayload, PurchaseOptions)
	-- upvalues: GetFFlagEnablePromptPurchaseRequestedV2Module (copy), GetFFlagEnablePromptPurchaseRequestedV2Take2Module (copy), FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (copy), MarketplaceService (copy), FFlagEnablePurchasePayloadInExperienceShop (copy), IsGenericChallengeResponseModule (copy)
	local Success, Result = pcall(function()
		-- upvalues: GetFFlagEnablePromptPurchaseRequestedV2Module (upval), GetFFlagEnablePromptPurchaseRequestedV2Take2Module (upval), FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (upval), MarketplaceService (upval), InfoType (copy), ProductId (copy), ExpectedPrice (copy), RequestId (copy), IsRobloxPurchase (copy), CollectibleItemId (copy), CollectibleProductId (copy), IdempotencyKey (copy), PurchaseAuthToken (copy), TimedOptionsDays (copy), FFlagEnablePurchasePayloadInExperienceShop (upval), PurchasePayload (copy), PurchaseOptions (copy)
		return if GetFFlagEnablePromptPurchaseRequestedV2Module() or GetFFlagEnablePromptPurchaseRequestedV2Take2Module() then if FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow then MarketplaceService:PerformPurchase(InfoType, ProductId, ExpectedPrice, RequestId, IsRobloxPurchase, CollectibleItemId, CollectibleProductId, IdempotencyKey, PurchaseAuthToken, TimedOptionsDays, if FFlagEnablePurchasePayloadInExperienceShop then PurchasePayload else nil, PurchaseOptions) elseif FFlagEnablePurchasePayloadInExperienceShop then MarketplaceService:PerformPurchase(InfoType, ProductId, ExpectedPrice, RequestId, IsRobloxPurchase, CollectibleItemId, CollectibleProductId, IdempotencyKey, PurchaseAuthToken, nil, PurchasePayload) else MarketplaceService:PerformPurchase(InfoType, ProductId, ExpectedPrice, RequestId, IsRobloxPurchase, CollectibleItemId, CollectibleProductId, IdempotencyKey, PurchaseAuthToken) else MarketplaceService:PerformPurchase(InfoType, ProductId, ExpectedPrice, RequestId, IsRobloxPurchase, CollectibleItemId, CollectibleProductId, IdempotencyKey)
	end)
	
	if Success then
		return Result
	elseif IsGenericChallengeResponseModule(Result) then
		return Result
	else
		error((tostring(Result)))
	end
end

local function performPurchaseV2(InfoType, ProductId, ExpectedPrice, RequestId, IsRobloxPurchase, CollectibleItemId, CollectibleProductId, IdempotencyKey, PurchaseAuthToken, CollectibleItemInstanceId, PurchaseOptions)
	-- upvalues: MarketplaceService (copy), IsGenericChallengeResponseModule (copy)
	local Success, Result = pcall(function()
		-- upvalues: CollectibleItemId (copy), CollectibleProductId (copy), IdempotencyKey (copy), PurchaseAuthToken (copy), CollectibleItemInstanceId (copy), PurchaseOptions (copy), MarketplaceService (upval), InfoType (copy), ProductId (copy), ExpectedPrice (copy), RequestId (copy), IsRobloxPurchase (copy)
		return MarketplaceService:PerformPurchaseV2(InfoType, ProductId, ExpectedPrice, RequestId, IsRobloxPurchase, {
			CollectibleItemId = CollectibleItemId,
			CollectibleProductId = CollectibleProductId,
			IdempotencyKey = IdempotencyKey,
			PurchaseAuthToken = PurchaseAuthToken,
			CollectibleItemInstanceId = CollectibleItemInstanceId,
			PurchaseOptions = PurchaseOptions
		})
	end)
	
	if Success then
		return Result
	elseif IsGenericChallengeResponseModule(Result) then
		return Result
	else
		error((tostring(Result)))
	end
end

local function performCreatorStorePurchase(p1, p2)
	-- upvalues: CreatorStoreService (copy), IsGenericChallengeResponseModule (copy)
	local Success, Result = pcall(function()
		-- upvalues: CreatorStoreService (upval), p1 (copy), p2 (copy)
		return CreatorStoreService:performCreatorStorePurchase(p1, p2)
	end)
	
	if Success then
		return Result
	elseif IsGenericChallengeResponseModule(Result) then
		return Result
	else
		error((tostring(Result)))
	end
end

local function getAssetInfo(p1)
	-- upvalues: CreatorStoreService (copy)
	return CreatorStoreService:getAssetInfoAsync(p1)
end

local function getCreatorStoreProductInfo(p1, p2)
	-- upvalues: CreatorStoreService (copy)
	return CreatorStoreService:getCreatorStoreProductInfoAsync(p1, p2)
end

local function loadAssetForEquip(AssetId)
	-- upvalues: InsertService (copy)
	return InsertService:LoadAsset(AssetId)
end

local function getAccountInfo()
	-- upvalues: PromiseModule (copy), request (copy), Replaced8 (copy)
	return PromiseModule.new(function(p1, p2)
		-- upvalues: request (upval), Replaced8 (upval)
		request({
			Method = "GET",
			Url = Replaced8 .. "v1/users/authenticated/app-launch-info"
		}, p1, p2)
	end)
end

local function getBalanceInfo()
	-- upvalues: PromiseModule (copy), request (copy), Replaced5 (copy)
	return PromiseModule.new(function(p1, p2)
		-- upvalues: request (upval), Replaced5 (upval)
		request({ Method = "GET", Url = Replaced5 .. "v1/user/currency" }, p1, p2)
	end)
end

local function getBundleDetails(p1)
	-- upvalues: Replaced4 (copy), PromiseModule (copy), request (copy)
	local config = {
		Method = "GET",
		Url = Replaced4 .. "v1/bundles/" .. tostring(p1) .. "/details"
	}
	
	return PromiseModule.new(function(p2, p3)
		-- upvalues: request (upval), config (copy)
		spawn(function()
			-- upvalues: request (upval), config (upval), p2 (copy), p3 (copy)
			request(config, p2, p3)
		end)
	end)
end

local function getProductPurchasableDetails(p1)
	-- upvalues: Replaced5 (copy), PromiseModule (copy), request (copy)
	local config = {
		Method = "GET",
		Url = Replaced5 .. "v1/products/" .. tostring(p1) .. "?showPurchasable=true"
	}
	
	return PromiseModule.new(function(p2, p3)
		-- upvalues: request (upval), config (copy)
		spawn(function()
			-- upvalues: request (upval), config (upval), p2 (copy), p3 (copy)
			request(config, p2, p3)
		end)
	end)
end

local function getCatalogItemDetails(p1, p2)
	-- upvalues: Replaced4 (copy), PromiseModule (copy), request (copy)
	local config = {
		Method = "GET",
		Url = string.format("%sv1/catalog/items/%d/details?itemType=%s", Replaced4, p1, p2)
	}
	
	return PromiseModule.new(function(p3, p4)
		-- upvalues: request (upval), config (copy)
		spawn(function()
			-- upvalues: request (upval), config (upval), p3 (copy), p4 (copy)
			request(config, p3, p4)
		end)
	end)
end

local function getResellers(p1, p2)
	-- upvalues: Replaced1 (copy), PromiseModule (copy), request (copy)
	local config = {
		Method = "GET",
		Url = string.format("%smarketplace-sales/v1/item/%s/resellers?cursor=&limit=%d", Replaced1, p1, p2 or 10)
	}
	
	return PromiseModule.new(function(p3, p4)
		-- upvalues: request (upval), config (copy)
		spawn(function()
			-- upvalues: request (upval), config (upval), p3 (copy), p4 (copy)
			request(config, p3, p4)
		end)
	end)
end

local function postCartPricing(Input)
	-- upvalues: Replaced1 (copy), HttpService (copy), PromiseModule (copy), request (copy)
	local config = {
		Method = "POST",
		Url = Replaced1 .. "marketplace-sales/v1/cart-pricing",
		Body = HttpService:JSONEncode(Input),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return PromiseModule.new(function(Callback, Callback1)
		-- upvalues: request (upval), config (copy)
		spawn(function()
			-- upvalues: request (upval), config (upval), Callback (copy), Callback1 (copy)
			request(config, function(p1)
				-- upvalues: Callback (upval)
				Callback(p1)
			end, function(p1)
				-- upvalues: Callback1 (upval)
				Callback1(p1)
			end)
		end)
	end)
end

local function postPremiumImpression()
	-- upvalues: Replaced7 (copy), HttpService (copy), PromiseModule (copy)
	local config = {
		Method = "POST",
		Url = Replaced7 .. "v1/universes/" .. tostring(game.GameId) .. "/premium-impressions/increment",
		Body = HttpService:JSONEncode("{}"),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return PromiseModule.new(function(_, _)
		-- upvalues: HttpService (upval), config (copy)
		spawn(function()
			-- upvalues: HttpService (upval), config (upval)
			return HttpService:RequestInternal(config):Start(function(_, _) end)
		end)
	end)
end

local function getPremiumUpsellPrecheck()
	-- upvalues: Replaced6 (copy), Players (copy), PromiseModule (copy), HttpService (copy)
	local config = {
		Method = "GET",
		Url = string.format("%sv1/users/%d/premium-upsell-precheck?universeId=%d&placeId=%d", Replaced6, Players.LocalPlayer.UserId, game.GameId, game.PlaceId)
	}
	
	return PromiseModule.new(function(Callback1, Callback)
		-- upvalues: HttpService (upval), config (copy)
		spawn(function()
			-- upvalues: HttpService (upval), config (upval), Callback1 (copy), Callback (copy)
			return HttpService:RequestInternal(config):Start(function(p1, p2)
				-- upvalues: Callback1 (upval), Callback (upval)
				if p1 and p2.StatusCode == 200 then
					Callback1()
					
					return
				else
					Callback()
				end
			end)
		end)
	end)
end

local function getSubscriptionPurchaseInfo(SubscriptionId)
	-- upvalues: MarketplaceService (copy)
	return MarketplaceService:GetSubscriptionPurchaseInfoAsync(SubscriptionId)
end

local function performSubscriptionPurchase(SubscriptionId, PaymentProvider)
	-- upvalues: MarketplaceService (copy)
	return MarketplaceService:PerformSubscriptionPurchaseV2(SubscriptionId, PaymentProvider)
end

local function getPurchaseWarning(p1, p2, p3)
	-- upvalues: UrlBuilder (copy), PromiseModule (copy), request (copy)
	local config = {
		Method = "GET",
		Url = UrlBuilder.economy.purchaseWarning.getPurchaseWarning(p1, p2, not p3)
	}
	
	return PromiseModule.new(function(p4, p5)
		-- upvalues: request (upval), config (copy)
		spawn(function()
			-- upvalues: request (upval), config (upval), p4 (copy), p5 (copy)
			request(config, p4, p5)
		end)
	end)
end

local function postPurchaseWarningAcknowledge(Acknowledgement)
	-- upvalues: UrlBuilder (copy), HttpService (copy), PromiseModule (copy)
	local config = {
		Method = "POST",
		Url = UrlBuilder.economy.purchaseWarning.ackPurchaseWarning(),
		Body = HttpService:JSONEncode({ acknowledgement = Acknowledgement }),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return PromiseModule.new(function(_, _)
		-- upvalues: HttpService (upval), config (copy)
		spawn(function()
			-- upvalues: HttpService (upval), config (upval)
			return HttpService:RequestInternal(config):Start(function(_, _) end)
		end)
	end)
end

local function checkUserPurchaseSettings()
	-- upvalues: UrlBuilder (copy), HttpService (copy), PromiseModule (copy), request (copy)
	local config = {
		Method = "POST",
		Url = UrlBuilder.economy.paymentsGateway.checkUserPurchaseSettings(),
		Body = HttpService:JSONEncode("{}"),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return PromiseModule.new(function(p1, p2)
		-- upvalues: request (upval), config (copy)
		spawn(function()
			-- upvalues: request (upval), config (upval), p1 (copy), p2 (copy)
			request(config, p1, p2)
		end)
	end)
end

local function getVngShopUrl()
	-- upvalues: UrlBuilder (copy), PromiseModule (copy), request (copy)
	local config = {
		Method = "GET",
		Url = UrlBuilder.economy.vngPayments.getVngShopUrl()
	}
	
	return PromiseModule.new(function(p1, p2)
		-- upvalues: request (upval), config (copy)
		spawn(function()
			-- upvalues: request (upval), config (upval), p1 (copy), p2 (copy)
			request(config, p1, p2)
		end)
	end)
end

local function performDevProductEdpPurchase(p1, Input)
	-- upvalues: Replaced1 (copy), HttpService (copy), PromiseModule (copy), request (copy)
	local config = {
		Method = "POST",
		Url = ("%sdeveloper-products/v1/developer-products/%i/purchase?requestLocationType=ExperienceDetailPage"):format(Replaced1, p1),
		Body = HttpService:JSONEncode(Input),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return PromiseModule.new(function(p2, p3)
		-- upvalues: request (upval), config (copy)
		spawn(function()
			-- upvalues: request (upval), config (upval), p2 (copy), p3 (copy)
			request(config, p2, p3)
		end)
	end)
end

local function getExperienceProductInfo(p1)
	-- upvalues: Replaced2 (copy), PromiseModule (copy), request (copy)
	local config = {
		Method = "GET",
		Url = ("%sv1/games/games-product-info?universeIds=%s"):format(Replaced2, p1)
	}
	
	return PromiseModule.new(function(p2, p3)
		-- upvalues: request (upval), config (copy)
		spawn(function()
			-- upvalues: request (upval), config (upval), p2 (copy), p3 (copy)
			request(config, p2, p3)
		end)
	end)
end

local function performExperiencePurchase(p1, Input)
	-- upvalues: Replaced5 (copy), HttpService (copy), PromiseModule (copy), request (copy)
	local config = {
		Method = "POST",
		Url = ("%sv1/purchases/products/%s"):format(Replaced5, p1),
		Body = HttpService:JSONEncode(Input),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return PromiseModule.new(function(p2, p3)
		-- upvalues: request (upval), config (copy)
		spawn(function()
			-- upvalues: request (upval), config (upval), p2 (copy), p3 (copy)
			request(config, p2, p3)
		end)
	end)
end

local function performLookPurchase(p1, Input)
	-- upvalues: Replaced1 (copy), HttpService (copy), PromiseModule (copy), request (copy)
	local config = {
		Method = "POST",
		Url = ("%slook-api/v2/looks/%s/purchase"):format(Replaced1, p1),
		Body = HttpService:JSONEncode(Input),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return PromiseModule.new(function(p2, p3)
		-- upvalues: request (upval), config (copy)
		spawn(function()
			-- upvalues: request (upval), config (upval), p2 (copy), p3 (copy)
			request(config, p2, p3)
		end)
	end)
end

local function performDeveloperSubscriptionRobuxPurchase(SubscriptionId, PriceInRobux)
	-- upvalues: EnableDevSubscriptionPurchaseWithRobuxEngineFeature (copy), MarketplaceService (copy)
	if not EnableDevSubscriptionPurchaseWithRobuxEngineFeature then
		error("Developer subscription Robux purchase requires engine feature to be enabled")
		
		return
	end
	local Success, Result = pcall(function()
		-- upvalues: MarketplaceService (upval), SubscriptionId (copy), PriceInRobux (copy)
		MarketplaceService:PerformSubscriptionPurchaseWithRobuxAsync(SubscriptionId, PriceInRobux)
	end)
	
	if not Success then
		error(Result)
	end
end

local function getUnifiedPurchaseFlowUserEligibility()
	-- upvalues: Replaced1 (copy), PromiseModule (copy), request (copy)
	local config = {
		Method = "GET",
		Url = ("%sroblox-subscriptions/v1/metadata"):format(Replaced1)
	}
	
	return PromiseModule.new(function(p1, p2)
		-- upvalues: request (upval), config (copy)
		spawn(function()
			-- upvalues: request (upval), config (upval), p1 (copy), p2 (copy)
			request(config, p1, p2)
		end)
	end)
end

local function GetLookDetailsV2ProductInfo(p1)
	-- upvalues: Replaced1 (copy), PromiseModule (copy), request (copy)
	local config = {
		Method = "GET",
		Url = string.format("%slook-api/v2/looks/%s", Replaced1, p1)
	}
	
	return PromiseModule.new(function(p2, p3)
		-- upvalues: request (upval), config (copy)
		spawn(function()
			-- upvalues: request (upval), config (upval), p2 (copy), p3 (copy)
			request(config, p2, p3)
		end)
	end)
end

return {
	new = function()
		-- upvalues: PromiseModule (copy), getABTestGroup (copy), getProductInfo (copy), getPlayerOwns (copy), performPurchase (copy), performPurchaseV2 (copy), GetFFlagEnableCreatorStorePurchasingCutoverModule (copy), performCreatorStorePurchase (copy), loadAssetForEquip (copy), getAccountInfo (copy), getAssetInfo (copy), getBalanceInfo (copy), getBundleDetails (copy), getProductPurchasableDetails (copy), FFlagRefreshPriceOnRetryAfterUpsellModule (copy), getCatalogItemDetails (copy), getResellers (copy), getCreatorStoreProductInfo (copy), getPremiumProductInfo (copy), postPremiumImpression (copy), getPremiumUpsellPrecheck (copy), getSubscriptionPurchaseInfo (copy), performSubscriptionPurchase (copy), getPurchaseWarning (copy), postPurchaseWarningAcknowledge (copy), checkUserPurchaseSettings (copy), getVngShopUrl (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), performDevProductEdpPurchase (copy), getExperienceProductInfo (copy), performExperiencePurchase (copy), performLookPurchase (copy), getUnifiedPurchaseFlowUserEligibility (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), performDeveloperSubscriptionRobuxPurchase (copy), getSubscriptionProductInfo (copy), FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule (copy), GetLookDetailsV2ProductInfo (copy), FFlagPurchasePromptCartPricingEnabledModule (copy), postCartPricing (copy)
		local config = {
			getABTestGroup = PromiseModule.promisify(getABTestGroup),
			getProductInfo = PromiseModule.promisify(getProductInfo),
			getPlayerOwns = PromiseModule.promisify(getPlayerOwns),
			performPurchase = PromiseModule.promisify(performPurchase),
			performPurchaseV2 = PromiseModule.promisify(performPurchaseV2),
			performCreatorStorePurchase = if GetFFlagEnableCreatorStorePurchasingCutoverModule() then PromiseModule.promisify(performCreatorStorePurchase) else nil,
			loadAssetForEquip = PromiseModule.promisify(loadAssetForEquip),
			getAccountInfo = PromiseModule.promisify(getAccountInfo),
			getAssetInfo = if GetFFlagEnableCreatorStorePurchasingCutoverModule() then PromiseModule.promisify(getAssetInfo) else nil,
			getBalanceInfo = PromiseModule.promisify(getBalanceInfo),
			getBundleDetails = getBundleDetails,
			getProductPurchasableDetails = getProductPurchasableDetails,
			getCatalogItemDetails = if FFlagRefreshPriceOnRetryAfterUpsellModule then getCatalogItemDetails else nil,
			getResellers = if FFlagRefreshPriceOnRetryAfterUpsellModule then getResellers else nil,
			getCreatorStoreProductInfo = if GetFFlagEnableCreatorStorePurchasingCutoverModule() then PromiseModule.promisify(getCreatorStoreProductInfo) else nil,
			getPremiumProductInfo = PromiseModule.promisify(getPremiumProductInfo),
			postPremiumImpression = PromiseModule.promisify(postPremiumImpression),
			getPremiumUpsellPrecheck = PromiseModule.promisify(getPremiumUpsellPrecheck),
			getSubscriptionPurchaseInfo = PromiseModule.promisify(getSubscriptionPurchaseInfo),
			performSubscriptionPurchase = PromiseModule.promisify(performSubscriptionPurchase),
			getPurchaseWarning = PromiseModule.promisify(getPurchaseWarning),
			postPurchaseWarningAcknowledge = PromiseModule.promisify(postPurchaseWarningAcknowledge),
			checkUserPurchaseSettings = PromiseModule.promisify(checkUserPurchaseSettings),
			getVngShopUrl = PromiseModule.promisify(getVngShopUrl),
			performDevProductEdpPurchase = if FFlagEnableUnifiedProductPurchaseFlow then PromiseModule.promisify(performDevProductEdpPurchase) else nil,
			getExperienceProductInfo = if FFlagEnableUnifiedProductPurchaseFlow then PromiseModule.promisify(getExperienceProductInfo) else nil,
			performExperiencePurchase = if FFlagEnableUnifiedProductPurchaseFlow then PromiseModule.promisify(performExperiencePurchase) else nil,
			performLookPurchase = if FFlagEnableUnifiedProductPurchaseFlow then PromiseModule.promisify(performLookPurchase) else nil,
			getUnifiedPurchaseFlowUserEligibility = if FFlagEnableUnifiedProductPurchaseFlow then PromiseModule.promisify(getUnifiedPurchaseFlowUserEligibility) else nil,
			performDeveloperSubscriptionRobuxPurchase = if FFlagEnableUnifiedPurchaseFlowForDevSubs then PromiseModule.promisify(performDeveloperSubscriptionRobuxPurchase) else nil,
			getSubscriptionProductInfo = if FFlagEnableUnifiedPurchaseFlowForDevSubs then PromiseModule.promisify(getSubscriptionProductInfo) else nil,
			GetLookDetailsV2ProductInfo = if FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule then PromiseModule.promisify(GetLookDetailsV2ProductInfo) else nil,
			postCartPricing = if FFlagPurchasePromptCartPricingEnabledModule then postCartPricing else nil
		}
		setmetatable(config, {
			__tostring = function(): string
				return "Service(Network)"
			end
		})
		
		return config
	end
}