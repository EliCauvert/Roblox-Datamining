local HttpService = game:GetService("HttpService")
local SafeAppStorageService = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceCommon).Lib.SafeAppStorageService
local AXTimedOptionsFtuxUseMemStorage = game:DefineFastFlag("AXTimedOptionsFtuxUseMemStorage", false)
local AXDisableTimedOptionsFtux = game:DefineFastFlag("AXDisableTimedOptionsFtux", false)

local function getStorage()
	-- upvalues: SafeAppStorageService (copy), AXTimedOptionsFtuxUseMemStorage (copy), HttpService (copy)
	local AXSlotBasedEditorCustomizeFtuxItem = SafeAppStorageService.getItem("AXSlotBasedEditorCustomizeFtux", AXTimedOptionsFtuxUseMemStorage)
	
	if not AXSlotBasedEditorCustomizeFtuxItem or AXSlotBasedEditorCustomizeFtuxItem == "" then
		AXSlotBasedEditorCustomizeFtuxItem = "{}"
	end
	local t = {}
	pcall(function()
		-- upvalues: t (ref), HttpService (upval), AXSlotBasedEditorCustomizeFtuxItem (ref)
		t = HttpService:JSONDecode(AXSlotBasedEditorCustomizeFtuxItem)
	end)
	
	return t
end

local function _(p1)
	-- upvalues: HttpService (copy), SafeAppStorageService (copy), AXTimedOptionsFtuxUseMemStorage (copy)
	pcall(function()
		-- upvalues: HttpService (upval), p1 (copy), SafeAppStorageService (upval), AXTimedOptionsFtuxUseMemStorage (upval)
		SafeAppStorageService.setItem("AXSlotBasedEditorCustomizeFtux", HttpService:JSONEncode(p1), AXTimedOptionsFtuxUseMemStorage)
		SafeAppStorageService.flush()
	end)
end

return function()
	-- upvalues: AXDisableTimedOptionsFtux (copy), getStorage (copy), HttpService (copy), SafeAppStorageService (copy), AXTimedOptionsFtuxUseMemStorage (copy)
	return {
		shouldShow2OptionToolTipOnBuyActionBar = function(): boolean
			-- upvalues: AXDisableTimedOptionsFtux (upval), getStorage (upval)
			return not AXDisableTimedOptionsFtux and not getStorage().hide2OptionToolTipOnBuyActionBar
		end,
		hide2OptionToolTipOnBuyActionBar = function()
			-- upvalues: getStorage (upval), HttpService (upval), SafeAppStorageService (upval), AXTimedOptionsFtuxUseMemStorage (upval)
			local Storage = getStorage()
			Storage.hide2OptionToolTipOnBuyActionBar = true
			pcall(function()
				-- upvalues: HttpService (upval), Storage (copy), SafeAppStorageService (upval), AXTimedOptionsFtuxUseMemStorage (upval)
				SafeAppStorageService.setItem("AXSlotBasedEditorCustomizeFtux", HttpService:JSONEncode(Storage), AXTimedOptionsFtuxUseMemStorage)
				SafeAppStorageService.flush()
			end)
		end,
		shouldShow2OptionToolTipInCheckoutPage = function(): boolean
			-- upvalues: AXDisableTimedOptionsFtux (upval), getStorage (upval)
			return not AXDisableTimedOptionsFtux and not getStorage().hide2OptionToolTipInCheckoutPage
		end,
		hide2OptionToolTipInCheckoutPage = function()
			-- upvalues: getStorage (upval), HttpService (upval), SafeAppStorageService (upval), AXTimedOptionsFtuxUseMemStorage (upval)
			local Storage = getStorage()
			Storage.hide2OptionToolTipInCheckoutPage = true
			pcall(function()
				-- upvalues: HttpService (upval), Storage (copy), SafeAppStorageService (upval), AXTimedOptionsFtuxUseMemStorage (upval)
				SafeAppStorageService.setItem("AXSlotBasedEditorCustomizeFtux", HttpService:JSONEncode(Storage), AXTimedOptionsFtuxUseMemStorage)
				SafeAppStorageService.flush()
			end)
		end,
		shouldShow2OptionOfferPillTooltip = function(): boolean
			-- upvalues: AXDisableTimedOptionsFtux (upval), getStorage (upval)
			return not AXDisableTimedOptionsFtux and not getStorage().hide2OptionOfferPillTooltip
		end,
		hide2OptionOfferPillTooltip = function()
			-- upvalues: getStorage (upval), HttpService (upval), SafeAppStorageService (upval), AXTimedOptionsFtuxUseMemStorage (upval)
			local Storage = getStorage()
			Storage.hide2OptionOfferPillTooltip = true
			pcall(function()
				-- upvalues: HttpService (upval), Storage (copy), SafeAppStorageService (upval), AXTimedOptionsFtuxUseMemStorage (upval)
				SafeAppStorageService.setItem("AXSlotBasedEditorCustomizeFtux", HttpService:JSONEncode(Storage), AXTimedOptionsFtuxUseMemStorage)
				SafeAppStorageService.flush()
			end)
		end
	}
end