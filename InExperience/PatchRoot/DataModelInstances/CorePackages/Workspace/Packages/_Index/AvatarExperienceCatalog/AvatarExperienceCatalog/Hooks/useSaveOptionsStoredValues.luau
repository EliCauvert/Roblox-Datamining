local httpService = game:GetService("HttpService")
local safeAppStorageService = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceCommon).Lib.SafeAppStorageService
local AXCatalogSaveOptionsUseMemStorage = game:DefineFastFlag("AXCatalogSaveOptionsUseMemStorage", false)

local function getStorage()
	-- upvalues: safeAppStorageService (ref), AXCatalogSaveOptionsUseMemStorage (ref), httpService (ref)
	local AXCatalogCheckoutPageSaveOptionValues = safeAppStorageService.getItem("AXCatalogCheckoutPageSaveOptionValues", AXCatalogSaveOptionsUseMemStorage)
	
	if not AXCatalogCheckoutPageSaveOptionValues or AXCatalogCheckoutPageSaveOptionValues == "" then
		AXCatalogCheckoutPageSaveOptionValues = "{}"
	end
	local t = {}
	pcall(function()
		-- upvalues: t (write), httpService (copy), AXCatalogCheckoutPageSaveOptionValues (write)
		t = httpService:JSONDecode(AXCatalogCheckoutPageSaveOptionValues)
	end)
	
	return t
end

local function _(value)
	-- upvalues: httpService (ref), safeAppStorageService (ref), AXCatalogSaveOptionsUseMemStorage (ref)
	pcall(function()
		-- upvalues: httpService (copy), value (ref), safeAppStorageService (copy), AXCatalogSaveOptionsUseMemStorage (copy)
		safeAppStorageService.setItem("AXCatalogCheckoutPageSaveOptionValues", httpService:JSONEncode(value), AXCatalogSaveOptionsUseMemStorage)
		safeAppStorageService.flush()
	end)
end

return function()
	-- upvalues: getStorage (ref), httpService (ref), safeAppStorageService (ref), AXCatalogSaveOptionsUseMemStorage (ref)
	return {
		setWearAfterPurchase = function(p1)
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXCatalogSaveOptionsUseMemStorage (copy)
			local var1 = getStorage()
			var1.wearAfterPurchase = p1
			pcall(function()
				-- upvalues: httpService (copy), var1 (ref), safeAppStorageService (copy), AXCatalogSaveOptionsUseMemStorage (copy)
				safeAppStorageService.setItem("AXCatalogCheckoutPageSaveOptionValues", httpService:JSONEncode(var1), AXCatalogSaveOptionsUseMemStorage)
				safeAppStorageService.flush()
			end)
		end,
		getWearAfterPurchase = function()
			-- upvalues: getStorage (copy)
			local var1 = getStorage()
			
			return var1.wearAfterPurchase == nil or var1.wearAfterPurchase
		end,
		setAddToAvatars = function(p1)
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXCatalogSaveOptionsUseMemStorage (copy)
			local var1 = getStorage()
			var1.addToAvatars = p1
			pcall(function()
				-- upvalues: httpService (copy), var1 (ref), safeAppStorageService (copy), AXCatalogSaveOptionsUseMemStorage (copy)
				safeAppStorageService.setItem("AXCatalogCheckoutPageSaveOptionValues", httpService:JSONEncode(var1), AXCatalogSaveOptionsUseMemStorage)
				safeAppStorageService.flush()
			end)
		end,
		getAddToAvatars = function()
			-- upvalues: getStorage (copy)
			local var1 = getStorage()
			
			return if var1.addToAvatars == nil then false else var1.addToAvatars
		end
	}
end