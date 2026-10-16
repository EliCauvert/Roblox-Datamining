local Chrome = script:FindFirstAncestor("Chrome")
local ServiceModule = require(Chrome.Service)
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local UseMappedSignalFunction = require(game:GetService("CorePackages").Workspace.Packages.Chrome).Hooks.useMappedSignal
local CommonFtuxTooltipModule = require(Chrome.Integrations.CommonFtuxTooltip)
local AvatarSwitcherTooltipPriority = game:DefineFastInt("AvatarSwitcherTooltipPriority", 3000)
local AvatarSwitcherTooltipStorageKey = game:DefineFastString("AvatarSwitcherTooltipStorageKey", "AvatarSwitcherTooltipStorageKey")
local AvatarSwitcherTooltipShowDelay = game:DefineFastInt("AvatarSwitcherTooltipShowDelay", 1000)
local AvatarSwitcherTooltipDismissDelay = game:DefineFastInt("AvatarSwitcherTooltipDismissDelay", 8500)

return function(p1) --[[ Line: 19 | Named "AvatarSwitcherFtuxTooltip" ]]
	-- upvalues: ServiceModule (copy), ConstantsModule (copy), UseMappedSignalFunction (copy), CommonFtuxTooltipModule (copy), AvatarSwitcherTooltipPriority (copy), AvatarSwitcherTooltipStorageKey (copy), AvatarSwitcherTooltipShowDelay (copy), AvatarSwitcherTooltipDismissDelay (copy)
	local IntegrationsResultEntry = ServiceModule:integrations()[ConstantsModule.AVATAR_SWITCHER_ID]
	
	return UseMappedSignalFunction(if IntegrationsResultEntry then IntegrationsResultEntry.availability else nil) == ServiceModule.AvailabilitySignal.Available and CommonFtuxTooltipModule({
		id = "AVATAR_SWITCHER_TOOLTIP",
		headerKey = "CoreScripts.FTUX.Heading.NewAvatarSwitcher",
		bodyKey = "CoreScripts.FTUX.Label.AvatarSwitcherDescription",
		priority = AvatarSwitcherTooltipPriority,
		isIconVisible = p1.visible,
		localStorageKey = AvatarSwitcherTooltipStorageKey,
		showDelay = AvatarSwitcherTooltipShowDelay,
		dismissDelay = AvatarSwitcherTooltipDismissDelay
	})
end