local httpService = game:GetService("HttpService")
local safeAppStorageService = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceCommon).Lib.SafeAppStorageService
local AXCatalogSaveOptionsUseMemStorage = game:DefineFastFlag("AXCatalogSaveOptionsUseMemStorage", false)

local function getStorage() --[[ line: 18 ]]
	-- upvalues: safeAppStorageService (ref), AXCatalogSaveOptionsUseMemStorage (ref), httpService (ref)
	local AXCatalogCheckoutPageSaveOptionValues = safeAppStorageService.getItem("AXCatalogCheckoutPageSaveOptionValues", AXCatalogSaveOptionsUseMemStorage)
	
	if not AXCatalogCheckoutPageSaveOptionValues or AXCatalogCheckoutPageSaveOptionValues == "" then
		AXCatalogCheckoutPageSaveOptionValues = "{}"
	end
	local t = {}
	pcall(function() --[[ line: 25 ]]
		-- upvalues: t (write), httpService (copy), AXCatalogCheckoutPageSaveOptionValues (write)
		t = httpService:JSONDecode(AXCatalogCheckoutPageSaveOptionValues)
	end)
	
	return t
end

local function _(value) --[[ line: 32 | named "setStorage" ]]
	-- upvalues: httpService (ref), safeAppStorageService (ref), AXCatalogSaveOptionsUseMemStorage (ref)
	pcall(function() --[[ line: 33 ]]
		-- upvalues: httpService (copy), value (ref), safeAppStorageService (copy), AXCatalogSaveOptionsUseMemStorage (copy)
		safeAppStorageService.setItem("AXCatalogCheckoutPageSaveOptionValues", httpService:JSONEncode(value), AXCatalogSaveOptionsUseMemStorage)
		safeAppStorageService.flush()
	end)
end

return function() --[[ line: 40 | named "useSaveOptionsStoredValues" ]]
	-- upvalues: getStorage (ref), httpService (ref), safeAppStorageService (ref), AXCatalogSaveOptionsUseMemStorage (ref)
	return {
		setWearAfterPurchase = function(p0) --[[ line: 58 ]]
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXCatalogSaveOptionsUseMemStorage (copy)
			local var5 = getStorage()
			var5.wearAfterPurchase = p0
			pcall(function() --[[ line: 33 ]]
				-- upvalues: httpService (copy), var5 (ref), safeAppStorageService (copy), AXCatalogSaveOptionsUseMemStorage (copy)
				safeAppStorageService.setItem("AXCatalogCheckoutPageSaveOptionValues", httpService:JSONEncode(var5), AXCatalogSaveOptionsUseMemStorage)
				safeAppStorageService.flush()
			end)
		end,
		getWearAfterPurchase = function() --[[ line: 41 ]]
			-- upvalues: getStorage (copy)
			local var6 = getStorage()
			
			return var6.wearAfterPurchase == nil or var6.wearAfterPurchase
		end,
		setAddToAvatars = function(p1) --[[ line: 64 ]]
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXCatalogSaveOptionsUseMemStorage (copy)
			local var7 = getStorage()
			var7.addToAvatars = p1
			pcall(function() --[[ line: 33 ]]
				-- upvalues: httpService (copy), var7 (ref), safeAppStorageService (copy), AXCatalogSaveOptionsUseMemStorage (copy)
				safeAppStorageService.setItem("AXCatalogCheckoutPageSaveOptionValues", httpService:JSONEncode(var7), AXCatalogSaveOptionsUseMemStorage)
				safeAppStorageService.flush()
			end)
		end,
		getAddToAvatars = function() --[[ line: 50 ]]
			-- upvalues: getStorage (copy)
			local var8 = getStorage()
			
			return if var8.addToAvatars == nil then false else var8.addToAvatars
		end
	}
end