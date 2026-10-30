local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local ReactModule = require(CorePackages.Packages.React)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local FoundationModule = require(CorePackages.Packages.Foundation)
local LinkingProtocol = require(CorePackages.Workspace.Packages.LinkingProtocol).LinkingProtocol
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local BuildModeLaunchModule = require(CorePackages.Workspace.Packages.BuildExperiencePlaytestLaunch.BuildModeLaunch)
local SettingsShowSignal = require(CorePackages.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local GetPlaytestModeStoreModule = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon.GetPlaytestModeStore)
local ObservableValue = require(RobloxGui.Modules.Chrome.ChromeShared.Service.ChromeUtils).ObservableValue
local UseIsPlaytestModeModule = require(RobloxGui.Modules.Chrome.ChromeShared.Hooks.useIsPlaytestMode)
local UseObservableValueModule = require(RobloxGui.Modules.Chrome.ChromeShared.Hooks.useObservableValue)
local EducationalTooltip = FoundationModule.EducationalTooltip
local OverlayProvider = FoundationModule.OverlayProvider
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local PlaytestModeDismissTooltip = game:DefineFastFlag("PlaytestModeDismissTooltip", false)
local FFlagEnableConsoleExpControls = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local EnabledResult = if PlaytestModeDismissTooltip then require(CorePackages.Workspace.Packages.Chrome).Enabled() else nil
local GamepadConnectorModule = if PlaytestModeDismissTooltip and FFlagEnableConsoleExpControls and EnabledResult then require(script.Parent.Parent.GamepadConnector) else nil
local PlaytestModeTooltipExcludeBuildMode = game:DefineFastFlag("PlaytestModeTooltipExcludeBuildMode", false)
local FFlagPlaytestModeTooltipOncePerWeek = require(CorePackages.Workspace.Packages.SharedFlags).FFlagPlaytestModeTooltipOncePerWeek
local FFlagPlaytestModeTooltipOnlyPrivateTesters = require(CorePackages.Workspace.Packages.SharedFlags).FFlagPlaytestModeTooltipOnlyPrivateTesters
local PlaytestModeTooltipLearnMoreUrl = game:DefineFastString("PlaytestModeTooltipLearnMoreUrl", "https://about.roblox.com/community-standards")
local PlaytestModeTooltipDisplayOrder = game:DefineFastInt("PlaytestModeTooltipDisplayOrder", -1)
local Flag = false
local Flag1 = false
local NewObservableValue = if PlaytestModeDismissTooltip then ObservableValue.new(false) else nil

local function getCanShow(AnchorRef, Enabled1, p1, Enabled): boolean
	-- upvalues: FFlagPlaytestModeTooltipOncePerWeek (copy), FFlagPlaytestModeTooltipOnlyPrivateTesters (copy), PlaytestModeTooltipExcludeBuildMode (copy), BuildModeLaunchModule (copy), Flag1 (ref), GetPlaytestModeStoreModule (copy), Flag (ref), PlaytestModeDismissTooltip (copy)
	if FFlagPlaytestModeTooltipOncePerWeek and not p1 then
		return false
	elseif FFlagPlaytestModeTooltipOnlyPrivateTesters and Enabled ~= true then
		return false
	elseif PlaytestModeTooltipExcludeBuildMode and BuildModeLaunchModule:hasBuildMode() then
		return false
	elseif FFlagPlaytestModeTooltipOncePerWeek then
		if not Flag1 and not GetPlaytestModeStoreModule(false).getHasTooltipCooldownExpired() then
			return false
		end
	elseif Flag then
		return false
	end
	return AnchorRef ~= nil and (AnchorRef.current ~= nil and (not PlaytestModeDismissTooltip or Enabled1 ~= false))
end

return ReactModule.memo(function(p1)
	-- upvalues: UseLocalizationFunction (copy), FFlagPlaytestModeTooltipOnlyPrivateTesters (copy), UseIsPlaytestModeModule (copy), SignalsReactModule (copy), GetPlaytestModeStoreModule (copy), PlaytestModeDismissTooltip (copy), UseObservableValueModule (copy), GamepadConnectorModule (copy), NewObservableValue (copy), ReactModule (copy), getCanShow (copy), FFlagPlaytestModeTooltipOncePerWeek (copy), Flag1 (ref), Flag (ref), LinkingProtocol (copy), PlaytestModeTooltipLearnMoreUrl (copy), SettingsShowSignal (copy), OverlayProvider (copy), PlaytestModeTooltipDisplayOrder (copy), EducationalTooltip (copy), PopoverSide (copy), PopoverAlign (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction(if FFlagPlaytestModeTooltipOnlyPrivateTesters then {
		title = "CoreScripts.FTUX.Heading.YouAreAnEarlyTester",
		text = "CoreScripts.FTUX.Description.WhiteMenuPreviewing",
		continueText = "CommonUI.Features.Action.OK",
		learnMoreText = "CommonUI.Features.Action.ViewDetails"
	} else {
		title = "CoreScripts.FTUX.Heading.ReadyToPlaytest",
		text = "CoreScripts.FTUX.Description.WhiteMenuPlaytestMode",
		continueText = "CommonUI.Features.Action.Continue",
		learnMoreText = "CommonUI.Features.Action.LearnMore"
	})
	local UseIsPlaytestModeModuleResult = UseIsPlaytestModeModule()
	local UseSignalStateResult = if FFlagPlaytestModeTooltipOnlyPrivateTesters then SignalsReactModule.useSignalState(GetPlaytestModeStoreModule(false).getIsPrivatePlaytester) else nil
	local UseObservableValueModuleResult = if PlaytestModeDismissTooltip then UseObservableValueModule(if GamepadConnectorModule == nil then NewObservableValue else GamepadConnectorModule:getShowTopBar()) else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState((getCanShow(p1.anchorRef, if PlaytestModeDismissTooltip then UseObservableValueModuleResult else nil, UseIsPlaytestModeModuleResult, UseSignalStateResult)))
	
	if FFlagPlaytestModeTooltipOncePerWeek then
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult (copy), Flag1 (upval), GetPlaytestModeStoreModule (upval)
			if UseStateResult and not Flag1 then
				Flag1 = true
				GetPlaytestModeStoreModule(false).markTooltipSeen()
			end
		end, { UseStateResult })
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagPlaytestModeTooltipOncePerWeek (upval), Flag1 (upval), Flag (upval), UseStateResult2 (copy)
		if FFlagPlaytestModeTooltipOncePerWeek then
			Flag1 = false
		else
			Flag = true
		end
		UseStateResult2(false)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: LinkingProtocol (upval), PlaytestModeTooltipLearnMoreUrl (upval), PlaytestModeDismissTooltip (upval), UseResult (copy), Flag (upval), UseStateResult2 (copy)
		LinkingProtocol.default:openURL(PlaytestModeTooltipLearnMoreUrl)
		
		if PlaytestModeDismissTooltip then
			UseResult()
			
			return
		else
			Flag = true
			UseStateResult2(false)
		end
	end, { if PlaytestModeDismissTooltip then UseResult else nil })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), getCanShow (upval), p1 (copy), PlaytestModeDismissTooltip (upval), UseObservableValueModuleResult (ref), UseIsPlaytestModeModuleResult (copy), UseSignalStateResult (ref)
		UseStateResult2((getCanShow(p1.anchorRef, if PlaytestModeDismissTooltip then UseObservableValueModuleResult else nil, UseIsPlaytestModeModuleResult, UseSignalStateResult)))
	end, {
		p1.anchorRef,
		if PlaytestModeDismissTooltip then UseObservableValueModuleResult else nil,
		if FFlagPlaytestModeTooltipOncePerWeek then UseIsPlaytestModeModuleResult else nil,
		if FFlagPlaytestModeTooltipOnlyPrivateTesters then UseSignalStateResult else nil
	})
	
	if PlaytestModeDismissTooltip then
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult (copy), UseObservableValueModuleResult (ref), UseResult (copy)
			if UseStateResult and not UseObservableValueModuleResult then
				UseResult()
			end
		end, { UseStateResult, UseObservableValueModuleResult })
		ReactModule.useEffect(function()
			-- upvalues: SettingsShowSignal (upval), UseResult (copy)
			local Connection = SettingsShowSignal:connect(function(p2)
				-- upvalues: UseResult (upval)
				if p2 then
					UseResult()
				end
			end)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		end, { UseResult })
	end
	if (FFlagPlaytestModeTooltipOncePerWeek or not Flag and UseIsPlaytestModeModuleResult) and UseStateResult then
		return ReactModule.createElement(OverlayProvider, { DisplayOrder = PlaytestModeTooltipDisplayOrder }, {
			Tooltip = ReactModule.createElement(EducationalTooltip, {
				isOpen = true,
				anchorRef = p1.anchorRef,
				title = UseLocalizationResult.title,
				text = UseLocalizationResult.text,
				side = PopoverSide.Bottom,
				align = PopoverAlign.Start,
				onClose = UseResult,
				actions = {
					{
						text = UseLocalizationResult.continueText,
						variant = ButtonVariant.Emphasis,
						onActivated = UseResult
					},
					{
						text = UseLocalizationResult.learnMoreText,
						variant = ButtonVariant.Standard,
						onActivated = UseResult1
					}
				}
			})
		})
	else
		return nil
	end
end)