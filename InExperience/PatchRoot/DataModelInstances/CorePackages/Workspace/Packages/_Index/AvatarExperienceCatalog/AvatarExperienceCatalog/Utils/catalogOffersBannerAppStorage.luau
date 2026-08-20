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
local var5 = if fFlagAXCatalogOffersDismissedStorageKeyFix then "AXCatalogOffersDismissed" else "AXCatalogOffersBannerDismissed"
local AXCatalogOffersBannerAppStorageUseMemStorage = game:DefineFastFlag("AXCatalogOffersBannerAppStorageUseMemStorage", false)

local function normalizeOfferId(p0) --[[ line: 53 ]]
	return p0 or ""
end

local function offerIdMapContains(p1, p2) --[[ line: 57 ]]
	return p1[p2] == true
end

local function coerceDecodedToOfferIdMapStorage(p3) --[[ line: 61 ]]
	if typeof(p3) ~= "table" then
		return nil
	end
	local t = {}
	local var13 = false
	
	for i, v in p3 do
		if typeof(i) == "string" and typeof(v) == "table" then
			local t_1 = {}
			
			for i_1, v_1 in v do
				if typeof(i_1) == "string" and v_1 == true then
					t_1[i_1] = true
				end
			end
			t[i] = t_1
			var13 = true
		end
	end
	return if var13 then t else nil
end

local function readStorageRecord(p4, p5) --[[ line: 85 ]]
	-- upvalues: safeAppStorageService (ref), AXCatalogOffersBannerAppStorageUseMemStorage (ref), httpService (ref)
	local item = safeAppStorageService.getItem(p4, AXCatalogOffersBannerAppStorageUseMemStorage)
	
	if not item or item == "" then
		return nil
	end
	local ok, status = pcall(function() --[[ line: 90 ]]
		-- upvalues: httpService (copy), item (ref)
		return httpService:JSONDecode(item)
	end)
	
	return if ok then p5(status) else nil
end

local function resolveVisibleOffer(p6) --[[ line: 118 ]]
	-- upvalues: getLocalUserIdModule (ref), playersService (ref), readStorageRecord (ref), var5 (ref), coerceDecodedToOfferIdMapStorage (ref), getMarketplaceOffersBannerOfferDisplayTitle (ref), getMarketplaceOffersBannerOfferDisplayId (ref)
	local var16 = getLocalUserIdModule(playersService)
	local t = {}
	
	if var16 ~= nil then
		local var18 = readStorageRecord(var5, coerceDecodedToOfferIdMapStorage)
		
		if var18 and var18[var16] then
			t = var18[var16]
		end
	end
	for i, v in p6.offers do
		local var19 = getMarketplaceOffersBannerOfferDisplayTitle(v)
		
		if var19 and var19 ~= "" then
			if var16 == nil or t[getMarketplaceOffersBannerOfferDisplayId(v) or ""] ~= true then
				return v
			end
		end
	end
	return nil
end

return {
	SHEET_FTUX_STORAGE_KEY = "AXCatalogOffersSheetFTUX",
	STORAGE_KEY = var5,
	readDismissStorage = function() --[[ line: 99 ]]
		-- upvalues: readStorageRecord (ref), var5 (ref), coerceDecodedToOfferIdMapStorage (ref)
		return readStorageRecord(var5, coerceDecodedToOfferIdMapStorage)
	end,
	readSheetFtuxStorage = function() --[[ line: 103 ]]
		-- upvalues: readStorageRecord (ref), coerceDecodedToOfferIdMapStorage (ref)
		return readStorageRecord("AXCatalogOffersSheetFTUX", coerceDecodedToOfferIdMapStorage)
	end,
	dismissRecordMatchesPayload = function(p7, p8) --[[ line: 107 ]]
		return p7[p8.userId] ~= nil and p7[p8.userId][p8.offerId or ""] == true
	end,
	dismissedOfferIdsContains = offerIdMapContains,
	normalizeOfferIdForStorage = normalizeOfferId,
	resolveVisibleOffer = resolveVisibleOffer,
	shouldHydrateDismissed = function(p9) --[[ line: 142 ]]
		-- upvalues: getLocalUserIdModule (ref), playersService (ref), resolveVisibleOffer (ref)
		return if getLocalUserIdModule(playersService) == nil then false else resolveVisibleOffer(p9) == nil
	end,
	shouldAutoOpenOfferSheetForCurrentOffer = function(p10) --[[ line: 169 ]]
		-- upvalues: getLocalUserIdModule (ref), playersService (ref), readStorageRecord (ref), coerceDecodedToOfferIdMapStorage (ref)
		local var20 = getLocalUserIdModule(playersService)
		
		if var20 == nil then
			return false
		end
		local var21 = readStorageRecord("AXCatalogOffersSheetFTUX", coerceDecodedToOfferIdMapStorage)
		
		return var21 == nil or var21[var20] == nil or not (var21[var20][p10 or ""] == true)
	end,
	writeDismissedForCurrentOffer = function(p11) --[[ line: 149 ]]
		-- upvalues: getLocalUserIdModule (ref), playersService (ref), readStorageRecord (ref), var5 (ref), coerceDecodedToOfferIdMapStorage (ref), httpService (ref), safeAppStorageService (ref), AXCatalogOffersBannerAppStorageUseMemStorage (ref)
		local var22 = getLocalUserIdModule(playersService)
		
		if var22 == nil then return end
		p11 = p11 or ""
		local var24 = readStorageRecord(var5, coerceDecodedToOfferIdMapStorage) or {}
		local var25 = var24[var22]
		
		if var25 == nil then
			var25 = {}
			var24[var22] = var25
		end
		var25[p11] = true
		pcall(function() --[[ line: 162 ]]
			-- upvalues: httpService (copy), var24 (ref), safeAppStorageService (copy), var5 (copy), AXCatalogOffersBannerAppStorageUseMemStorage (copy)
			safeAppStorageService.setItem(var5, httpService:JSONEncode(var24), AXCatalogOffersBannerAppStorageUseMemStorage)
			safeAppStorageService.flush()
		end)
	end,
	writeSeenOfferSheetForCurrentOffer = function(p12) --[[ line: 181 ]]
		-- upvalues: getLocalUserIdModule (ref), playersService (ref), readStorageRecord (ref), coerceDecodedToOfferIdMapStorage (ref), httpService (ref), safeAppStorageService (ref), AXCatalogOffersBannerAppStorageUseMemStorage (ref)
		local var26 = getLocalUserIdModule(playersService)
		
		if var26 == nil then return end
		p12 = p12 or ""
		local AXCatalogOffersSheetFTUX = readStorageRecord("AXCatalogOffersSheetFTUX", coerceDecodedToOfferIdMapStorage) or {}
		local var29 = AXCatalogOffersSheetFTUX[var26]
		
		if var29 == nil then
			var29 = {}
			AXCatalogOffersSheetFTUX[var26] = var29
		end
		var29[p12] = true
		pcall(function() --[[ line: 194 ]]
			-- upvalues: httpService (copy), AXCatalogOffersSheetFTUX (ref), safeAppStorageService (copy), AXCatalogOffersBannerAppStorageUseMemStorage (copy)
			safeAppStorageService.setItem("AXCatalogOffersSheetFTUX", httpService:JSONEncode(AXCatalogOffersSheetFTUX), AXCatalogOffersBannerAppStorageUseMemStorage)
			safeAppStorageService.flush()
		end)
	end
}