local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local safeAppStorageService = require(parent.AvatarExperienceCommon).Lib.SafeAppStorageService
local fFlagAXDisableMultiItemShoppingFtux = require(parent.AvatarExperienceFlags).FFlagAXDisableMultiItemShoppingFtux
local AXCatalogMultiItemShoppingFtuxUseMemStorage = game:DefineFastFlag("AXCatalogMultiItemShoppingFtuxUseMemStorage", false)
local AXCatalogMultiItemShoppingFtuxOtherPromptMaxCount = game:DefineFastInt("AXCatalogMultiItemShoppingFtuxOtherPromptMaxCount", 3)

local function getStorage()
	-- upvalues: safeAppStorageService (ref), AXCatalogMultiItemShoppingFtuxUseMemStorage (ref), httpService (ref)
	local AXCatalogMultiItemShoppingFTUX = safeAppStorageService.getItem("AXCatalogMultiItemShoppingFTUX", AXCatalogMultiItemShoppingFtuxUseMemStorage)
	
	if not AXCatalogMultiItemShoppingFTUX or AXCatalogMultiItemShoppingFTUX == "" then
		AXCatalogMultiItemShoppingFTUX = "{}"
	end
	local t = {}
	pcall(function()
		-- upvalues: t (write), httpService (copy), AXCatalogMultiItemShoppingFTUX (write)
		t = httpService:JSONDecode(AXCatalogMultiItemShoppingFTUX)
	end)
	
	return t
end

local function _(value)
	-- upvalues: httpService (ref), safeAppStorageService (ref), AXCatalogMultiItemShoppingFtuxUseMemStorage (ref)
	pcall(function()
		-- upvalues: httpService (copy), value (ref), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
		safeAppStorageService.setItem("AXCatalogMultiItemShoppingFTUX", httpService:JSONEncode(value), AXCatalogMultiItemShoppingFtuxUseMemStorage)
		safeAppStorageService.flush()
	end)
end

return function()
	-- upvalues: fFlagAXDisableMultiItemShoppingFtux (ref), getStorage (ref), AXCatalogMultiItemShoppingFtuxOtherPromptMaxCount (ref), httpService (ref), safeAppStorageService (ref), AXCatalogMultiItemShoppingFtuxUseMemStorage (ref)
	return {
		shouldShowTooltipOnCheckoutButton = function()
			-- upvalues: fFlagAXDisableMultiItemShoppingFtux (copy), getStorage (copy)
			return if fFlagAXDisableMultiItemShoppingFtux then false else not getStorage().seenTooltipOnCheckoutButton
		end,
		shouldShowClearAllItemsPrompt = function()
			-- upvalues: fFlagAXDisableMultiItemShoppingFtux (copy), getStorage (copy), AXCatalogMultiItemShoppingFtuxOtherPromptMaxCount (copy)
			if fFlagAXDisableMultiItemShoppingFtux then
				return false
			end
			local var1 = getStorage()
			
			return not var1.hideClearAllItemsPrompt and (if var1.clearAllItemsPromptCount ~= nil then var1.clearAllItemsPromptCount < AXCatalogMultiItemShoppingFtuxOtherPromptMaxCount else true)
		end,
		shouldShowWearAvatarReplaceAllItemsPrompt = function()
			-- upvalues: fFlagAXDisableMultiItemShoppingFtux (copy), getStorage (copy), AXCatalogMultiItemShoppingFtuxOtherPromptMaxCount (copy)
			if fFlagAXDisableMultiItemShoppingFtux then
				return false
			end
			local var1 = getStorage()
			
			return not var1.hideWearAvatarReplaceAllItemsPrompt and (if var1.wearAvatarReplaceAllItemsPromptCount ~= nil then var1.wearAvatarReplaceAllItemsPromptCount < AXCatalogMultiItemShoppingFtuxOtherPromptMaxCount else true)
		end,
		setSeenTooltipOnCheckoutButton = function()
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
			local var1 = getStorage()
			var1.seenTooltipOnCheckoutButton = true
			pcall(function()
				-- upvalues: httpService (copy), var1 (ref), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
				safeAppStorageService.setItem("AXCatalogMultiItemShoppingFTUX", httpService:JSONEncode(var1), AXCatalogMultiItemShoppingFtuxUseMemStorage)
				safeAppStorageService.flush()
			end)
		end,
		hideClearAllItemsPrompt = function()
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
			local var1 = getStorage()
			var1.hideClearAllItemsPrompt = true
			pcall(function()
				-- upvalues: httpService (copy), var1 (ref), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
				safeAppStorageService.setItem("AXCatalogMultiItemShoppingFTUX", httpService:JSONEncode(var1), AXCatalogMultiItemShoppingFtuxUseMemStorage)
				safeAppStorageService.flush()
			end)
		end,
		incrementClearAllItemsPromptCount = function()
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
			local var1 = getStorage()
			var1.clearAllItemsPromptCount = if var1.clearAllItemsPromptCount == nil then 1 else var1.clearAllItemsPromptCount + 1
			pcall(function()
				-- upvalues: httpService (copy), var1 (ref), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
				safeAppStorageService.setItem("AXCatalogMultiItemShoppingFTUX", httpService:JSONEncode(var1), AXCatalogMultiItemShoppingFtuxUseMemStorage)
				safeAppStorageService.flush()
			end)
		end,
		hideWearAvatarReplaceAllItemsPrompt = function()
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
			local var1 = getStorage()
			var1.hideWearAvatarReplaceAllItemsPrompt = true
			pcall(function()
				-- upvalues: httpService (copy), var1 (ref), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
				safeAppStorageService.setItem("AXCatalogMultiItemShoppingFTUX", httpService:JSONEncode(var1), AXCatalogMultiItemShoppingFtuxUseMemStorage)
				safeAppStorageService.flush()
			end)
		end,
		incrementWearAvatarReplaceAllItemsPromptCount = function()
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
			local var1 = getStorage()
			var1.wearAvatarReplaceAllItemsPromptCount = if var1.wearAvatarReplaceAllItemsPromptCount == nil then 1 else var1.wearAvatarReplaceAllItemsPromptCount + 1
			pcall(function()
				-- upvalues: httpService (copy), var1 (ref), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
				safeAppStorageService.setItem("AXCatalogMultiItemShoppingFTUX", httpService:JSONEncode(var1), AXCatalogMultiItemShoppingFtuxUseMemStorage)
				safeAppStorageService.flush()
			end)
		end,
		shouldShowItemReplacedOnAvatarPrompt = function()
			-- upvalues: fFlagAXDisableMultiItemShoppingFtux (copy), getStorage (copy)
			return if fFlagAXDisableMultiItemShoppingFtux then false else not getStorage().seenItemReplacedOnAvatarPrompt
		end,
		setSeenItemReplaceOnAvatarPrompt = function()
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
			local var1 = getStorage()
			var1.seenItemReplacedOnAvatarPrompt = true
			pcall(function()
				-- upvalues: httpService (copy), var1 (ref), safeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
				safeAppStorageService.setItem("AXCatalogMultiItemShoppingFTUX", httpService:JSONEncode(var1), AXCatalogMultiItemShoppingFtuxUseMemStorage)
				safeAppStorageService.flush()
			end)
		end
	}
end