local Chrome = script:FindFirstAncestor("Chrome")
local ServiceModule = require(Chrome.Service)
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local UseMappedSignalFunction = require(game:GetService("CorePackages").Workspace.Packages.Chrome).Hooks.useMappedSignal
local CommonFtuxTooltipModule = require(Chrome.Integrations.CommonFtuxTooltip)
local InExperienceShopTooltipPriority = game:DefineFastInt("InExperienceShopTooltipPriority", 3500)
local InExperienceShopTooltipStorageKey = game:DefineFastString("InExperienceShopTooltipStorageKey", "InExperienceShopTooltipStorageKey")
local InExperienceShopTooltipShowDelay = game:DefineFastInt("InExperienceShopTooltipShowDelay", 1000)
local InExperienceShopTooltipDismissDelay = game:DefineFastInt("InExperienceShopTooltipDismissDelay", 7000)

return function(p1) --[[ Line: 20 | Named "InExperienceShopFtuxTooltip" ]]
	-- upvalues: ServiceModule (copy), ConstantsModule (copy), UseMappedSignalFunction (copy), CommonFtuxTooltipModule (copy), InExperienceShopTooltipPriority (copy), InExperienceShopTooltipStorageKey (copy), InExperienceShopTooltipShowDelay (copy), InExperienceShopTooltipDismissDelay (copy)
	local IntegrationsResultEntry = ServiceModule:integrations()[ConstantsModule.IN_EXPERIENCE_SHOP_ID]
	
	return UseMappedSignalFunction(if IntegrationsResultEntry then IntegrationsResultEntry.availability else nil) == ServiceModule.AvailabilitySignal.Available and CommonFtuxTooltipModule({
		id = "IN_EXPERIENCE_SHOP_TOOLTIP",
		headerKey = "CoreScripts.FTUX.Heading.InExperienceShop",
		bodyKey = "CoreScripts.FTUX.Label.InExperienceShopDescription",
		priority = InExperienceShopTooltipPriority,
		isIconVisible = p1.visible,
		localStorageKey = InExperienceShopTooltipStorageKey,
		showDelay = InExperienceShopTooltipShowDelay,
		dismissDelay = InExperienceShopTooltipDismissDelay
	})
end