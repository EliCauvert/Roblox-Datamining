local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local corePackagesService = game:GetService("CorePackages")
local gamepadService = game:GetService("GamepadService")
local gameSettings = UserSettings().GameSettings
local chrome = script:FindFirstAncestor("Chrome")
local chromeShared = script:FindFirstAncestor("ChromeShared")
local focusSelectExpChatModule = require(chromeShared.Utility.FocusSelectExpChat)
local serviceModule = require(chromeShared.Service)
local guiService = game:GetService("GuiService")
local constantsModule = require(chromeShared.Unibar.Constants)
local respawnUtilsModule = require(chrome.Integrations.RespawnUtils)
local focusUtils = require(corePackagesService.Workspace.Packages.Chrome).FocusUtils
local focusNavigationStore = require(corePackagesService.Workspace.Packages.ExpChat).Stores.GetFocusNavigationStore(false)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagChromeShortcutAddRespawnLeaveToIEM = sharedFlagsModule.FFlagChromeShortcutAddRespawnLeaveToIEM
local fFlagChromeShortcutRemoveLeaveOnRespawnPage = sharedFlagsModule.FFlagChromeShortcutRemoveLeaveOnRespawnPage
local fFlagChromeShortcutRemoveRespawnOnLeavePage = sharedFlagsModule.FFlagChromeShortcutRemoveRespawnOnLeavePage
local fFlagConsoleChatUseChromeFocusUtils = sharedFlagsModule.FFlagConsoleChatUseChromeFocusUtils
local fFlagChromeShortcutChatOpenKeyboard = sharedFlagsModule.FFlagChromeShortcutChatOpenKeyboard
local fFlagAddSwitchTabHintsToIEM = sharedFlagsModule.FFlagAddSwitchTabHintsToIEM
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet
local fFlagSideSheetFocusNav = sharedFlagsModule.FFlagSideSheetFocusNav
local flags = chrome.Flags
local fFlagRespawnChromeShortcutTelemetryModule = require(flags.FFlagRespawnChromeShortcutTelemetry)
local fFlagLeaveActionChromeShortcutTelemetryModule = require(flags.FFlagLeaveActionChromeShortcutTelemetry)
local fFlagLeaveChromeShortcutTelemetryModule = require(flags.FFlagLeaveChromeShortcutTelemetry)
local fFlagRespawnActionChromeShortcutTelemetryModule = require(flags.FFlagRespawnActionChromeShortcutTelemetry)
local flagsModule = require(chromeShared.Flags)
local fFlagRemoveLeaveShortcutFromLeaveConfirm = flagsModule.FFlagRemoveLeaveShortcutFromLeaveConfirm
local fFlagRemoveRespawnShortcutFromRespawnConfirmation = flagsModule.FFlagRemoveRespawnShortcutFromRespawnConfirmation
local var17 = if fFlagEnableConsoleExpControls then require(robloxGui.Modules.ChatSelector) else nil
local leaveGameModule = require(robloxGui.Modules.Settings.leaveGame)
local inExperienceSideSheetModule = require(corePackagesService.Workspace.Packages.InExperienceSideSheet)
local getSideSheetVisibility = inExperienceSideSheetModule.getSideSheetVisibility
local toggleSideSheet = inExperienceSideSheetModule.toggleSideSheet
local fFlagShowUnibarOnVirtualCursor = sharedFlagsModule.FFlagShowUnibarOnVirtualCursor
local t = {
	keyCode = Enum.KeyCode.ButtonX,
	activated = function()
		-- upvalues: robloxGui (ref), fFlagLeaveActionChromeShortcutTelemetryModule (ref), leaveGameModule (ref), fFlagLeaveChromeShortcutTelemetryModule (ref), fFlagConsoleChatUseChromeFocusUtils (ref), focusNavigationStore (ref), fFlagRespawnChromeShortcutTelemetryModule (ref)
		local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
		local leaveGamePage = settingsHubModule.Instance.LeaveGamePage
		
		local function _()
			-- upvalues: settingsHubModule (ref), leaveGamePage (ref)
			settingsHubModule.Instance:SwitchToPage(leaveGamePage, true, nil, nil, nil, { used_shortcut = true })
		end
		
		if settingsHubModule:GetVisibility() then
			if settingsHubModule.Instance.Pages.CurrentPage == leaveGamePage then
				if fFlagLeaveActionChromeShortcutTelemetryModule then
					leaveGameModule(true, { telemetryFields = { used_shortcut = true } })
					
					return
				end
				leaveGameModule(true)
				
				return
			elseif fFlagLeaveChromeShortcutTelemetryModule then
				settingsHubModule.Instance:SwitchToPage(leaveGamePage, true, nil, nil, nil, { used_shortcut = true })
				
				return
			end
			settingsHubModule:SwitchToPage(leaveGamePage, true)
			
			return
		elseif fFlagConsoleChatUseChromeFocusUtils and focusNavigationStore.getChatInputBarFocused(false) then
			focusNavigationStore.unfocusChatInputBar()
		end
		if fFlagRespawnChromeShortcutTelemetryModule then
			settingsHubModule:SetVisibility(true)
			settingsHubModule.Instance:SwitchToPage(leaveGamePage, true, nil, nil, nil, { used_shortcut = true })
			
			return
		end
		settingsHubModule:SetVisibility(true, false, leaveGamePage)
	end
}
local t_1 = {
	integration = "respawn",
	keyCode = Enum.KeyCode.ButtonY,
	activated = function()
		-- upvalues: robloxGui (ref), fFlagRespawnActionChromeShortcutTelemetryModule (ref), fFlagConsoleChatUseChromeFocusUtils (ref), focusNavigationStore (ref), fFlagRespawnChromeShortcutTelemetryModule (ref), respawnUtilsModule (ref), serviceModule (ref)
		local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
		
		if settingsHubModule:GetVisibility() and settingsHubModule.Instance.Pages.CurrentPage == settingsHubModule.Instance.ResetCharacterPage then
			if fFlagRespawnActionChromeShortcutTelemetryModule then
				settingsHubModule.Instance.ResetCharacterPage.ResetFunction({ resetTelemetryFields = { used_shortcut = true } })
				
				return
			end
			settingsHubModule.Instance.ResetCharacterPage.ResetFunction()
			
			return
		elseif fFlagConsoleChatUseChromeFocusUtils and focusNavigationStore.getChatInputBarFocused(false) then
			focusNavigationStore.unfocusChatInputBar()
		end
		if fFlagRespawnChromeShortcutTelemetryModule then
			respawnUtilsModule.respawnPage({ usedShortcut = true })
			
			return
		end
		serviceModule:activate("respawn")
	end
}

local function activateBack()
	-- upvalues: fFlagEnableConsoleExpControls (ref), focusUtils (ref), fFlagConsoleChatUseChromeFocusUtils (ref), serviceModule (ref), robloxGui (ref), guiService (ref), focusNavigationStore (ref)
	local var25 = fFlagEnableConsoleExpControls and focusUtils.MenuIconSelectedSignal:get()
	local var26 = not fFlagConsoleChatUseChromeFocusUtils or serviceModule:inFocusNav():get()
	local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
	
	if settingsHubModule:GetVisibility() then
		settingsHubModule.Instance:PopMenu(false, true)
		
		if not settingsHubModule:GetVisibility() then
			serviceModule:selectMenuIcon()
		end
		return Enum.ContextActionResult.Sink
	elseif var26 or var25 then
		local var28 = serviceModule:currentSubMenu():get()
		
		if var28 then
			serviceModule:toggleSubMenu(var28)
			serviceModule:setSelected(var28)
		else
			serviceModule:disableFocusNav()
			serviceModule:setShortcutBar(nil)
			guiService.SelectedCoreObject = nil
			
			if fFlagEnableConsoleExpControls then
				focusUtils.MenuIconSelectedSignal:set(false)
			end
		end
		return Enum.ContextActionResult.Sink
	elseif fFlagConsoleChatUseChromeFocusUtils and focusNavigationStore.getChatInputBarFocused(false) then
		focusUtils.FocusOnChrome(function()
			-- upvalues: focusNavigationStore (copy)
			focusNavigationStore.unfocusChatInputBar()
		end, "chat")
		
		return Enum.ContextActionResult.Sink
	end
end

function registerShortcuts()
	-- upvalues: serviceModule (ref), t (ref), t_1 (ref), fFlagChromeShortcutAddRespawnLeaveToIEM (ref), fFlagChromeShortcutChatOpenKeyboard (ref), fFlagEnableConsoleExpControls (ref), var17 (ref), fFlagConsoleChatUseChromeFocusUtils (ref), focusNavigationStore (ref), focusUtils (ref), gameSettings (ref), focusSelectExpChatModule (ref), robloxGui (ref), fFlagEnableSideSheet (ref), fFlagSideSheetFocusNav (ref), getSideSheetVisibility (ref), toggleSideSheet (ref), activateBack (ref), fFlagRemoveLeaveShortcutFromLeaveConfirm (ref), fFlagRemoveRespawnShortcutFromRespawnConfirmation (ref), guiService (ref), gamepadService (ref)
	serviceModule:registerShortcut({
		id = "leave",
		label = "CoreScripts.TopBar.Leave",
		integration = nil,
		actionName = "UnibarGamepadLeaveGame",
		keyCode = t.keyCode,
		activated = t.activated
	})
	serviceModule:registerShortcut({
		id = "respawn",
		label = "CoreScripts.InGameMenu.QuickActions.Respawn",
		actionName = "UnibarGamepadRespawn",
		keyCode = t_1.keyCode,
		integration = t_1.integration,
		activated = t_1.activated
	})
	
	if fFlagChromeShortcutAddRespawnLeaveToIEM then
		serviceModule:registerShortcut({
			id = "leave_in_experience_menu",
			label = nil,
			integration = nil,
			actionName = "IEMGamepadLeaveGame",
			keyCode = t.keyCode,
			activated = t.activated
		})
		serviceModule:registerShortcut({
			id = "respawn_in_experience_menu",
			label = nil,
			actionName = "IEMGamepadRespawn",
			keyCode = t_1.keyCode,
			integration = t_1.integration,
			activated = t_1.activated
		})
	end
	serviceModule:registerShortcut({
		id = "chat",
		label = "CoreScripts.TopBar.Chat",
		integration = "chat",
		actionName = "UnibarGamepadChat",
		keyCode = if fFlagChromeShortcutChatOpenKeyboard then Enum.KeyCode.ButtonL2 else Enum.KeyCode.ButtonR1,
		activated = if fFlagEnableConsoleExpControls then function()
			-- upvalues: var17 (copy), fFlagChromeShortcutChatOpenKeyboard (copy), fFlagConsoleChatUseChromeFocusUtils (copy), focusNavigationStore (copy), focusUtils (copy), gameSettings (copy), focusSelectExpChatModule (copy)
			local visibility = var17:GetVisibility()
			
			if fFlagChromeShortcutChatOpenKeyboard then
				if fFlagConsoleChatUseChromeFocusUtils and focusNavigationStore.getChatInputBarFocused(false) then
					focusUtils.FocusOnChrome(function()
						-- upvalues: focusNavigationStore (copy)
						focusNavigationStore.unfocusChatInputBar()
					end, "chat")
					var17:SetVisible(false)
					gameSettings.ChatVisible = false
					
					return
				end
				var17:SetVisible(true)
				gameSettings.ChatVisible = true
				var17:FocusChatBar()
				focusSelectExpChatModule("chat")
				
				return
			else
				var17:SetVisible(not visibility)
				
				if not visibility then
					focusSelectExpChatModule("chat")
					
					return
				elseif fFlagConsoleChatUseChromeFocusUtils and focusNavigationStore.getChatInputBarFocused(false) then
					focusUtils.FocusOnChrome(function()
						-- upvalues: focusNavigationStore (copy)
						focusNavigationStore.unfocusChatInputBar()
					end, "chat")
				end
			end
		end else nil
	})
	serviceModule:registerShortcut({
		id = "tiltMenu",
		label = "CoreScripts.TopBar.Menu",
		integration = nil,
		actionName = "UnibarGamepadMenu",
		keyCode = Enum.KeyCode.ButtonR2,
		activated = function()
			-- upvalues: robloxGui (copy), fFlagConsoleChatUseChromeFocusUtils (copy), focusNavigationStore (copy), fFlagEnableSideSheet (copy), fFlagSideSheetFocusNav (copy), getSideSheetVisibility (copy), toggleSideSheet (copy)
			local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
			
			if settingsHubModule:GetVisibility() then
				settingsHubModule:SetVisibility(false)
				
				return
			elseif fFlagConsoleChatUseChromeFocusUtils and focusNavigationStore.getChatInputBarFocused(false) then
				focusNavigationStore.unfocusChatInputBar()
			end
			if fFlagEnableSideSheet and fFlagSideSheetFocusNav then
				if getSideSheetVisibility() then
					return
				else
					toggleSideSheet(true)
					
					return
				end
			else
				settingsHubModule:SetVisibility(true)
			end
		end
	})
	serviceModule:registerShortcut({
		id = "back",
		label = "CoreScripts.TopBar.Back",
		integration = nil,
		actionName = "UnibarGamepadBack",
		keyCode = Enum.KeyCode.ButtonB,
		displayPriority = if fFlagEnableConsoleExpControls then -10 else nil,
		activated = activateBack
	})
	
	if fFlagRemoveLeaveShortcutFromLeaveConfirm or fFlagRemoveRespawnShortcutFromRespawnConfirmation then
		serviceModule:registerShortcut({
			id = "back-invisible",
			label = nil,
			actionName = "UnibarGamepadBackInvisible",
			keyCode = Enum.KeyCode.ButtonB,
			activated = activateBack
		})
	end
	serviceModule:registerShortcut({
		id = "close",
		label = nil,
		actionName = "UnibarGamepadClose",
		keyCode = Enum.KeyCode.ButtonStart,
		activated = function()
			-- upvalues: robloxGui (copy), serviceModule (copy), guiService (copy)
			require(robloxGui.Modules.Settings.SettingsHub):SetVisibility(false)
			serviceModule:disableFocusNav()
			serviceModule:setShortcutBar(nil)
			guiService.SelectedCoreObject = nil
		end
	})
	serviceModule:registerShortcut({
		id = "virtualCursor",
		label = nil,
		actionName = "VirtualCursorShortcut",
		keyCode = Enum.KeyCode.ButtonSelect,
		activated = function()
			-- upvalues: serviceModule (copy), guiService (copy), gamepadService (copy)
			serviceModule:disableFocusNav()
			serviceModule:setShortcutBar(nil)
			guiService.SelectedCoreObject = nil
			gamepadService.GamepadCursorEnabled = true
		end
	})
	serviceModule:registerShortcut({
		id = "tiltMenuPreviousTab",
		label = "CoreScripts.InGameMenu.Controls.PreviousTab",
		integration = nil,
		actionName = nil,
		activated = nil,
		keyCode = Enum.KeyCode.ButtonL1
	})
	serviceModule:registerShortcut({
		id = "tiltMenuNextTab",
		label = "CoreScripts.InGameMenu.Controls.NextTab",
		integration = nil,
		actionName = nil,
		activated = nil,
		keyCode = Enum.KeyCode.ButtonR1
	})
end

function configureShortcutBars()
	-- upvalues: serviceModule (ref), constantsModule (ref), fFlagShowUnibarOnVirtualCursor (ref), fFlagAddSwitchTabHintsToIEM (ref), fFlagChromeShortcutAddRespawnLeaveToIEM (ref), fFlagChromeShortcutRemoveRespawnOnLeavePage (ref), fFlagChromeShortcutRemoveLeaveOnRespawnPage (ref), fFlagRemoveLeaveShortcutFromLeaveConfirm (ref), fFlagRemoveRespawnShortcutFromRespawnConfirmation (ref)
	serviceModule:configureShortcutBar(constantsModule.UNIBAR_SHORTCUTBAR_ID, if fFlagShowUnibarOnVirtualCursor then {
		"leave", "respawn", "chat", "tiltMenu", "back", "virtualCursor"
	} else {
		"leave",
		"respawn",
		"chat",
		"tiltMenu",
		"back"
	})
	serviceModule:configureShortcutBar(constantsModule.TILTMENU_SHORTCUTBAR_ID, if fFlagAddSwitchTabHintsToIEM then {
		"leave_in_experience_menu",
		"respawn_in_experience_menu",
		"back-invisible",
		"close"
	} elseif fFlagChromeShortcutAddRespawnLeaveToIEM then {
		"leave_in_experience_menu", "respawn_in_experience_menu",
		"tiltMenuPreviousTab", "tiltMenuNextTab", "back", "close"
	} else {
		"tiltMenuPreviousTab",
		"tiltMenuNextTab",
		"back",
		"close"
	})
	
	if not fFlagChromeShortcutRemoveRespawnOnLeavePage or not fFlagChromeShortcutRemoveLeaveOnRespawnPage then
		serviceModule:configureShortcutBar(constantsModule.TILTMENU_DIALOG_SHORTCUTBAR_ID, { "leave", "respawn", "back", "close" })
	end
	if fFlagRemoveLeaveShortcutFromLeaveConfirm then
		serviceModule:configureShortcutBar(constantsModule.TILTMENU_LEAVE_DIALOG_SHORTCUTBAR_ID, { "back-invisible", "close" })
	elseif fFlagChromeShortcutRemoveRespawnOnLeavePage then
		serviceModule:configureShortcutBar(constantsModule.TILTMENU_LEAVE_DIALOG_SHORTCUTBAR_ID, { "leave", "back", "close" })
	end
	if fFlagRemoveRespawnShortcutFromRespawnConfirmation then
		serviceModule:configureShortcutBar(constantsModule.TILTMENU_RESPAWN_DIALOG_SHORTCUTBAR_ID, { "back-invisible", "close" })
		
		return
	elseif fFlagChromeShortcutRemoveLeaveOnRespawnPage then
		serviceModule:configureShortcutBar(constantsModule.TILTMENU_RESPAWN_DIALOG_SHORTCUTBAR_ID, { "respawn", "back", "close" })
	end
end

return function()
	registerShortcuts()
	configureShortcutBars()
end