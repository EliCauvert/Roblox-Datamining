local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local LinkingProtocol = require(CorePackages.Workspace.Packages.LinkingProtocol).LinkingProtocol
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local BuildModeLaunchModule = require(CorePackages.Workspace.Packages.BuildExperiencePlaytestLaunch.BuildModeLaunch)
local SettingsShowSignal = require(CorePackages.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
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
local PlaytestModeTooltipLearnMoreUrl = game:DefineFastString("PlaytestModeTooltipLearnMoreUrl", "https://about.roblox.com/community-standards")
local PlaytestModeTooltipDisplayOrder = game:DefineFastInt("PlaytestModeTooltipDisplayOrder", -1)
local Flag = false
local NewObservableValue = if PlaytestModeDismissTooltip then ObservableValue.new(false) else nil

local function _(p1, Enabled): boolean
	-- upvalues: PlaytestModeTooltipExcludeBuildMode (copy), BuildModeLaunchModule (copy), Flag (ref), PlaytestModeDismissTooltip (copy)
	return (not PlaytestModeTooltipExcludeBuildMode or not BuildModeLaunchModule:hasBuildMode()) and (not Flag and (p1 ~= nil and (p1.current ~= nil and (not PlaytestModeDismissTooltip or Enabled ~= false))))
end

return ReactModule.memo(function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseIsPlaytestModeModule (copy), PlaytestModeDismissTooltip (copy), UseObservableValueModule (copy), GamepadConnectorModule (copy), NewObservableValue (copy), ReactModule (copy), PlaytestModeTooltipExcludeBuildMode (copy), BuildModeLaunchModule (copy), Flag (ref), LinkingProtocol (copy), PlaytestModeTooltipLearnMoreUrl (copy), SettingsShowSignal (copy), OverlayProvider (copy), PlaytestModeTooltipDisplayOrder (copy), EducationalTooltip (copy), PopoverSide (copy), PopoverAlign (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		title = "CoreScripts.FTUX.Heading.ReadyToPlaytest",
		text = "CoreScripts.FTUX.Description.WhiteMenuPlaytestMode",
		continueText = "CommonUI.Features.Action.Continue",
		learnMoreText = "CommonUI.Features.Action.LearnMore"
	})
	local UseIsPlaytestModeModuleResult = UseIsPlaytestModeModule()
	local UseObservableValueModuleResult = if PlaytestModeDismissTooltip then UseObservableValueModule(if GamepadConnectorModule == nil then NewObservableValue else GamepadConnectorModule:getShowTopBar()) else nil
	local AnchorRef = p1.anchorRef
	local UseStateResult, UseStateResult2 = ReactModule.useState((not PlaytestModeTooltipExcludeBuildMode or not BuildModeLaunchModule:hasBuildMode()) and (not Flag and (AnchorRef ~= nil and (AnchorRef.current ~= nil and (not PlaytestModeDismissTooltip or (if PlaytestModeDismissTooltip then UseObservableValueModuleResult else nil) ~= false)))))
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Flag (upval), UseStateResult2 (copy)
		Flag = true
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
		-- upvalues: UseStateResult2 (copy), p1 (copy), PlaytestModeDismissTooltip (upval), UseObservableValueModuleResult (ref), PlaytestModeTooltipExcludeBuildMode (upval), BuildModeLaunchModule (upval), Flag (upval)
		local AnchorRef = p1.anchorRef
		UseStateResult2((not PlaytestModeTooltipExcludeBuildMode or not BuildModeLaunchModule:hasBuildMode()) and (not Flag and (AnchorRef ~= nil and (AnchorRef.current ~= nil and (not PlaytestModeDismissTooltip or (if PlaytestModeDismissTooltip then UseObservableValueModuleResult else nil) ~= false)))))
	end, {
		p1.anchorRef,
		if PlaytestModeDismissTooltip then UseObservableValueModuleResult else nil
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
	return if Flag or not UseIsPlaytestModeModuleResult or not UseStateResult then nil else ReactModule.createElement(OverlayProvider, { DisplayOrder = PlaytestModeTooltipDisplayOrder }, {
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
end)