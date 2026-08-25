local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local reactModule = require(corePackagesService.Packages.React)
local foundationModule = require(corePackagesService.Packages.Foundation)
local linkingProtocol = require(corePackagesService.Workspace.Packages.LinkingProtocol).LinkingProtocol
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local buildModeLaunchModule = require(corePackagesService.Workspace.Packages.BuildExperience.BuildModeLaunch)
local settingsShowSignal = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local observableValue = require(robloxGui.Modules.Chrome.ChromeShared.Service.ChromeUtils).ObservableValue
local useIsPlaytestModeModule = require(robloxGui.Modules.Chrome.ChromeShared.Hooks.useIsPlaytestMode)
local useObservableValueModule = require(robloxGui.Modules.Chrome.ChromeShared.Hooks.useObservableValue)
local educationalTooltip = foundationModule.EducationalTooltip
local overlayProvider = foundationModule.OverlayProvider
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign
local buttonVariant = foundationModule.Enums.ButtonVariant
local playtestModeDismissTooltip = game:DefineFastFlag("PlaytestModeDismissTooltip", false)
local var8 = if playtestModeDismissTooltip and require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls and (if playtestModeDismissTooltip then require(corePackagesService.Workspace.Packages.Chrome).Enabled() else nil) then require(script.Parent.Parent.GamepadConnector) else nil
local playtestModeTooltipExcludeBuildMode = game:DefineFastFlag("PlaytestModeTooltipExcludeBuildMode", false)
local playtestModeTooltipLearnMoreUrl = game:DefineFastString("PlaytestModeTooltipLearnMoreUrl", "https://about.roblox.com/community-standards")
local playtestModeTooltipDisplayOrder = game:DefineFastInt("PlaytestModeTooltipDisplayOrder", -1)
local var12 = false
local var13 = if playtestModeDismissTooltip then observableValue.new(false) else nil

local function _(p0, p1)
	-- upvalues: playtestModeTooltipExcludeBuildMode (ref), buildModeLaunchModule (ref), var12 (write), playtestModeDismissTooltip (ref)
	return if playtestModeTooltipExcludeBuildMode and buildModeLaunchModule:hasBuildMode() then false else not var12 and (p0 ~= nil and (p0.current ~= nil and (not playtestModeDismissTooltip or p1 ~= false)))
end

return reactModule.memo(function(p2)
	-- upvalues: useLocalization (ref), useIsPlaytestModeModule (ref), playtestModeDismissTooltip (ref), useObservableValueModule (ref), var8 (ref), var13 (ref), reactModule (ref), playtestModeTooltipExcludeBuildMode (ref), buildModeLaunchModule (ref), var12 (write), linkingProtocol (ref), playtestModeTooltipLearnMoreUrl (ref), settingsShowSignal (ref), overlayProvider (ref), playtestModeTooltipDisplayOrder (ref), educationalTooltip (ref), popoverSide (ref), popoverAlign (ref), buttonVariant (ref)
	local var14 = useLocalization({
		title = "CoreScripts.FTUX.Heading.ReadyToPlaytest",
		text = "CoreScripts.FTUX.Description.WhiteMenuPlaytestMode",
		continueText = "CommonUI.Features.Action.Continue",
		learnMoreText = "CommonUI.Features.Action.LearnMore"
	})
	local var15 = useIsPlaytestModeModule()
	local var16 = if playtestModeDismissTooltip then useObservableValueModule(if var8 == nil then var13 else var8:getShowTopBar()) else nil
	local useState = reactModule.useState
	local anchorRef = p2.anchorRef
	local var17 = if playtestModeTooltipExcludeBuildMode and buildModeLaunchModule:hasBuildMode() then false else not var12 and (anchorRef ~= nil and (anchorRef.current ~= nil and (not playtestModeDismissTooltip or (if playtestModeDismissTooltip then var16 else nil) ~= false)))
	useState, var17 = useState(var17)
	local var18 = reactModule.useCallback(function()
		-- upvalues: var12 (copy), var17 (ref)
		var12 = true
		var17(false)
	end, {})
	local var19 = reactModule.useCallback(function()
		-- upvalues: linkingProtocol (copy), playtestModeTooltipLearnMoreUrl (copy), playtestModeDismissTooltip (copy), var18 (ref), var12 (copy), var17 (ref)
		linkingProtocol.default:openURL(playtestModeTooltipLearnMoreUrl)
		
		if playtestModeDismissTooltip then
			var18()
			
			return
		end
		var12 = true
		var17(false)
	end, { if playtestModeDismissTooltip then var18 else nil })
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), p2 (ref), playtestModeDismissTooltip (copy), var16 (write), playtestModeTooltipExcludeBuildMode (copy), buildModeLaunchModule (copy), var12 (copy)
		local anchorRef = p2.anchorRef
		var17(if playtestModeTooltipExcludeBuildMode and buildModeLaunchModule:hasBuildMode() then false else not var12 and (anchorRef ~= nil and (anchorRef.current ~= nil and (not playtestModeDismissTooltip or (if playtestModeDismissTooltip then var16 else nil) ~= false))))
	end, {
		p2.anchorRef,
		if playtestModeDismissTooltip then var16 else nil
	})
	
	if playtestModeDismissTooltip then
		reactModule.useEffect(function()
			-- upvalues: useState (ref), var16 (write), var18 (ref)
			if useState and not var16 then
				var18()
			end
		end, { useState, var16 })
		reactModule.useEffect(function()
			-- upvalues: settingsShowSignal (copy), var18 (ref)
			local var20 = settingsShowSignal:connect(function(p3)
				-- upvalues: var18 (copy)
				if p3 then
					var18()
				end
			end)
			
			return function()
				-- upvalues: var20 (ref)
				var20:Disconnect()
			end
		end, { var18 })
	end
	return if var12 or not var15 or not useState then nil else reactModule.createElement(overlayProvider, { DisplayOrder = playtestModeTooltipDisplayOrder }, {
		Tooltip = reactModule.createElement(educationalTooltip, {
			isOpen = true,
			anchorRef = p2.anchorRef,
			title = var14.title,
			text = var14.text,
			side = popoverSide.Bottom,
			align = popoverAlign.Start,
			onClose = var18,
			actions = {
				{
					text = var14.continueText,
					variant = buttonVariant.Emphasis,
					onActivated = var18
				},
				{
					text = var14.learnMoreText,
					variant = buttonVariant.Standard,
					onActivated = var19
				}
			}
		})
	})
end)