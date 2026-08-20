local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local safeAppStorageService = require(parent.AvatarExperienceCommon).Lib.SafeAppStorageService
local fFlagAXDisableMultiItemShoppingFtux = require(parent.AvatarExperienceFlags).FFlagAXDisableMultiItemShoppingFtux
local AXCatalogMultiItemShoppingFtuxUseMemStorage = game:DefineFastFlag("AXCatalogMultiItemShoppingFtuxUseMemStorage", false)
local AXCatalogMultiItemShoppingFtuxOtherPromptMaxCount = game:DefineFastInt("AXCatalogMultiItemShoppingFtuxOtherPromptMaxCount", 3)

local function getStorage() --[[ line: 27 ]]
	-- upvalues: safeAppStorageService (ref), AXCatalogMultiItemShoppingFtuxUseMemStorage (ref), httpService (ref)
	local AXCatalogMultiItemShoppingFTUX = safeAppStorageService.getItem("AXCatalogMultiItemShoppingFTUX", AXCatalogMultiItemShoppingFtuxUseMemStorage)
	
	if not AXCatalogMultiItemShoppingFTUX or AXCatalogMultiItemShoppingFTUX == "" then
		AXCatalogMultiItemShoppingFTUX = "{}"
	end
	local t = {}
	pcall(function() --[[ line: 35 ]]
		-- upvalues: t (write), httpService (copy), AXCatalogMultiItemShoppingFTUX (write)
		t = httpService:JSONDecode(AXCatalogMultiItemShoppingFTUX)
	end)
	
	return t
end

local function _(value) --[[ line: 43 | named "setStorage" ]]
	-- upvalues: httpService (ref), safeAppStorageService (ref), AXCatalogMultiItemShoppingFtuxUseMemStorage (ref)
	pcall(function() --[[ line: 44 ]]
		-- upvalues: httpService (copy), value (ref), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
		safeAppStorageService.setItem("AXCatalogMultiItemShoppingFTUX", httpService:JSONEncode(value), AXCatalogMultiItemShoppingFtuxUseMemStorage)
		safeAppStorageService.flush()
	end)
end

return function() --[[ line: 55 | named "useMultiItemShoppingFtux" ]]
	-- upvalues: fFlagAXDisableMultiItemShoppingFtux (ref), getStorage (ref), AXCatalogMultiItemShoppingFtuxOtherPromptMaxCount (ref), httpService (ref), safeAppStorageService (ref), AXCatalogMultiItemShoppingFtuxUseMemStorage (ref)
	return {
		shouldShowTooltipOnCheckoutButton = function() --[[ line: 56 ]]
			-- upvalues: fFlagAXDisableMultiItemShoppingFtux (copy), getStorage (copy)
			return if fFlagAXDisableMultiItemShoppingFtux then false else not getStorage().seenTooltipOnCheckoutButton
		end,
		shouldShowClearAllItemsPrompt = function() --[[ line: 65 ]]
			-- upvalues: fFlagAXDisableMultiItemShoppingFtux (copy), getStorage (copy), AXCatalogMultiItemShoppingFtuxOtherPromptMaxCount (copy)
			if fFlagAXDisableMultiItemShoppingFtux then
				return false
			end
			local var6 = getStorage()
			
			return not var6.hideClearAllItemsPrompt and (if var6.clearAllItemsPromptCount ~= nil then var6.clearAllItemsPromptCount < AXCatalogMultiItemShoppingFtuxOtherPromptMaxCount else true)
		end,
		shouldShowWearAvatarReplaceAllItemsPrompt = function() --[[ line: 78 ]]
			-- upvalues: fFlagAXDisableMultiItemShoppingFtux (copy), getStorage (copy), AXCatalogMultiItemShoppingFtuxOtherPromptMaxCount (copy)
			if fFlagAXDisableMultiItemShoppingFtux then
				return false
			end
			local var7 = getStorage()
			
			return not var7.hideWearAvatarReplaceAllItemsPrompt and (if var7.wearAvatarReplaceAllItemsPromptCount ~= nil then var7.wearAvatarReplaceAllItemsPromptCount < AXCatalogMultiItemShoppingFtuxOtherPromptMaxCount else true)
		end,
		setSeenTooltipOnCheckoutButton = function() --[[ line: 100 ]]
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
			local var8 = getStorage()
			var8.seenTooltipOnCheckoutButton = true
			pcall(function() --[[ line: 44 ]]
				-- upvalues: httpService (copy), var8 (ref), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
				safeAppStorageService.setItem("AXCatalogMultiItemShoppingFTUX", httpService:JSONEncode(var8), AXCatalogMultiItemShoppingFtuxUseMemStorage)
				safeAppStorageService.flush()
			end)
		end,
		hideClearAllItemsPrompt = function() --[[ line: 107 ]]
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
			local var9 = getStorage()
			var9.hideClearAllItemsPrompt = true
			pcall(function() --[[ line: 44 ]]
				-- upvalues: httpService (copy), var9 (ref), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
				safeAppStorageService.setItem("AXCatalogMultiItemShoppingFTUX", httpService:JSONEncode(var9), AXCatalogMultiItemShoppingFtuxUseMemStorage)
				safeAppStorageService.flush()
			end)
		end,
		incrementClearAllItemsPromptCount = function() --[[ line: 114 ]]
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
			local var10 = getStorage()
			var10.clearAllItemsPromptCount = if var10.clearAllItemsPromptCount == nil then 1 else var10.clearAllItemsPromptCount + 1
			pcall(function() --[[ line: 44 ]]
				-- upvalues: httpService (copy), var10 (ref), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
				safeAppStorageService.setItem("AXCatalogMultiItemShoppingFTUX", httpService:JSONEncode(var10), AXCatalogMultiItemShoppingFtuxUseMemStorage)
				safeAppStorageService.flush()
			end)
		end,
		hideWearAvatarReplaceAllItemsPrompt = function() --[[ line: 123 ]]
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
			local var11 = getStorage()
			var11.hideWearAvatarReplaceAllItemsPrompt = true
			pcall(function() --[[ line: 44 ]]
				-- upvalues: httpService (copy), var11 (ref), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
				safeAppStorageService.setItem("AXCatalogMultiItemShoppingFTUX", httpService:JSONEncode(var11), AXCatalogMultiItemShoppingFtuxUseMemStorage)
				safeAppStorageService.flush()
			end)
		end,
		incrementWearAvatarReplaceAllItemsPromptCount = function() --[[ line: 130 ]]
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
			local var12 = getStorage()
			var12.wearAvatarReplaceAllItemsPromptCount = if var12.wearAvatarReplaceAllItemsPromptCount == nil then 1 else var12.wearAvatarReplaceAllItemsPromptCount + 1
			pcall(function() --[[ line: 44 ]]
				-- upvalues: httpService (copy), var12 (ref), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
				safeAppStorageService.setItem("AXCatalogMultiItemShoppingFTUX", httpService:JSONEncode(var12), AXCatalogMultiItemShoppingFtuxUseMemStorage)
				safeAppStorageService.flush()
			end)
		end,
		shouldShowItemReplacedOnAvatarPrompt = function() --[[ line: 91 ]]
			-- upvalues: fFlagAXDisableMultiItemShoppingFtux (copy), getStorage (copy)
			return if fFlagAXDisableMultiItemShoppingFtux then false else not getStorage().seenItemReplacedOnAvatarPrompt
		end,
		setSeenItemReplaceOnAvatarPrompt = function() --[[ line: 139 ]]
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
			local var13 = getStorage()
			var13.seenItemReplacedOnAvatarPrompt = true
			pcall(function() --[[ line: 44 ]]
				-- upvalues: httpService (copy), var13 (ref), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
				safeAppStorageService.setItem("AXCatalogMultiItemShoppingFTUX", httpService:JSONEncode(var13), AXCatalogMultiItemShoppingFtuxUseMemStorage)
				safeAppStorageService.flush()
			end)
		end
	}
end