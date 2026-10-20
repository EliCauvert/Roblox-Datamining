local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local UtilityModule = require(RobloxGui.Modules.Settings.Utility)
local LeaveGameModule = require(RobloxGui.Modules.Settings.leaveGame)
local ReactModule = require(CorePackages.Packages.React)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local ConstantsModule = require(RobloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local IsEnabled = require(RobloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")):IsEnabled()
local FoundationModule = require(CorePackages.Packages.Foundation)
local TelemetryModule = require(script.Parent.Telemetry)
local NextUpStateModule = require(script.Parent.NextUpState)
local UseFocusGuiObjectFunction = require(CorePackages.Packages.ReactFocusNavigation).useFocusGuiObject
local UseLastInputModeFunction = require(CorePackages.Workspace.Packages.FocusNavigationUtils).useLastInputMode
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagEnableNextUpImageLatencyTelemetryModule = require(script.Parent.Flags.FFlagEnableNextUpImageLatencyTelemetry)
local EnabledResult = require(CorePackages.Workspace.Packages.Chrome).Enabled()
local ServiceModule = if EnabledResult then require(RobloxGui.Modules.Chrome.Service) else nil
local ConstantsModule1 = if EnabledResult then require(RobloxGui.Modules.Chrome.ChromeShared.Unibar.Constants) else nil
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagChromeShortcutRemoveRespawnOnLeavePage = SharedFlagsModule.FFlagChromeShortcutRemoveRespawnOnLeavePage

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), UseLastInputModeFunction (copy), UseFocusGuiObjectFunction (copy), UseLocalizationFunction (copy), ConstantsModule (copy), FFlagEnableConsoleExpControls (copy), EnabledResult (copy), ServiceModule (copy), ConstantsModule1 (copy), FFlagChromeShortcutRemoveRespawnOnLeavePage (copy), ContextActionService (copy), FFlagEnableNextUpImageLatencyTelemetryModule (copy), TelemetryModule (copy), NextUpStateModule (copy), LeaveGameModule (copy), UtilityModule (copy), IsEnabled (copy), View (copy), Text (copy), Button (copy), InputSize (copy), ButtonVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseLastInputModeResult = UseLastInputModeFunction()
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		[ConstantsModule.ConfirmLeaveGameLocalizedKey] = ConstantsModule.ConfirmLeaveGameLocalizedKey,
		[ConstantsModule.LeaveGameLocalizedKey] = ConstantsModule.LeaveGameLocalizedKey,
		[ConstantsModule.DontLeaveGameLocalizedKey] = ConstantsModule.DontLeaveGameLocalizedKey
	})
	local UseResult = ReactModule.useCallback(function(_, UserInputState, Input)
		-- upvalues: p1 (copy)
		if UserInputState == Enum.UserInputState.Begin then
			p1.onDontLeave(Input.UserInputType == Enum.UserInputType.Gamepad1 or (Input.UserInputType == Enum.UserInputType.Gamepad2 or (Input.UserInputType == Enum.UserInputType.Gamepad3 or Input.UserInputType == Enum.UserInputType.Gamepad4)))
		end
	end, { p1.onDontLeave })
	ReactModule.useEffect(function()
		-- upvalues: FFlagEnableConsoleExpControls (upval), EnabledResult (upval), ServiceModule (upval), ConstantsModule1 (upval), FFlagChromeShortcutRemoveRespawnOnLeavePage (upval), ContextActionService (upval), UseResult (copy)
		if FFlagEnableConsoleExpControls then
			if EnabledResult and ServiceModule and ConstantsModule1 then
				if FFlagChromeShortcutRemoveRespawnOnLeavePage then
					ServiceModule:setShortcutBar(ConstantsModule1.TILTMENU_LEAVE_DIALOG_SHORTCUTBAR_ID)
				else
					ServiceModule:setShortcutBar(ConstantsModule1.TILTMENU_DIALOG_SHORTCUTBAR_ID)
				end
			end
		else
			ContextActionService:BindCoreAction("LeaveGameCancelAction", UseResult, false, Enum.KeyCode.ButtonB)
		end
		return function()
			-- upvalues: ContextActionService (upval)
			ContextActionService:UnbindCoreAction("LeaveGameCancelAction")
		end
	end, { UseResult })
	ReactModule.useEffect(function()
		-- upvalues: UseLastInputModeResult (copy), UseFocusGuiObjectResult (copy), UseRefResult (copy)
		if UseLastInputModeResult == "Focus" then
			UseFocusGuiObjectResult(UseRefResult.current)
			
			return
		else
			UseFocusGuiObjectResult(nil)
		end
	end, { UseLastInputModeResult, UseRefResult.current })
	local UseRefResult1 = if FFlagEnableNextUpImageLatencyTelemetryModule then ReactModule.useRef(false) else nil
	local Callback = if FFlagEnableNextUpImageLatencyTelemetryModule then function(p2)
		-- upvalues: UseRefResult1 (copy), TelemetryModule (upval)
		if not UseRefResult1.current then
			UseRefResult1.current = true
			TelemetryModule.logNextUpExitModalAction(p2)
			
			return
		end
	end else nil
	
	if FFlagEnableNextUpImageLatencyTelemetryModule then
		ReactModule.useEffect(function()
			-- upvalues: Callback (copy), TelemetryModule (upval)
			return function()
				-- upvalues: Callback (upval), TelemetryModule (upval)
				Callback(TelemetryModule.NextUpSortViewActionType.CloseExitModalEscape)
			end
		end, {})
	end
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y col gap-large",
		LayoutOrder = 1,
		Position = UDim2.new(0, 0, 0, if IsEnabled then 100 else 0)
	}, {
		LeaveGameText = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			Text = UseLocalizationResult[ConstantsModule.ConfirmLeaveGameLocalizedKey],
			tag = `text-wrap {if UtilityModule:IsSmallTouchScreen() then "text-heading-small" elseif IsEnabled then "text-heading-large" else "text-heading-medium"} auto-y size-full-0`,
			textStyle = UseTokensResult.Color.Extended.White.White_100
		}),
		LeaveButtonsContainer = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y row align-x-center gap-medium wrap flex-x-fill"
		}, {
			LeaveGameButton = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				text = UseLocalizationResult[ConstantsModule.LeaveGameLocalizedKey],
				size = InputSize.Medium,
				variant = ButtonVariant.SoftEmphasis,
				width = UDim.new(0, p1.buttonSize),
				ref = UseRefResult,
				onActivated = ReactModule.useCallback(function()
					-- upvalues: FFlagEnableNextUpImageLatencyTelemetryModule (upval), Callback (copy), TelemetryModule (upval), NextUpStateModule (upval), LeaveGameModule (upval)
					if FFlagEnableNextUpImageLatencyTelemetryModule then
						Callback(TelemetryModule.NextUpSortViewActionType.LeaveGame)
					else
						TelemetryModule.logNextUpSortView(NextUpStateModule.getNextUpTilesLoaded())
					end
					LeaveGameModule(true)
				end, {})
			}),
			DontLeaveGameButton = ReactModule.createElement(Button, {
				LayoutOrder = 2,
				text = UseLocalizationResult[ConstantsModule.DontLeaveGameLocalizedKey],
				size = InputSize.Medium,
				variant = ButtonVariant.Standard,
				width = UDim.new(0, p1.buttonSize),
				onActivated = ReactModule.useCallback(function()
					-- upvalues: FFlagEnableNextUpImageLatencyTelemetryModule (upval), Callback (copy), TelemetryModule (upval), NextUpStateModule (upval), p1 (copy), UtilityModule (upval)
					if FFlagEnableNextUpImageLatencyTelemetryModule then
						Callback(TelemetryModule.NextUpSortViewActionType.CloseExitModalClick)
					else
						TelemetryModule.logNextUpSortView(NextUpStateModule.getNextUpTilesLoaded())
					end
					p1.onDontLeave(UtilityModule:IsUsingGamepad())
				end, { p1.onDontLeave })
			})
		})
	})
end)