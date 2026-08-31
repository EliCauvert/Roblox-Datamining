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

return function()
	-- upvalues: signalsModule (ref), fFlagPurchasePromptFetchCartPricing (ref), fFlagAXCatalogOffersBannerMockApi (ref), mockGetOffersForUser (ref), sendAXCounterV2 (ref), constantsModule (ref), getLocalUserIdModule (ref), playersService (ref), getMarketplaceOffersBanner (ref), purchasePromptLiteModule (ref)
	local var1, var2 = signalsModule.createSignal(nil)
	local var3, var4 = signalsModule.createSignal(false)
	local var5, var6 = signalsModule.createSignal(false)
	local var7, var8 = signalsModule.createSignal(false)
	local var9 = nil
	
	local function notifyPurchaseCompleted() end
	
	local function fetchOffers(p1, p2)
		-- upvalues: fFlagPurchasePromptFetchCartPricing (copy), var9 (write), var6 (ref), var8 (ref), fFlagAXCatalogOffersBannerMockApi (copy), mockGetOffersForUser (copy), sendAXCounterV2 (copy), constantsModule (copy), var2 (ref), getLocalUserIdModule (copy), playersService (copy), getMarketplaceOffersBanner (copy)
		if fFlagPurchasePromptFetchCartPricing then
			var9 = p1
		end
		var6(true)
		local var10 = false
		local var11 = false
		local var12 = nil
		
		local function _(p3)
			-- upvalues: var11 (write), var6 (copy), var8 (copy)
			if var11 then return end
			var11 = true
			var6(false)
			
			if not p3 then
				var8(true)
			end
		end
		
		local function cleanup()
			-- upvalues: var10 (write), var12 (write), var11 (write), var6 (copy)
			if var10 then return end
			var10 = true
			
			if var12 then
				var12()
			end
			if var11 then
				return
			end
			var11 = true
			var6(false)
		end
		
		if fFlagAXCatalogOffersBannerMockApi then
			local var13, var14 = mockGetOffersForUser()
			var12 = var14
			var13:andThen(function(p3)
				-- upvalues: var10 (write), sendAXCounterV2 (copy), constantsModule (copy), var2 (copy), var11 (write), var6 (copy), var8 (copy)
				if not var10 and p3 then
					sendAXCounterV2(constantsModule.COUNTERS.CatalogOffersBanner.fetchSucceeded)
					var2(p3)
				end
				if var11 then return end
				var11 = true
				var6(false)
				
				if not var10 then
					var8(true)
				end
			end):catch(function(p3)
				-- upvalues: var10 (write), sendAXCounterV2 (copy), constantsModule (copy), var11 (write), var6 (copy), var8 (copy)
				if not var10 then
					sendAXCounterV2(constantsModule.COUNTERS.CatalogOffersBanner.fetchFailed)
					warn("[catalogOffersBannerStore] mock failed:", p3)
				end
				if var11 then return end
				var11 = true
				var6(false)
				
				if not var10 then
					var8(true)
				end
			end)
			
			return cleanup
		end
		local var15 = getLocalUserIdModule(playersService)
		
		if var15 == nil then
			warn("[catalogOffersBannerStore] no LocalPlayer; skipping offers fetch")
			var11 = true
			var6(false)
			var8(true)
			
			return function() end
		end
		local var16, var17 = getMarketplaceOffersBanner(var15, p1, p2)
		var12 = var17
		var16:andThen(function(p3)
			-- upvalues: var10 (write), sendAXCounterV2 (copy), constantsModule (copy), var2 (copy), var11 (write), var6 (copy), var8 (copy)
			if not var10 then
				if p3 then
					sendAXCounterV2(constantsModule.COUNTERS.CatalogOffersBanner.fetchSucceeded)
				end
				var2(p3)
			end
			if var11 then return end
			var11 = true
			var6(false)
			
			if not var10 then
				var8(true)
			end
		end):catch(function(p3)
			-- upvalues: var10 (write), sendAXCounterV2 (copy), constantsModule (copy), var11 (write), var6 (copy), var8 (copy)
			if not var10 then
				sendAXCounterV2(constantsModule.COUNTERS.CatalogOffersBanner.fetchFailed)
				warn("[catalogOffersBannerStore] fetch failed:", p3)
			end
			if var11 then return end
			var11 = true
			var6(false)
			
			if not var10 then
				var8(true)
			end
		end)
		
		return cleanup
	end
	
	if fFlagPurchasePromptFetchCartPricing then
		purchasePromptLiteModule.Events.purchaseCompletedEvent:Connect(function()
			-- upvalues: var9 (write), var5 (ref), fetchOffers (ref)
			if not var9 then return end
			if var5(false) then
				return
			end
			fetchOffers(var9, "cart")
		end)
	end
	return {
		getPayload = var1,
		setPayload = var2,
		getDismissed = var3,
		setDismissed = var4,
		getHasCompletedOffersFetch = var7,
		getOffersFetchInProgress = var5,
		fetchOffers = fetchOffers,
		notifyPurchaseCompleted = notifyPurchaseCompleted
	}
end