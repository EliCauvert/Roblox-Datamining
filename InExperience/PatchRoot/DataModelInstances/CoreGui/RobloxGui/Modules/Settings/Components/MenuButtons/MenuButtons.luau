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

local function createMenuButtons(p1, p2, p3)
	-- upvalues: reactModule (ref), view (ref), fFlagIEMFocusNavSupportNewButtonsModule (ref), menuButtonModule (ref), fFlagGamepadIconSupportCheck (ref), fFlagAddTraversalHistoryReactMenuButtonsModule (ref)
	local t = {}
	
	for i = 1, #p1 do
		t["MenuButtonContainer" .. i] = reactModule.createElement(view, {
			tag = "fill row align-y-center",
			LayoutOrder = i,
			SelectionGroup = if fFlagIEMFocusNavSupportNewButtonsModule then true else nil
		}, {
			MenuButton = reactModule.createElement(menuButtonModule, {
				layoutOrder = 1,
				text = p1[i].text,
				lastInput = p2,
				keyboardButtonImageHint = p1[i].hint.keyboardButtonImage,
				gamepadButton = if fFlagGamepadIconSupportCheck then p1[i].hint.gamepadButton else nil,
				gamepadButtonImageHint = p1[i].hint.gamepadButtonImage,
				onActivated = p1[i].onActivated,
				isEmphasized = p1[i].isEmphasized,
				isSmall = p3,
				isDisabled = p1[i].getIsDisabled(),
				addTraversalHistoryMenu = if fFlagAddTraversalHistoryReactMenuButtonsModule then p1[i].addTraversalHistoryMenu else nil,
				currentPageChangeSignal = if fFlagAddTraversalHistoryReactMenuButtonsModule then p1[i].currentPageChangeSignal else nil,
				buttonRef = if fFlagIEMFocusNavSupportNewButtonsModule then p1[i].buttonRef else nil
			})
		})
	end
	return t
end

return function(p4)
	-- upvalues: reactModule (ref), utilityModule (ref), useSignalState (ref), fFlagIEMFocusNavSupportNewButtonsModule (ref), useLocalization (ref), constantsModule (ref), useLastInput (ref), fFlagAddTraversalHistoryReactMenuButtonsModule (ref), menuButtonsUseGreyResumeButton (ref), fIntRelocateMobileMenuButtonsVariantModule (ref), contextActionService (ref), userInputService (ref), menuButtonsDisconnectGamepadConnected (ref), view (ref), createMenuButtons (ref)
	local var1, _ = reactModule.useState(utilityModule:IsSmallTouchScreen())
	local _ = useSignalState(p4.getCanRespawn)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(nil)
	
	if fFlagIEMFocusNavSupportNewButtonsModule then
		reactModule.useEffect(function()
			-- upvalues: p4 (ref), var3 (ref)
			if p4.setResumeMenuButton then
				p4.setResumeMenuButton(var3.current)
			end
		end, { p4.setResumeMenuButton })
	end
	local var4, var5 = reactModule.useBinding("")
	local var6, var7 = reactModule.useBinding("")
	local var8, var9 = reactModule.useBinding("")
	local var10 = useLocalization({
		LeaveGame = constantsModule.LeaveGameLocalizedKey,
		Respawn = constantsModule.RespawnLocalizedKey,
		Resume = constantsModule.ResumeLocalizedKey
	})
	local var11 = useLastInput()
	local var12 = reactModule.useMemo(function()
		-- upvalues: var10 (ref), var4 (ref), var5 (ref), p4 (ref), constantsModule (copy), fFlagAddTraversalHistoryReactMenuButtonsModule (copy), var2 (ref), var6 (ref), var7 (ref), var8 (ref), var9 (ref), menuButtonsUseGreyResumeButton (copy), fIntRelocateMobileMenuButtonsVariantModule (copy), fFlagIEMFocusNavSupportNewButtonsModule (copy), var3 (ref)
		return {
			{
				name = "LeaveGameButton",
				isEmphasized = false,
				text = var10.LeaveGame,
				hint = {
					keyboard = "L",
					keyboardButtonImage = "icons/controls/keys/key_l",
					gamepadButton = Enum.KeyCode.ButtonX,
					gamepadButtonImage = var4,
					setGamepadButtonImage = var5
				},
				getIsDisabled = function()
					return false
				end,
				onActivated = function()
					-- upvalues: p4 (copy), constantsModule (copy)
					p4.onLeaveGame(constantsModule.AnalyticsMenuButtonSource)
				end,
				hotkeys = { Enum.KeyCode.L, Enum.KeyCode.ButtonX },
				hotkeyFunc = function()
					-- upvalues: p4 (copy), constantsModule (copy)
					p4.onLeaveGame(constantsModule.AnalyticsMenuHotkeySource)
				end,
				addTraversalHistoryMenu = if fFlagAddTraversalHistoryReactMenuButtonsModule then true else nil,
				currentPageChangeSignal = if fFlagAddTraversalHistoryReactMenuButtonsModule then p4.currentPageChangeSignal else nil,
				buttonRef = var2
			},
			{
				name = "ResetButton",
				isEmphasized = false,
				text = var10.Respawn,
				hint = {
					keyboard = "R",
					keyboardButtonImage = "icons/controls/keys/key_r",
					gamepadButton = Enum.KeyCode.ButtonY,
					gamepadButtonImage = var6,
					setGamepadButtonImage = var7
				},
				getIsDisabled = function()
					-- upvalues: p4 (copy)
					return not p4.getCanRespawn(false)
				end,
				onActivated = function()
					-- upvalues: p4 (copy), constantsModule (copy)
					p4.onRespawn(constantsModule.AnalyticsMenuButtonSource)
				end,
				hotkeys = { Enum.KeyCode.R, Enum.KeyCode.ButtonY },
				hotkeyFunc = function()
					-- upvalues: p4 (copy), constantsModule (copy)
					p4.onRespawn(constantsModule.AnalyticsMenuHotkeySource)
				end
			},
			{
				name = "ResumeButton",
				text = var10.Resume,
				hint = {
					keyboard = "ESC",
					keyboardButtonImage = "icons/controls/keys/key_esc",
					gamepadButton = Enum.KeyCode.ButtonStart,
					gamepadButtonImage = var8,
					setGamepadButtonImage = var9
				},
				isEmphasized = if menuButtonsUseGreyResumeButton then false else not (fIntRelocateMobileMenuButtonsVariantModule == 1),
				getIsDisabled = function()
					return false
				end,
				onActivated = function()
					-- upvalues: p4 (copy), constantsModule (copy)
					p4.onResume(constantsModule.AnalyticsMenuButtonSource)
				end,
				hotkeyFunc = function()
					-- upvalues: p4 (copy), constantsModule (copy)
					p4.onResume(constantsModule.AnalyticsMenuHotkeySource)
				end,
				hotkeys = { Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart },
				buttonRef = if fFlagIEMFocusNavSupportNewButtonsModule then var3 else nil
			}
		}
	end, {
		var10,
		p4.onLeaveGame,
		p4.onRespawn,
		p4.onResume,
		p4.getCanRespawn
	})
	local var13 = reactModule.useCallback(function(p5)
		-- upvalues: p4 (ref), contextActionService (copy)
		if not p4.getVisibility() then return end
		for i = 1, #p5 do
			if p5[i].hotkeyFunc ~= nil then
				contextActionService:BindCoreAction(p5[i].name, p5[i].hotkeyFunc, false, unpack(p5[i].hotkeys))
			end
		end
	end, {})
	local var14 = reactModule.useCallback(function(p6)
		-- upvalues: contextActionService (copy)
		for i = 1, #p6 do
			contextActionService:UnbindCoreAction(p6[i].name)
		end
	end, {})
	local var15 = reactModule.useCallback(function(p7)
		-- upvalues: var14 (ref), userInputService (copy), p4 (ref), var13 (ref)
		local _ = function(p8, p9)
			-- upvalues: var14 (copy), p7 (ref)
			return function()
				-- upvalues: p9 (ref), var14 (copy), p7 (copy), p8 (ref)
				if not p9() then
					var14(p7)
					p8()
				end
			end
		end
		
		local _ = function(p8, p9)
			-- upvalues: var14 (copy), p7 (ref)
			return function(_, p10, _)
				-- upvalues: p8 (ref), p9 (ref), var14 (copy), p7 (copy)
				if p10 == Enum.UserInputState.Begin then
					local var16 = p8
					local var17 = p9;
					(function()
						-- upvalues: var17 (ref), var14 (copy), p7 (copy), var16 (ref)
						if not var17() then
							var14(p7)
							var16()
						end
					end)()
				end
			end
		end
		
		for i = 1, #p7 do
			local var16 = p7[i]
			local onActivated = p7[i].onActivated
			local getIsDisabled = p7[i].getIsDisabled
			
			function var35.onActivated()
				-- upvalues: getIsDisabled (ref), var14 (copy), p7 (ref), onActivated (ref)
				if not getIsDisabled() then
					var14(p7)
					onActivated()
				end
			end
			
			local var17 = p7[i]
			local hotkeyFunc = p7[i].hotkeyFunc
			local getIsDisabled_1 = p7[i].getIsDisabled
			
			function var36.hotkeyFunc(_, p8, _)
				-- upvalues: hotkeyFunc (ref), getIsDisabled_1 (ref), var14 (copy), p7 (ref)
				if p8 == Enum.UserInputState.Begin then
					local var18 = hotkeyFunc
					local var19 = getIsDisabled_1;
					(function()
						-- upvalues: var19 (ref), var14 (copy), p7 (copy), var18 (ref)
						if not var19() then
							var14(p7)
							var18()
						end
					end)()
				end
			end
			
			p7[i].hint.setGamepadButtonImage(userInputService:GetImageForKeyCode(p7[i].hint.gamepadButton))
		end
		p4.setAddMenuKeyBindings(function()
			-- upvalues: var13 (copy), p7 (ref)
			var13(p7)
		end)
		p4.setRemoveMenuKeyBindings(function()
			-- upvalues: var14 (copy), p7 (ref)
			var14(p7)
		end)
		
		return p7
	end, {})
	local var18 = reactModule.useMemo(function()
		-- upvalues: var15 (ref), var12 (ref)
		return var15(var12)
	end, { var12 })
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var18 (ref), menuButtonsDisconnectGamepadConnected (copy)
		local gamepadConnectedConnection = userInputService.GamepadConnected:Connect(function()
			-- upvalues: var18 (copy), userInputService (copy)
			for i = 1, #var18 do
				var18[i].hint.setGamepadButtonImage(userInputService:GetImageForKeyCode(var18[i].hint.gamepadButton))
			end
		end)
		
		return function()
			-- upvalues: menuButtonsDisconnectGamepadConnected (copy), gamepadConnectedConnection (ref)
			if menuButtonsDisconnectGamepadConnected then
				gamepadConnectedConnection:Disconnect()
			end
		end
	end, { var18 })
	
	return reactModule.createElement(view, {
		tag = {
			["size-full row align-y-center"] = true,
			["gap-small"] = not var1,
			["gap-xsmall"] = var1
		}
	}, createMenuButtons(var18, var11, var1))
end