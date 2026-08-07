local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local reactModule = require(corePackagesService.Packages.React)
local foundationModule = require(corePackagesService.Packages.Foundation)
local linkingProtocol = require(corePackagesService.Workspace.Packages.LinkingProtocol).LinkingProtocol
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local useIsPlaytestModeModule = require(robloxGui.Modules.Chrome.ChromeShared.Hooks.useIsPlaytestMode)
local educationalTooltip = foundationModule.EducationalTooltip
local overlayProvider = foundationModule.OverlayProvider
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign
local buttonVariant = foundationModule.Enums.ButtonVariant
local playtestModeTooltipLearnMoreUrl = game:DefineFastString("PlaytestModeTooltipLearnMoreUrl", "https://about.roblox.com/community-standards")
local playtestModeTooltipDisplayOrder = game:DefineFastInt("PlaytestModeTooltipDisplayOrder", -1)
local var7 = false

local function _(p0) --[[ line: 30 | named "getCanShow" ]]
	-- upvalues: var7 (write)
	return not var7 and (p0 ~= nil and p0.current ~= nil)
end

return reactModule.memo(function(p1) --[[ line: 34 | named "PlaytestModeTooltip" ]]
	-- upvalues: useLocalization (ref), useIsPlaytestModeModule (ref), reactModule (ref), var7 (write), linkingProtocol (ref), playtestModeTooltipLearnMoreUrl (ref), overlayProvider (ref), playtestModeTooltipDisplayOrder (ref), educationalTooltip (ref), popoverSide (ref), popoverAlign (ref), buttonVariant (ref)
	local var8 = useLocalization({
		title = "CoreScripts.FTUX.Heading.ReadyToPlaytest",
		text = "CoreScripts.FTUX.Description.WhiteMenuPlaytestMode",
		continueText = "CommonUI.Features.Action.Continue",
		learnMoreText = "CommonUI.Features.Action.LearnMore"
	})
	local var9 = useIsPlaytestModeModule()
	local useState = reactModule.useState
	local anchorRef = p1.anchorRef
	local var10 = not var7 and (anchorRef ~= nil and anchorRef.current ~= nil)
	useState, var10 = useState(var10)
	reactModule.useEffect(function() --[[ line: 46 ]]
		-- upvalues: var10 (ref), p1 (ref), var7 (copy)
		local anchorRef = p1.anchorRef
		var10(not var7 and (anchorRef ~= nil and anchorRef.current ~= nil))
	end, { p1.anchorRef })
	local var11 = reactModule.useCallback(function() --[[ line: 50 ]]
		-- upvalues: var7 (copy), var10 (ref)
		var7 = true
		var10(false)
	end, {})
	
	return if var7 or not var9 or not useState then nil else reactModule.createElement(overlayProvider, { DisplayOrder = playtestModeTooltipDisplayOrder }, {
		Tooltip = reactModule.createElement(educationalTooltip, {
			isOpen = true,
			anchorRef = p1.anchorRef,
			title = var8.title,
			text = var8.text,
			side = popoverSide.Bottom,
			align = popoverAlign.Start,
			onClose = var11,
			actions = {
				{
					text = var8.continueText,
					variant = buttonVariant.Emphasis,
					onActivated = var11
				},
				{
					text = var8.learnMoreText,
					variant = buttonVariant.Standard,
					onActivated = reactModule.useCallback(function() --[[ line: 55 ]]
						-- upvalues: linkingProtocol (copy), playtestModeTooltipLearnMoreUrl (copy), var7 (copy), var10 (ref)
						linkingProtocol.default:openURL(playtestModeTooltipLearnMoreUrl)
						var7 = true
						var10(false)
					end, {})
				}
			}
		})
	})
end)