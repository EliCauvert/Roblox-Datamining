local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local safeAppStorageService = require(parent.AvatarExperienceCommon).Lib.SafeAppStorageService
local fFlagAXMakeupReleaseFTUX = avatarExperienceFlagsModule.FFlagAXMakeupReleaseFTUX
local fFlagAXMISEnableMultiShopping = avatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local AXCatalogMakeupFtuxUseMemStorage = game:DefineFastFlag("AXCatalogMakeupFtuxUseMemStorage", false)
local fFlagAXMakeupLayeringTooltipFTUX = avatarExperienceFlagsModule.FFlagAXMakeupLayeringTooltipFTUX
local fFlagAXSkipMakeupFTUX = avatarExperienceFlagsModule.FFlagAXSkipMakeupFTUX
local AXMakeupLayeringTooltipMaxSeenCount = game:DefineFastInt("AXMakeupLayeringTooltipMaxSeenCount", 2)
local AXMakeupMax6LayersPromptMaxSeenCount = game:DefineFastInt("AXMakeupMax6LayersPromptMaxSeenCount", 3)
local var1 = if fFlagAXMakeupLayeringTooltipFTUX then false else nil

local function getStorage()
	-- upvalues: safeAppStorageService (ref), AXCatalogMakeupFtuxUseMemStorage (ref), httpService (ref)
	local AXCatalogMakeupFTUX = safeAppStorageService.getItem("AXCatalogMakeupFTUX", AXCatalogMakeupFtuxUseMemStorage)
	
	if not AXCatalogMakeupFTUX or AXCatalogMakeupFTUX == "" then
		AXCatalogMakeupFTUX = "{}"
	end
	local t = {}
	pcall(function()
		-- upvalues: t (write), httpService (copy), AXCatalogMakeupFTUX (write)
		t = httpService:JSONDecode(AXCatalogMakeupFTUX)
	end)
	
	return t
end

local function _(value)
	-- upvalues: httpService (ref), safeAppStorageService (ref), AXCatalogMakeupFtuxUseMemStorage (ref)
	pcall(function()
		-- upvalues: httpService (copy), value (ref), safeAppStorageService (copy), AXCatalogMakeupFtuxUseMemStorage (copy)
		safeAppStorageService.setItem("AXCatalogMakeupFTUX", httpService:JSONEncode(value), AXCatalogMakeupFtuxUseMemStorage)
		safeAppStorageService.flush()
	end)
end

return function()
	-- upvalues: fFlagAXMISEnableMultiShopping (ref), getStorage (ref), httpService (ref), safeAppStorageService (ref), AXCatalogMakeupFtuxUseMemStorage (ref), fFlagAXSkipMakeupFTUX (ref), AXMakeupMax6LayersPromptMaxSeenCount (ref), fFlagAXMakeupLayeringTooltipFTUX (ref), var1 (write), AXMakeupLayeringTooltipMaxSeenCount (ref), fFlagAXMakeupReleaseFTUX (ref)
	return {
		shouldShowMakeupMax6LayersPrompt = function()
			-- upvalues: fFlagAXSkipMakeupFTUX (copy), getStorage (copy), fFlagAXMISEnableMultiShopping (copy), AXMakeupMax6LayersPromptMaxSeenCount (copy)
			if fFlagAXSkipMakeupFTUX then
				return false
			end
			local var2 = getStorage()
			
			return not var2.hideMakeupMax6LayersPrompt and (if fFlagAXMISEnableMultiShopping then if var2.seenMakeupMax6LayersCount ~= nil then var2.seenMakeupMax6LayersCount < AXMakeupMax6LayersPromptMaxSeenCount else true else not fFlagAXMISEnableMultiShopping)
		end,
		hideMakeupMax6LayersPrompt = function()
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXCatalogMakeupFtuxUseMemStorage (copy)
			local var2 = getStorage()
			var2.hideMakeupMax6LayersPrompt = true
			pcall(function()
				-- upvalues: httpService (copy), var2 (ref), safeAppStorageService (copy), AXCatalogMakeupFtuxUseMemStorage (copy)
				safeAppStorageService.setItem("AXCatalogMakeupFTUX", httpService:JSONEncode(var2), AXCatalogMakeupFtuxUseMemStorage)
				safeAppStorageService.flush()
			end)
		end,
		shouldShowMakeupLayeringTooltip = if fFlagAXMakeupLayeringTooltipFTUX then function()
			-- upvalues: fFlagAXSkipMakeupFTUX (copy), var1 (copy), getStorage (copy), AXMakeupLayeringTooltipMaxSeenCount (copy)
			return if fFlagAXSkipMakeupFTUX then false elseif var1 then false else (getStorage().makeupLayeringTooltipSeenCount or 0) < AXMakeupLayeringTooltipMaxSeenCount
		end else nil,
		markMakeupLayeringTooltipSeen = if fFlagAXMakeupLayeringTooltipFTUX then function()
			-- upvalues: var1 (copy), getStorage (copy), httpService (copy), safeAppStorageService (copy), AXCatalogMakeupFtuxUseMemStorage (copy)
			var1 = true
			local var2 = getStorage()
			var2.makeupLayeringTooltipSeenCount = (var2.makeupLayeringTooltipSeenCount or 0) + 1
			pcall(function()
				-- upvalues: httpService (copy), var2 (ref), safeAppStorageService (copy), AXCatalogMakeupFtuxUseMemStorage (copy)
				safeAppStorageService.setItem("AXCatalogMakeupFTUX", httpService:JSONEncode(var2), AXCatalogMakeupFtuxUseMemStorage)
				safeAppStorageService.flush()
			end)
		end else nil,
		shouldShowMakeupReleasePrompt = if fFlagAXMakeupReleaseFTUX then function()
			-- upvalues: fFlagAXSkipMakeupFTUX (copy), getStorage (copy)
			return if fFlagAXSkipMakeupFTUX then false else not getStorage().shownMakeupReleasePrompt
		end else nil,
		setShownMakeupReleasePrompt = if fFlagAXMakeupReleaseFTUX then function()
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXCatalogMakeupFtuxUseMemStorage (copy)
			local var2 = getStorage()
			var2.shownMakeupReleasePrompt = true
			pcall(function()
				-- upvalues: httpService (copy), var2 (ref), safeAppStorageService (copy), AXCatalogMakeupFtuxUseMemStorage (copy)
				safeAppStorageService.setItem("AXCatalogMakeupFTUX", httpService:JSONEncode(var2), AXCatalogMakeupFtuxUseMemStorage)
				safeAppStorageService.flush()
			end)
		end else nil,
		incrementSeenMakeupMax6LayersPrompt = function()
			-- upvalues: fFlagAXMISEnableMultiShopping (copy), getStorage (copy), httpService (copy), safeAppStorageService (copy), AXCatalogMakeupFtuxUseMemStorage (copy)
			if fFlagAXMISEnableMultiShopping then
				local var2 = getStorage()
				var2.seenMakeupMax6LayersCount = if var2.seenMakeupMax6LayersCount == nil then 1 else var2.seenMakeupMax6LayersCount + 1
				pcall(function()
					-- upvalues: httpService (copy), var2 (ref), safeAppStorageService (copy), AXCatalogMakeupFtuxUseMemStorage (copy)
					safeAppStorageService.setItem("AXCatalogMakeupFTUX", httpService:JSONEncode(var2), AXCatalogMakeupFtuxUseMemStorage)
					safeAppStorageService.flush()
				end)
				
				return
			end
		end
	}
end