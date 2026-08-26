local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local serviceModule = require(chrome.Service)
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)
local useMappedSignal = require(corePackagesService.Workspace.Packages.Chrome).Hooks.useMappedSignal
local commonFtuxTooltipModule = require(chrome.Integrations.CommonFtuxTooltip)
local inExperienceShopTooltipPriority = game:DefineFastInt("InExperienceShopTooltipPriority", 3500)
local inExperienceShopTooltipStorageKey = game:DefineFastString("InExperienceShopTooltipStorageKey", "InExperienceShopTooltipStorageKey")
local inExperienceShopTooltipShowDelay = game:DefineFastInt("InExperienceShopTooltipShowDelay", 1000)
local inExperienceShopTooltipDismissDelay = game:DefineFastInt("InExperienceShopTooltipDismissDelay", 7000)

return function(p1)
	-- upvalues: serviceModule (ref), constantsModule (ref), useMappedSignal (ref), commonFtuxTooltipModule (ref), inExperienceShopTooltipPriority (ref), inExperienceShopTooltipStorageKey (ref), inExperienceShopTooltipShowDelay (ref), inExperienceShopTooltipDismissDelay (ref)
	local iNEXPERIENCESHOPID = serviceModule:integrations()[constantsModule.IN_EXPERIENCE_SHOP_ID]
	
	return useMappedSignal(if iNEXPERIENCESHOPID then iNEXPERIENCESHOPID.availability else nil) == serviceModule.AvailabilitySignal.Available and commonFtuxTooltipModule({
		id = "IN_EXPERIENCE_SHOP_TOOLTIP",
		headerKey = "CoreScripts.FTUX.Heading.InExperienceShop",
		bodyKey = "CoreScripts.FTUX.Label.InExperienceShopDescription",
		priority = inExperienceShopTooltipPriority,
		isIconVisible = p1.visible,
		localStorageKey = inExperienceShopTooltipStorageKey,
		showDelay = inExperienceShopTooltipShowDelay,
		dismissDelay = inExperienceShopTooltipDismissDelay
	})
end