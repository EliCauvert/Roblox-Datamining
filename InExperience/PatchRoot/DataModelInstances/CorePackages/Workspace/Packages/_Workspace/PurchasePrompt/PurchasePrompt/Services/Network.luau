local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local httpService = game:GetService("HttpService")
local contentProviderService = game:GetService("ContentProvider")
local marketplaceService = game:GetService("MarketplaceService")
local insertService = game:GetService("InsertService")
local userInputService = game:GetService("UserInputService")
local playersService = game:GetService("Players")
local creatorStoreService = game:GetService("CreatorStoreService")
local urlBuilder = require(parent.PurchasePromptDeps).UrlBuilder.UrlBuilder
local promiseModule = require(purchasePrompt.Promise)
local premiumProductModule = require(purchasePrompt.Models.PremiumProduct)
local _ = require(purchasePrompt.types)
local debugLogModule = require(purchasePrompt.Utils.debugLog)
local serializeTableModule = require(purchasePrompt.Utils.serializeTable)
local isGenericChallengeResponseModule = require(purchasePrompt.Utils.isGenericChallengeResponse)
local enablePlayerOwnsBundleApiEngineFeature = game:GetEngineFeature("EnablePlayerOwnsBundleApi")
local enableDevSubscriptionPurchaseWithRobuxEngineFeature = game:GetEngineFeature("EnableDevSubscriptionPurchaseWithRobux")
local getFFlagEnablePromptPurchaseRequestedV2Module = require(purchasePrompt.Flags.GetFFlagEnablePromptPurchaseRequestedV2)
local getFFlagEnablePromptPurchaseRequestedV2Take2Module = require(purchasePrompt.Flags.GetFFlagEnablePromptPurchaseRequestedV2Take2)
local getFFlagEnableCreatorStorePurchasingCutoverModule = require(purchasePrompt.Flags.GetFFlagEnableCreatorStorePurchasingCutover)
local fFlagEnableUnifiedProductPurchaseFlow = require(parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local fFlagEnableUnifiedPurchaseFlowForDevSubs = require(parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local fFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule = require(purchasePrompt.Flags.FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsell)
local fFlagEnableRequestLocationTypeForSduiPurchaseModule = require(purchasePrompt.Flags.FFlagEnableRequestLocationTypeForSduiPurchase)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = sharedFlagsModule.FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local fFlagEnablePurchasePayloadInExperienceShop = sharedFlagsModule.FFlagEnablePurchasePayloadInExperienceShop
local fFlagRefreshPriceOnRetryAfterUpsellModule = require(purchasePrompt.Flags.FFlagRefreshPriceOnRetryAfterUpsell)
local fFlagPurchasePromptCartPricingEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local fFlagEnableInExperienceOffersPurchaseFlow = sharedFlagsModule.FFlagEnableInExperienceOffersPurchaseFlow
local replaced = string.gsub(string.gsub(contentProviderService.BaseUrl:lower(), "/m.", "/www."), "http:", "https:")
replaced = string.gsub(replaced, "https://www", "https://api")
local replaced_1 = string.gsub(replaced, "https://www", "https://apis")
local replaced_2 = string.gsub(replaced, "https://www", "https://games")
local replaced_3 = string.gsub(replaced, "https://www", "https://abtesting")
local replaced_4 = string.gsub(replaced, "https://www.", "https://catalog.")
local replaced_5 = string.gsub(replaced, "https://www.", "https://economy.")
local replaced_6 = string.gsub(replaced, "https://www.", "https://premiumfeatures.")
local replaced_7 = string.gsub(replaced, "https://www.", "https://economycreatorstats.")
local replaced_8 = string.gsub(replaced, "https://www", "https://users")

local function request(p1, p2, p3)
	-- upvalues: debugLogModule (ref), serializeTableModule (ref), httpService (ref)
	debugLogModule(function()
		-- upvalues: p1 (ref), serializeTableModule (copy)
		return "Request " .. p0.Url .. "\n" .. serializeTableModule(p1)
	end)
	
	return httpService:RequestInternal(p1):Start(function(p4, p5)
		-- upvalues: debugLogModule (copy), p1 (ref), serializeTableModule (copy), httpService (copy), p2 (ref), p3 (ref)
		debugLogModule(function()
			-- upvalues: p1 (copy), serializeTableModule (copy), p5 (ref)
			return "Response " .. p0.Url .. "\n" .. serializeTableModule(p5)
		end)
		
		if not p4 then
			p3(tostring(p5.StatusMessage))
			
			return
		end
		local _ = nil
		local ok, status = pcall(httpService.JSONDecode, httpService, p5.Body)
		local var1 = status
		
		if ok then
			p2(var1)
			
			return
		end
		p3("Could not parse JSON.")
	end)
end

local function getABTestGroup(p1, p2)
	-- upvalues: promiseModule (ref), request (ref), replaced_3 (ref), httpService (ref)
	local list = {
		{
			SubjectType = 1,
			ExperimentName = p2,
			SubjectTargetId = p1
		}
	}
	
	return promiseModule.new(function(p3, p4)
		-- upvalues: request (copy), replaced_3 (copy), httpService (copy), list (ref)
		return request({
			Method = "POST",
			Url = replaced_3 .. "v1/get-enrollments",
			Body = httpService:JSONEncode(list),
			Headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}, p3, p4)
	end)
end

local function getProductInfo(p1, p2)
	-- upvalues: marketplaceService (ref)
	return marketplaceService:GetProductInfoAsync(p1, p2)
end

local function getSubscriptionProductInfo(p1)
	-- upvalues: marketplaceService (ref)
	return marketplaceService:GetSubscriptionProductInfoAsync(p1)
end

local function getPremiumProductInfo()
	-- upvalues: promiseModule (ref), request (ref), replaced_6 (ref), premiumProductModule (ref), userInputService (ref)
	return promiseModule.new(function(p1, p2)
		-- upvalues: request (copy), replaced_6 (copy), premiumProductModule (copy), userInputService (copy)
		request({
			Method = "GET",
			Url = replaced_6 .. "v1/products?typeName=Subscription"
		}, function(p3)
			-- upvalues: premiumProductModule (copy), userInputService (copy), p1 (ref)
			local var1 = nil
			
			for i, v in ipairs(p3.products) do
				local var2 = premiumProductModule(v)
				
				if var2 ~= nil and (var1 == nil or var2.robuxAmount < var1.robuxAmount) then
					var1 = var2
				end
			end
			if userInputService:GetPlatform() == Enum.Platform.Android and var1 ~= nil and var1.mobileProductId ~= nil then
				var1.mobileProductId = var1.mobileProductId:lower()
			end
			p1(var1)
		end, p2)
	end)
end

local function getPlayerOwns(p1, p2, p3)
	-- upvalues: marketplaceService (ref), enablePlayerOwnsBundleApiEngineFeature (ref)
	return if p3 == Enum.InfoType.Asset then marketplaceService:PlayerOwnsAssetAsync(p1, p2) elseif enablePlayerOwnsBundleApiEngineFeature and p3 == Enum.InfoType.Bundle then marketplaceService:PlayerOwnsBundleAsync(p1, p2) elseif p3 == Enum.InfoType.GamePass then marketplaceService:UserOwnsGamePassAsync(p1.UserId, p2) else p3 == Enum.InfoType.Subscription and marketplaceService:IsPlayerSubscribed(p1, p2)
end

local function performPurchase(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12)
	-- upvalues: getFFlagEnablePromptPurchaseRequestedV2Module (ref), getFFlagEnablePromptPurchaseRequestedV2Take2Module (ref), fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (ref), marketplaceService (ref), fFlagEnablePurchasePayloadInExperienceShop (ref), isGenericChallengeResponseModule (ref)
	local ok, status = pcall(function()
		-- upvalues: getFFlagEnablePromptPurchaseRequestedV2Module (copy), getFFlagEnablePromptPurchaseRequestedV2Take2Module (copy), fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (copy), marketplaceService (copy), p1 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref), p6 (ref), p7 (ref), p8 (ref), p9 (ref), p10 (ref), fFlagEnablePurchasePayloadInExperienceShop (copy), p11 (ref), p12 (ref)
		return if not (not getFFlagEnablePromptPurchaseRequestedV2Module() and not getFFlagEnablePromptPurchaseRequestedV2Take2Module()) then if fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow then marketplaceService:PerformPurchase(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, if fFlagEnablePurchasePayloadInExperienceShop then p11 else nil, p12) elseif fFlagEnablePurchasePayloadInExperienceShop then marketplaceService:PerformPurchase(p1, p2, p3, p4, p5, p6, p7, p8, p9, nil, p11) else marketplaceService:PerformPurchase(p1, p2, p3, p4, p5, p6, p7, p8, p9) else marketplaceService:PerformPurchase(p1, p2, p3, p4, p5, p6, p7, p8)
	end)
	
	if ok then
		return status
	elseif isGenericChallengeResponseModule(status) then
		return status
	end
	error(tostring(status))
end

local function performPurchaseV2(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
	-- upvalues: marketplaceService (ref), isGenericChallengeResponseModule (ref)
	local ok, status = pcall(function()
		-- upvalues: p6 (ref), p7 (ref), p8 (ref), p9 (ref), p10 (ref), p11 (ref), marketplaceService (copy), p1 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref)
		return marketplaceService:PerformPurchaseV2(p1, p2, p3, p4, p5, {
			CollectibleItemId = p6,
			CollectibleProductId = p7,
			IdempotencyKey = p8,
			PurchaseAuthToken = p9,
			CollectibleItemInstanceId = p10,
			PurchaseOptions = p11
		})
	end)
	
	if ok then
		return status
	elseif isGenericChallengeResponseModule(status) then
		return status
	end
	error(tostring(status))
end

local function performCreatorStorePurchase(p1, p2)
	-- upvalues: creatorStoreService (ref), isGenericChallengeResponseModule (ref)
	local ok, status = pcall(function()
		-- upvalues: creatorStoreService (copy), p1 (ref), p2 (ref)
		return creatorStoreService:performCreatorStorePurchase(p1, p2)
	end)
	
	if ok then
		return status
	elseif isGenericChallengeResponseModule(status) then
		return status
	end
	error(tostring(status))
end

local function getAssetInfo(value)
	-- upvalues: creatorStoreService (ref)
	return creatorStoreService:getAssetInfoAsync(value)
end

local function getCreatorStoreProductInfo(p1, p2)
	-- upvalues: creatorStoreService (ref)
	return creatorStoreService:getCreatorStoreProductInfoAsync(p1, p2)
end

local function loadAssetForEquip(value)
	-- upvalues: insertService (ref)
	return insertService:LoadAsset(value)
end

local function getAccountInfo()
	-- upvalues: promiseModule (ref), request (ref), replaced_8 (ref)
	return promiseModule.new(function(p1, p2)
		-- upvalues: request (copy), replaced_8 (copy)
		request({
			Method = "GET",
			Url = replaced_8 .. "v1/users/authenticated/app-launch-info"
		}, p1, p2)
	end)
end

local function getBalanceInfo()
	-- upvalues: promiseModule (ref), request (ref), replaced_5 (ref)
	return promiseModule.new(function(p1, p2)
		-- upvalues: request (copy), replaced_5 (copy)
		request({ Method = "GET", Url = replaced_5 .. "v1/user/currency" }, p1, p2)
	end)
end

local function getBundleDetails(p1)
	-- upvalues: replaced_4 (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = replaced_4 .. "v1/bundles/" .. tostring(p1) .. "/details"
	}
	
	return promiseModule.new(function(p2, p3)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p2 (ref), p3 (ref)
			request(t, p2, p3)
		end)
	end)
end

local function getProductPurchasableDetails(p1)
	-- upvalues: replaced_5 (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = replaced_5 .. "v1/products/" .. tostring(p1) .. "?showPurchasable=true"
	}
	
	return promiseModule.new(function(p2, p3)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p2 (ref), p3 (ref)
			request(t, p2, p3)
		end)
	end)
end

local function getCatalogItemDetails(p1, p2)
	-- upvalues: replaced_4 (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = string.format("%sv1/catalog/items/%d/details?itemType=%s", replaced_4, p1, p2)
	}
	
	return promiseModule.new(function(p3, p4)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p3 (ref), p4 (ref)
			request(t, p3, p4)
		end)
	end)
end

local function getResellers(p1, p2)
	-- upvalues: replaced_1 (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = string.format("%smarketplace-sales/v1/item/%s/resellers?cursor=&limit=%d", replaced_1, p1, p2 or 10)
	}
	
	return promiseModule.new(function(p3, p4)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p3 (ref), p4 (ref)
			request(t, p3, p4)
		end)
	end)
end

local function postCartPricing(p1)
	-- upvalues: replaced_1 (ref), httpService (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "POST",
		Url = replaced_1 .. "marketplace-sales/v1/cart-pricing",
		Body = httpService:JSONEncode(p1),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return promiseModule.new(function(p2, p3)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p2 (ref), p3 (ref)
			request(t, function(p4)
				-- upvalues: p2 (copy)
				p2(p4)
			end, function(p4)
				-- upvalues: p3 (copy)
				p3(p4)
			end)
		end)
	end)
end

local function postInGameItemCartPricing(p1)
	-- upvalues: replaced_1 (ref), httpService (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "POST",
		Url = replaced_1 .. "checkout-api/v1/cart-pricing",
		Body = httpService:JSONEncode(p1),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return promiseModule.new(function(p2, p3)
		-- upvalues: request (copy), t (ref)
		request(t, p2, p3)
	end)
end

local function postPremiumImpression()
	-- upvalues: replaced_7 (ref), httpService (ref), promiseModule (ref)
	local t = {
		Method = "POST",
		Url = replaced_7 .. "v1/universes/" .. tostring(game.GameId) .. "/premium-impressions/increment",
		Body = httpService:JSONEncode("{}"),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return promiseModule.new(function(_, _)
		-- upvalues: httpService (copy), t (ref)
		spawn(function()
			-- upvalues: httpService (copy), t (copy)
			return httpService:RequestInternal(t):Start(function(_, _) end)
		end)
	end)
end

local function getPremiumUpsellPrecheck()
	-- upvalues: replaced_6 (ref), playersService (ref), promiseModule (ref), httpService (ref)
	local t = {
		Method = "GET",
		Url = string.format("%sv1/users/%d/premium-upsell-precheck?universeId=%d&placeId=%d", replaced_6, playersService.LocalPlayer.UserId, game.GameId, game.PlaceId)
	}
	
	return promiseModule.new(function(p1, p2)
		-- upvalues: httpService (copy), t (ref)
		spawn(function()
			-- upvalues: httpService (copy), t (copy), p1 (ref), p2 (ref)
			return httpService:RequestInternal(t):Start(function(p3, p4)
				-- upvalues: p1 (copy), p2 (copy)
				if p3 and p4.StatusCode == 200 then
					p1()
					
					return
				end
				p2()
			end)
		end)
	end)
end

local function getSubscriptionPurchaseInfo(p1)
	-- upvalues: marketplaceService (ref)
	return marketplaceService:GetSubscriptionPurchaseInfoAsync(p1)
end

local function performSubscriptionPurchase(p1, p2)
	-- upvalues: marketplaceService (ref)
	return marketplaceService:PerformSubscriptionPurchaseV2(p1, p2)
end

local function getPurchaseWarning(p1, p2, p3)
	-- upvalues: urlBuilder (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = urlBuilder.economy.purchaseWarning.getPurchaseWarning(p1, p2, not p3)
	}
	
	return promiseModule.new(function(p4, p5)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p4 (ref), p5 (ref)
			request(t, p4, p5)
		end)
	end)
end

local function postPurchaseWarningAcknowledge(p1)
	-- upvalues: urlBuilder (ref), httpService (ref), promiseModule (ref)
	local t = {
		Method = "POST",
		Url = urlBuilder.economy.purchaseWarning.ackPurchaseWarning(),
		Body = httpService:JSONEncode({ acknowledgement = p1 }),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return promiseModule.new(function(_, _)
		-- upvalues: httpService (copy), t (ref)
		spawn(function()
			-- upvalues: httpService (copy), t (copy)
			return httpService:RequestInternal(t):Start(function(_, _) end)
		end)
	end)
end

local function checkUserPurchaseSettings()
	-- upvalues: urlBuilder (ref), httpService (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "POST",
		Url = urlBuilder.economy.paymentsGateway.checkUserPurchaseSettings(),
		Body = httpService:JSONEncode("{}"),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return promiseModule.new(function(p1, p2)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p1 (ref), p2 (ref)
			request(t, p1, p2)
		end)
	end)
end

local function getVngShopUrl()
	-- upvalues: urlBuilder (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = urlBuilder.economy.vngPayments.getVngShopUrl()
	}
	
	return promiseModule.new(function(p1, p2)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p1 (ref), p2 (ref)
			request(t, p1, p2)
		end)
	end)
end

local function performDevProductEdpPurchase(p1, p2)
	-- upvalues: fFlagEnableRequestLocationTypeForSduiPurchaseModule (ref), replaced_1 (ref), httpService (ref), promiseModule (ref), request (ref)
	local requestLocationType, var1
	local _ = nil
	
	if fFlagEnableRequestLocationTypeForSduiPurchaseModule then
		requestLocationType = p2.requestLocationType
		var1 = if requestLocationType == nil or requestLocationType == "" then ("%sdeveloper-products/v1/developer-products/%i/purchase"):format(replaced_1, p1) else ("%sdeveloper-products/v1/developer-products/%i/purchase?requestLocationType=%s"):format(replaced_1, p1, requestLocationType)
	else
		var1 = ("%sdeveloper-products/v1/developer-products/%i/purchase?requestLocationType=ExperienceDetailPage"):format(replaced_1, p1)
	end
	requestLocationType = {
		Method = "POST",
		Url = var1,
		Body = httpService:JSONEncode(p2),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return promiseModule.new(function(p3, p4)
		-- upvalues: request (copy), requestLocationType (ref)
		spawn(function()
			-- upvalues: request (copy), requestLocationType (copy), p3 (ref), p4 (ref)
			request(requestLocationType, p3, p4)
		end)
	end)
end

local function getExperienceProductInfo(p1)
	-- upvalues: replaced_2 (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = ("%sv1/games/games-product-info?universeIds=%s"):format(replaced_2, p1)
	}
	
	return promiseModule.new(function(p2, p3)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p2 (ref), p3 (ref)
			request(t, p2, p3)
		end)
	end)
end

local function performExperiencePurchase(p1, p2)
	-- upvalues: replaced_5 (ref), httpService (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "POST",
		Url = ("%sv1/purchases/products/%s"):format(replaced_5, p1),
		Body = httpService:JSONEncode(p2),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return promiseModule.new(function(p3, p4)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p3 (ref), p4 (ref)
			request(t, p3, p4)
		end)
	end)
end

local function performLookPurchase(p1, p2)
	-- upvalues: replaced_1 (ref), httpService (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "POST",
		Url = ("%slook-api/v2/looks/%s/purchase"):format(replaced_1, p1),
		Body = httpService:JSONEncode(p2),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return promiseModule.new(function(p3, p4)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p3 (ref), p4 (ref)
			request(t, p3, p4)
		end)
	end)
end

local function performDeveloperSubscriptionRobuxPurchase(p1, p2)
	-- upvalues: enableDevSubscriptionPurchaseWithRobuxEngineFeature (ref), marketplaceService (ref)
	if not enableDevSubscriptionPurchaseWithRobuxEngineFeature then
		error("Developer subscription Robux purchase requires engine feature to be enabled")
		
		return
	end
	local ok, status = pcall(function()
		-- upvalues: marketplaceService (copy), p1 (ref), p2 (ref)
		marketplaceService:PerformSubscriptionPurchaseWithRobuxAsync(p1, p2)
	end)
	
	if not ok then
		error(status)
	end
end

local function getUnifiedPurchaseFlowUserEligibility()
	-- upvalues: replaced_1 (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = ("%sroblox-subscriptions/v1/metadata"):format(replaced_1)
	}
	
	return promiseModule.new(function(p1, p2)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p1 (ref), p2 (ref)
			request(t, p1, p2)
		end)
	end)
end

local function GetLookDetailsV2ProductInfo(p1)
	-- upvalues: replaced_1 (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = string.format("%slook-api/v2/looks/%s", replaced_1, p1)
	}
	
	return promiseModule.new(function(p2, p3)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p2 (ref), p3 (ref)
			request(t, p2, p3)
		end)
	end)
end

return {
	new = function()
		-- upvalues: promiseModule (ref), getABTestGroup (ref), getProductInfo (ref), getPlayerOwns (ref), performPurchase (ref), performPurchaseV2 (ref), getFFlagEnableCreatorStorePurchasingCutoverModule (ref), performCreatorStorePurchase (ref), loadAssetForEquip (ref), getAccountInfo (ref), getAssetInfo (ref), getBalanceInfo (ref), getBundleDetails (ref), getProductPurchasableDetails (ref), fFlagRefreshPriceOnRetryAfterUpsellModule (ref), getCatalogItemDetails (ref), getResellers (ref), getCreatorStoreProductInfo (ref), getPremiumProductInfo (ref), postPremiumImpression (ref), getPremiumUpsellPrecheck (ref), getSubscriptionPurchaseInfo (ref), performSubscriptionPurchase (ref), getPurchaseWarning (ref), postPurchaseWarningAcknowledge (ref), checkUserPurchaseSettings (ref), getVngShopUrl (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), performDevProductEdpPurchase (ref), getExperienceProductInfo (ref), performExperiencePurchase (ref), performLookPurchase (ref), getUnifiedPurchaseFlowUserEligibility (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), performDeveloperSubscriptionRobuxPurchase (ref), getSubscriptionProductInfo (ref), fFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule (ref), GetLookDetailsV2ProductInfo (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), postCartPricing (ref), fFlagEnableInExperienceOffersPurchaseFlow (ref), postInGameItemCartPricing (ref)
		local t = {
			getABTestGroup = promiseModule.promisify(getABTestGroup),
			getProductInfo = promiseModule.promisify(getProductInfo),
			getPlayerOwns = promiseModule.promisify(getPlayerOwns),
			performPurchase = promiseModule.promisify(performPurchase),
			performPurchaseV2 = promiseModule.promisify(performPurchaseV2),
			performCreatorStorePurchase = if getFFlagEnableCreatorStorePurchasingCutoverModule() then promiseModule.promisify(performCreatorStorePurchase) else nil,
			loadAssetForEquip = promiseModule.promisify(loadAssetForEquip),
			getAccountInfo = promiseModule.promisify(getAccountInfo),
			getAssetInfo = if getFFlagEnableCreatorStorePurchasingCutoverModule() then promiseModule.promisify(getAssetInfo) else nil,
			getBalanceInfo = promiseModule.promisify(getBalanceInfo),
			getBundleDetails = getBundleDetails,
			getProductPurchasableDetails = getProductPurchasableDetails,
			getCatalogItemDetails = if fFlagRefreshPriceOnRetryAfterUpsellModule then getCatalogItemDetails else nil,
			getResellers = if fFlagRefreshPriceOnRetryAfterUpsellModule then getResellers else nil,
			getCreatorStoreProductInfo = if getFFlagEnableCreatorStorePurchasingCutoverModule() then promiseModule.promisify(getCreatorStoreProductInfo) else nil,
			getPremiumProductInfo = promiseModule.promisify(getPremiumProductInfo),
			postPremiumImpression = promiseModule.promisify(postPremiumImpression),
			getPremiumUpsellPrecheck = promiseModule.promisify(getPremiumUpsellPrecheck),
			getSubscriptionPurchaseInfo = promiseModule.promisify(getSubscriptionPurchaseInfo),
			performSubscriptionPurchase = promiseModule.promisify(performSubscriptionPurchase),
			getPurchaseWarning = promiseModule.promisify(getPurchaseWarning),
			postPurchaseWarningAcknowledge = promiseModule.promisify(postPurchaseWarningAcknowledge),
			checkUserPurchaseSettings = promiseModule.promisify(checkUserPurchaseSettings),
			getVngShopUrl = promiseModule.promisify(getVngShopUrl),
			performDevProductEdpPurchase = if fFlagEnableUnifiedProductPurchaseFlow then promiseModule.promisify(performDevProductEdpPurchase) else nil,
			getExperienceProductInfo = if fFlagEnableUnifiedProductPurchaseFlow then promiseModule.promisify(getExperienceProductInfo) else nil,
			performExperiencePurchase = if fFlagEnableUnifiedProductPurchaseFlow then promiseModule.promisify(performExperiencePurchase) else nil,
			performLookPurchase = if fFlagEnableUnifiedProductPurchaseFlow then promiseModule.promisify(performLookPurchase) else nil,
			getUnifiedPurchaseFlowUserEligibility = if fFlagEnableUnifiedProductPurchaseFlow then promiseModule.promisify(getUnifiedPurchaseFlowUserEligibility) else nil,
			performDeveloperSubscriptionRobuxPurchase = if fFlagEnableUnifiedPurchaseFlowForDevSubs then promiseModule.promisify(performDeveloperSubscriptionRobuxPurchase) else nil,
			getSubscriptionProductInfo = if fFlagEnableUnifiedPurchaseFlowForDevSubs then promiseModule.promisify(getSubscriptionProductInfo) else nil,
			GetLookDetailsV2ProductInfo = if fFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule then promiseModule.promisify(GetLookDetailsV2ProductInfo) else nil,
			postCartPricing = if fFlagPurchasePromptCartPricingEnabledModule then postCartPricing else nil,
			postInGameItemCartPricing = if fFlagEnableInExperienceOffersPurchaseFlow then postInGameItemCartPricing else nil
		}
		setmetatable(t, {
			__tostring = function()
				return "Service(Network)"
			end
		})
		
		return t
	end
}