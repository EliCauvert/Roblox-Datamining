local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local SafeAppStorageService = require(Parent.AvatarExperienceCommon).Lib.SafeAppStorageService
local _ = require(AvatarExperienceCatalog.Api.GetMarketplaceOffersBanner.MarketplaceOffersBannerTypes)
local MarketplaceOffersBannerDisplayModule = require(AvatarExperienceCatalog.Api.GetMarketplaceOffersBanner.marketplaceOffersBannerDisplay)
local GetLocalUserIdModule = require(script.Parent.getLocalUserId)
local GetMarketplaceOffersBannerOfferDisplayIdFunction = MarketplaceOffersBannerDisplayModule.getMarketplaceOffersBannerOfferDisplayId
local GetMarketplaceOffersBannerOfferDisplayTitleFunction = MarketplaceOffersBannerDisplayModule.getMarketplaceOffersBannerOfferDisplayTitle
local AXCatalogOffersDismissed: string = if require(Parent.AvatarExperienceFlags).FFlagAXCatalogOffersDismissedStorageKeyFix then "AXCatalogOffersDismissed" else "AXCatalogOffersBannerDismissed"
local AXCatalogOffersBannerAppStorageUseMemStorage = game:DefineFastFlag("AXCatalogOffersBannerAppStorageUseMemStorage", false)

local function coerceDecodedToOfferIdMapStorage(List)
	if typeof(List) ~= "table" then
		return nil
	end
	local t = {}
	local Flag = false
	
	for i, value in List do
		if typeof(i) == "string" and typeof(value) == "table" then
			local t1 = {}
			
			for i1, value1 in value do
				if typeof(i1) == "string" and value1 == true then
					t1[i1] = true
				end
			end
			t[i] = t1
			Flag = true
		end
	end
	return if Flag then t else nil
end

local function readStorageRecord(AXCatalogOffersDismissed, Callback)
	-- upvalues: SafeAppStorageService (copy), AXCatalogOffersBannerAppStorageUseMemStorage (copy), HttpService (copy)
	local Item = SafeAppStorageService.getItem(AXCatalogOffersDismissed, AXCatalogOffersBannerAppStorageUseMemStorage)
	
	if Item and Item ~= "" then
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), Item (copy)
			return HttpService:JSONDecode(Item)
		end)
		
		return if Success then Callback(Result) else nil
	else
		return nil
	end
end

local function resolveVisibleOffer(p1)
	-- upvalues: GetLocalUserIdModule (copy), Players (copy), readStorageRecord (copy), AXCatalogOffersDismissed (copy), coerceDecodedToOfferIdMapStorage (copy), GetMarketplaceOffersBannerOfferDisplayTitleFunction (copy), GetMarketplaceOffersBannerOfferDisplayIdFunction (copy)
	local LocalUserIdModule = GetLocalUserIdModule(Players)
	local t = {}
	
	if LocalUserIdModule ~= nil then
		local StorageRecord = readStorageRecord(AXCatalogOffersDismissed, coerceDecodedToOfferIdMapStorage)
		
		if StorageRecord and StorageRecord[LocalUserIdModule] then
			t = StorageRecord[LocalUserIdModule]
		end
	end
	for _, offer in p1.offers do
		local MarketplaceOffersBannerOfferDisplayTitle = GetMarketplaceOffersBannerOfferDisplayTitleFunction(offer)
		
		if MarketplaceOffersBannerOfferDisplayTitle and MarketplaceOffersBannerOfferDisplayTitle ~= "" then
			local MarketplaceOffersBannerOfferDisplayId = GetMarketplaceOffersBannerOfferDisplayIdFunction(offer) or ""
			
			if LocalUserIdModule == nil or t[MarketplaceOffersBannerOfferDisplayId] ~= true then
				return offer
			end
		end
	end
	return nil
end

return {
	SHEET_FTUX_STORAGE_KEY = "AXCatalogOffersSheetFTUX",
	STORAGE_KEY = AXCatalogOffersDismissed,
	readDismissStorage = function()
		-- upvalues: readStorageRecord (copy), AXCatalogOffersDismissed (copy), coerceDecodedToOfferIdMapStorage (copy)
		return readStorageRecord(AXCatalogOffersDismissed, coerceDecodedToOfferIdMapStorage)
	end,
	readSheetFtuxStorage = function()
		-- upvalues: readStorageRecord (copy), coerceDecodedToOfferIdMapStorage (copy)
		return readStorageRecord("AXCatalogOffersSheetFTUX", coerceDecodedToOfferIdMapStorage)
	end,
	dismissRecordMatchesPayload = function(p2, p3): boolean
		local OfferId = p3.offerId or ""
		
		return p2[p3.userId] ~= nil and p2[p3.userId][OfferId] == true
	end,
	dismissedOfferIdsContains = function(p2, p3): boolean
		return p2[p3] == true
	end,
	normalizeOfferIdForStorage = function(p2)
		return p2 or ""
	end,
	resolveVisibleOffer = resolveVisibleOffer,
	shouldHydrateDismissed = function(p2): boolean
		-- upvalues: GetLocalUserIdModule (copy), Players (copy), resolveVisibleOffer (copy)
		return GetLocalUserIdModule(Players) ~= nil and resolveVisibleOffer(p2) == nil
	end,
	shouldAutoOpenOfferSheetForCurrentOffer = function(p2): boolean
		-- upvalues: GetLocalUserIdModule (copy), Players (copy), readStorageRecord (copy), coerceDecodedToOfferIdMapStorage (copy)
		local LocalUserIdModule = GetLocalUserIdModule(Players)
		
		if LocalUserIdModule == nil then
			return false
		else
			local AXCatalogOffersSheetFTUX = readStorageRecord("AXCatalogOffersSheetFTUX", coerceDecodedToOfferIdMapStorage)
			
			return AXCatalogOffersSheetFTUX == nil or AXCatalogOffersSheetFTUX[LocalUserIdModule] == nil or not (AXCatalogOffersSheetFTUX[LocalUserIdModule][p2 or ""] == true)
		end
	end,
	writeDismissedForCurrentOffer = function(p2)
		-- upvalues: GetLocalUserIdModule (copy), Players (copy), readStorageRecord (copy), AXCatalogOffersDismissed (copy), coerceDecodedToOfferIdMapStorage (copy), HttpService (copy), SafeAppStorageService (copy), AXCatalogOffersBannerAppStorageUseMemStorage (copy)
		local LocalUserIdModule = GetLocalUserIdModule(Players)
		
		if LocalUserIdModule == nil then return end
		local P9 = p2 or ""
		local StorageRecord = readStorageRecord(AXCatalogOffersDismissed, coerceDecodedToOfferIdMapStorage) or {}
		local StorageRecordEntry = StorageRecord[LocalUserIdModule]
		
		if StorageRecordEntry == nil then
			StorageRecordEntry = {}
			StorageRecord[LocalUserIdModule] = StorageRecordEntry
		end
		StorageRecordEntry[P9] = true
		pcall(function()
			-- upvalues: HttpService (upval), StorageRecord (copy), SafeAppStorageService (upval), AXCatalogOffersDismissed (upval), AXCatalogOffersBannerAppStorageUseMemStorage (upval)
			SafeAppStorageService.setItem(AXCatalogOffersDismissed, HttpService:JSONEncode(StorageRecord), AXCatalogOffersBannerAppStorageUseMemStorage)
			SafeAppStorageService.flush()
		end)
	end,
	writeSeenOfferSheetForCurrentOffer = function(p2)
		-- upvalues: GetLocalUserIdModule (copy), Players (copy), readStorageRecord (copy), coerceDecodedToOfferIdMapStorage (copy), HttpService (copy), SafeAppStorageService (copy), AXCatalogOffersBannerAppStorageUseMemStorage (copy)
		local LocalUserIdModule = GetLocalUserIdModule(Players)
		
		if LocalUserIdModule == nil then return end
		local P11 = p2 or ""
		local AXCatalogOffersSheetFTUX = readStorageRecord("AXCatalogOffersSheetFTUX", coerceDecodedToOfferIdMapStorage) or {}
		local AXCatalogOffersSheetFTUXEntry = AXCatalogOffersSheetFTUX[LocalUserIdModule]
		
		if AXCatalogOffersSheetFTUXEntry == nil then
			AXCatalogOffersSheetFTUXEntry = {}
			AXCatalogOffersSheetFTUX[LocalUserIdModule] = AXCatalogOffersSheetFTUXEntry
		end
		AXCatalogOffersSheetFTUXEntry[P11] = true
		pcall(function()
			-- upvalues: HttpService (upval), AXCatalogOffersSheetFTUX (copy), SafeAppStorageService (upval), AXCatalogOffersBannerAppStorageUseMemStorage (upval)
			SafeAppStorageService.setItem("AXCatalogOffersSheetFTUX", HttpService:JSONEncode(AXCatalogOffersSheetFTUX), AXCatalogOffersBannerAppStorageUseMemStorage)
			SafeAppStorageService.flush()
		end)
	end
}