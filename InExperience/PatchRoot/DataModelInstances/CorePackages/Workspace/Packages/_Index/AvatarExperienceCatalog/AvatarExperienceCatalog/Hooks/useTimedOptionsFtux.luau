local HttpService = game:GetService("HttpService")
local SafeAppStorageService = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceCommon).Lib.SafeAppStorageService
local AXTimedOptionsFtuxUseMemStorage = game:DefineFastFlag("AXTimedOptionsFtuxUseMemStorage", false)
local AXDisableTimedOptionsFtux = game:DefineFastFlag("AXDisableTimedOptionsFtux", false)

local function getStorage() --[[ Line: 21 ]]
	-- upvalues: SafeAppStorageService (copy), AXTimedOptionsFtuxUseMemStorage (copy), HttpService (copy)
	local AXSlotBasedEditorCustomizeFtuxItem = SafeAppStorageService.getItem("AXSlotBasedEditorCustomizeFtux", AXTimedOptionsFtuxUseMemStorage)
	
	if not AXSlotBasedEditorCustomizeFtuxItem or AXSlotBasedEditorCustomizeFtuxItem == "" then
		AXSlotBasedEditorCustomizeFtuxItem = "{}"
	end
	local t = {}
	pcall(function() --[[ Line: 28 ]]
		-- upvalues: t (ref), HttpService (upval), AXSlotBasedEditorCustomizeFtuxItem (ref)
		t = HttpService:JSONDecode(AXSlotBasedEditorCustomizeFtuxItem)
	end)
	
	return t
end

local function _(p1) --[[ Line: 36 | Named "setStorage" ]]
	-- upvalues: HttpService (copy), SafeAppStorageService (copy), AXTimedOptionsFtuxUseMemStorage (copy)
	pcall(function() --[[ Line: 37 ]]
		-- upvalues: HttpService (upval), p1 (copy), SafeAppStorageService (upval), AXTimedOptionsFtuxUseMemStorage (upval)
		SafeAppStorageService.setItem("AXSlotBasedEditorCustomizeFtux", HttpService:JSONEncode(p1), AXTimedOptionsFtuxUseMemStorage)
		SafeAppStorageService.flush()
	end)
end

return function() --[[ Line: 44 | Named "useTimedOptionsFtux" ]]
	-- upvalues: AXDisableTimedOptionsFtux (copy), getStorage (copy), HttpService (copy), SafeAppStorageService (copy), AXTimedOptionsFtuxUseMemStorage (copy)
	return {
		shouldShow2OptionToolTipOnBuyActionBar = function(): boolean --[[ Line: 45 ]]
			-- upvalues: AXDisableTimedOptionsFtux (upval), getStorage (upval)
			return not AXDisableTimedOptionsFtux and not getStorage().hide2OptionToolTipOnBuyActionBar
		end,
		hide2OptionToolTipOnBuyActionBar = function() --[[ Line: 55 ]]
			-- upvalues: getStorage (upval), HttpService (upval), SafeAppStorageService (upval), AXTimedOptionsFtuxUseMemStorage (upval)
			local Storage = getStorage()
			Storage.hide2OptionToolTipOnBuyActionBar = true
			pcall(function() --[[ Line: 37 ]]
				-- upvalues: HttpService (upval), Storage (copy), SafeAppStorageService (upval), AXTimedOptionsFtuxUseMemStorage (upval)
				SafeAppStorageService.setItem("AXSlotBasedEditorCustomizeFtux", HttpService:JSONEncode(Storage), AXTimedOptionsFtuxUseMemStorage)
				SafeAppStorageService.flush()
			end)
		end,
		shouldShow2OptionToolTipInCheckoutPage = function(): boolean --[[ Line: 62 ]]
			-- upvalues: AXDisableTimedOptionsFtux (upval), getStorage (upval)
			return not AXDisableTimedOptionsFtux and not getStorage().hide2OptionToolTipInCheckoutPage
		end,
		hide2OptionToolTipInCheckoutPage = function() --[[ Line: 72 ]]
			-- upvalues: getStorage (upval), HttpService (upval), SafeAppStorageService (upval), AXTimedOptionsFtuxUseMemStorage (upval)
			local Storage = getStorage()
			Storage.hide2OptionToolTipInCheckoutPage = true
			pcall(function() --[[ Line: 37 ]]
				-- upvalues: HttpService (upval), Storage (copy), SafeAppStorageService (upval), AXTimedOptionsFtuxUseMemStorage (upval)
				SafeAppStorageService.setItem("AXSlotBasedEditorCustomizeFtux", HttpService:JSONEncode(Storage), AXTimedOptionsFtuxUseMemStorage)
				SafeAppStorageService.flush()
			end)
		end,
		shouldShow2OptionOfferPillTooltip = function(): boolean --[[ Line: 79 ]]
			-- upvalues: AXDisableTimedOptionsFtux (upval), getStorage (upval)
			return not AXDisableTimedOptionsFtux and not getStorage().hide2OptionOfferPillTooltip
		end,
		hide2OptionOfferPillTooltip = function() --[[ Line: 89 ]]
			-- upvalues: getStorage (upval), HttpService (upval), SafeAppStorageService (upval), AXTimedOptionsFtuxUseMemStorage (upval)
			local Storage = getStorage()
			Storage.hide2OptionOfferPillTooltip = true
			pcall(function() --[[ Line: 37 ]]
				-- upvalues: HttpService (upval), Storage (copy), SafeAppStorageService (upval), AXTimedOptionsFtuxUseMemStorage (upval)
				SafeAppStorageService.setItem("AXSlotBasedEditorCustomizeFtux", HttpService:JSONEncode(Storage), AXTimedOptionsFtuxUseMemStorage)
				SafeAppStorageService.flush()
			end)
		end
	}
end