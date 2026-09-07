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
local var1 = if playtestModeDismissTooltip and require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls and (if playtestModeDismissTooltip then require(corePackagesService.Workspace.Packages.Chrome).Enabled() else nil) then require(script.Parent.Parent.GamepadConnector) else nil
local playtestModeTooltipExcludeBuildMode = game:DefineFastFlag("PlaytestModeTooltipExcludeBuildMode", false)
local playtestModeTooltipLearnMoreUrl = game:DefineFastString("PlaytestModeTooltipLearnMoreUrl", "https://about.roblox.com/community-standards")
local playtestModeTooltipDisplayOrder = game:DefineFastInt("PlaytestModeTooltipDisplayOrder", -1)
local var2 = false
local var3 = if playtestModeDismissTooltip then observableValue.new(false) else nil

local function _(p1, p2)
	-- upvalues: playtestModeTooltipExcludeBuildMode (ref), buildModeLaunchModule (ref), var2 (write), playtestModeDismissTooltip (ref)
	return if playtestModeTooltipExcludeBuildMode and buildModeLaunchModule:hasBuildMode() then false else not var2 and (p1 ~= nil and (p1.current ~= nil and (not playtestModeDismissTooltip or p2 ~= false)))
end

return reactModule.memo(function(p1)
	-- upvalues: useLocalization (ref), useIsPlaytestModeModule (ref), playtestModeDismissTooltip (ref), useObservableValueModule (ref), var1 (ref), var3 (ref), reactModule (ref), playtestModeTooltipExcludeBuildMode (ref), buildModeLaunchModule (ref), var2 (write), linkingProtocol (ref), playtestModeTooltipLearnMoreUrl (ref), settingsShowSignal (ref), overlayProvider (ref), playtestModeTooltipDisplayOrder (ref), educationalTooltip (ref), popoverSide (ref), popoverAlign (ref), buttonVariant (ref)
	local var4 = useLocalization({
		title = "CoreScripts.FTUX.Heading.ReadyToPlaytest",
		text = "CoreScripts.FTUX.Description.WhiteMenuPlaytestMode",
		continueText = "CommonUI.Features.Action.Continue",
		learnMoreText = "CommonUI.Features.Action.LearnMore"
	})
	local var5 = useIsPlaytestModeModule()
	local var6 = if playtestModeDismissTooltip then useObservableValueModule(if var1 == nil then var3 else var1:getShowTopBar()) else nil
	local useState = reactModule.useState
	local anchorRef = p1.anchorRef
	local var7 = if playtestModeTooltipExcludeBuildMode and buildModeLaunchModule:hasBuildMode() then false else not var2 and (anchorRef ~= nil and (anchorRef.current ~= nil and (not playtestModeDismissTooltip or (if playtestModeDismissTooltip then var6 else nil) ~= false)))
	useState, var17 = useState(var7)
	local var8 = reactModule.useCallback(function()
		-- upvalues: var2 (copy), var7 (ref)
		var2 = true
		var7(false)
	end, {})
	local var9 = reactModule.useCallback(function()
		-- upvalues: linkingProtocol (copy), playtestModeTooltipLearnMoreUrl (copy), playtestModeDismissTooltip (copy), var8 (ref), var2 (copy), var7 (ref)
		linkingProtocol.default:openURL(playtestModeTooltipLearnMoreUrl)
		
		if playtestModeDismissTooltip then
			var8()
			
			return
		end
		var2 = true
		var7(false)
	end, { if playtestModeDismissTooltip then var8 else nil })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), p1 (ref), playtestModeDismissTooltip (copy), var6 (write), playtestModeTooltipExcludeBuildMode (copy), buildModeLaunchModule (copy), var2 (copy)
		local anchorRef = p1.anchorRef
		var7(if playtestModeTooltipExcludeBuildMode and buildModeLaunchModule:hasBuildMode() then false else not var2 and (anchorRef ~= nil and (anchorRef.current ~= nil and (not playtestModeDismissTooltip or (if playtestModeDismissTooltip then var6 else nil) ~= false))))
	end, {
		p1.anchorRef,
		if playtestModeDismissTooltip then var6 else nil
	})
	
	if playtestModeDismissTooltip then
		reactModule.useEffect(function()
			-- upvalues: useState (ref), var6 (write), var8 (ref)
			if useState and not var6 then
				var8()
			end
		end, { useState, var6 })
		reactModule.useEffect(function()
			-- upvalues: settingsShowSignal (copy), var8 (ref)
			local var10 = settingsShowSignal:connect(function(p2)
				-- upvalues: var8 (copy)
				if p2 then
					var8()
				end
			end)
			
			return function()
				-- upvalues: var10 (ref)
				var10:Disconnect()
			end
		end, { var8 })
	end
	return if var2 or not var5 or not useState then nil else reactModule.createElement(overlayProvider, { DisplayOrder = playtestModeTooltipDisplayOrder }, {
		Tooltip = reactModule.createElement(educationalTooltip, {
			isOpen = true,
			anchorRef = p1.anchorRef,
			title = var4.title,
			text = var4.text,
			side = popoverSide.Bottom,
			align = popoverAlign.Start,
			onClose = var8,
			actions = {
				{
					text = var4.continueText,
					variant = buttonVariant.Emphasis,
					onActivated = var8
				},
				{
					text = var4.learnMoreText,
					variant = buttonVariant.Standard,
					onActivated = var9
				}
			}
		})
	})
end)