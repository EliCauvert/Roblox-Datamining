local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local playersService = game:GetService("Players")
local sendAXCounterV2 = require(parent.AvatarExperienceAnalytics).sendAXCounterV2
local fFlagAXCatalogOffersBannerMockApi = require(parent.AvatarExperienceFlags).FFlagAXCatalogOffersBannerMockApi
local fFlagPurchasePromptFetchCartPricing = require(parent.SharedFlags).FFlagPurchasePromptFetchCartPricing
local purchasePromptLiteModule = require(parent.PurchasePromptLite)
local signalsModule = require(parent.Signals)
local _ = require(parent.LuauPolyfill)
local constantsModule = require(avatarExperienceCatalog.Constants)
local getMarketplaceOffersBanner = require(avatarExperienceCatalog.Api.GetMarketplaceOffersBanner.getMarketplaceOffersBanner).getMarketplaceOffersBanner
local mockGetOffersForUser = require(avatarExperienceCatalog.Api.GetMarketplaceOffersBanner.mockGetOffersForUser).mockGetOffersForUser
local _ = require(avatarExperienceCatalog.Api.GetMarketplaceOffersBanner.MarketplaceOffersBannerTypes)
local getLocalUserIdModule = require(avatarExperienceCatalog.Utils.getLocalUserId)

return function() --[[ line: 55 | named "createCatalogOffersBannerStore" ]]
	-- upvalues: signalsModule (ref), fFlagPurchasePromptFetchCartPricing (ref), fFlagAXCatalogOffersBannerMockApi (ref), mockGetOffersForUser (ref), sendAXCounterV2 (ref), constantsModule (ref), getLocalUserIdModule (ref), playersService (ref), getMarketplaceOffersBanner (ref), purchasePromptLiteModule (ref)
	local var6, var7 = signalsModule.createSignal(nil)
	local var8, var9 = signalsModule.createSignal(false)
	local var10, var11 = signalsModule.createSignal(false)
	local var12, var13 = signalsModule.createSignal(false)
	local var14 = nil
	
	local function notifyPurchaseCompleted() --[[ line: 67 ]] end
	
	local function fetchOffers(p0, p1) --[[ line: 69 ]]
		-- upvalues: fFlagPurchasePromptFetchCartPricing (copy), var14 (write), var11 (ref), var13 (ref), fFlagAXCatalogOffersBannerMockApi (copy), mockGetOffersForUser (copy), sendAXCounterV2 (copy), constantsModule (copy), var7 (ref), getLocalUserIdModule (copy), playersService (copy), getMarketplaceOffersBanner (copy)
		if fFlagPurchasePromptFetchCartPricing then
			var14 = p0
		end
		var11(true)
		local var17 = false
		local var18 = false
		local var19 = nil
		
		local function _(p2) --[[ line: 82 | named "finishOnce" ]]
			-- upvalues: var18 (write), var11 (copy), var13 (copy)
			if var18 then return end
			var18 = true
			var11(false)
			
			if not p2 then
				var13(true)
			end
		end
		
		local function cleanup() --[[ line: 93 ]]
			-- upvalues: var17 (write), var19 (write), var18 (write), var11 (copy)
			if var17 then return end
			var17 = true
			
			if var19 then
				var19()
			end
			if var18 then
				return
			end
			var18 = true
			var11(false)
		end
		
		if fFlagAXCatalogOffersBannerMockApi then
			local var21, var22 = mockGetOffersForUser()
			var19 = var22
			var21:andThen(function(p4) --[[ line: 108 ]]
				-- upvalues: var17 (write), sendAXCounterV2 (copy), constantsModule (copy), var7 (copy), var18 (write), var11 (copy), var13 (copy)
				if not var17 and p4 then
					sendAXCounterV2(constantsModule.COUNTERS.CatalogOffersBanner.fetchSucceeded)
					var7(p4)
				end
				if var18 then return end
				var18 = true
				var11(false)
				
				if not var17 then
					var13(true)
				end
			end):catch(function(p3) --[[ line: 115 ]]
				-- upvalues: var17 (write), sendAXCounterV2 (copy), constantsModule (copy), var18 (write), var11 (copy), var13 (copy)
				if not var17 then
					sendAXCounterV2(constantsModule.COUNTERS.CatalogOffersBanner.fetchFailed)
					warn("[catalogOffersBannerStore] mock failed:", p3)
				end
				if var18 then return end
				var18 = true
				var11(false)
				
				if not var17 then
					var13(true)
				end
			end)
			
			return cleanup
		end
		local var23 = getLocalUserIdModule(playersService)
		
		if var23 == nil then
			warn("[catalogOffersBannerStore] no LocalPlayer; skipping offers fetch")
			var18 = true
			var11(false)
			var13(true)
			
			return function() --[[ line: 129 ]] end
		end
		local var24, var25 = getMarketplaceOffersBanner(var23, p0, p1)
		var19 = var25
		var24:andThen(function(p6) --[[ line: 135 ]]
			-- upvalues: var17 (write), sendAXCounterV2 (copy), constantsModule (copy), var7 (copy), var18 (write), var11 (copy), var13 (copy)
			if not var17 then
				if p6 then
					sendAXCounterV2(constantsModule.COUNTERS.CatalogOffersBanner.fetchSucceeded)
				end
				var7(p6)
			end
			if var18 then return end
			var18 = true
			var11(false)
			
			if not var17 then
				var13(true)
			end
		end):catch(function(p5) --[[ line: 144 ]]
			-- upvalues: var17 (write), sendAXCounterV2 (copy), constantsModule (copy), var18 (write), var11 (copy), var13 (copy)
			if not var17 then
				sendAXCounterV2(constantsModule.COUNTERS.CatalogOffersBanner.fetchFailed)
				warn("[catalogOffersBannerStore] fetch failed:", p5)
			end
			if var18 then return end
			var18 = true
			var11(false)
			
			if not var17 then
				var13(true)
			end
		end)
		
		return cleanup
	end
	
	if fFlagPurchasePromptFetchCartPricing then
		purchasePromptLiteModule.Events.purchaseCompletedEvent:Connect(function() --[[ line: 159 ]]
			-- upvalues: var14 (write), var10 (ref), fetchOffers (ref)
			if not var14 then return end
			if var10(false) then
				return
			end
			fetchOffers(var14, "cart")
		end)
	end
	return {
		getPayload = var6,
		setPayload = var7,
		getDismissed = var8,
		setDismissed = var9,
		getHasCompletedOffersFetch = var12,
		getOffersFetchInProgress = var10,
		fetchOffers = fetchOffers,
		notifyPurchaseCompleted = notifyPurchaseCompleted
	}
end