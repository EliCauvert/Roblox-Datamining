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
local getFFlagUseCatalogItemDetailsToResolveBundlePurchaseModule = require(purchasePrompt.Flags.GetFFlagUseCatalogItemDetailsToResolveBundlePurchase)
local getFFlagEnableCreatorStorePurchasingCutoverModule = require(purchasePrompt.Flags.GetFFlagEnableCreatorStorePurchasingCutover)
local fFlagEnableUnifiedProductPurchaseFlow = require(parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local fFlagEnableUnifiedPurchaseFlowForDevSubs = require(parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local fFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule = require(purchasePrompt.Flags.FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsell)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = sharedFlagsModule.FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local fFlagEnablePurchasePayloadInExperienceShop = sharedFlagsModule.FFlagEnablePurchasePayloadInExperienceShop
local fFlagRefreshPriceOnRetryAfterUpsellModule = require(purchasePrompt.Flags.FFlagRefreshPriceOnRetryAfterUpsell)
local fFlagPurchasePromptCartPricingEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
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

local function request(p0, p1, p2) --[[ line: 55 ]]
	-- upvalues: debugLogModule (ref), serializeTableModule (ref), httpService (ref)
	debugLogModule(function() --[[ line: 56 ]]
		-- upvalues: p0 (ref), serializeTableModule (copy)
		return "Request " .. p0.Url .. "\n" .. serializeTableModule(p0)
	end)
	
	return httpService:RequestInternal(p0):Start(function(p3, p4) --[[ line: 59 ]]
		-- upvalues: debugLogModule (copy), p0 (ref), serializeTableModule (copy), httpService (copy), p1 (ref), p2 (ref)
		debugLogModule(function() --[[ line: 60 ]]
			-- upvalues: p0 (copy), serializeTableModule (copy), p4 (ref)
			return "Response " .. p0.Url .. "\n" .. serializeTableModule(p4)
		end)
		
		if not p3 then
			p2(tostring(p4.StatusMessage))
			
			return
		end
		local _ = nil
		local ok, status = pcall(httpService.JSONDecode, httpService, p4.Body)
		local var66 = status
		
		if ok then
			p1(var66)
			
			return
		end
		p2("Could not parse JSON.")
	end)
end

local function getABTestGroup(p5, p6) --[[ line: 80 ]]
	-- upvalues: promiseModule (ref), request (ref), replaced_3 (ref), httpService (ref)
	local list = {
		{
			SubjectType = 1,
			ExperimentName = p6,
			SubjectTargetId = p5
		}
	}
	
	return promiseModule.new(function(p7, p8) --[[ line: 89 ]]
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

local function getProductInfo(p9, p10) --[[ line: 102 ]]
	-- upvalues: marketplaceService (ref)
	return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then marketplaceService:GetProductInfoAsync(p9, p10) else marketplaceService:GetProductInfo(p9, p10)
end

local function getSubscriptionProductInfo(p11) --[[ line: 110 ]]
	-- upvalues: marketplaceService (ref)
	return marketplaceService:GetSubscriptionProductInfoAsync(p11)
end

local function getPremiumProductInfo() --[[ line: 114 ]]
	-- upvalues: promiseModule (ref), request (ref), replaced_6 (ref), premiumProductModule (ref), userInputService (ref)
	return promiseModule.new(function(p12, p13) --[[ line: 115 ]]
		-- upvalues: request (copy), replaced_6 (copy), premiumProductModule (copy), userInputService (copy)
		request({
			Method = "GET",
			Url = replaced_6 .. "v1/products?typeName=Subscription"
		}, function(p14) --[[ line: 119 ]]
			-- upvalues: premiumProductModule (copy), userInputService (copy), p12 (ref)
			local var68 = nil
			
			for i, v in ipairs(p14.products) do
				local var69 = premiumProductModule(v)
				
				if var69 ~= nil and (var68 == nil or var69.robuxAmount < var68.robuxAmount) then
					var68 = var69
				end
			end
			if userInputService:GetPlatform() == Enum.Platform.Android and var68 ~= nil and var68.mobileProductId ~= nil then
				var68.mobileProductId = var68.mobileProductId:lower()
			end
			p12(var68)
		end, p13)
	end)
end

local function getPlayerOwns(p15, p16, p17) --[[ line: 142 ]]
	-- upvalues: marketplaceService (ref), enablePlayerOwnsBundleApiEngineFeature (ref)
	return if p17 == Enum.InfoType.Asset then if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then marketplaceService:PlayerOwnsAssetAsync(p15, p16) else marketplaceService:PlayerOwnsAsset(p15, p16) elseif enablePlayerOwnsBundleApiEngineFeature and p17 == Enum.InfoType.Bundle then if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then marketplaceService:PlayerOwnsBundleAsync(p15, p16) else marketplaceService:PlayerOwnsBundle(p15, p16) elseif p17 == Enum.InfoType.GamePass then marketplaceService:UserOwnsGamePassAsync(p15.UserId, p16) else p17 == Enum.InfoType.Subscription and marketplaceService:IsPlayerSubscribed(p15, p16)
end

local function performPurchase(p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29) --[[ line: 164 ]]
	-- upvalues: getFFlagEnablePromptPurchaseRequestedV2Module (ref), getFFlagEnablePromptPurchaseRequestedV2Take2Module (ref), fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (ref), marketplaceService (ref), fFlagEnablePurchasePayloadInExperienceShop (ref), isGenericChallengeResponseModule (ref)
	local ok, status = pcall(function() --[[ line: 178 ]]
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

local function performPurchaseV2(p30, p31, p32, p33, p34, p35, p36, p37, p38, p39, p40) --[[ line: 250 ]]
	-- upvalues: marketplaceService (ref), isGenericChallengeResponseModule (ref)
	local ok, status = pcall(function() --[[ line: 263 ]]
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

local function performCreatorStorePurchase(p41, p42) --[[ line: 297 ]]
	-- upvalues: creatorStoreService (ref), isGenericChallengeResponseModule (ref)
	local ok, status = pcall(function() --[[ line: 298 ]]
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

local function getAssetInfo(value) --[[ line: 317 ]]
	-- upvalues: creatorStoreService (ref)
	return creatorStoreService:getAssetInfoAsync(value)
end

local function getCreatorStoreProductInfo(p43, p44) --[[ line: 321 ]]
	-- upvalues: creatorStoreService (ref)
	return creatorStoreService:getCreatorStoreProductInfoAsync(p43, p44)
end

local function loadAssetForEquip(value) --[[ line: 325 ]]
	-- upvalues: insertService (ref)
	return insertService:LoadAsset(value)
end

local function getAccountInfo() --[[ line: 329 ]]
	-- upvalues: promiseModule (ref), request (ref), replaced_8 (ref)
	return promiseModule.new(function(p45, p46) --[[ line: 330 ]]
		-- upvalues: request (copy), replaced_8 (copy)
		request({
			Method = "GET",
			Url = replaced_8 .. "v1/users/authenticated/app-launch-info"
		}, p45, p46)
	end)
end

local function getBalanceInfo() --[[ line: 338 ]]
	-- upvalues: promiseModule (ref), request (ref), replaced_5 (ref)
	return promiseModule.new(function(p47, p48) --[[ line: 339 ]]
		-- upvalues: request (copy), replaced_5 (copy)
		request({ Method = "GET", Url = replaced_5 .. "v1/user/currency" }, p47, p48)
	end)
end

local function getBundleDetails(p49) --[[ line: 347 ]]
	-- upvalues: replaced_4 (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = replaced_4 .. "v1/bundles/" .. tostring(p49) .. "/details"
	}
	
	return promiseModule.new(function(p50, p51) --[[ line: 354 ]]
		-- upvalues: request (copy), t (ref)
		spawn(function() --[[ line: 355 ]]
			-- upvalues: request (copy), t (copy), p50 (ref), p51 (ref)
			request(t, p50, p51)
		end)
	end)
end

local function getProductPurchasableDetails(p52) --[[ line: 361 ]]
	-- upvalues: replaced_5 (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = replaced_5 .. "v1/products/" .. tostring(p52) .. "?showPurchasable=true"
	}
	
	return promiseModule.new(function(p53, p54) --[[ line: 368 ]]
		-- upvalues: request (copy), t (ref)
		spawn(function() --[[ line: 369 ]]
			-- upvalues: request (copy), t (copy), p53 (ref), p54 (ref)
			request(t, p53, p54)
		end)
	end)
end

local function getCatalogItemDetails(p55, p56) --[[ line: 375 ]]
	-- upvalues: replaced_4 (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = string.format("%sv1/catalog/items/%d/details?itemType=%s", replaced_4, p55, p56)
	}
	
	return promiseModule.new(function(p57, p58) --[[ line: 381 ]]
		-- upvalues: request (copy), t (ref)
		spawn(function() --[[ line: 382 ]]
			-- upvalues: request (copy), t (copy), p57 (ref), p58 (ref)
			request(t, p57, p58)
		end)
	end)
end

local function getResellers(p59, p60) --[[ line: 388 ]]
	-- upvalues: replaced_1 (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = string.format("%smarketplace-sales/v1/item/%s/resellers?cursor=&limit=%d", replaced_1, p59, p60 or 10)
	}
	
	return promiseModule.new(function(p61, p62) --[[ line: 400 ]]
		-- upvalues: request (copy), t (ref)
		spawn(function() --[[ line: 401 ]]
			-- upvalues: request (copy), t (copy), p61 (ref), p62 (ref)
			request(t, p61, p62)
		end)
	end)
end

local function postCartPricing(p63) --[[ line: 407 ]]
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
	
	return promiseModule.new(function(p64, p65) --[[ line: 420 ]]
		-- upvalues: request (copy), t (ref)
		spawn(function() --[[ line: 421 ]]
			-- upvalues: request (copy), t (copy), p64 (ref), p65 (ref)
			request(t, function(p66) --[[ line: 422 ]]
				-- upvalues: p64 (copy)
				p64(p66)
			end, function(p67) --[[ line: 424 ]]
				-- upvalues: p65 (copy)
				p65(p67)
			end)
		end)
	end)
end

local function postPremiumImpression() --[[ line: 431 ]]
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
	
	return promiseModule.new(function(_, _) --[[ line: 446 ]]
		-- upvalues: httpService (copy), t (ref)
		spawn(function() --[[ line: 447 ]]
			-- upvalues: httpService (copy), t (copy)
			return httpService:RequestInternal(t):Start(function(_, _) --[[ line: 448 ]] end)
		end)
	end)
end

local function getPremiumUpsellPrecheck() --[[ line: 455 ]]
	-- upvalues: replaced_6 (ref), playersService (ref), promiseModule (ref), httpService (ref)
	local t = {
		Method = "GET",
		Url = string.format("%sv1/users/%d/premium-upsell-precheck?universeId=%d&placeId=%d", replaced_6, playersService.LocalPlayer.UserId, game.GameId, game.PlaceId)
	}
	
	return promiseModule.new(function(p68, p69) --[[ line: 467 ]]
		-- upvalues: httpService (copy), t (ref)
		spawn(function() --[[ line: 468 ]]
			-- upvalues: httpService (copy), t (copy), p68 (ref), p69 (ref)
			return httpService:RequestInternal(t):Start(function(p70, p71) --[[ line: 469 ]]
				-- upvalues: p68 (copy), p69 (copy)
				if p70 and p71.StatusCode == 200 then
					p68()
					
					return
				end
				p69()
			end)
		end)
	end)
end

local function getSubscriptionPurchaseInfo(p72) --[[ line: 480 ]]
	-- upvalues: marketplaceService (ref)
	return marketplaceService:GetSubscriptionPurchaseInfoAsync(p72)
end

local function performSubscriptionPurchase(p73, p74) --[[ line: 484 ]]
	-- upvalues: marketplaceService (ref)
	return marketplaceService:PerformSubscriptionPurchaseV2(p73, p74)
end

local function getPurchaseWarning(p75, p76, p77) --[[ line: 488 ]]
	-- upvalues: urlBuilder (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = urlBuilder.economy.purchaseWarning.getPurchaseWarning(p75, p76, not p77)
	}
	
	return promiseModule.new(function(p78, p79) --[[ line: 494 ]]
		-- upvalues: request (copy), t (ref)
		spawn(function() --[[ line: 495 ]]
			-- upvalues: request (copy), t (copy), p78 (ref), p79 (ref)
			request(t, p78, p79)
		end)
	end)
end

local function postPurchaseWarningAcknowledge(p80) --[[ line: 501 ]]
	-- upvalues: urlBuilder (ref), httpService (ref), promiseModule (ref)
	local t = {
		Method = "POST",
		Url = urlBuilder.economy.purchaseWarning.ackPurchaseWarning(),
		Body = httpService:JSONEncode({ acknowledgement = p80 }),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return promiseModule.new(function(_, _) --[[ line: 515 ]]
		-- upvalues: httpService (copy), t (ref)
		spawn(function() --[[ line: 516 ]]
			-- upvalues: httpService (copy), t (copy)
			return httpService:RequestInternal(t):Start(function(_, _) --[[ line: 517 ]] end)
		end)
	end)
end

local function checkUserPurchaseSettings() --[[ line: 524 ]]
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
	
	return promiseModule.new(function(p81, p82) --[[ line: 537 ]]
		-- upvalues: request (copy), t (ref)
		spawn(function() --[[ line: 538 ]]
			-- upvalues: request (copy), t (copy), p81 (ref), p82 (ref)
			request(t, p81, p82)
		end)
	end)
end

local function getVngShopUrl() --[[ line: 544 ]]
	-- upvalues: urlBuilder (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = urlBuilder.economy.vngPayments.getVngShopUrl()
	}
	
	return promiseModule.new(function(p83, p84) --[[ line: 552 ]]
		-- upvalues: request (copy), t (ref)
		spawn(function() --[[ line: 553 ]]
			-- upvalues: request (copy), t (copy), p83 (ref), p84 (ref)
			request(t, p83, p84)
		end)
	end)
end

local function performDevProductEdpPurchase(p85, p86) --[[ line: 559 ]]
	-- upvalues: replaced_1 (ref), httpService (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "POST",
		Url = ("%sdeveloper-products/v1/developer-products/%i/purchase?requestLocationType=ExperienceDetailPage"):format(replaced_1, p85),
		Body = httpService:JSONEncode(p86),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return promiseModule.new(function(p87, p88) --[[ line: 575 ]]
		-- upvalues: request (copy), t (ref)
		spawn(function() --[[ line: 576 ]]
			-- upvalues: request (copy), t (copy), p87 (ref), p88 (ref)
			request(t, p87, p88)
		end)
	end)
end

local function getExperienceProductInfo(p89) --[[ line: 582 ]]
	-- upvalues: replaced_2 (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = ("%sv1/games/games-product-info?universeIds=%s"):format(replaced_2, p89)
	}
	
	return promiseModule.new(function(p90, p91) --[[ line: 590 ]]
		-- upvalues: request (copy), t (ref)
		spawn(function() --[[ line: 591 ]]
			-- upvalues: request (copy), t (copy), p90 (ref), p91 (ref)
			request(t, p90, p91)
		end)
	end)
end

local function performExperiencePurchase(p92, p93) --[[ line: 597 ]]
	-- upvalues: replaced_5 (ref), httpService (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "POST",
		Url = ("%sv1/purchases/products/%s"):format(replaced_5, p92),
		Body = httpService:JSONEncode(p93),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return promiseModule.new(function(p94, p95) --[[ line: 610 ]]
		-- upvalues: request (copy), t (ref)
		spawn(function() --[[ line: 611 ]]
			-- upvalues: request (copy), t (copy), p94 (ref), p95 (ref)
			request(t, p94, p95)
		end)
	end)
end

local function performLookPurchase(p96, p97) --[[ line: 617 ]]
	-- upvalues: replaced_1 (ref), httpService (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "POST",
		Url = ("%slook-api/v2/looks/%s/purchase"):format(replaced_1, p96),
		Body = httpService:JSONEncode(p97),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	
	return promiseModule.new(function(p98, p99) --[[ line: 630 ]]
		-- upvalues: request (copy), t (ref)
		spawn(function() --[[ line: 631 ]]
			-- upvalues: request (copy), t (copy), p98 (ref), p99 (ref)
			request(t, p98, p99)
		end)
	end)
end

local function performDeveloperSubscriptionRobuxPurchase(p100, p101) --[[ line: 637 ]]
	-- upvalues: enableDevSubscriptionPurchaseWithRobuxEngineFeature (ref), marketplaceService (ref)
	if not enableDevSubscriptionPurchaseWithRobuxEngineFeature then
		error("Developer subscription Robux purchase requires engine feature to be enabled")
		
		return
	end
	local ok, status = pcall(function() --[[ line: 639 ]]
		-- upvalues: marketplaceService (copy), p100 (ref), p101 (ref)
		marketplaceService:PerformSubscriptionPurchaseWithRobuxAsync(p100, p101)
	end)
	
	if not ok then
		error(status)
	end
end

local function getUnifiedPurchaseFlowUserEligibility() --[[ line: 651 ]]
	-- upvalues: replaced_1 (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = ("%sroblox-subscriptions/v1/metadata"):format(replaced_1)
	}
	
	return promiseModule.new(function(p102, p103) --[[ line: 659 ]]
		-- upvalues: request (copy), t (ref)
		spawn(function() --[[ line: 660 ]]
			-- upvalues: request (copy), t (copy), p102 (ref), p103 (ref)
			request(t, p102, p103)
		end)
	end)
end

local function GetLookDetailsV2ProductInfo(p104) --[[ line: 666 ]]
	-- upvalues: replaced_1 (ref), promiseModule (ref), request (ref)
	local t = {
		Method = "GET",
		Url = string.format("%slook-api/v2/looks/%s", replaced_1, p104)
	}
	
	return promiseModule.new(function(p105, p106) --[[ line: 674 ]]
		-- upvalues: request (copy), t (ref)
		spawn(function() --[[ line: 675 ]]
			-- upvalues: request (copy), t (copy), p105 (ref), p106 (ref)
			request(t, p105, p106)
		end)
	end)
end

return {
	new = function() --[[ line: 685 ]]
		-- upvalues: promiseModule (ref), getABTestGroup (ref), getProductInfo (ref), getPlayerOwns (ref), performPurchase (ref), performPurchaseV2 (ref), getFFlagEnableCreatorStorePurchasingCutoverModule (ref), performCreatorStorePurchase (ref), loadAssetForEquip (ref), getAccountInfo (ref), getAssetInfo (ref), getBalanceInfo (ref), getBundleDetails (ref), getProductPurchasableDetails (ref), getFFlagUseCatalogItemDetailsToResolveBundlePurchaseModule (ref), fFlagRefreshPriceOnRetryAfterUpsellModule (ref), getCatalogItemDetails (ref), getResellers (ref), getCreatorStoreProductInfo (ref), getPremiumProductInfo (ref), postPremiumImpression (ref), getPremiumUpsellPrecheck (ref), getSubscriptionPurchaseInfo (ref), performSubscriptionPurchase (ref), getPurchaseWarning (ref), postPurchaseWarningAcknowledge (ref), checkUserPurchaseSettings (ref), getVngShopUrl (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), performDevProductEdpPurchase (ref), getExperienceProductInfo (ref), performExperiencePurchase (ref), performLookPurchase (ref), getUnifiedPurchaseFlowUserEligibility (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), performDeveloperSubscriptionRobuxPurchase (ref), getSubscriptionProductInfo (ref), fFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule (ref), GetLookDetailsV2ProductInfo (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), postCartPricing (ref)
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
			getCatalogItemDetails = if getFFlagUseCatalogItemDetailsToResolveBundlePurchaseModule() or fFlagRefreshPriceOnRetryAfterUpsellModule then getCatalogItemDetails else nil,
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
			postCartPricing = if fFlagPurchasePromptCartPricingEnabledModule then postCartPricing else nil
		}
		setmetatable(t, {
			__tostring = function() --[[ line: 746 ]]
				return "Service(Network)"
			end
		})
		
		return t
	end
}