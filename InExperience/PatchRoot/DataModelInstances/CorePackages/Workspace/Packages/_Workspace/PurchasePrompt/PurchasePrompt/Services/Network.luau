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

local function request(p0, p1, p2)
	-- upvalues: debugLogModule (ref), serializeTableModule (ref), httpService (ref)
	debugLogModule(function()
		-- upvalues: p0 (ref), serializeTableModule (copy)
		return "Request " .. p0.Url .. "\n" .. serializeTableModule(p0)
	end)
	
	return httpService:RequestInternal(p0):Start(function(p3, p4)
		-- upvalues: debugLogModule (copy), p0 (ref), serializeTableModule (copy), httpService (copy), p1 (ref), p2 (ref)
		debugLogModule(function()
			-- upvalues: p0 (copy), serializeTableModule (copy), p4 (ref)
			return "Response " .. p0.Url .. "\n" .. serializeTableModule(p4)
		end)
		
		if not p3 then
			p2(tostring(p4.StatusMessage))
			
			return
		end
		local _ = nil
		local ok, status = pcall(httpService.JSONDecode, httpService, p4.Body)
		local var67 = status
		
		if ok then
			p1(var67)
			
			return
		end
		p2("Could not parse JSON.")
	end)
end

local function getABTestGroup(p5, p6)
	-- upvalues: promiseModule (ref), request (ref), replaced_3 (ref), httpService (ref)
	local list = {
		{
			SubjectType = 1,
			ExperimentName = p6,
			SubjectTargetId = p5
		}
	}
	
	return promiseModule.new(function(p7, p8)
		-- upvalues: request (copy), replaced_3 (copy), httpService (copy), list (ref)
		return request({
			Method = "POST",
			Url = replaced_3 .. "v1/get-enrollments",
			Body = httpService:JSONEncode(list),
			Headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}, p7, p8)
	end)
end

local function getProductInfo(p9, p10)
	-- upvalues: marketplaceService (ref)
	return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then marketplaceService:GetProductInfoAsync(p9, p10) else marketplaceService:GetProductInfo(p9, p10)
end

local function getSubscriptionProductInfo(p11)
	-- upvalues: marketplaceService (ref)
	return marketplaceService:GetSubscriptionProductInfoAsync(p11)
end

local function getPremiumProductInfo()
	-- upvalues: promiseModule (ref), request (ref), replaced_6 (ref), premiumProductModule (ref), userInputService (ref)
	return promiseModule.new(function(p12, p13)
		-- upvalues: request (copy), replaced_6 (copy), premiumProductModule (copy), userInputService (copy)
		request({
			Method = "GET",
			Url = replaced_6 .. "v1/products?typeName=Subscription"
		}, function(p14)
			-- upvalues: premiumProductModule (copy), userInputService (copy), p12 (ref)
			local var69 = nil
			
			for i, v in ipairs(p14.products) do
				local var70 = premiumProductModule(v)
				
				if var70 ~= nil and (var69 == nil or var70.robuxAmount < var69.robuxAmount) then
					var69 = var70
				end
			end
			if userInputService:GetPlatform() == Enum.Platform.Android and var69 ~= nil and var69.mobileProductId ~= nil then
				var69.mobileProductId = var69.mobileProductId:lower()
			end
			p12(var69)
		end, p13)
	end)
end

local function getPlayerOwns(p15, p16, p17)
	-- upvalues: marketplaceService (ref), enablePlayerOwnsBundleApiEngineFeature (ref)
	return if p17 == Enum.InfoType.Asset then if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then marketplaceService:PlayerOwnsAssetAsync(p15, p16) else marketplaceService:PlayerOwnsAsset(p15, p16) elseif enablePlayerOwnsBundleApiEngineFeature and p17 == Enum.InfoType.Bundle then if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then marketplaceService:PlayerOwnsBundleAsync(p15, p16) else marketplaceService:PlayerOwnsBundle(p15, p16) elseif p17 == Enum.InfoType.GamePass then marketplaceService:UserOwnsGamePassAsync(p15.UserId, p16) else p17 == Enum.InfoType.Subscription and marketplaceService:IsPlayerSubscribed(p15, p16)
end

local function performPurchase(p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29)
	-- upvalues: getFFlagEnablePromptPurchaseRequestedV2Module (ref), getFFlagEnablePromptPurchaseRequestedV2Take2Module (ref), fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (ref), marketplaceService (ref), fFlagEnablePurchasePayloadInExperienceShop (ref), isGenericChallengeResponseModule (ref)
	local ok, status = pcall(function()
		-- upvalues: getFFlagEnablePromptPurchaseRequestedV2Module (copy), getFFlagEnablePromptPurchaseRequestedV2Take2Module (copy), fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (copy), marketplaceService (copy), p18 (ref), p19 (ref), p20 (ref), p21 (ref), p22 (ref), p23 (ref), p24 (ref), p25 (ref), p26 (ref), p27 (ref), fFlagEnablePurchasePayloadInExperienceShop (copy), p28 (ref), p29 (ref)
		return if not (not getFFlagEnablePromptPurchaseRequestedV2Module() and not getFFlagEnablePromptPurchaseRequestedV2Take2Module()) then if fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow then marketplaceService:PerformPurchase(p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, if fFlagEnablePurchasePayloadInExperienceShop then p28 else nil, p29) elseif fFlagEnablePurchasePayloadInExperienceShop then marketplaceService:PerformPurchase(p18, p19, p20, p21, p22, p23, p24, p25, p26, nil, p28) else marketplaceService:PerformPurchase(p18, p19, p20, p21, p22, p23, p24, p25, p26) else marketplaceService:PerformPurchase(p18, p19, p20, p21, p22, p23, p24, p25)
	end)
	
	if ok then
		return status
	elseif isGenericChallengeResponseModule(status) then
		return status
	end
	error(tostring(status))
end

local function performPurchaseV2(p30, p31, p32, p33, p34, p35, p36, p37, p38, p39, p40)
	-- upvalues: marketplaceService (ref), isGenericChallengeResponseModule (ref)
	local ok, status = pcall(function()
		-- upvalues: p35 (ref), p36 (ref), p37 (ref), p38 (ref), p39 (ref), p40 (ref), marketplaceService (copy), p30 (ref), p31 (ref), p32 (ref), p33 (ref), p34 (ref)
		return marketplaceService:PerformPurchaseV2(p30, p31, p32, p33, p34, {
			CollectibleItemId = p35,
			CollectibleProductId = p36,
			IdempotencyKey = p37,
			PurchaseAuthToken = p38,
			CollectibleItemInstanceId = p39,
			PurchaseOptions = p40
		})
	end)
	
	if ok then
		return status
	elseif isGenericChallengeResponseModule(status) then
		return status
	end
	error(tostring(status))
end

local function performCreatorStorePurchase(p41, p42)
	-- upvalues: creatorStoreService (ref), isGenericChallengeResponseModule (ref)
	local ok, status = pcall(function()
		-- upvalues: creatorStoreService (copy), p41 (ref), p42 (ref)
		return creatorStoreService:performCreatorStorePurchase(p41, p42)
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

local function getCreatorStoreProductInfo(p43, p44)
	-- upvalues: creatorStoreService (ref)
	return creatorStoreService:getCreatorStoreProductInfoAsync(p43, p44)
end

local function loadAssetForEquip(value)
	-- upvalues: insertService (ref)
	return insertService:LoadAsset(value)
end

local function getAccountInfo()
	-- upvalues: promiseModule (ref), request (ref), replaced_8 (ref)
	return promiseModule.new(function(p45, p46)
		-- upvalues: request (copy), replaced_8 (copy)
		request({
			Method = "GET",
			Url = replaced_8 .. "v1/users/authenticated/app-launch-info"
		}, p45, p46)
	end)
end

local function getBalanceInfo()
	-- upvalues: promiseModule (ref), request (ref), replaced_5 (ref)
	return promiseModule.new(function(p47, p48)
		-- upvalues: request (copy), replaced_5 (copy)
		request({ Method = "GET", Url = replaced_5 .. "v1/user/currency" }, p47, p48)
	end)
end

local function getBundleDetails(p49)
	-- upvalues: replaced_4 (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = replaced_4 .. "v1/bundles/" .. tostring(p49) .. "/details"
	}
	
	return promiseModule.new(function(p50, p51)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p50 (ref), p51 (ref)
			request(t, p50, p51)
		end)
	end)
end

local function getProductPurchasableDetails(p52)
	-- upvalues: replaced_5 (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = replaced_5 .. "v1/products/" .. tostring(p52) .. "?showPurchasable=true"
	}
	
	return promiseModule.new(function(p53, p54)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p53 (ref), p54 (ref)
			request(t, p53, p54)
		end)
	end)
end

local function getCatalogItemDetails(p55, p56)
	-- upvalues: replaced_4 (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = string.format("%sv1/catalog/items/%d/details?itemType=%s", replaced_4, p55, p56)
	}
	
	return promiseModule.new(function(p57, p58)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p57 (ref), p58 (ref)
			request(t, p57, p58)
		end)
	end)
end

local function getResellers(p59, p60)
	-- upvalues: replaced_1 (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = string.format("%smarketplace-sales/v1/item/%s/resellers?cursor=&limit=%d", replaced_1, p59, p60 or 10)
	}
	
	return promiseModule.new(function(p61, p62)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p61 (ref), p62 (ref)
			request(t, p61, p62)
		end)
	end)
end

local function postCartPricing(p63)
	-- upvalues: replaced_1 (ref), httpService (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "POST",
		Url = replaced_1 .. "marketplace-sales/v1/cart-pricing",
		Body = httpService:JSONEncode(p63),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return promiseModule.new(function(p64, p65)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p64 (ref), p65 (ref)
			request(t, function(p66)
				-- upvalues: p64 (copy)
				p64(p66)
			end, function(p67)
				-- upvalues: p65 (copy)
				p65(p67)
			end)
		end)
	end)
end

local function postInGameItemCartPricing(p68)
	-- upvalues: replaced_1 (ref), httpService (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "POST",
		Url = replaced_1 .. "checkout-api/v1/cart-pricing",
		Body = httpService:JSONEncode(p68),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return promiseModule.new(function(p69, p70)
		-- upvalues: request (copy), t (ref)
		request(t, p69, p70)
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
	
	return promiseModule.new(function(p71, p72)
		-- upvalues: httpService (copy), t (ref)
		spawn(function()
			-- upvalues: httpService (copy), t (copy), p71 (ref), p72 (ref)
			return httpService:RequestInternal(t):Start(function(p73, p74)
				-- upvalues: p71 (copy), p72 (copy)
				if p73 and p74.StatusCode == 200 then
					p71()
					
					return
				end
				p72()
			end)
		end)
	end)
end

local function getSubscriptionPurchaseInfo(p75)
	-- upvalues: marketplaceService (ref)
	return marketplaceService:GetSubscriptionPurchaseInfoAsync(p75)
end

local function performSubscriptionPurchase(p76, p77)
	-- upvalues: marketplaceService (ref)
	return marketplaceService:PerformSubscriptionPurchaseV2(p76, p77)
end

local function getPurchaseWarning(p78, p79, p80)
	-- upvalues: urlBuilder (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = urlBuilder.economy.purchaseWarning.getPurchaseWarning(p78, p79, not p80)
	}
	
	return promiseModule.new(function(p81, p82)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p81 (ref), p82 (ref)
			request(t, p81, p82)
		end)
	end)
end

local function postPurchaseWarningAcknowledge(p83)
	-- upvalues: urlBuilder (ref), httpService (ref), promiseModule (ref)
	local t = {
		Method = "POST",
		Url = urlBuilder.economy.purchaseWarning.ackPurchaseWarning(),
		Body = httpService:JSONEncode({ acknowledgement = p83 }),
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
	
	return promiseModule.new(function(p84, p85)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p84 (ref), p85 (ref)
			request(t, p84, p85)
		end)
	end)
end

local function getVngShopUrl()
	-- upvalues: urlBuilder (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = urlBuilder.economy.vngPayments.getVngShopUrl()
	}
	
	return promiseModule.new(function(p86, p87)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p86 (ref), p87 (ref)
			request(t, p86, p87)
		end)
	end)
end

local function performDevProductEdpPurchase(p88, p89)
	-- upvalues: fFlagEnableRequestLocationTypeForSduiPurchaseModule (ref), replaced_1 (ref), httpService (ref), promiseModule (ref), request (ref)
	local requestLocationType, var83
	local _ = nil
	
	if fFlagEnableRequestLocationTypeForSduiPurchaseModule then
		requestLocationType = p89.requestLocationType
		var83 = if requestLocationType == nil or requestLocationType == "" then ("%sdeveloper-products/v1/developer-products/%i/purchase"):format(replaced_1, p88) else ("%sdeveloper-products/v1/developer-products/%i/purchase?requestLocationType=%s"):format(replaced_1, p88, requestLocationType)
	else
		var83 = ("%sdeveloper-products/v1/developer-products/%i/purchase?requestLocationType=ExperienceDetailPage"):format(replaced_1, p88)
	end
	requestLocationType = {
		Method = "POST",
		Url = var83,
		Body = httpService:JSONEncode(p89),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return promiseModule.new(function(p90, p91)
		-- upvalues: request (copy), requestLocationType (ref)
		spawn(function()
			-- upvalues: request (copy), requestLocationType (copy), p90 (ref), p91 (ref)
			request(requestLocationType, p90, p91)
		end)
	end)
end

local function getExperienceProductInfo(p92)
	-- upvalues: replaced_2 (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = ("%sv1/games/games-product-info?universeIds=%s"):format(replaced_2, p92)
	}
	
	return promiseModule.new(function(p93, p94)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p93 (ref), p94 (ref)
			request(t, p93, p94)
		end)
	end)
end

local function performExperiencePurchase(p95, p96)
	-- upvalues: replaced_5 (ref), httpService (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "POST",
		Url = ("%sv1/purchases/products/%s"):format(replaced_5, p95),
		Body = httpService:JSONEncode(p96),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return promiseModule.new(function(p97, p98)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p97 (ref), p98 (ref)
			request(t, p97, p98)
		end)
	end)
end

local function performLookPurchase(p99, p100)
	-- upvalues: replaced_1 (ref), httpService (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "POST",
		Url = ("%slook-api/v2/looks/%s/purchase"):format(replaced_1, p99),
		Body = httpService:JSONEncode(p100),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return promiseModule.new(function(p101, p102)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p101 (ref), p102 (ref)
			request(t, p101, p102)
		end)
	end)
end

local function performDeveloperSubscriptionRobuxPurchase(p103, p104)
	-- upvalues: enableDevSubscriptionPurchaseWithRobuxEngineFeature (ref), marketplaceService (ref)
	if not enableDevSubscriptionPurchaseWithRobuxEngineFeature then
		error("Developer subscription Robux purchase requires engine feature to be enabled")
		
		return
	end
	local ok, status = pcall(function()
		-- upvalues: marketplaceService (copy), p103 (ref), p104 (ref)
		marketplaceService:PerformSubscriptionPurchaseWithRobuxAsync(p103, p104)
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
	
	return promiseModule.new(function(p105, p106)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p105 (ref), p106 (ref)
			request(t, p105, p106)
		end)
	end)
end

local function GetLookDetailsV2ProductInfo(p107)
	-- upvalues: replaced_1 (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = string.format("%slook-api/v2/looks/%s", replaced_1, p107)
	}
	
	return promiseModule.new(function(p108, p109)
		-- upvalues: request (copy), t (ref)
		spawn(function()
			-- upvalues: request (copy), t (copy), p108 (ref), p109 (ref)
			request(t, p108, p109)
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