local HttpService = game:GetService("HttpService")
local SafeAppStorageService = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceCommon).Lib.SafeAppStorageService
local AXCatalogSaveOptionsUseMemStorage = game:DefineFastFlag("AXCatalogSaveOptionsUseMemStorage", false)

local function getStorage()
	-- upvalues: SafeAppStorageService (copy), AXCatalogSaveOptionsUseMemStorage (copy), HttpService (copy)
	local AXCatalogCheckoutPageSaveOptionValuesItem = SafeAppStorageService.getItem("AXCatalogCheckoutPageSaveOptionValues", AXCatalogSaveOptionsUseMemStorage)
	
	if not AXCatalogCheckoutPageSaveOptionValuesItem or AXCatalogCheckoutPageSaveOptionValuesItem == "" then
		AXCatalogCheckoutPageSaveOptionValuesItem = "{}"
	end
	local t = {}
	pcall(function()
		-- upvalues: t (ref), HttpService (upval), AXCatalogCheckoutPageSaveOptionValuesItem (ref)
		t = HttpService:JSONDecode(AXCatalogCheckoutPageSaveOptionValuesItem)
	end)
	
	return t
end

local function _(p1)
	-- upvalues: HttpService (copy), SafeAppStorageService (copy), AXCatalogSaveOptionsUseMemStorage (copy)
	pcall(function()
		-- upvalues: HttpService (upval), p1 (copy), SafeAppStorageService (upval), AXCatalogSaveOptionsUseMemStorage (upval)
		SafeAppStorageService.setItem("AXCatalogCheckoutPageSaveOptionValues", HttpService:JSONEncode(p1), AXCatalogSaveOptionsUseMemStorage)
		SafeAppStorageService.flush()
	end)
end

return function()
	-- upvalues: getStorage (copy), HttpService (copy), SafeAppStorageService (copy), AXCatalogSaveOptionsUseMemStorage (copy)
	return {
		setWearAfterPurchase = function(WearAfterPurchase)
			-- upvalues: getStorage (upval), HttpService (upval), SafeAppStorageService (upval), AXCatalogSaveOptionsUseMemStorage (upval)
			local Storage = getStorage()
			Storage.wearAfterPurchase = WearAfterPurchase
			pcall(function()
				-- upvalues: HttpService (upval), Storage (copy), SafeAppStorageService (upval), AXCatalogSaveOptionsUseMemStorage (upval)
				SafeAppStorageService.setItem("AXCatalogCheckoutPageSaveOptionValues", HttpService:JSONEncode(Storage), AXCatalogSaveOptionsUseMemStorage)
				SafeAppStorageService.flush()
			end)
		end,
		getWearAfterPurchase = function()
			-- upvalues: getStorage (upval)
			local Storage = getStorage()
			
			return Storage.wearAfterPurchase == nil or Storage.wearAfterPurchase
		end,
		setAddToAvatars = function(AddToAvatars)
			-- upvalues: getStorage (upval), HttpService (upval), SafeAppStorageService (upval), AXCatalogSaveOptionsUseMemStorage (upval)
			local Storage = getStorage()
			Storage.addToAvatars = AddToAvatars
			pcall(function()
				-- upvalues: HttpService (upval), Storage (copy), SafeAppStorageService (upval), AXCatalogSaveOptionsUseMemStorage (upval)
				SafeAppStorageService.setItem("AXCatalogCheckoutPageSaveOptionValues", HttpService:JSONEncode(Storage), AXCatalogSaveOptionsUseMemStorage)
				SafeAppStorageService.flush()
			end)
		end,
		getAddToAvatars = function()
			-- upvalues: getStorage (upval)
			local Storage = getStorage()
			
			return Storage.addToAvatars ~= nil and Storage.addToAvatars
		end
	}
end