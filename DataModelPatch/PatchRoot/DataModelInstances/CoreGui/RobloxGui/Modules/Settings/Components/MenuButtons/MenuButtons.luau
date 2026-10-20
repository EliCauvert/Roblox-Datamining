local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local UtilityModule = require(RobloxGui.Modules.Settings.Utility)
local ConstantsModule = require(RobloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Packages.Signals)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local MenuButtonModule = require(script.Parent.MenuButton)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local UseLastInputFunction = require(CorePackages.Workspace.Packages.Responsive).useLastInput
local View = require(CorePackages.Packages.Foundation).View
local FIntRelocateMobileMenuButtonsVariantModule = require(RobloxGui.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant)
local FFlagAddTraversalHistoryReactMenuButtonsModule = require(RobloxGui.Modules.Settings.Flags.FFlagAddTraversalHistoryReactMenuButtons)
local FFlagGamepadIconSupportCheck = require(CorePackages.Workspace.Packages.SharedFlags).FFlagGamepadIconSupportCheck
local FFlagFixTraversalHistoryMenuFixesV3 = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).Traversal.Flags.FFlagFixTraversalHistoryMenuFixesV3
local MenuButtonsDisconnectGamepadConnected = game:DefineFastFlag("MenuButtonsDisconnectGamepadConnected", false)
local MenuButtonsUseGreyResumeButton = game:DefineFastFlag("MenuButtonsUseGreyResumeButton", false)
local FFlagIEMFocusNavSupportNewButtonsModule = require(RobloxGui.Modules.Settings.Flags.FFlagIEMFocusNavSupportNewButtons)

local function createMenuButtons(UseMemoResult, LastInput, IsSmall)
	-- upvalues: ReactModule (copy), View (copy), FFlagIEMFocusNavSupportNewButtonsModule (copy), MenuButtonModule (copy), FFlagGamepadIconSupportCheck (copy), FFlagAddTraversalHistoryReactMenuButtonsModule (copy)
	local t = {}
	
	for i = 1, #UseMemoResult do
		local Text = "MenuButtonContainer" .. i
		local CreateElementFunction = ReactModule.createElement
		local config = {
			tag = "fill row align-y-center",
			LayoutOrder = i,
			SelectionGroup = if FFlagIEMFocusNavSupportNewButtonsModule then true else nil
		}
		local CreateElementFunction1 = ReactModule.createElement
		local config1 = {
			layoutOrder = 1,
			text = UseMemoResult[i].text,
			lastInput = LastInput,
			keyboardButtonImageHint = UseMemoResult[i].hint.keyboardButtonImage,
			gamepadButton = if FFlagGamepadIconSupportCheck then UseMemoResult[i].hint.gamepadButton else nil
		}
		config1.gamepadButtonImageHint = UseMemoResult[i].hint.gamepadButtonImage
		config1.onActivated = UseMemoResult[i].onActivated
		config1.isEmphasized = UseMemoResult[i].isEmphasized
		config1.isSmall = IsSmall
		config1.isDisabled = UseMemoResult[i].getIsDisabled()
		config1.addTraversalHistoryMenu = if FFlagAddTraversalHistoryReactMenuButtonsModule then UseMemoResult[i].addTraversalHistoryMenu else nil
		config1.currentPageChangeSignal = if FFlagAddTraversalHistoryReactMenuButtonsModule then UseMemoResult[i].currentPageChangeSignal else nil
		config1.buttonRef = if FFlagIEMFocusNavSupportNewButtonsModule then UseMemoResult[i].buttonRef else nil
		t[Text] = CreateElementFunction(View, config, {
			MenuButton = CreateElementFunction1(MenuButtonModule, config1)
		})
	end
	return t
end

return function(p1)
	-- upvalues: ReactModule (copy), UtilityModule (copy), UseSignalStateFunction (copy), FFlagFixTraversalHistoryMenuFixesV3 (copy), FFlagIEMFocusNavSupportNewButtonsModule (copy), UseLocalizationFunction (copy), ConstantsModule (copy), UseLastInputFunction (copy), FFlagAddTraversalHistoryReactMenuButtonsModule (copy), MenuButtonsUseGreyResumeButton (copy), FIntRelocateMobileMenuButtonsVariantModule (copy), ContextActionService (copy), UserInputService (copy), MenuButtonsDisconnectGamepadConnected (copy), View (copy), createMenuButtons (copy)
	local UseStateResult, _ = ReactModule.useState(UtilityModule:IsSmallTouchScreen())
	local _ = UseSignalStateFunction(p1.getCanRespawn)
	local UseRefResult = if FFlagFixTraversalHistoryMenuFixesV3 then ReactModule.useRef(nil) else nil
	local UseRefResult1 = ReactModule.useRef(nil)
	
	if FFlagIEMFocusNavSupportNewButtonsModule then
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), UseRefResult1 (copy)
			if p1.setResumeMenuButton then
				p1.setResumeMenuButton(UseRefResult1.current)
			end
		end, { p1.setResumeMenuButton })
	end
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding("")
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding("")
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding("")
	local UseLocalizationResult = UseLocalizationFunction({
		LeaveGame = ConstantsModule.LeaveGameLocalizedKey,
		Respawn = ConstantsModule.RespawnLocalizedKey,
		Resume = ConstantsModule.ResumeLocalizedKey
	})
	local UseLastInputResult = UseLastInputFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseLocalizationResult (copy), UseBindingResult (copy), UseBindingResult2 (copy), p1 (copy), ConstantsModule (upval), FFlagAddTraversalHistoryReactMenuButtonsModule (upval), FFlagFixTraversalHistoryMenuFixesV3 (upval), UseRefResult (copy), UseBindingResult1 (copy), UseBindingResult2_1 (copy), UseBindingResult3 (copy), UseBindingResult2_2 (copy), MenuButtonsUseGreyResumeButton (upval), FIntRelocateMobileMenuButtonsVariantModule (upval), FFlagIEMFocusNavSupportNewButtonsModule (upval), UseRefResult1 (copy)
		return {
			{
				name = "LeaveGameButton",
				isEmphasized = false,
				text = UseLocalizationResult.LeaveGame,
				hint = {
					keyboard = "L",
					keyboardButtonImage = "icons/controls/keys/key_l",
					gamepadButton = Enum.KeyCode.ButtonX,
					gamepadButtonImage = UseBindingResult,
					setGamepadButtonImage = UseBindingResult2
				},
				getIsDisabled = function(): boolean
					return false
				end,
				onActivated = function()
					-- upvalues: p1 (upval), ConstantsModule (upval)
					p1.onLeaveGame(ConstantsModule.AnalyticsMenuButtonSource)
				end,
				hotkeys = { Enum.KeyCode.L, Enum.KeyCode.ButtonX },
				hotkeyFunc = function()
					-- upvalues: p1 (upval), ConstantsModule (upval)
					p1.onLeaveGame(ConstantsModule.AnalyticsMenuHotkeySource)
				end,
				addTraversalHistoryMenu = if FFlagAddTraversalHistoryReactMenuButtonsModule then true else nil,
				currentPageChangeSignal = if FFlagAddTraversalHistoryReactMenuButtonsModule then p1.currentPageChangeSignal else nil,
				buttonRef = if FFlagFixTraversalHistoryMenuFixesV3 then UseRefResult else nil
			},
			{
				name = "ResetButton",
				isEmphasized = false,
				text = UseLocalizationResult.Respawn,
				hint = {
					keyboard = "R",
					keyboardButtonImage = "icons/controls/keys/key_r",
					gamepadButton = Enum.KeyCode.ButtonY,
					gamepadButtonImage = UseBindingResult1,
					setGamepadButtonImage = UseBindingResult2_1
				},
				getIsDisabled = function(): boolean
					-- upvalues: p1 (upval)
					return not p1.getCanRespawn(false)
				end,
				onActivated = function()
					-- upvalues: p1 (upval), ConstantsModule (upval)
					p1.onRespawn(ConstantsModule.AnalyticsMenuButtonSource)
				end,
				hotkeys = { Enum.KeyCode.R, Enum.KeyCode.ButtonY },
				hotkeyFunc = function()
					-- upvalues: p1 (upval), ConstantsModule (upval)
					p1.onRespawn(ConstantsModule.AnalyticsMenuHotkeySource)
				end
			},
			{
				name = "ResumeButton",
				text = UseLocalizationResult.Resume,
				hint = {
					keyboard = "ESC",
					keyboardButtonImage = "icons/controls/keys/key_esc",
					gamepadButton = Enum.KeyCode.ButtonStart,
					gamepadButtonImage = UseBindingResult3,
					setGamepadButtonImage = UseBindingResult2_2
				},
				isEmphasized = not MenuButtonsUseGreyResumeButton and not (FIntRelocateMobileMenuButtonsVariantModule == 1),
				getIsDisabled = function(): boolean
					return false
				end,
				onActivated = function()
					-- upvalues: p1 (upval), ConstantsModule (upval)
					p1.onResume(ConstantsModule.AnalyticsMenuButtonSource)
				end,
				hotkeyFunc = function()
					-- upvalues: p1 (upval), ConstantsModule (upval)
					p1.onResume(ConstantsModule.AnalyticsMenuHotkeySource)
				end,
				hotkeys = { Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart },
				buttonRef = if FFlagIEMFocusNavSupportNewButtonsModule then UseRefResult1 else nil
			}
		}
	end, {
		UseLocalizationResult,
		p1.onLeaveGame,
		p1.onRespawn,
		p1.onResume,
		p1.getCanRespawn
	})
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy), ContextActionService (upval)
		if not p1.getVisibility() then return end
		for i = 1, #p2 do
			if p2[i].hotkeyFunc ~= nil then
				ContextActionService:BindCoreAction(p2[i].name, p2[i].hotkeyFunc, false, unpack(p2[i].hotkeys))
			end
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function(p3)
		-- upvalues: ContextActionService (upval)
		for i = 1, #p3 do
			ContextActionService:UnbindCoreAction(p3[i].name)
		end
	end, {})
	local UseResult2 = ReactModule.useCallback(function(p4)
		-- upvalues: UseResult1 (copy), UserInputService (upval), p1 (copy), UseResult (copy)
		local function _(p5, p6)
			-- upvalues: UseResult1 (upval), p4 (copy)
			return function()
				-- upvalues: p6 (copy), UseResult1 (upval), p4 (upval), p5 (copy)
				if not p6() then
					UseResult1(p4)
					p5()
				end
			end
		end
		
		local _ = function(Callback, Callback1)
			-- upvalues: UseResult1 (upval), p4 (copy)
			return function(_, UserInputState, _)
				-- upvalues: Callback (copy), Callback1 (copy), UseResult1 (upval), p4 (upval)
				if UserInputState == Enum.UserInputState.Begin then
					(function()
						-- upvalues: Callback1 (copy), UseResult1 (upval), p4 (upval), Callback (copy)
						if not Callback1() then
							UseResult1(p4)
							Callback()
						end
					end)()
				end
			end
		end
		
		for i = 1, #p4 do
			local OnActivated = p4[i].onActivated
			local GetIsDisabled = p4[i].getIsDisabled
			
			p4[i].onActivated = function()
				-- upvalues: GetIsDisabled (copy), UseResult1 (upval), p4 (copy), OnActivated (copy)
				if not GetIsDisabled() then
					UseResult1(p4)
					OnActivated()
				end
			end
			
			local HotkeyFunc = p4[i].hotkeyFunc
			local GetIsDisabled1 = p4[i].getIsDisabled
			
			p4[i].hotkeyFunc = function(_, UserInputState, _)
				-- upvalues: HotkeyFunc (copy), GetIsDisabled1 (copy), UseResult1 (upval), p4 (copy)
				if UserInputState == Enum.UserInputState.Begin then
					(function()
						-- upvalues: GetIsDisabled1 (copy), UseResult1 (upval), p4 (upval), HotkeyFunc (copy)
						if not GetIsDisabled1() then
							UseResult1(p4)
							HotkeyFunc()
						end
					end)()
				end
			end
			
			p4[i].hint.setGamepadButtonImage(UserInputService:GetImageForKeyCode(p4[i].hint.gamepadButton))
		end
		p1.setAddMenuKeyBindings(function()
			-- upvalues: UseResult (upval), p4 (copy)
			UseResult(p4)
		end)
		p1.setRemoveMenuKeyBindings(function()
			-- upvalues: UseResult1 (upval), p4 (copy)
			UseResult1(p4)
		end)
		
		return p4
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseResult2 (copy), UseMemoResult (copy)
		return UseResult2(UseMemoResult)
	end, { UseMemoResult })
	ReactModule.useEffect(function()
		-- upvalues: UserInputService (upval), UseMemoResult1 (copy), MenuButtonsDisconnectGamepadConnected (upval)
		local GamepadConnectedConnection = UserInputService.GamepadConnected:Connect(function()
			-- upvalues: UseMemoResult1 (upval), UserInputService (upval)
			for i = 1, #UseMemoResult1 do
				UseMemoResult1[i].hint.setGamepadButtonImage(UserInputService:GetImageForKeyCode(UseMemoResult1[i].hint.gamepadButton))
			end
		end)
		
		return function()
			-- upvalues: MenuButtonsDisconnectGamepadConnected (upval), GamepadConnectedConnection (copy)
			if MenuButtonsDisconnectGamepadConnected then
				GamepadConnectedConnection:Disconnect()
			end
		end
	end, { UseMemoResult1 })
	
	return ReactModule.createElement(View, {
		tag = {
			["size-full row align-y-center"] = true,
			["gap-small"] = not UseStateResult,
			["gap-xsmall"] = UseStateResult
		}
	}, (createMenuButtons(UseMemoResult1, UseLastInputResult, UseStateResult)))
end