local HttpService = game:GetService("HttpService")
local SafeAppStorageService = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceCommon).Lib.SafeAppStorageService
local AXCatalogSaveOptionsUseMemStorage = game:DefineFastFlag("AXCatalogSaveOptionsUseMemStorage", false)
local AXSetSaveAsAvatarDefault = game:DefineFastFlag("AXSetSaveAsAvatarDefault", false)

local function getStorage() --[[ Line: 19 ]]
	-- upvalues: SafeAppStorageService (copy), AXCatalogSaveOptionsUseMemStorage (copy), HttpService (copy)
	local AXCatalogCheckoutPageSaveOptionValuesItem = SafeAppStorageService.getItem("AXCatalogCheckoutPageSaveOptionValues", AXCatalogSaveOptionsUseMemStorage)
	
	if not AXCatalogCheckoutPageSaveOptionValuesItem or AXCatalogCheckoutPageSaveOptionValuesItem == "" then
		AXCatalogCheckoutPageSaveOptionValuesItem = "{}"
	end
	local t = {}
	pcall(function() --[[ Line: 26 ]]
		-- upvalues: t (ref), HttpService (upval), AXCatalogCheckoutPageSaveOptionValuesItem (ref)
		t = HttpService:JSONDecode(AXCatalogCheckoutPageSaveOptionValuesItem)
	end)
	
	return t
end

local function _(p1) --[[ Line: 33 | Named "setStorage" ]]
	-- upvalues: HttpService (copy), SafeAppStorageService (copy), AXCatalogSaveOptionsUseMemStorage (copy)
	pcall(function() --[[ Line: 34 ]]
		-- upvalues: HttpService (upval), p1 (copy), SafeAppStorageService (upval), AXCatalogSaveOptionsUseMemStorage (upval)
		SafeAppStorageService.setItem("AXCatalogCheckoutPageSaveOptionValues", HttpService:JSONEncode(p1), AXCatalogSaveOptionsUseMemStorage)
		SafeAppStorageService.flush()
	end)
end

return function() --[[ Line: 41 | Named "useSaveOptionsStoredValues" ]]
	-- upvalues: getStorage (copy), AXSetSaveAsAvatarDefault (copy), HttpService (copy), SafeAppStorageService (copy), AXCatalogSaveOptionsUseMemStorage (copy)
	return {
		setWearAfterPurchase = function(WearAfterPurchase) --[[ Line: 59 ]]
			-- upvalues: getStorage (upval), HttpService (upval), SafeAppStorageService (upval), AXCatalogSaveOptionsUseMemStorage (upval)
			local Storage = getStorage()
			Storage.wearAfterPurchase = WearAfterPurchase
			pcall(function() --[[ Line: 34 ]]
				-- upvalues: HttpService (upval), Storage (copy), SafeAppStorageService (upval), AXCatalogSaveOptionsUseMemStorage (upval)
				SafeAppStorageService.setItem("AXCatalogCheckoutPageSaveOptionValues", HttpService:JSONEncode(Storage), AXCatalogSaveOptionsUseMemStorage)
				SafeAppStorageService.flush()
			end)
		end,
		getWearAfterPurchase = function() --[[ Line: 42 ]]
			-- upvalues: getStorage (upval)
			local Storage = getStorage()
			
			return Storage.wearAfterPurchase == nil or Storage.wearAfterPurchase
		end,
		setAddToAvatars = function(AddToAvatars) --[[ Line: 65 ]]
			-- upvalues: getStorage (upval), HttpService (upval), SafeAppStorageService (upval), AXCatalogSaveOptionsUseMemStorage (upval)
			local Storage = getStorage()
			Storage.addToAvatars = AddToAvatars
			pcall(function() --[[ Line: 34 ]]
				-- upvalues: HttpService (upval), Storage (copy), SafeAppStorageService (upval), AXCatalogSaveOptionsUseMemStorage (upval)
				SafeAppStorageService.setItem("AXCatalogCheckoutPageSaveOptionValues", HttpService:JSONEncode(Storage), AXCatalogSaveOptionsUseMemStorage)
				SafeAppStorageService.flush()
			end)
		end,
		getAddToAvatars = function() --[[ Line: 51 ]]
			-- upvalues: getStorage (upval), AXSetSaveAsAvatarDefault (upval)
			local Storage = getStorage()
			
			return if Storage.addToAvatars == nil then if AXSetSaveAsAvatarDefault then true else false else Storage.addToAvatars
		end
	}
end