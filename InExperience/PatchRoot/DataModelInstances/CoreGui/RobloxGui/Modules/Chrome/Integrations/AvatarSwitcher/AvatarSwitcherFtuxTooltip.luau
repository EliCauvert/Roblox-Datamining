local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local serviceModule = require(chrome.Service)
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)
local useMappedSignal = require(corePackagesService.Workspace.Packages.Chrome).Hooks.useMappedSignal
local commonFtuxTooltipModule = require(chrome.Integrations.CommonFtuxTooltip)
local avatarSwitcherTooltipPriority = game:DefineFastInt("AvatarSwitcherTooltipPriority", 3000)
local avatarSwitcherTooltipStorageKey = game:DefineFastString("AvatarSwitcherTooltipStorageKey", "AvatarSwitcherTooltipStorageKey")
local avatarSwitcherTooltipShowDelay = game:DefineFastInt("AvatarSwitcherTooltipShowDelay", 1000)
local avatarSwitcherTooltipDismissDelay = game:DefineFastInt("AvatarSwitcherTooltipDismissDelay", 8500)

return function(p1)
	-- upvalues: serviceModule (ref), constantsModule (ref), useMappedSignal (ref), commonFtuxTooltipModule (ref), avatarSwitcherTooltipPriority (ref), avatarSwitcherTooltipStorageKey (ref), avatarSwitcherTooltipShowDelay (ref), avatarSwitcherTooltipDismissDelay (ref)
	local AVATAR_SWITCHER_ID = serviceModule:integrations()[constantsModule.AVATAR_SWITCHER_ID]
	
	return useMappedSignal(if AVATAR_SWITCHER_ID then AVATAR_SWITCHER_ID.availability else nil) == serviceModule.AvailabilitySignal.Available and commonFtuxTooltipModule({
		id = "AVATAR_SWITCHER_TOOLTIP",
		headerKey = "CoreScripts.FTUX.Heading.NewAvatarSwitcher",
		bodyKey = "CoreScripts.FTUX.Label.AvatarSwitcherDescription",
		priority = avatarSwitcherTooltipPriority,
		isIconVisible = p1.visible,
		localStorageKey = avatarSwitcherTooltipStorageKey,
		showDelay = avatarSwitcherTooltipShowDelay,
		dismissDelay = avatarSwitcherTooltipDismissDelay
	})
end