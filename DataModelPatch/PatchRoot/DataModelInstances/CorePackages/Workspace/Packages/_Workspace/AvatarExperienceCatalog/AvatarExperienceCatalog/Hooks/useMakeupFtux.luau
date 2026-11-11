local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local SafeAppStorageService = require(Parent.AvatarExperienceCommon).Lib.SafeAppStorageService
local FFlagAXMakeupReleaseFTUX = AvatarExperienceFlagsModule.FFlagAXMakeupReleaseFTUX
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local AXCatalogMakeupFtuxUseMemStorage = game:DefineFastFlag("AXCatalogMakeupFtuxUseMemStorage", false)
local FFlagAXMakeupLayeringTooltipFTUX = AvatarExperienceFlagsModule.FFlagAXMakeupLayeringTooltipFTUX
local FFlagAXSkipMakeupFTUX = AvatarExperienceFlagsModule.FFlagAXSkipMakeupFTUX
local AXMakeupLayeringTooltipMaxSeenCount = game:DefineFastInt("AXMakeupLayeringTooltipMaxSeenCount", 2)
local AXMakeupMax6LayersPromptMaxSeenCount = game:DefineFastInt("AXMakeupMax6LayersPromptMaxSeenCount", 3)
local Flag = not FFlagAXMakeupLayeringTooltipFTUX and nil

local function getStorage()
	-- upvalues: SafeAppStorageService (copy), AXCatalogMakeupFtuxUseMemStorage (copy), HttpService (copy)
	local AXCatalogMakeupFTUXItem = SafeAppStorageService.getItem("AXCatalogMakeupFTUX", AXCatalogMakeupFtuxUseMemStorage)
	
	if not AXCatalogMakeupFTUXItem or AXCatalogMakeupFTUXItem == "" then
		AXCatalogMakeupFTUXItem = "{}"
	end
	local t = {}
	pcall(function()
		-- upvalues: t (ref), HttpService (upval), AXCatalogMakeupFTUXItem (ref)
		t = HttpService:JSONDecode(AXCatalogMakeupFTUXItem)
	end)
	
	return t
end

local function _(p1)
	-- upvalues: HttpService (copy), SafeAppStorageService (copy), AXCatalogMakeupFtuxUseMemStorage (copy)
	pcall(function()
		-- upvalues: HttpService (upval), p1 (copy), SafeAppStorageService (upval), AXCatalogMakeupFtuxUseMemStorage (upval)
		SafeAppStorageService.setItem("AXCatalogMakeupFTUX", HttpService:JSONEncode(p1), AXCatalogMakeupFtuxUseMemStorage)
		SafeAppStorageService.flush()
	end)
end

return function()
	-- upvalues: FFlagAXMISEnableMultiShopping (copy), getStorage (copy), HttpService (copy), SafeAppStorageService (copy), AXCatalogMakeupFtuxUseMemStorage (copy), FFlagAXSkipMakeupFTUX (copy), AXMakeupMax6LayersPromptMaxSeenCount (copy), FFlagAXMakeupLayeringTooltipFTUX (copy), Flag (ref), AXMakeupLayeringTooltipMaxSeenCount (copy), FFlagAXMakeupReleaseFTUX (copy)
	return {
		shouldShowMakeupMax6LayersPrompt = function(): boolean
			-- upvalues: FFlagAXSkipMakeupFTUX (upval), getStorage (upval), FFlagAXMISEnableMultiShopping (upval), AXMakeupMax6LayersPromptMaxSeenCount (upval)
			if FFlagAXSkipMakeupFTUX then
				return false
			else
				local Storage = getStorage()
				
				return not Storage.hideMakeupMax6LayersPrompt and (not FFlagAXMISEnableMultiShopping or (Storage.seenMakeupMax6LayersCount == nil or Storage.seenMakeupMax6LayersCount < AXMakeupMax6LayersPromptMaxSeenCount))
			end
		end,
		hideMakeupMax6LayersPrompt = function()
			-- upvalues: getStorage (upval), HttpService (upval), SafeAppStorageService (upval), AXCatalogMakeupFtuxUseMemStorage (upval)
			local Storage = getStorage()
			Storage.hideMakeupMax6LayersPrompt = true
			pcall(function()
				-- upvalues: HttpService (upval), Storage (copy), SafeAppStorageService (upval), AXCatalogMakeupFtuxUseMemStorage (upval)
				SafeAppStorageService.setItem("AXCatalogMakeupFTUX", HttpService:JSONEncode(Storage), AXCatalogMakeupFtuxUseMemStorage)
				SafeAppStorageService.flush()
			end)
		end,
		shouldShowMakeupLayeringTooltip = if FFlagAXMakeupLayeringTooltipFTUX then function(): boolean
			-- upvalues: FFlagAXSkipMakeupFTUX (upval), Flag (upval), getStorage (upval), AXMakeupLayeringTooltipMaxSeenCount (upval)
			return not FFlagAXSkipMakeupFTUX and (not Flag and (getStorage().makeupLayeringTooltipSeenCount or 0) < AXMakeupLayeringTooltipMaxSeenCount)
		end else nil,
		markMakeupLayeringTooltipSeen = if FFlagAXMakeupLayeringTooltipFTUX then function()
			-- upvalues: Flag (upval), getStorage (upval), HttpService (upval), SafeAppStorageService (upval), AXCatalogMakeupFtuxUseMemStorage (upval)
			Flag = true
			local Storage = getStorage()
			Storage.makeupLayeringTooltipSeenCount = (Storage.makeupLayeringTooltipSeenCount or 0) + 1
			pcall(function()
				-- upvalues: HttpService (upval), Storage (copy), SafeAppStorageService (upval), AXCatalogMakeupFtuxUseMemStorage (upval)
				SafeAppStorageService.setItem("AXCatalogMakeupFTUX", HttpService:JSONEncode(Storage), AXCatalogMakeupFtuxUseMemStorage)
				SafeAppStorageService.flush()
			end)
		end else nil,
		shouldShowMakeupReleasePrompt = if FFlagAXMakeupReleaseFTUX then function(): boolean
			-- upvalues: FFlagAXSkipMakeupFTUX (upval), getStorage (upval)
			return not FFlagAXSkipMakeupFTUX and not getStorage().shownMakeupReleasePrompt
		end else nil,
		setShownMakeupReleasePrompt = if FFlagAXMakeupReleaseFTUX then function()
			-- upvalues: getStorage (upval), HttpService (upval), SafeAppStorageService (upval), AXCatalogMakeupFtuxUseMemStorage (upval)
			local Storage = getStorage()
			Storage.shownMakeupReleasePrompt = true
			pcall(function()
				-- upvalues: HttpService (upval), Storage (copy), SafeAppStorageService (upval), AXCatalogMakeupFtuxUseMemStorage (upval)
				SafeAppStorageService.setItem("AXCatalogMakeupFTUX", HttpService:JSONEncode(Storage), AXCatalogMakeupFtuxUseMemStorage)
				SafeAppStorageService.flush()
			end)
		end else nil,
		incrementSeenMakeupMax6LayersPrompt = function()
			-- upvalues: FFlagAXMISEnableMultiShopping (upval), getStorage (upval), HttpService (upval), SafeAppStorageService (upval), AXCatalogMakeupFtuxUseMemStorage (upval)
			if FFlagAXMISEnableMultiShopping then
				local Storage = getStorage()
				Storage.seenMakeupMax6LayersCount = if Storage.seenMakeupMax6LayersCount == nil then 1 else Storage.seenMakeupMax6LayersCount + 1
				pcall(function()
					-- upvalues: HttpService (upval), Storage (copy), SafeAppStorageService (upval), AXCatalogMakeupFtuxUseMemStorage (upval)
					SafeAppStorageService.setItem("AXCatalogMakeupFTUX", HttpService:JSONEncode(Storage), AXCatalogMakeupFtuxUseMemStorage)
					SafeAppStorageService.flush()
				end)
				
				return
			end
		end
	}
end