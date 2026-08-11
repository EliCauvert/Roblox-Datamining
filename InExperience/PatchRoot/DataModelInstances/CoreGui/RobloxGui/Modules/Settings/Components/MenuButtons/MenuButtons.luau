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
local coreScriptsRoactCommonModule = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon)
local responsiveModule = require(corePackagesService.Workspace.Packages.Responsive)
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local menuButtonModule = require(script.Parent.MenuButton)
local useSignalState = signalsReactModule.useSignalState
local useLastInput = responsiveModule.useLastInput
local traversal = coreScriptsRoactCommonModule.Traversal
local view = foundationModule.View
local fIntRelocateMobileMenuButtonsVariantModule = require(robloxGui.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant)
local fFlagAddTraversalHistoryReactMenuButtonsModule = require(robloxGui.Modules.Settings.Flags.FFlagAddTraversalHistoryReactMenuButtons)
local fFlagGamepadIconSupportCheck = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagGamepadIconSupportCheck
local fFlagFixTraversalHistoryMenuFixesV3 = traversal.Flags.FFlagFixTraversalHistoryMenuFixesV3
local menuButtonsDisconnectGamepadConnected = game:DefineFastFlag("MenuButtonsDisconnectGamepadConnected", false)
local menuButtonsUseGreyResumeButton = game:DefineFastFlag("MenuButtonsUseGreyResumeButton", false)
local fFlagIEMFocusNavSupportNewButtonsModule = require(robloxGui.Modules.Settings.Flags.FFlagIEMFocusNavSupportNewButtons)

local function createMenuButtons(p0, p1, p2) --[[ line: 40 ]]
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

return function(p3) --[[ line: 80 | named "MenuButtons" ]]
	-- upvalues: reactModule (ref), utilityModule (ref), useSignalState (ref), fFlagFixTraversalHistoryMenuFixesV3 (ref), fFlagIEMFocusNavSupportNewButtonsModule (ref), useLocalization (ref), constantsModule (ref), useLastInput (ref), fFlagAddTraversalHistoryReactMenuButtonsModule (ref), menuButtonsUseGreyResumeButton (ref), fIntRelocateMobileMenuButtonsVariantModule (ref), contextActionService (ref), userInputService (ref), menuButtonsDisconnectGamepadConnected (ref), view (ref), createMenuButtons (ref)
	local var20, _ = reactModule.useState(utilityModule:IsSmallTouchScreen())
	local _ = useSignalState(p3.getCanRespawn)
	local var21 = if fFlagFixTraversalHistoryMenuFixesV3 then reactModule.useRef(nil) else nil
	local var22 = reactModule.useRef(nil)
	
	if fFlagIEMFocusNavSupportNewButtonsModule then
		reactModule.useEffect(function() --[[ line: 89 ]]
			-- upvalues: p3 (ref), var22 (ref)
			if p3.setResumeMenuButton then
				p3.setResumeMenuButton(var22.current)
			end
		end, { p3.setResumeMenuButton })
	end
	local var23, var24 = reactModule.useBinding("")
	local var25, var26 = reactModule.useBinding("")
	local var27, var28 = reactModule.useBinding("")
	local var29 = useLocalization({
		LeaveGame = constantsModule.LeaveGameLocalizedKey,
		Respawn = constantsModule.RespawnLocalizedKey,
		Resume = constantsModule.ResumeLocalizedKey
	})
	local var30 = useLastInput()
	local var31 = reactModule.useMemo(function() --[[ line: 107 ]]
		-- upvalues: var29 (ref), var23 (ref), var24 (ref), p3 (ref), constantsModule (copy), fFlagAddTraversalHistoryReactMenuButtonsModule (copy), fFlagFixTraversalHistoryMenuFixesV3 (copy), var21 (ref), var25 (ref), var26 (ref), var27 (ref), var28 (ref), menuButtonsUseGreyResumeButton (copy), fIntRelocateMobileMenuButtonsVariantModule (copy), fFlagIEMFocusNavSupportNewButtonsModule (copy), var22 (ref)
		return {
			{
				name = "LeaveGameButton",
				isEmphasized = false,
				text = var29.LeaveGame,
				hint = {
					keyboard = "L",
					keyboardButtonImage = "icons/controls/keys/key_l",
					gamepadButton = Enum.KeyCode.ButtonX,
					gamepadButtonImage = var23,
					setGamepadButtonImage = var24
				},
				getIsDisabled = function() --[[ line: 120 ]]
					return false
				end,
				onActivated = function() --[[ line: 123 ]]
					-- upvalues: p3 (copy), constantsModule (copy)
					p3.onLeaveGame(constantsModule.AnalyticsMenuButtonSource)
				end,
				hotkeys = { Enum.KeyCode.L, Enum.KeyCode.ButtonX },
				hotkeyFunc = function() --[[ line: 127 ]]
					-- upvalues: p3 (copy), constantsModule (copy)
					p3.onLeaveGame(constantsModule.AnalyticsMenuHotkeySource)
				end,
				addTraversalHistoryMenu = if fFlagAddTraversalHistoryReactMenuButtonsModule then true else nil,
				currentPageChangeSignal = if fFlagAddTraversalHistoryReactMenuButtonsModule then p3.currentPageChangeSignal else nil,
				buttonRef = if fFlagFixTraversalHistoryMenuFixesV3 then var21 else nil
			},
			{
				name = "ResetButton",
				isEmphasized = false,
				text = var29.Respawn,
				hint = {
					keyboard = "R",
					keyboardButtonImage = "icons/controls/keys/key_r",
					gamepadButton = Enum.KeyCode.ButtonY,
					gamepadButtonImage = var25,
					setGamepadButtonImage = var26
				},
				getIsDisabled = function() --[[ line: 145 ]]
					-- upvalues: p3 (copy)
					return not p3.getCanRespawn(false)
				end,
				onActivated = function() --[[ line: 148 ]]
					-- upvalues: p3 (copy), constantsModule (copy)
					p3.onRespawn(constantsModule.AnalyticsMenuButtonSource)
				end,
				hotkeys = { Enum.KeyCode.R, Enum.KeyCode.ButtonY },
				hotkeyFunc = function() --[[ line: 152 ]]
					-- upvalues: p3 (copy), constantsModule (copy)
					p3.onRespawn(constantsModule.AnalyticsMenuHotkeySource)
				end
			},
			{
				name = "ResumeButton",
				text = var29.Resume,
				hint = {
					keyboard = "ESC",
					keyboardButtonImage = "icons/controls/keys/key_esc",
					gamepadButton = Enum.KeyCode.ButtonStart,
					gamepadButtonImage = var27,
					setGamepadButtonImage = var28
				},
				isEmphasized = if menuButtonsUseGreyResumeButton then false else not (fIntRelocateMobileMenuButtonsVariantModule == 1),
				getIsDisabled = function() --[[ line: 167 ]]
					return false
				end,
				onActivated = function() --[[ line: 170 ]]
					-- upvalues: p3 (copy), constantsModule (copy)
					p3.onResume(constantsModule.AnalyticsMenuButtonSource)
				end,
				hotkeyFunc = function() --[[ line: 173 ]]
					-- upvalues: p3 (copy), constantsModule (copy)
					p3.onResume(constantsModule.AnalyticsMenuHotkeySource)
				end,
				hotkeys = { Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart },
				buttonRef = if fFlagIEMFocusNavSupportNewButtonsModule then var22 else nil
			}
		}
	end, {
		var29,
		p3.onLeaveGame,
		p3.onRespawn,
		p3.onResume,
		p3.getCanRespawn
	})
	local var32 = reactModule.useCallback(function(p4) --[[ line: 182 ]]
		-- upvalues: p3 (ref), contextActionService (copy)
		if not p3.getVisibility() then return end
		for i = 1, #p4 do
			if p4[i].hotkeyFunc ~= nil then
				contextActionService:BindCoreAction(p4[i].name, p4[i].hotkeyFunc, false, unpack(p4[i].hotkeys))
			end
		end
	end, {})
	local var33 = reactModule.useCallback(function(p5) --[[ line: 199 ]]
		-- upvalues: contextActionService (copy)
		for i = 1, #p5 do
			contextActionService:UnbindCoreAction(p5[i].name)
		end
	end, {})
	local var34 = reactModule.useCallback(function(p6) --[[ line: 205 ]]
		-- upvalues: var33 (ref), userInputService (copy), p3 (ref), var32 (ref)
		local _ = function(p7, p8) --[[ line: 206 ]]
			-- upvalues: var33 (copy), p6 (ref)
			return function() --[[ line: 207 ]]
				-- upvalues: p8 (ref), var33 (copy), p6 (copy), p7 (ref)
				if not p8() then
					var33(p6)
					p7()
				end
			end
		end
		
		local _ = function(p9, p10) --[[ line: 215 ]]
			-- upvalues: var33 (copy), p6 (ref)
			return function(_, p11, _) --[[ line: 216 ]]
				-- upvalues: p9 (ref), p10 (ref), var33 (copy), p6 (copy)
				if p11 == Enum.UserInputState.Begin then
					local var38 = p9
					local var39 = p10;
					(function() --[[ line: 207 ]]
						-- upvalues: var39 (ref), var33 (copy), p6 (copy), var38 (ref)
						if not var39() then
							var33(p6)
							var38()
						end
					end)()
				end
			end
		end
		
		for i = 1, #p6 do
			local var36 = p6[i]
			local onActivated = p6[i].onActivated
			local getIsDisabled = p6[i].getIsDisabled
			
			function var36.onActivated() --[[ line: 207 ]]
				-- upvalues: getIsDisabled (ref), var33 (copy), p6 (ref), onActivated (ref)
				if not getIsDisabled() then
					var33(p6)
					onActivated()
				end
			end
			
			local var37 = p6[i]
			local hotkeyFunc = p6[i].hotkeyFunc
			local getIsDisabled_1 = p6[i].getIsDisabled
			
			function var37.hotkeyFunc(_, p12, _) --[[ line: 216 ]]
				-- upvalues: hotkeyFunc (ref), getIsDisabled_1 (ref), var33 (copy), p6 (ref)
				if p12 == Enum.UserInputState.Begin then
					local var38 = hotkeyFunc
					local var39 = getIsDisabled_1;
					(function() --[[ line: 207 ]]
						-- upvalues: var39 (ref), var33 (copy), p6 (copy), var38 (ref)
						if not var39() then
							var33(p6)
							var38()
						end
					end)()
				end
			end
			
			p6[i].hint.setGamepadButtonImage(userInputService:GetImageForKeyCode(p6[i].hint.gamepadButton))
		end
		p3.setAddMenuKeyBindings(function() --[[ line: 231 ]]
			-- upvalues: var32 (copy), p6 (ref)
			var32(p6)
		end)
		p3.setRemoveMenuKeyBindings(function() --[[ line: 234 ]]
			-- upvalues: var33 (copy), p6 (ref)
			var33(p6)
		end)
		
		return p6
	end, {})
	local var35 = reactModule.useMemo(function() --[[ line: 241 ]]
		-- upvalues: var34 (ref), var31 (ref)
		return var34(var31)
	end, { var31 })
	reactModule.useEffect(function() --[[ line: 245 ]]
		-- upvalues: userInputService (copy), var35 (ref), menuButtonsDisconnectGamepadConnected (copy)
		local gamepadConnectedConnection = userInputService.GamepadConnected:Connect(function() --[[ line: 246 ]]
			-- upvalues: var35 (copy), userInputService (copy)
			for i = 1, #var35 do
				var35[i].hint.setGamepadButtonImage(userInputService:GetImageForKeyCode(var35[i].hint.gamepadButton))
			end
		end)
		
		return function() --[[ line: 254 ]]
			-- upvalues: menuButtonsDisconnectGamepadConnected (copy), gamepadConnectedConnection (ref)
			if menuButtonsDisconnectGamepadConnected then
				gamepadConnectedConnection:Disconnect()
			end
		end
	end, { var35 })
	
	return reactModule.createElement(view, {
		tag = {
			["size-full row align-y-center"] = true,
			["gap-small"] = not var20,
			["gap-xsmall"] = var20
		}
	}, createMenuButtons(var35, var30, var20))
end