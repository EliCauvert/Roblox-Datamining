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
local var5 = if fFlagAXMakeupLayeringTooltipFTUX then false else nil

local function getStorage() --[[ line: 30 ]]
	-- upvalues: safeAppStorageService (ref), AXCatalogMakeupFtuxUseMemStorage (ref), httpService (ref)
	local AXCatalogMakeupFTUX = safeAppStorageService.getItem("AXCatalogMakeupFTUX", AXCatalogMakeupFtuxUseMemStorage)
	
	if not AXCatalogMakeupFTUX or AXCatalogMakeupFTUX == "" then
		AXCatalogMakeupFTUX = "{}"
	end
	local t = {}
	pcall(function() --[[ line: 37 ]]
		-- upvalues: t (write), httpService (copy), AXCatalogMakeupFTUX (write)
		t = httpService:JSONDecode(AXCatalogMakeupFTUX)
	end)
	
	return t
end

local function _(value) --[[ line: 45 | named "setStorage" ]]
	-- upvalues: httpService (ref), safeAppStorageService (ref), AXCatalogMakeupFtuxUseMemStorage (ref)
	pcall(function() --[[ line: 46 ]]
		-- upvalues: httpService (copy), value (ref), safeAppStorageService (copy), AXCatalogMakeupFtuxUseMemStorage (copy)
		safeAppStorageService.setItem("AXCatalogMakeupFTUX", httpService:JSONEncode(value), AXCatalogMakeupFtuxUseMemStorage)
		safeAppStorageService.flush()
	end)
end

return function() --[[ line: 53 | named "useMakeupFtux" ]]
	-- upvalues: fFlagAXMISEnableMultiShopping (ref), getStorage (ref), httpService (ref), safeAppStorageService (ref), AXCatalogMakeupFtuxUseMemStorage (ref), fFlagAXSkipMakeupFTUX (ref), AXMakeupMax6LayersPromptMaxSeenCount (ref), fFlagAXMakeupLayeringTooltipFTUX (ref), var5 (write), AXMakeupLayeringTooltipMaxSeenCount (ref), fFlagAXMakeupReleaseFTUX (ref)
	return {
		shouldShowMakeupMax6LayersPrompt = function() --[[ line: 66 ]]
			-- upvalues: fFlagAXSkipMakeupFTUX (copy), getStorage (copy), fFlagAXMISEnableMultiShopping (copy), AXMakeupMax6LayersPromptMaxSeenCount (copy)
			if fFlagAXSkipMakeupFTUX then
				return false
			end
			local var9 = getStorage()
			
			return not var9.hideMakeupMax6LayersPrompt and (if fFlagAXMISEnableMultiShopping then if var9.seenMakeupMax6LayersCount ~= nil then var9.seenMakeupMax6LayersCount < AXMakeupMax6LayersPromptMaxSeenCount else true else not fFlagAXMISEnableMultiShopping)
		end,
		hideMakeupMax6LayersPrompt = function() --[[ line: 82 ]]
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXCatalogMakeupFtuxUseMemStorage (copy)
			local var10 = getStorage()
			var10.hideMakeupMax6LayersPrompt = true
			pcall(function() --[[ line: 46 ]]
				-- upvalues: httpService (copy), var10 (ref), safeAppStorageService (copy), AXCatalogMakeupFtuxUseMemStorage (copy)
				safeAppStorageService.setItem("AXCatalogMakeupFTUX", httpService:JSONEncode(var10), AXCatalogMakeupFtuxUseMemStorage)
				safeAppStorageService.flush()
			end)
		end,
		shouldShowMakeupLayeringTooltip = if fFlagAXMakeupLayeringTooltipFTUX then function() --[[ line: 90 ]]
			-- upvalues: fFlagAXSkipMakeupFTUX (copy), var5 (copy), getStorage (copy), AXMakeupLayeringTooltipMaxSeenCount (copy)
			return if fFlagAXSkipMakeupFTUX then false elseif var5 then false else (getStorage().makeupLayeringTooltipSeenCount or 0) < AXMakeupLayeringTooltipMaxSeenCount
		end else nil,
		markMakeupLayeringTooltipSeen = if fFlagAXMakeupLayeringTooltipFTUX then function() --[[ line: 106 ]]
			-- upvalues: var5 (copy), getStorage (copy), httpService (copy), safeAppStorageService (copy), AXCatalogMakeupFtuxUseMemStorage (copy)
			var5 = true
			local var11 = getStorage()
			var11.makeupLayeringTooltipSeenCount = (var11.makeupLayeringTooltipSeenCount or 0) + 1
			pcall(function() --[[ line: 46 ]]
				-- upvalues: httpService (copy), var11 (ref), safeAppStorageService (copy), AXCatalogMakeupFtuxUseMemStorage (copy)
				safeAppStorageService.setItem("AXCatalogMakeupFTUX", httpService:JSONEncode(var11), AXCatalogMakeupFtuxUseMemStorage)
				safeAppStorageService.flush()
			end)
		end else nil,
		shouldShowMakeupReleasePrompt = if fFlagAXMakeupReleaseFTUX then function() --[[ line: 117 ]]
			-- upvalues: fFlagAXSkipMakeupFTUX (copy), getStorage (copy)
			return if fFlagAXSkipMakeupFTUX then false else not getStorage().shownMakeupReleasePrompt
		end else nil,
		setShownMakeupReleasePrompt = if fFlagAXMakeupReleaseFTUX then function() --[[ line: 128 ]]
			-- upvalues: getStorage (copy), httpService (copy), safeAppStorageService (copy), AXCatalogMakeupFtuxUseMemStorage (copy)
			local var12 = getStorage()
			var12.shownMakeupReleasePrompt = true
			pcall(function() --[[ line: 46 ]]
				-- upvalues: httpService (copy), var12 (ref), safeAppStorageService (copy), AXCatalogMakeupFtuxUseMemStorage (copy)
				safeAppStorageService.setItem("AXCatalogMakeupFTUX", httpService:JSONEncode(var12), AXCatalogMakeupFtuxUseMemStorage)
				safeAppStorageService.flush()
			end)
		end else nil,
		incrementSeenMakeupMax6LayersPrompt = function() --[[ line: 54 ]]
			-- upvalues: fFlagAXMISEnableMultiShopping (copy), getStorage (copy), httpService (copy), safeAppStorageService (copy), AXCatalogMakeupFtuxUseMemStorage (copy)
			if fFlagAXMISEnableMultiShopping then
				local var13 = getStorage()
				var13.seenMakeupMax6LayersCount = if var13.seenMakeupMax6LayersCount == nil then 1 else var13.seenMakeupMax6LayersCount + 1
				pcall(function() --[[ line: 46 ]]
					-- upvalues: httpService (copy), var13 (ref), safeAppStorageService (copy), AXCatalogMakeupFtuxUseMemStorage (copy)
					safeAppStorageService.setItem("AXCatalogMakeupFTUX", httpService:JSONEncode(var13), AXCatalogMakeupFtuxUseMemStorage)
					safeAppStorageService.flush()
				end)
				
				return
			end
		end
	}
end