local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local reactModule = require(corePackagesService.Packages.React)
local foundationModule = require(corePackagesService.Packages.Foundation)
local linkingProtocol = require(corePackagesService.Workspace.Packages.LinkingProtocol).LinkingProtocol
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
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
local var7 = if playtestModeDismissTooltip and require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls and (if playtestModeDismissTooltip then require(corePackagesService.Workspace.Packages.Chrome).Enabled() else nil) then require(script.Parent.Parent.GamepadConnector) else nil
local playtestModeTooltipLearnMoreUrl = game:DefineFastString("PlaytestModeTooltipLearnMoreUrl", "https://about.roblox.com/community-standards")
local playtestModeTooltipDisplayOrder = game:DefineFastInt("PlaytestModeTooltipDisplayOrder", -1)
local var10 = false
local var11 = if playtestModeDismissTooltip then observableValue.new(false) else nil

local function _(p0, p1) --[[ line: 45 | named "getCanShow" ]]
	-- upvalues: var10 (write), playtestModeDismissTooltip (ref)
	return not var10 and (p0 ~= nil and (p0.current ~= nil and (not playtestModeDismissTooltip or p1 ~= false)))
end

return reactModule.memo(function(p2) --[[ line: 49 | named "PlaytestModeTooltip" ]]
	-- upvalues: useLocalization (ref), useIsPlaytestModeModule (ref), playtestModeDismissTooltip (ref), useObservableValueModule (ref), var7 (ref), var11 (ref), reactModule (ref), var10 (write), linkingProtocol (ref), playtestModeTooltipLearnMoreUrl (ref), settingsShowSignal (ref), overlayProvider (ref), playtestModeTooltipDisplayOrder (ref), educationalTooltip (ref), popoverSide (ref), popoverAlign (ref), buttonVariant (ref)
	local var12 = useLocalization({
		title = "CoreScripts.FTUX.Heading.ReadyToPlaytest",
		text = "CoreScripts.FTUX.Description.WhiteMenuPlaytestMode",
		continueText = "CommonUI.Features.Action.Continue",
		learnMoreText = "CommonUI.Features.Action.LearnMore"
	})
	local var13 = useIsPlaytestModeModule()
	local var14 = if playtestModeDismissTooltip then useObservableValueModule(if var7 == nil then var11 else var7:getShowTopBar()) else nil
	local useState = reactModule.useState
	local anchorRef = p2.anchorRef
	local var15 = not var10 and (anchorRef ~= nil and (anchorRef.current ~= nil and (not playtestModeDismissTooltip or (if playtestModeDismissTooltip then var14 else nil) ~= false)))
	useState, var15 = useState(var15)
	local var16 = reactModule.useCallback(function() --[[ line: 70 ]]
		-- upvalues: var10 (copy), var15 (ref)
		var10 = true
		var15(false)
	end, {})
	local var17 = reactModule.useCallback(function() --[[ line: 75 ]]
		-- upvalues: linkingProtocol (copy), playtestModeTooltipLearnMoreUrl (copy), playtestModeDismissTooltip (copy), var16 (ref), var10 (copy), var15 (ref)
		linkingProtocol.default:openURL(playtestModeTooltipLearnMoreUrl)
		
		if playtestModeDismissTooltip then
			var16()
			
			return
		end
		var10 = true
		var15(false)
	end, { if playtestModeDismissTooltip then var16 else nil })
	reactModule.useEffect(function() --[[ line: 85 ]]
		-- upvalues: var15 (ref), p2 (ref), playtestModeDismissTooltip (copy), var14 (write), var10 (copy)
		local anchorRef = p2.anchorRef
		var15(not var10 and (anchorRef ~= nil and (anchorRef.current ~= nil and (not playtestModeDismissTooltip or (if playtestModeDismissTooltip then var14 else nil) ~= false))))
	end, {
		p2.anchorRef,
		if playtestModeDismissTooltip then var14 else nil
	})
	
	if playtestModeDismissTooltip then
		reactModule.useEffect(function() --[[ line: 90 ]]
			-- upvalues: useState (ref), var14 (write), var16 (ref)
			if useState and not var14 then
				var16()
			end
		end, { useState, var14 })
		reactModule.useEffect(function() --[[ line: 96 ]]
			-- upvalues: settingsShowSignal (copy), var16 (ref)
			local var18 = settingsShowSignal:connect(function(p3) --[[ line: 97 ]]
				-- upvalues: var16 (copy)
				if p3 then
					var16()
				end
			end)
			
			return function() --[[ line: 103 ]]
				-- upvalues: var18 (ref)
				var18:Disconnect()
			end
		end, { var16 })
	end
	return if var10 or not var13 or not useState then nil else reactModule.createElement(overlayProvider, { DisplayOrder = playtestModeTooltipDisplayOrder }, {
		Tooltip = reactModule.createElement(educationalTooltip, {
			isOpen = true,
			anchorRef = p2.anchorRef,
			title = var12.title,
			text = var12.text,
			side = popoverSide.Bottom,
			align = popoverAlign.Start,
			onClose = var16,
			actions = {
				{
					text = var12.continueText,
					variant = buttonVariant.Emphasis,
					onActivated = var16
				},
				{
					text = var12.learnMoreText,
					variant = buttonVariant.Standard,
					onActivated = var17
				}
			}
		})
	})
end)