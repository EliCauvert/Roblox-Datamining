local httpService = game:GetService("HttpService")
local safeAppStorageService = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceCommon).Lib.SafeAppStorageService
local AXTimedOptionsFtuxUseMemStorage = game:DefineFastFlag("AXTimedOptionsFtuxUseMemStorage", false)
local AXDisableTimedOptionsFtux = game:DefineFastFlag("AXDisableTimedOptionsFtux", false)

local function getStorage() --[[ line: 21 ]]
	-- upvalues: safeAppStorageService (ref), AXTimedOptionsFtuxUseMemStorage (ref), httpService (ref)
	local AXSlotBasedEditorCustomizeFtux = safeAppStorageService.getItem("AXSlotBasedEditorCustomizeFtux", AXTimedOptionsFtuxUseMemStorage)
	
	if not AXSlotBasedEditorCustomizeFtux or AXSlotBasedEditorCustomizeFtux == "" then
		AXSlotBasedEditorCustomizeFtux = "{}"
	end
	local t = {}
	pcall(function() --[[ line: 28 ]]
		-- upvalues: t (write), httpService (copy), AXSlotBasedEditorCustomizeFtux (write)
		t = httpService:JSONDecode(AXSlotBasedEditorCustomizeFtux)
	end)
	
	return t
end

local function _(value) --[[ line: 36 | named "setStorage" ]]
	-- upvalues: httpService (ref), safeAppStorageService (ref), AXTimedOptionsFtuxUseMemStorage (ref)
	pcall(function() --[[ line: 37 ]]
		-- upvalues: httpService (copy), value (ref), safeAppStorageService (copy), AXTimedOptionsFtuxUseMemStorage (copy)
		safeAppStorageService.setItem("AXSlotBasedEditorCustomizeFtux", httpService:JSONEncode(value), AXTimedOptionsFtuxUseMemStorage)
		safeAppStorageService.flush()
	end)
end

return function() --[[ line: 44 | named "useTimedOptionsFtux" ]]
	-- upvalues: AXDisableTimedOptionsFtux (ref), getStorage (ref), httpService (ref), safeAppStorageService (ref), AXTimedOptionsFtuxUseMemStorage (ref)
	return {
		shouldShow2OptionToolTipOnBuyActionBar = function() --[[ line: 45 ]]
			-- upvalues: AXDisableTimedOptionsFtux (copy), getStorage (copy)
			return if AXDisableTimedOptionsFtux then false else not getStorage().hide2OptionToolTipOnBuyActionBar
		end,
		hide2OptionToolTipOnBuyActionBar = function() --[[ line: 55 ]]
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXTimedOptionsFtuxUseMemStorage (copy)
			local var6 = getStorage()
			var6.hide2OptionToolTipOnBuyActionBar = true
			pcall(function() --[[ line: 37 ]]
				-- upvalues: httpService (copy), var6 (ref), safeAppStorageService (copy), AXTimedOptionsFtuxUseMemStorage (copy)
				safeAppStorageService.setItem("AXSlotBasedEditorCustomizeFtux", httpService:JSONEncode(var6), AXTimedOptionsFtuxUseMemStorage)
				safeAppStorageService.flush()
			end)
		end,
		shouldShow2OptionToolTipInCheckoutPage = function() --[[ line: 62 ]]
			-- upvalues: AXDisableTimedOptionsFtux (copy), getStorage (copy)
			return if AXDisableTimedOptionsFtux then false else not getStorage().hide2OptionToolTipInCheckoutPage
		end,
		hide2OptionToolTipInCheckoutPage = function() --[[ line: 72 ]]
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXTimedOptionsFtuxUseMemStorage (copy)
			local var7 = getStorage()
			var7.hide2OptionToolTipInCheckoutPage = true
			pcall(function() --[[ line: 37 ]]
				-- upvalues: httpService (copy), var7 (ref), safeAppStorageService (copy), AXTimedOptionsFtuxUseMemStorage (copy)
				safeAppStorageService.setItem("AXSlotBasedEditorCustomizeFtux", httpService:JSONEncode(var7), AXTimedOptionsFtuxUseMemStorage)
				safeAppStorageService.flush()
			end)
		end,
		shouldShow2OptionOfferPillTooltip = function() --[[ line: 79 ]]
			-- upvalues: AXDisableTimedOptionsFtux (copy), getStorage (copy)
			return if AXDisableTimedOptionsFtux then false else not getStorage().hide2OptionOfferPillTooltip
		end,
		hide2OptionOfferPillTooltip = function() --[[ line: 89 ]]
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXTimedOptionsFtuxUseMemStorage (copy)
			local var8 = getStorage()
			var8.hide2OptionOfferPillTooltip = true
			pcall(function() --[[ line: 37 ]]
				-- upvalues: httpService (copy), var8 (ref), safeAppStorageService (copy), AXTimedOptionsFtuxUseMemStorage (copy)
				safeAppStorageService.setItem("AXSlotBasedEditorCustomizeFtux", httpService:JSONEncode(var8), AXTimedOptionsFtuxUseMemStorage)
				safeAppStorageService.flush()
			end)
		end
	}
end