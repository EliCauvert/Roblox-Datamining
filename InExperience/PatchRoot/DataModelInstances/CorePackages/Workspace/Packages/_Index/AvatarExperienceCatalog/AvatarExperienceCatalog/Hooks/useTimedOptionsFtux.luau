local httpService = game:GetService("HttpService")
local safeAppStorageService = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceCommon).Lib.SafeAppStorageService
local AXTimedOptionsFtuxUseMemStorage = game:DefineFastFlag("AXTimedOptionsFtuxUseMemStorage", false)
local AXDisableTimedOptionsFtux = game:DefineFastFlag("AXDisableTimedOptionsFtux", false)

local function getStorage()
	-- upvalues: safeAppStorageService (ref), AXTimedOptionsFtuxUseMemStorage (ref), httpService (ref)
	local AXSlotBasedEditorCustomizeFtux = safeAppStorageService.getItem("AXSlotBasedEditorCustomizeFtux", AXTimedOptionsFtuxUseMemStorage)
	
	if not AXSlotBasedEditorCustomizeFtux or AXSlotBasedEditorCustomizeFtux == "" then
		AXSlotBasedEditorCustomizeFtux = "{}"
	end
	local t = {}
	pcall(function()
		-- upvalues: t (write), httpService (copy), AXSlotBasedEditorCustomizeFtux (write)
		t = httpService:JSONDecode(AXSlotBasedEditorCustomizeFtux)
	end)
	
	return t
end

local function _(value)
	-- upvalues: httpService (ref), safeAppStorageService (ref), AXTimedOptionsFtuxUseMemStorage (ref)
	pcall(function()
		-- upvalues: httpService (copy), value (ref), safeAppStorageService (copy), AXTimedOptionsFtuxUseMemStorage (copy)
		safeAppStorageService.setItem("AXSlotBasedEditorCustomizeFtux", httpService:JSONEncode(value), AXTimedOptionsFtuxUseMemStorage)
		safeAppStorageService.flush()
	end)
end

return function()
	-- upvalues: AXDisableTimedOptionsFtux (ref), getStorage (ref), httpService (ref), safeAppStorageService (ref), AXTimedOptionsFtuxUseMemStorage (ref)
	return {
		shouldShow2OptionToolTipOnBuyActionBar = function()
			-- upvalues: AXDisableTimedOptionsFtux (copy), getStorage (copy)
			return if AXDisableTimedOptionsFtux then false else not getStorage().hide2OptionToolTipOnBuyActionBar
		end,
		hide2OptionToolTipOnBuyActionBar = function()
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXTimedOptionsFtuxUseMemStorage (copy)
			local var1 = getStorage()
			var1.hide2OptionToolTipOnBuyActionBar = true
			pcall(function()
				-- upvalues: httpService (copy), var1 (ref), safeAppStorageService (copy), AXTimedOptionsFtuxUseMemStorage (copy)
				safeAppStorageService.setItem("AXSlotBasedEditorCustomizeFtux", httpService:JSONEncode(var1), AXTimedOptionsFtuxUseMemStorage)
				safeAppStorageService.flush()
			end)
		end,
		shouldShow2OptionToolTipInCheckoutPage = function()
			-- upvalues: AXDisableTimedOptionsFtux (copy), getStorage (copy)
			return if AXDisableTimedOptionsFtux then false else not getStorage().hide2OptionToolTipInCheckoutPage
		end,
		hide2OptionToolTipInCheckoutPage = function()
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXTimedOptionsFtuxUseMemStorage (copy)
			local var1 = getStorage()
			var1.hide2OptionToolTipInCheckoutPage = true
			pcall(function()
				-- upvalues: httpService (copy), var1 (ref), safeAppStorageService (copy), AXTimedOptionsFtuxUseMemStorage (copy)
				safeAppStorageService.setItem("AXSlotBasedEditorCustomizeFtux", httpService:JSONEncode(var1), AXTimedOptionsFtuxUseMemStorage)
				safeAppStorageService.flush()
			end)
		end,
		shouldShow2OptionOfferPillTooltip = function()
			-- upvalues: AXDisableTimedOptionsFtux (copy), getStorage (copy)
			return if AXDisableTimedOptionsFtux then false else not getStorage().hide2OptionOfferPillTooltip
		end,
		hide2OptionOfferPillTooltip = function()
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXTimedOptionsFtuxUseMemStorage (copy)
			local var1 = getStorage()
			var1.hide2OptionOfferPillTooltip = true
			pcall(function()
				-- upvalues: httpService (copy), var1 (ref), safeAppStorageService (copy), AXTimedOptionsFtuxUseMemStorage (copy)
				safeAppStorageService.setItem("AXSlotBasedEditorCustomizeFtux", httpService:JSONEncode(var1), AXTimedOptionsFtuxUseMemStorage)
				safeAppStorageService.flush()
			end)
		end
	}
end