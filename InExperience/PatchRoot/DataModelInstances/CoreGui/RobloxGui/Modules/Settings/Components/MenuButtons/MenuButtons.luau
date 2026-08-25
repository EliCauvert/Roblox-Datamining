local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local userInputService = game:GetService("UserInputService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local utilityModule = require(robloxGui.Modules.Settings.Utility)
local constantsModule = require(robloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local reactModule = require(corePackagesService.Packages.React)
local foundationModule = require(corePackagesService.Packages.Foundation)
local _ = require(corePackagesService.Packages.Signals)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local responsiveModule = require(corePackagesService.Workspace.Packages.Responsive)
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local menuButtonModule = require(script.Parent.MenuButton)
local useSignalState = signalsReactModule.useSignalState
local useLastInput = responsiveModule.useLastInput
local view = foundationModule.View
local fIntRelocateMobileMenuButtonsVariantModule = require(robloxGui.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant)
local fFlagAddTraversalHistoryReactMenuButtonsModule = require(robloxGui.Modules.Settings.Flags.FFlagAddTraversalHistoryReactMenuButtons)
local fFlagGamepadIconSupportCheck = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagGamepadIconSupportCheck
local menuButtonsDisconnectGamepadConnected = game:DefineFastFlag("MenuButtonsDisconnectGamepadConnected", false)
local menuButtonsUseGreyResumeButton = game:DefineFastFlag("MenuButtonsUseGreyResumeButton", false)
local fFlagIEMFocusNavSupportNewButtonsModule = require(robloxGui.Modules.Settings.Flags.FFlagIEMFocusNavSupportNewButtons)

local function createMenuButtons(p0, p1, p2)
	-- upvalues: reactModule (ref), view (ref), fFlagIEMFocusNavSupportNewButtonsModule (ref), menuButtonModule (ref), fFlagGamepadIconSupportCheck (ref), fFlagAddTraversalHistoryReactMenuButtonsModule (ref)
	local t = {}
	
	for i = 1, #p0 do
		t["MenuButtonContainer" .. i] = reactModule.createElement(view, {
			tag = "fill row align-y-center",
			LayoutOrder = i,
			SelectionGroup = if fFlagIEMFocusNavSupportNewButtonsModule then true else nil
		}, {
			MenuButton = reactModule.createElement(menuButtonModule, {
				layoutOrder = 1,
				text = p0[i].text,
				lastInput = p1,
				keyboardButtonImageHint = p0[i].hint.keyboardButtonImage,
				gamepadButton = if fFlagGamepadIconSupportCheck then p0[i].hint.gamepadButton else nil,
				gamepadButtonImageHint = p0[i].hint.gamepadButtonImage,
				onActivated = p0[i].onActivated,
				isEmphasized = p0[i].isEmphasized,
				isSmall = p2,
				isDisabled = p0[i].getIsDisabled(),
				addTraversalHistoryMenu = if fFlagAddTraversalHistoryReactMenuButtonsModule then p0[i].addTraversalHistoryMenu else nil,
				currentPageChangeSignal = if fFlagAddTraversalHistoryReactMenuButtonsModule then p0[i].currentPageChangeSignal else nil,
				buttonRef = if fFlagIEMFocusNavSupportNewButtonsModule then p0[i].buttonRef else nil
			})
		})
	end
	return t
end

return function(p3)
	-- upvalues: reactModule (ref), utilityModule (ref), useSignalState (ref), fFlagIEMFocusNavSupportNewButtonsModule (ref), useLocalization (ref), constantsModule (ref), useLastInput (ref), fFlagAddTraversalHistoryReactMenuButtonsModule (ref), menuButtonsUseGreyResumeButton (ref), fIntRelocateMobileMenuButtonsVariantModule (ref), contextActionService (ref), userInputService (ref), menuButtonsDisconnectGamepadConnected (ref), view (ref), createMenuButtons (ref)
	local var19, _ = reactModule.useState(utilityModule:IsSmallTouchScreen())
	local _ = useSignalState(p3.getCanRespawn)
	local var20 = reactModule.useRef(nil)
	local var21 = reactModule.useRef(nil)
	
	if fFlagIEMFocusNavSupportNewButtonsModule then
		reactModule.useEffect(function()
			-- upvalues: p3 (ref), var21 (ref)
			if p3.setResumeMenuButton then
				p3.setResumeMenuButton(var21.current)
			end
		end, { p3.setResumeMenuButton })
	end
	local var22, var23 = reactModule.useBinding("")
	local var24, var25 = reactModule.useBinding("")
	local var26, var27 = reactModule.useBinding("")
	local var28 = useLocalization({
		LeaveGame = constantsModule.LeaveGameLocalizedKey,
		Respawn = constantsModule.RespawnLocalizedKey,
		Resume = constantsModule.ResumeLocalizedKey
	})
	local var29 = useLastInput()
	local var30 = reactModule.useMemo(function()
		-- upvalues: var28 (ref), var22 (ref), var23 (ref), p3 (ref), constantsModule (copy), fFlagAddTraversalHistoryReactMenuButtonsModule (copy), var20 (ref), var24 (ref), var25 (ref), var26 (ref), var27 (ref), menuButtonsUseGreyResumeButton (copy), fIntRelocateMobileMenuButtonsVariantModule (copy), fFlagIEMFocusNavSupportNewButtonsModule (copy), var21 (ref)
		return {
			{
				name = "LeaveGameButton",
				isEmphasized = false,
				text = var28.LeaveGame,
				hint = {
					keyboard = "L",
					keyboardButtonImage = "icons/controls/keys/key_l",
					gamepadButton = Enum.KeyCode.ButtonX,
					gamepadButtonImage = var22,
					setGamepadButtonImage = var23
				},
				getIsDisabled = function()
					return false
				end,
				onActivated = function()
					-- upvalues: p3 (copy), constantsModule (copy)
					p3.onLeaveGame(constantsModule.AnalyticsMenuButtonSource)
				end,
				hotkeys = { Enum.KeyCode.L, Enum.KeyCode.ButtonX },
				hotkeyFunc = function()
					-- upvalues: p3 (copy), constantsModule (copy)
					p3.onLeaveGame(constantsModule.AnalyticsMenuHotkeySource)
				end,
				addTraversalHistoryMenu = if fFlagAddTraversalHistoryReactMenuButtonsModule then true else nil,
				currentPageChangeSignal = if fFlagAddTraversalHistoryReactMenuButtonsModule then p3.currentPageChangeSignal else nil,
				buttonRef = var20
			},
			{
				name = "ResetButton",
				isEmphasized = false,
				text = var28.Respawn,
				hint = {
					keyboard = "R",
					keyboardButtonImage = "icons/controls/keys/key_r",
					gamepadButton = Enum.KeyCode.ButtonY,
					gamepadButtonImage = var24,
					setGamepadButtonImage = var25
				},
				getIsDisabled = function()
					-- upvalues: p3 (copy)
					return not p3.getCanRespawn(false)
				end,
				onActivated = function()
					-- upvalues: p3 (copy), constantsModule (copy)
					p3.onRespawn(constantsModule.AnalyticsMenuButtonSource)
				end,
				hotkeys = { Enum.KeyCode.R, Enum.KeyCode.ButtonY },
				hotkeyFunc = function()
					-- upvalues: p3 (copy), constantsModule (copy)
					p3.onRespawn(constantsModule.AnalyticsMenuHotkeySource)
				end
			},
			{
				name = "ResumeButton",
				text = var28.Resume,
				hint = {
					keyboard = "ESC",
					keyboardButtonImage = "icons/controls/keys/key_esc",
					gamepadButton = Enum.KeyCode.ButtonStart,
					gamepadButtonImage = var26,
					setGamepadButtonImage = var27
				},
				isEmphasized = if menuButtonsUseGreyResumeButton then false else not (fIntRelocateMobileMenuButtonsVariantModule == 1),
				getIsDisabled = function()
					return false
				end,
				onActivated = function()
					-- upvalues: p3 (copy), constantsModule (copy)
					p3.onResume(constantsModule.AnalyticsMenuButtonSource)
				end,
				hotkeyFunc = function()
					-- upvalues: p3 (copy), constantsModule (copy)
					p3.onResume(constantsModule.AnalyticsMenuHotkeySource)
				end,
				hotkeys = { Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart },
				buttonRef = if fFlagIEMFocusNavSupportNewButtonsModule then var21 else nil
			}
		}
	end, {
		var28,
		p3.onLeaveGame,
		p3.onRespawn,
		p3.onResume,
		p3.getCanRespawn
	})
	local var31 = reactModule.useCallback(function(p4)
		-- upvalues: p3 (ref), contextActionService (copy)
		if not p3.getVisibility() then return end
		for i = 1, #p4 do
			if p4[i].hotkeyFunc ~= nil then
				contextActionService:BindCoreAction(p4[i].name, p4[i].hotkeyFunc, false, unpack(p4[i].hotkeys))
			end
		end
	end, {})
	local var32 = reactModule.useCallback(function(p5)
		-- upvalues: contextActionService (copy)
		for i = 1, #p5 do
			contextActionService:UnbindCoreAction(p5[i].name)
		end
	end, {})
	local var33 = reactModule.useCallback(function(p6)
		-- upvalues: var32 (ref), userInputService (copy), p3 (ref), var31 (ref)
		local _ = function(p7, p8)
			-- upvalues: var32 (copy), p6 (ref)
			return function()
				-- upvalues: p8 (ref), var32 (copy), p6 (copy), p7 (ref)
				if not p8() then
					var32(p6)
					p7()
				end
			end
		end
		
		local _ = function(p9, p10)
			-- upvalues: var32 (copy), p6 (ref)
			return function(_, p11, _)
				-- upvalues: p9 (ref), p10 (ref), var32 (copy), p6 (copy)
				if p11 == Enum.UserInputState.Begin then
					local var37 = p9
					local var38 = p10;
					(function()
						-- upvalues: var38 (ref), var32 (copy), p6 (copy), var37 (ref)
						if not var38() then
							var32(p6)
							var37()
						end
					end)()
				end
			end
		end
		
		for i = 1, #p6 do
			local var35 = p6[i]
			local onActivated = p6[i].onActivated
			local getIsDisabled = p6[i].getIsDisabled
			
			function var35.onActivated()
				-- upvalues: getIsDisabled (ref), var32 (copy), p6 (ref), onActivated (ref)
				if not getIsDisabled() then
					var32(p6)
					onActivated()
				end
			end
			
			local var36 = p6[i]
			local hotkeyFunc = p6[i].hotkeyFunc
			local getIsDisabled_1 = p6[i].getIsDisabled
			
			function var36.hotkeyFunc(_, p12, _)
				-- upvalues: hotkeyFunc (ref), getIsDisabled_1 (ref), var32 (copy), p6 (ref)
				if p12 == Enum.UserInputState.Begin then
					local var37 = hotkeyFunc
					local var38 = getIsDisabled_1;
					(function()
						-- upvalues: var38 (ref), var32 (copy), p6 (copy), var37 (ref)
						if not var38() then
							var32(p6)
							var37()
						end
					end)()
				end
			end
			
			p6[i].hint.setGamepadButtonImage(userInputService:GetImageForKeyCode(p6[i].hint.gamepadButton))
		end
		p3.setAddMenuKeyBindings(function()
			-- upvalues: var31 (copy), p6 (ref)
			var31(p6)
		end)
		p3.setRemoveMenuKeyBindings(function()
			-- upvalues: var32 (copy), p6 (ref)
			var32(p6)
		end)
		
		return p6
	end, {})
	local var34 = reactModule.useMemo(function()
		-- upvalues: var33 (ref), var30 (ref)
		return var33(var30)
	end, { var30 })
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var34 (ref), menuButtonsDisconnectGamepadConnected (copy)
		local gamepadConnectedConnection = userInputService.GamepadConnected:Connect(function()
			-- upvalues: var34 (copy), userInputService (copy)
			for i = 1, #var34 do
				var34[i].hint.setGamepadButtonImage(userInputService:GetImageForKeyCode(var34[i].hint.gamepadButton))
			end
		end)
		
		return function()
			-- upvalues: menuButtonsDisconnectGamepadConnected (copy), gamepadConnectedConnection (ref)
			if menuButtonsDisconnectGamepadConnected then
				gamepadConnectedConnection:Disconnect()
			end
		end
	end, { var34 })
	
	return reactModule.createElement(view, {
		tag = {
			["size-full row align-y-center"] = true,
			["gap-small"] = not var19,
			["gap-xsmall"] = var19
		}
	}, createMenuButtons(var34, var29, var19))
end