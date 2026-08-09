local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local utilityModule = require(robloxGui.Modules.Settings.Utility)
local leaveGameModule = require(robloxGui.Modules.Settings.leaveGame)
local reactModule = require(corePackagesService.Packages.React)
local reactFocusNavigationModule = require(corePackagesService.Packages.ReactFocusNavigation)
local focusNavigationUtilsModule = require(corePackagesService.Workspace.Packages.FocusNavigationUtils)
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local constantsModule = require(robloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local var10 = require(robloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")):IsEnabled()
local foundationModule = require(corePackagesService.Packages.Foundation)
local telemetryModule = require(script.Parent.Telemetry)
local nextUpStateModule = require(script.Parent.NextUpState)
local useFocusGuiObject = reactFocusNavigationModule.useFocusGuiObject
local useLastInputMode = focusNavigationUtilsModule.useLastInputMode
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local fFlagEnableNextUpImageLatencyTelemetryModule = require(script.Parent.Flags.FFlagEnableNextUpImageLatencyTelemetry)
local var15 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local var16 = if var15 then require(robloxGui.Modules.Chrome.Service) else nil
local var17 = if var15 then require(robloxGui.Modules.Chrome.ChromeShared.Unibar.Constants) else nil
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagChromeShortcutRemoveRespawnOnLeavePage = sharedFlagsModule.FFlagChromeShortcutRemoveRespawnOnLeavePage

return reactModule.memo(function(p0) --[[ line: 48 | named "LeaveButtonsContainer" ]]
	-- upvalues: useTokens (ref), reactModule (ref), useLastInputMode (ref), useFocusGuiObject (ref), useLocalization (ref), constantsModule (ref), fFlagEnableConsoleExpControls (ref), var15 (ref), var16 (ref), var17 (ref), fFlagChromeShortcutRemoveRespawnOnLeavePage (ref), contextActionService (ref), fFlagEnableNextUpImageLatencyTelemetryModule (ref), telemetryModule (ref), nextUpStateModule (ref), leaveGameModule (ref), utilityModule (ref), var10 (ref), view (ref), text (ref), button (ref), inputSize (ref), buttonVariant (ref)
	local var19 = useTokens()
	local var20 = reactModule.useRef(nil)
	local var21 = useLastInputMode()
	local var22 = useFocusGuiObject()
	local var23 = useLocalization({
		[constantsModule.ConfirmLeaveGameLocalizedKey] = constantsModule.ConfirmLeaveGameLocalizedKey,
		[constantsModule.LeaveGameLocalizedKey] = constantsModule.LeaveGameLocalizedKey,
		[constantsModule.DontLeaveGameLocalizedKey] = constantsModule.DontLeaveGameLocalizedKey
	})
	local var24 = reactModule.useCallback(function(_, p1, p2) --[[ line: 60 ]]
		-- upvalues: p0 (ref)
		if p1 == Enum.UserInputState.Begin then
			p0.onDontLeave(if p2.UserInputType ~= Enum.UserInputType.Gamepad1 then if p2.UserInputType ~= Enum.UserInputType.Gamepad2 then if p2.UserInputType ~= Enum.UserInputType.Gamepad3 then p2.UserInputType == Enum.UserInputType.Gamepad4 else true else true else true)
		end
	end, { p0.onDontLeave })
	reactModule.useEffect(function() --[[ line: 71 ]]
		-- upvalues: fFlagEnableConsoleExpControls (copy), var15 (copy), var16 (copy), var17 (copy), fFlagChromeShortcutRemoveRespawnOnLeavePage (copy), contextActionService (copy), var24 (ref)
		if not fFlagEnableConsoleExpControls then
			contextActionService:BindCoreAction("LeaveGameCancelAction", var24, false, Enum.KeyCode.ButtonB)
		elseif var15 and var16 and var17 then
			if fFlagChromeShortcutRemoveRespawnOnLeavePage then
				var16:setShortcutBar(var17.TILTMENU_LEAVE_DIALOG_SHORTCUTBAR_ID)
			else
				var16:setShortcutBar(var17.TILTMENU_DIALOG_SHORTCUTBAR_ID)
			end
		end
		return function() --[[ line: 84 ]]
			-- upvalues: contextActionService (copy)
			contextActionService:UnbindCoreAction("LeaveGameCancelAction")
		end
	end, { var24 })
	reactModule.useEffect(function() --[[ line: 89 ]]
		-- upvalues: var21 (ref), var22 (ref), var20 (ref)
		if var21 == "Focus" then
			var22(var20.current)
			
			return
		end
		var22(nil)
	end, { var21, var20.current })
	local var25 = if fFlagEnableNextUpImageLatencyTelemetryModule then reactModule.useRef(false) else nil
	local var26 = if fFlagEnableNextUpImageLatencyTelemetryModule then function(p3) --[[ line: 99 ]]
		-- upvalues: var25 (ref), telemetryModule (copy)
		if var25.current then
			return
		end
		var25.current = true
		telemetryModule.logNextUpExitModalAction(p3)
	end else nil
	
	if fFlagEnableNextUpImageLatencyTelemetryModule then
		reactModule.useEffect(function() --[[ line: 109 ]]
			-- upvalues: var26 (ref), telemetryModule (copy)
			return function() --[[ line: 110 ]]
				-- upvalues: var26 (copy), telemetryModule (copy)
				var26(telemetryModule.NextUpSortViewActionType.CloseExitModalEscape)
			end
		end, {})
	end
	local var27 = reactModule.useCallback(function() --[[ line: 116 ]]
		-- upvalues: fFlagEnableNextUpImageLatencyTelemetryModule (copy), var26 (ref), telemetryModule (copy), nextUpStateModule (copy), leaveGameModule (copy)
		if fFlagEnableNextUpImageLatencyTelemetryModule then
			var26(telemetryModule.NextUpSortViewActionType.LeaveGame)
		else
			telemetryModule.logNextUpSortView(nextUpStateModule.getNextUpTilesLoaded())
		end
		leaveGameModule(true)
	end, {})
	local var28 = reactModule.useCallback(function() --[[ line: 125 ]]
		-- upvalues: fFlagEnableNextUpImageLatencyTelemetryModule (copy), var26 (ref), telemetryModule (copy), nextUpStateModule (copy), p0 (ref), utilityModule (copy)
		if fFlagEnableNextUpImageLatencyTelemetryModule then
			var26(telemetryModule.NextUpSortViewActionType.CloseExitModalClick)
		else
			telemetryModule.logNextUpSortView(nextUpStateModule.getNextUpTilesLoaded())
		end
		p0.onDontLeave(utilityModule:IsUsingGamepad())
	end, { p0.onDontLeave })
	local var29 = "text-heading-medium"
	
	if utilityModule:IsSmallTouchScreen() then
		var29 = "text-heading-small"
	elseif var10 then
		var29 = "text-heading-large"
	end
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y col gap-large",
		LayoutOrder = 1,
		Position = UDim2.new(0, 0, 0, if var10 then 100 else 0)
	}, {
		LeaveGameText = reactModule.createElement(text, {
			LayoutOrder = 1,
			Text = var23[constantsModule.ConfirmLeaveGameLocalizedKey],
			tag = `text-wrap {var29} auto-y size-full-0`,
			textStyle = var19.Color.Extended.White.White_100
		}),
		LeaveButtonsContainer = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y row align-x-center gap-medium wrap flex-x-fill"
		}, {
			LeaveGameButton = reactModule.createElement(button, {
				LayoutOrder = 1,
				text = var23[constantsModule.LeaveGameLocalizedKey],
				size = inputSize.Medium,
				variant = buttonVariant.SoftEmphasis,
				width = UDim.new(0, p0.buttonSize),
				ref = var20,
				onActivated = var27
			}),
			DontLeaveGameButton = reactModule.createElement(button, {
				LayoutOrder = 2,
				text = var23[constantsModule.DontLeaveGameLocalizedKey],
				size = inputSize.Medium,
				variant = buttonVariant.Standard,
				width = UDim.new(0, p0.buttonSize),
				onActivated = var28
			})
		})
	})
end)