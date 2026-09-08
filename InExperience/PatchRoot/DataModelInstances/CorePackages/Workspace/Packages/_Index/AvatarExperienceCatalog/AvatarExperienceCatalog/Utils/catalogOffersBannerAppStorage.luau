local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local safeAppStorageService = require(parent.AvatarExperienceCommon).Lib.SafeAppStorageService
local fFlagAXCatalogOffersDismissedStorageKeyFix = require(parent.AvatarExperienceFlags).FFlagAXCatalogOffersDismissedStorageKeyFix
local _ = require(avatarExperienceCatalog.Api.GetMarketplaceOffersBanner.MarketplaceOffersBannerTypes)
local marketplaceOffersBannerDisplayModule = require(avatarExperienceCatalog.Api.GetMarketplaceOffersBanner.marketplaceOffersBannerDisplay)
local getLocalUserIdModule = require(script.Parent.getLocalUserId)
local getMarketplaceOffersBannerOfferDisplayId = marketplaceOffersBannerDisplayModule.getMarketplaceOffersBannerOfferDisplayId
local getMarketplaceOffersBannerOfferDisplayTitle = marketplaceOffersBannerDisplayModule.getMarketplaceOffersBannerOfferDisplayTitle
local var1 = if fFlagAXCatalogOffersDismissedStorageKeyFix then "AXCatalogOffersDismissed" else "AXCatalogOffersBannerDismissed"
local AXCatalogOffersBannerAppStorageUseMemStorage = game:DefineFastFlag("AXCatalogOffersBannerAppStorageUseMemStorage", false)

local function normalizeOfferId(p1)
	return p1 or ""
end

local function offerIdMapContains(p1, p2)
	return p1[p2] == true
end

local function coerceDecodedToOfferIdMapStorage(p1)
	if typeof(p1) ~= "table" then
		return nil
	end
	local t = {}
	local var2 = false
	
	for i, v in p1 do
		if typeof(i) == "string" and typeof(v) == "table" then
			local t_1 = {}
			
			for i_1, v_1 in v do
				if typeof(i_1) == "string" and v_1 == true then
					t_1[i_1] = true
				end
			end
			t[i] = t_1
			var2 = true
		end
	end
	return if var2 then t else nil
end

local function readStorageRecord(p2, p3)
	-- upvalues: safeAppStorageService (ref), AXCatalogOffersBannerAppStorageUseMemStorage (ref), httpService (ref)
	local item = safeAppStorageService.getItem(p2, AXCatalogOffersBannerAppStorageUseMemStorage)
	
	if not item or item == "" then
		return nil
	end
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), item (ref)
		return httpService:JSONDecode(item)
	end)
	
	return if ok then p3(status) else nil
end

local function resolveVisibleOffer(p2)
	-- upvalues: getLocalUserIdModule (ref), playersService (ref), readStorageRecord (ref), var1 (ref), coerceDecodedToOfferIdMapStorage (ref), getMarketplaceOffersBannerOfferDisplayTitle (ref), getMarketplaceOffersBannerOfferDisplayId (ref)
	local var3 = getLocalUserIdModule(playersService)
	local t = {}
	
	if var3 ~= nil then
		local var4 = readStorageRecord(var1, coerceDecodedToOfferIdMapStorage)
		
		if var4 and var4[var3] then
			t = var4[var3]
		end
	end
	for i, v in p2.offers do
		local var5 = getMarketplaceOffersBannerOfferDisplayTitle(v)
		
		if var5 and var5 ~= "" then
			if var3 == nil or t[getMarketplaceOffersBannerOfferDisplayId(v) or ""] ~= true then
				return v
			end
		end
	end
	return nil
end

return {
	SHEET_FTUX_STORAGE_KEY = "AXCatalogOffersSheetFTUX",
	STORAGE_KEY = var1,
	readDismissStorage = function()
		-- upvalues: readStorageRecord (ref), var1 (ref), coerceDecodedToOfferIdMapStorage (ref)
		return readStorageRecord(var1, coerceDecodedToOfferIdMapStorage)
	end,
	readSheetFtuxStorage = function()
		-- upvalues: readStorageRecord (ref), coerceDecodedToOfferIdMapStorage (ref)
		return readStorageRecord("AXCatalogOffersSheetFTUX", coerceDecodedToOfferIdMapStorage)
	end,
	dismissRecordMatchesPayload = function(p3, p4)
		return p3[p4.userId] ~= nil and p3[p4.userId][p4.offerId or ""] == true
	end,
	dismissedOfferIdsContains = offerIdMapContains,
	normalizeOfferIdForStorage = normalizeOfferId,
	resolveVisibleOffer = resolveVisibleOffer,
	shouldHydrateDismissed = function(p3)
		-- upvalues: getLocalUserIdModule (ref), playersService (ref), resolveVisibleOffer (ref)
		return if getLocalUserIdModule(playersService) == nil then false else resolveVisibleOffer(p3) == nil
	end,
	shouldAutoOpenOfferSheetForCurrentOffer = function(p3)
		-- upvalues: getLocalUserIdModule (ref), playersService (ref), readStorageRecord (ref), coerceDecodedToOfferIdMapStorage (ref)
		local var6 = getLocalUserIdModule(playersService)
		
		if var6 == nil then
			return false
		end
		local var7 = readStorageRecord("AXCatalogOffersSheetFTUX", coerceDecodedToOfferIdMapStorage)
		
		return var7 == nil or var7[var6] == nil or not (var7[var6][p3 or ""] == true)
	end,
	writeDismissedForCurrentOffer = function(p3)
		-- upvalues: getLocalUserIdModule (ref), playersService (ref), readStorageRecord (ref), var1 (ref), coerceDecodedToOfferIdMapStorage (ref), httpService (ref), safeAppStorageService (ref), AXCatalogOffersBannerAppStorageUseMemStorage (ref)
		local var6 = getLocalUserIdModule(playersService)
		
		if var6 == nil then return end
		p3 = p3 or ""
		local var7 = readStorageRecord(var1, coerceDecodedToOfferIdMapStorage) or {}
		local var8 = var7[var6]
		
		if var8 == nil then
			var8 = {}
			var7[var6] = var8
		end
		var8[p3] = true
		pcall(function()
			-- upvalues: httpService (copy), var7 (ref), safeAppStorageService (copy), var1 (copy), AXCatalogOffersBannerAppStorageUseMemStorage (copy)
			safeAppStorageService.setItem(var1, httpService:JSONEncode(var7), AXCatalogOffersBannerAppStorageUseMemStorage)
			safeAppStorageService.flush()
		end)
	end,
	writeSeenOfferSheetForCurrentOffer = function(p3)
		-- upvalues: getLocalUserIdModule (ref), playersService (ref), readStorageRecord (ref), coerceDecodedToOfferIdMapStorage (ref), httpService (ref), safeAppStorageService (ref), AXCatalogOffersBannerAppStorageUseMemStorage (ref)
		local var6 = getLocalUserIdModule(playersService)
		
		if var6 == nil then return end
		p3 = p3 or ""
		local AXCatalogOffersSheetFTUX = readStorageRecord("AXCatalogOffersSheetFTUX", coerceDecodedToOfferIdMapStorage) or {}
		local var7 = AXCatalogOffersSheetFTUX[var6]
		
		if var7 == nil then
			var7 = {}
			AXCatalogOffersSheetFTUX[var6] = var7
		end
		var7[p3] = true
		pcall(function()
			-- upvalues: httpService (copy), AXCatalogOffersSheetFTUX (ref), safeAppStorageService (copy), AXCatalogOffersBannerAppStorageUseMemStorage (copy)
			safeAppStorageService.setItem("AXCatalogOffersSheetFTUX", httpService:JSONEncode(AXCatalogOffersSheetFTUX), AXCatalogOffersBannerAppStorageUseMemStorage)
			safeAppStorageService.flush()
		end)
	end
}