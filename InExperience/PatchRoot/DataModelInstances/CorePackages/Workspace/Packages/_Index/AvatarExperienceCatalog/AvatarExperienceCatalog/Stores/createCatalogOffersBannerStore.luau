local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local Players = game:GetService("Players")
local SendAXCounterV2Function = require(Parent.AvatarExperienceAnalytics).sendAXCounterV2
local FFlagAXCatalogOffersBannerMockApi = require(Parent.AvatarExperienceFlags).FFlagAXCatalogOffersBannerMockApi
local FFlagPurchasePromptFetchCartPricing = require(Parent.SharedFlags).FFlagPurchasePromptFetchCartPricing
local PurchasePromptLiteModule = require(Parent.PurchasePromptLite)
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.LuauPolyfill)
local ConstantsModule = require(AvatarExperienceCatalog.Constants)
local GetMarketplaceOffersBannerFunction = require(AvatarExperienceCatalog.Api.GetMarketplaceOffersBanner.getMarketplaceOffersBanner).getMarketplaceOffersBanner
local MockGetOffersForUserFunction = require(AvatarExperienceCatalog.Api.GetMarketplaceOffersBanner.mockGetOffersForUser).mockGetOffersForUser
local _ = require(AvatarExperienceCatalog.Api.GetMarketplaceOffersBanner.MarketplaceOffersBannerTypes)
local GetLocalUserIdModule = require(AvatarExperienceCatalog.Utils.getLocalUserId)

return function() --[[ Line: 55 | Named "createCatalogOffersBannerStore" ]]
	-- upvalues: SignalsModule (copy), FFlagPurchasePromptFetchCartPricing (copy), FFlagAXCatalogOffersBannerMockApi (copy), MockGetOffersForUserFunction (copy), SendAXCounterV2Function (copy), ConstantsModule (copy), GetLocalUserIdModule (copy), Players (copy), GetMarketplaceOffersBannerFunction (copy), PurchasePromptLiteModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	local Signal1, Signal2_1 = SignalsModule.createSignal(false)
	local Signal3, Signal2_2 = SignalsModule.createSignal(false)
	local Signal4, Signal2_3 = SignalsModule.createSignal(false)
	local v1 = nil
	
	local function notifyPurchaseCompleted() --[[ Line: 67 ]] end
	
	local function fetchOffers(p1, p2) --[[ Line: 69 ]]
		-- upvalues: FFlagPurchasePromptFetchCartPricing (upval), v1 (ref), Signal2_2 (copy), Signal2_3 (copy), FFlagAXCatalogOffersBannerMockApi (upval), MockGetOffersForUserFunction (upval), SendAXCounterV2Function (upval), ConstantsModule (upval), Signal2 (copy), GetLocalUserIdModule (upval), Players (upval), GetMarketplaceOffersBannerFunction (upval)
		if FFlagPurchasePromptFetchCartPricing then
			v1 = p1
		end
		Signal2_2(true)
		local Flag = false
		local Flag1 = false
		local Callback = nil
		
		local function _(p3) --[[ Line: 82 | Named "finishOnce" ]]
			-- upvalues: Flag1 (ref), Signal2_2 (upval), Signal2_3 (upval)
			if Flag1 then return end
			Flag1 = true
			Signal2_2(false)
			
			if not p3 then
				Signal2_3(true)
			end
		end
		
		local function cleanup() --[[ Line: 93 ]]
			-- upvalues: Flag (ref), Callback (ref), Flag1 (ref), Signal2_2 (upval)
			if Flag then return end
			Flag = true
			
			if Callback then
				Callback()
			end
			if not Flag1 then
				Flag1 = true
				Signal2_2(false)
				
				return
			end
		end
		
		if FFlagAXCatalogOffersBannerMockApi then
			local MockGetOffersForUserResult, MockGetOffersForUserResult2 = MockGetOffersForUserFunction()
			Callback = MockGetOffersForUserResult2
			MockGetOffersForUserResult:andThen(function(Result) --[[ Line: 108 ]]
				-- upvalues: Flag (ref), SendAXCounterV2Function (upval), ConstantsModule (upval), Signal2 (upval), Flag1 (ref), Signal2_2 (upval), Signal2_3 (upval)
				if not Flag and Result then
					SendAXCounterV2Function(ConstantsModule.COUNTERS.CatalogOffersBanner.fetchSucceeded)
					Signal2(Result)
				end
				local Flag2 = Flag
				
				if Flag1 then return end
				Flag1 = true
				Signal2_2(false)
				
				if not Flag2 then
					Signal2_3(true)
				end
			end):catch(function(Err) --[[ Line: 115 ]]
				-- upvalues: Flag (ref), SendAXCounterV2Function (upval), ConstantsModule (upval), Flag1 (ref), Signal2_2 (upval), Signal2_3 (upval)
				if not Flag then
					SendAXCounterV2Function(ConstantsModule.COUNTERS.CatalogOffersBanner.fetchFailed)
					warn("[catalogOffersBannerStore] mock failed:", Err)
				end
				local Flag2 = Flag
				
				if Flag1 then return end
				Flag1 = true
				Signal2_2(false)
				
				if not Flag2 then
					Signal2_3(true)
				end
			end)
			
			return cleanup
		end
		local LocalUserIdModule = GetLocalUserIdModule(Players)
		
		if LocalUserIdModule ~= nil then
			local MarketplaceOffersBanner, MarketplaceOffersBanner2 = GetMarketplaceOffersBannerFunction(LocalUserIdModule, p1, p2)
			Callback = MarketplaceOffersBanner2
			MarketplaceOffersBanner:andThen(function(Result) --[[ Line: 135 ]]
				-- upvalues: Flag (ref), SendAXCounterV2Function (upval), ConstantsModule (upval), Signal2 (upval), Flag1 (ref), Signal2_2 (upval), Signal2_3 (upval)
				if not Flag then
					if Result then
						SendAXCounterV2Function(ConstantsModule.COUNTERS.CatalogOffersBanner.fetchSucceeded)
					end
					Signal2(Result)
				end
				local Flag2 = Flag
				
				if Flag1 then return end
				Flag1 = true
				Signal2_2(false)
				
				if not Flag2 then
					Signal2_3(true)
				end
			end):catch(function(Err) --[[ Line: 144 ]]
				-- upvalues: Flag (ref), SendAXCounterV2Function (upval), ConstantsModule (upval), Flag1 (ref), Signal2_2 (upval), Signal2_3 (upval)
				if not Flag then
					SendAXCounterV2Function(ConstantsModule.COUNTERS.CatalogOffersBanner.fetchFailed)
					warn("[catalogOffersBannerStore] fetch failed:", Err)
				end
				local Flag2 = Flag
				
				if Flag1 then return end
				Flag1 = true
				Signal2_2(false)
				
				if not Flag2 then
					Signal2_3(true)
				end
			end)
			
			return cleanup
		end
		warn("[catalogOffersBannerStore] no LocalPlayer; skipping offers fetch")
		
		if not Flag1 then
			Flag1 = true
			Signal2_2(false)
			Signal2_3(true)
		end
		return function() --[[ Line: 129 ]] end
	end
	
	if FFlagPurchasePromptFetchCartPricing then
		PurchasePromptLiteModule.Events.purchaseCompletedEvent:Connect(function() --[[ Line: 159 ]]
			-- upvalues: v1 (ref), Signal3 (copy), fetchOffers (copy)
			if not v1 then return end
			if not Signal3(false) then
				fetchOffers(v1, "cart")
				
				return
			end
		end)
	end
	return {
		getPayload = Signal,
		setPayload = Signal2,
		getDismissed = Signal1,
		setDismissed = Signal2_1,
		getHasCompletedOffersFetch = Signal4,
		getOffersFetchInProgress = Signal3,
		fetchOffers = fetchOffers,
		notifyPurchaseCompleted = notifyPurchaseCompleted
	}
end