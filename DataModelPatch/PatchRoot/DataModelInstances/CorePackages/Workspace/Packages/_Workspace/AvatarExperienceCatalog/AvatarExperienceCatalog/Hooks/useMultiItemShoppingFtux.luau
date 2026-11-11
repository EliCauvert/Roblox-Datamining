local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local SafeAppStorageService = require(Parent.AvatarExperienceCommon).Lib.SafeAppStorageService
local FFlagAXDisableMultiItemShoppingFtux = require(Parent.AvatarExperienceFlags).FFlagAXDisableMultiItemShoppingFtux
local AXCatalogMultiItemShoppingFtuxUseMemStorage = game:DefineFastFlag("AXCatalogMultiItemShoppingFtuxUseMemStorage", false)
local AXCatalogMultiItemShoppingFtuxOtherPromptMaxCount = game:DefineFastInt("AXCatalogMultiItemShoppingFtuxOtherPromptMaxCount", 3)

local function getStorage()
	-- upvalues: SafeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy), HttpService (copy)
	local AXCatalogMultiItemShoppingFTUXItem = SafeAppStorageService.getItem("AXCatalogMultiItemShoppingFTUX", AXCatalogMultiItemShoppingFtuxUseMemStorage)
	
	if not AXCatalogMultiItemShoppingFTUXItem or AXCatalogMultiItemShoppingFTUXItem == "" then
		AXCatalogMultiItemShoppingFTUXItem = "{}"
	end
	local t = {}
	pcall(function()
		-- upvalues: t (ref), HttpService (upval), AXCatalogMultiItemShoppingFTUXItem (ref)
		t = HttpService:JSONDecode(AXCatalogMultiItemShoppingFTUXItem)
	end)
	
	return t
end

local function _(p1)
	-- upvalues: HttpService (copy), SafeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
	pcall(function()
		-- upvalues: HttpService (upval), p1 (copy), SafeAppStorageService (upval), AXCatalogMultiItemShoppingFtuxUseMemStorage (upval)
		SafeAppStorageService.setItem("AXCatalogMultiItemShoppingFTUX", HttpService:JSONEncode(p1), AXCatalogMultiItemShoppingFtuxUseMemStorage)
		SafeAppStorageService.flush()
	end)
end

return function()
	-- upvalues: FFlagAXDisableMultiItemShoppingFtux (copy), getStorage (copy), AXCatalogMultiItemShoppingFtuxOtherPromptMaxCount (copy), HttpService (copy), SafeAppStorageService (copy), AXCatalogMultiItemShoppingFtuxUseMemStorage (copy)
	return {
		shouldShowTooltipOnCheckoutButton = function(): boolean
			-- upvalues: FFlagAXDisableMultiItemShoppingFtux (upval), getStorage (upval)
			return not FFlagAXDisableMultiItemShoppingFtux and not getStorage().seenTooltipOnCheckoutButton
		end,
		shouldShowClearAllItemsPrompt = function(): boolean
			-- upvalues: FFlagAXDisableMultiItemShoppingFtux (upval), getStorage (upval), AXCatalogMultiItemShoppingFtuxOtherPromptMaxCount (upval)
			if FFlagAXDisableMultiItemShoppingFtux then
				return false
			else
				local Storage = getStorage()
				
				return not Storage.hideClearAllItemsPrompt and (Storage.clearAllItemsPromptCount == nil or Storage.clearAllItemsPromptCount < AXCatalogMultiItemShoppingFtuxOtherPromptMaxCount)
			end
		end,
		shouldShowWearAvatarReplaceAllItemsPrompt = function(): boolean
			-- upvalues: FFlagAXDisableMultiItemShoppingFtux (upval), getStorage (upval), AXCatalogMultiItemShoppingFtuxOtherPromptMaxCount (upval)
			if FFlagAXDisableMultiItemShoppingFtux then
				return false
			else
				local Storage = getStorage()
				
				return not Storage.hideWearAvatarReplaceAllItemsPrompt and (Storage.wearAvatarReplaceAllItemsPromptCount == nil or Storage.wearAvatarReplaceAllItemsPromptCount < AXCatalogMultiItemShoppingFtuxOtherPromptMaxCount)
			end
		end,
		setSeenTooltipOnCheckoutButton = function()
			-- upvalues: getStorage (upval), HttpService (upval), SafeAppStorageService (upval), AXCatalogMultiItemShoppingFtuxUseMemStorage (upval)
			local Storage = getStorage()
			Storage.seenTooltipOnCheckoutButton = true
			pcall(function()
				-- upvalues: HttpService (upval), Storage (copy), SafeAppStorageService (upval), AXCatalogMultiItemShoppingFtuxUseMemStorage (upval)
				SafeAppStorageService.setItem("AXCatalogMultiItemShoppingFTUX", HttpService:JSONEncode(Storage), AXCatalogMultiItemShoppingFtuxUseMemStorage)
				SafeAppStorageService.flush()
			end)
		end,
		hideClearAllItemsPrompt = function()
			-- upvalues: getStorage (upval), HttpService (upval), SafeAppStorageService (upval), AXCatalogMultiItemShoppingFtuxUseMemStorage (upval)
			local Storage = getStorage()
			Storage.hideClearAllItemsPrompt = true
			pcall(function()
				-- upvalues: HttpService (upval), Storage (copy), SafeAppStorageService (upval), AXCatalogMultiItemShoppingFtuxUseMemStorage (upval)
				SafeAppStorageService.setItem("AXCatalogMultiItemShoppingFTUX", HttpService:JSONEncode(Storage), AXCatalogMultiItemShoppingFtuxUseMemStorage)
				SafeAppStorageService.flush()
			end)
		end,
		incrementClearAllItemsPromptCount = function()
			-- upvalues: getStorage (upval), HttpService (upval), SafeAppStorageService (upval), AXCatalogMultiItemShoppingFtuxUseMemStorage (upval)
			local Storage = getStorage()
			Storage.clearAllItemsPromptCount = if Storage.clearAllItemsPromptCount == nil then 1 else Storage.clearAllItemsPromptCount + 1
			pcall(function()
				-- upvalues: HttpService (upval), Storage (copy), SafeAppStorageService (upval), AXCatalogMultiItemShoppingFtuxUseMemStorage (upval)
				SafeAppStorageService.setItem("AXCatalogMultiItemShoppingFTUX", HttpService:JSONEncode(Storage), AXCatalogMultiItemShoppingFtuxUseMemStorage)
				SafeAppStorageService.flush()
			end)
		end,
		hideWearAvatarReplaceAllItemsPrompt = function()
			-- upvalues: getStorage (upval), HttpService (upval), SafeAppStorageService (upval), AXCatalogMultiItemShoppingFtuxUseMemStorage (upval)
			local Storage = getStorage()
			Storage.hideWearAvatarReplaceAllItemsPrompt = true
			pcall(function()
				-- upvalues: HttpService (upval), Storage (copy), SafeAppStorageService (upval), AXCatalogMultiItemShoppingFtuxUseMemStorage (upval)
				SafeAppStorageService.setItem("AXCatalogMultiItemShoppingFTUX", HttpService:JSONEncode(Storage), AXCatalogMultiItemShoppingFtuxUseMemStorage)
				SafeAppStorageService.flush()
			end)
		end,
		incrementWearAvatarReplaceAllItemsPromptCount = function()
			-- upvalues: getStorage (upval), HttpService (upval), SafeAppStorageService (upval), AXCatalogMultiItemShoppingFtuxUseMemStorage (upval)
			local Storage = getStorage()
			Storage.wearAvatarReplaceAllItemsPromptCount = if Storage.wearAvatarReplaceAllItemsPromptCount == nil then 1 else Storage.wearAvatarReplaceAllItemsPromptCount + 1
			pcall(function()
				-- upvalues: HttpService (upval), Storage (copy), SafeAppStorageService (upval), AXCatalogMultiItemShoppingFtuxUseMemStorage (upval)
				SafeAppStorageService.setItem("AXCatalogMultiItemShoppingFTUX", HttpService:JSONEncode(Storage), AXCatalogMultiItemShoppingFtuxUseMemStorage)
				SafeAppStorageService.flush()
			end)
		end,
		shouldShowItemReplacedOnAvatarPrompt = function(): boolean
			-- upvalues: FFlagAXDisableMultiItemShoppingFtux (upval), getStorage (upval)
			return not FFlagAXDisableMultiItemShoppingFtux and not getStorage().seenItemReplacedOnAvatarPrompt
		end,
		setSeenItemReplaceOnAvatarPrompt = function()
			-- upvalues: getStorage (upval), HttpService (upval), SafeAppStorageService (upval), AXCatalogMultiItemShoppingFtuxUseMemStorage (upval)
			local Storage = getStorage()
			Storage.seenItemReplacedOnAvatarPrompt = true
			pcall(function()
				-- upvalues: HttpService (upval), Storage (copy), SafeAppStorageService (upval), AXCatalogMultiItemShoppingFtuxUseMemStorage (upval)
				SafeAppStorageService.setItem("AXCatalogMultiItemShoppingFTUX", HttpService:JSONEncode(Storage), AXCatalogMultiItemShoppingFtuxUseMemStorage)
				SafeAppStorageService.flush()
			end)
		end
	}
end