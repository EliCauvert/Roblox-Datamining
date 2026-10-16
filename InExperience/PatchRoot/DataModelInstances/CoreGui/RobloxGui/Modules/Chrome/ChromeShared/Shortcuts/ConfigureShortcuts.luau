local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local CorePackages = game:GetService("CorePackages")
local GamepadService = game:GetService("GamepadService")
local GameSettings = UserSettings().GameSettings
local Chrome = script:FindFirstAncestor("Chrome")
local ChromeShared = script:FindFirstAncestor("ChromeShared")
local FocusSelectExpChatModule = require(ChromeShared.Utility.FocusSelectExpChat)
local ServiceModule = require(ChromeShared.Service)
local GuiService = game:GetService("GuiService")
local ConstantsModule = require(ChromeShared.Unibar.Constants)
local RespawnUtilsModule = require(Chrome.Integrations.RespawnUtils)
local FocusUtils = require(CorePackages.Workspace.Packages.Chrome).FocusUtils
local FocusNavigationStore = require(CorePackages.Workspace.Packages.ExpChat).Stores.GetFocusNavigationStore(false)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagChromeShortcutAddRespawnLeaveToIEM = SharedFlagsModule.FFlagChromeShortcutAddRespawnLeaveToIEM
local FFlagChromeShortcutRemoveLeaveOnRespawnPage = SharedFlagsModule.FFlagChromeShortcutRemoveLeaveOnRespawnPage
local FFlagChromeShortcutRemoveRespawnOnLeavePage = SharedFlagsModule.FFlagChromeShortcutRemoveRespawnOnLeavePage
local FFlagConsoleChatUseChromeFocusUtils = SharedFlagsModule.FFlagConsoleChatUseChromeFocusUtils
local FFlagChromeShortcutChatOpenKeyboard = SharedFlagsModule.FFlagChromeShortcutChatOpenKeyboard
local FFlagAddSwitchTabHintsToIEM = SharedFlagsModule.FFlagAddSwitchTabHintsToIEM
local IsSideSheetEnabledModule = require(CorePackages.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local FFlagSideSheetFocusNav = SharedFlagsModule.FFlagSideSheetFocusNav
local Flags = Chrome.Flags
local FFlagRespawnChromeShortcutTelemetryModule = require(Flags.FFlagRespawnChromeShortcutTelemetry)
local FFlagLeaveActionChromeShortcutTelemetryModule = require(Flags.FFlagLeaveActionChromeShortcutTelemetry)
local FFlagLeaveChromeShortcutTelemetryModule = require(Flags.FFlagLeaveChromeShortcutTelemetry)
local FFlagRespawnActionChromeShortcutTelemetryModule = require(Flags.FFlagRespawnActionChromeShortcutTelemetry)
local FlagsModule = require(ChromeShared.Flags)
local FFlagRemoveLeaveShortcutFromLeaveConfirm = FlagsModule.FFlagRemoveLeaveShortcutFromLeaveConfirm
local FFlagRemoveRespawnShortcutFromRespawnConfirmation = FlagsModule.FFlagRemoveRespawnShortcutFromRespawnConfirmation
local ChatSelectorModule = if FFlagEnableConsoleExpControls then require(RobloxGui.Modules.ChatSelector) else nil
local LeaveGameModule = require(RobloxGui.Modules.Settings.leaveGame)
local InExperienceSideSheetModule = require(CorePackages.Workspace.Packages.InExperienceSideSheet)
local GetSideSheetVisibilityFunction = InExperienceSideSheetModule.getSideSheetVisibility
local ToggleSideSheetFunction = InExperienceSideSheetModule.toggleSideSheet
local FFlagShowUnibarOnVirtualCursor = SharedFlagsModule.FFlagShowUnibarOnVirtualCursor
local config = {
	keyCode = Enum.KeyCode.ButtonX,
	activated = function() --[[ Line: 51 ]]
		-- upvalues: RobloxGui (copy), FFlagLeaveActionChromeShortcutTelemetryModule (copy), LeaveGameModule (copy), FFlagLeaveChromeShortcutTelemetryModule (copy), FFlagConsoleChatUseChromeFocusUtils (copy), FocusNavigationStore (copy), FFlagRespawnChromeShortcutTelemetryModule (copy)
		local SettingsHubModule = require(RobloxGui.Modules.Settings.SettingsHub)
		local LeaveGamePage = SettingsHubModule.Instance.LeaveGamePage
		
		local function _() --[[ Line: 54 | Named "switchToLeavePage" ]]
			-- upvalues: SettingsHubModule (copy), LeaveGamePage (copy)
			SettingsHubModule.Instance:SwitchToPage(LeaveGamePage, true, nil, nil, nil, { used_shortcut = true })
		end
		
		if not SettingsHubModule:GetVisibility() then
			if FFlagConsoleChatUseChromeFocusUtils and FocusNavigationStore.getChatInputBarFocused(false) then
				FocusNavigationStore.unfocusChatInputBar()
			end
			if FFlagRespawnChromeShortcutTelemetryModule then
				SettingsHubModule:SetVisibility(true)
				SettingsHubModule.Instance:SwitchToPage(LeaveGamePage, true, nil, nil, nil, { used_shortcut = true })
				
				return
			else
				SettingsHubModule:SetVisibility(true, false, LeaveGamePage)
				
				return
			end
		elseif SettingsHubModule.Instance.Pages.CurrentPage == LeaveGamePage then
			if FFlagLeaveActionChromeShortcutTelemetryModule then
				LeaveGameModule(true, { telemetryFields = { used_shortcut = true } })
				
				return
			else
				LeaveGameModule(true)
				
				return
			end
		elseif FFlagLeaveChromeShortcutTelemetryModule then
			SettingsHubModule.Instance:SwitchToPage(LeaveGamePage, true, nil, nil, nil, { used_shortcut = true })
			
			return
		else
			SettingsHubModule:SwitchToPage(LeaveGamePage, true)
		end
	end
}
local config1 = {
	integration = "respawn",
	keyCode = Enum.KeyCode.ButtonY,
	activated = function() --[[ Line: 98 ]]
		-- upvalues: RobloxGui (copy), FFlagRespawnActionChromeShortcutTelemetryModule (copy), FFlagConsoleChatUseChromeFocusUtils (copy), FocusNavigationStore (copy), FFlagRespawnChromeShortcutTelemetryModule (copy), RespawnUtilsModule (copy), ServiceModule (copy)
		local SettingsHubModule = require(RobloxGui.Modules.Settings.SettingsHub)
		
		if not SettingsHubModule:GetVisibility() or SettingsHubModule.Instance.Pages.CurrentPage ~= SettingsHubModule.Instance.ResetCharacterPage then
			if FFlagConsoleChatUseChromeFocusUtils and FocusNavigationStore.getChatInputBarFocused(false) then
				FocusNavigationStore.unfocusChatInputBar()
			end
			if FFlagRespawnChromeShortcutTelemetryModule then
				RespawnUtilsModule.respawnPage({ usedShortcut = true })
				
				return
			else
				ServiceModule:activate("respawn")
				
				return
			end
		elseif FFlagRespawnActionChromeShortcutTelemetryModule then
			SettingsHubModule.Instance.ResetCharacterPage.ResetFunction({ resetTelemetryFields = { used_shortcut = true } })
			
			return
		else
			SettingsHubModule.Instance.ResetCharacterPage.ResetFunction()
		end
	end
}

local function activateBack() --[[ Line: 130 ]]
	-- upvalues: FFlagEnableConsoleExpControls (copy), FocusUtils (copy), FFlagConsoleChatUseChromeFocusUtils (copy), ServiceModule (copy), RobloxGui (copy), GuiService (copy), FocusNavigationStore (copy)
	local GetResult = FFlagEnableConsoleExpControls and FocusUtils.MenuIconSelectedSignal:get()
	local NoFFlagConsoleChatUseChromeFocusUtils = not FFlagConsoleChatUseChromeFocusUtils or ServiceModule:inFocusNav():get()
	local SettingsHubModule = require(RobloxGui.Modules.Settings.SettingsHub)
	
	if SettingsHubModule:GetVisibility() then
		SettingsHubModule.Instance:PopMenu(false, true)
		
		if not SettingsHubModule:GetVisibility() then
			ServiceModule:selectMenuIcon()
		end
		return Enum.ContextActionResult.Sink
	elseif NoFFlagConsoleChatUseChromeFocusUtils or GetResult then
		local GetResult1 = ServiceModule:currentSubMenu():get()
		
		if GetResult1 then
			ServiceModule:toggleSubMenu(GetResult1)
			ServiceModule:setSelected(GetResult1)
		else
			ServiceModule:disableFocusNav()
			ServiceModule:setShortcutBar(nil)
			GuiService.SelectedCoreObject = nil
			
			if FFlagEnableConsoleExpControls then
				FocusUtils.MenuIconSelectedSignal:set(false)
			end
		end
		return Enum.ContextActionResult.Sink
	elseif not FFlagConsoleChatUseChromeFocusUtils or not FocusNavigationStore.getChatInputBarFocused(false) then return end
	FocusUtils.FocusOnChrome(function() --[[ Line: 155 ]]
		-- upvalues: FocusNavigationStore (upval)
		FocusNavigationStore.unfocusChatInputBar()
	end, "chat")
	
	return Enum.ContextActionResult.Sink
end

function registerShortcuts() --[[ Line: 163 ]]
	-- upvalues: ServiceModule (copy), config (copy), config1 (copy), FFlagChromeShortcutAddRespawnLeaveToIEM (copy), FFlagChromeShortcutChatOpenKeyboard (copy), FFlagEnableConsoleExpControls (copy), ChatSelectorModule (copy), FFlagConsoleChatUseChromeFocusUtils (copy), FocusNavigationStore (copy), FocusUtils (copy), GameSettings (copy), FocusSelectExpChatModule (copy), RobloxGui (copy), IsSideSheetEnabledModule (copy), FFlagSideSheetFocusNav (copy), GetSideSheetVisibilityFunction (copy), ToggleSideSheetFunction (copy), activateBack (copy), FFlagRemoveLeaveShortcutFromLeaveConfirm (copy), FFlagRemoveRespawnShortcutFromRespawnConfirmation (copy), GuiService (copy), GamepadService (copy)
	ServiceModule:registerShortcut({
		id = "leave",
		label = "CoreScripts.TopBar.Leave",
		integration = nil,
		actionName = "UnibarGamepadLeaveGame",
		keyCode = config.keyCode,
		activated = config.activated
	})
	ServiceModule:registerShortcut({
		id = "respawn",
		label = "CoreScripts.InGameMenu.QuickActions.Respawn",
		actionName = "UnibarGamepadRespawn",
		keyCode = config1.keyCode,
		integration = config1.integration,
		activated = config1.activated
	})
	
	if FFlagChromeShortcutAddRespawnLeaveToIEM then
		ServiceModule:registerShortcut({
			id = "leave_in_experience_menu",
			label = nil,
			integration = nil,
			actionName = "IEMGamepadLeaveGame",
			keyCode = config.keyCode,
			activated = config.activated
		})
		ServiceModule:registerShortcut({
			id = "respawn_in_experience_menu",
			label = nil,
			actionName = "IEMGamepadRespawn",
			keyCode = config1.keyCode,
			integration = config1.integration,
			activated = config1.activated
		})
	end
	ServiceModule:registerShortcut({
		id = "chat",
		label = "CoreScripts.TopBar.Chat",
		integration = "chat",
		actionName = "UnibarGamepadChat",
		keyCode = if FFlagChromeShortcutChatOpenKeyboard then Enum.KeyCode.ButtonL2 else Enum.KeyCode.ButtonR1,
		activated = if FFlagEnableConsoleExpControls then function() --[[ Line: 209 ]]
			-- upvalues: ChatSelectorModule (upval), FFlagChromeShortcutChatOpenKeyboard (upval), FFlagConsoleChatUseChromeFocusUtils (upval), FocusNavigationStore (upval), FocusUtils (upval), GameSettings (upval), FocusSelectExpChatModule (upval)
			local Visibility = ChatSelectorModule:GetVisibility()
			
			if not FFlagChromeShortcutChatOpenKeyboard then
				ChatSelectorModule:SetVisible(not Visibility)
				
				if not Visibility then
					FocusSelectExpChatModule("chat")
					
					return
				end
				if FFlagConsoleChatUseChromeFocusUtils and FocusNavigationStore.getChatInputBarFocused(false) then
					FocusUtils.FocusOnChrome(function() --[[ Line: 235 ]]
						-- upvalues: FocusNavigationStore (upval)
						FocusNavigationStore.unfocusChatInputBar()
					end, "chat")
				end
				return
			elseif FFlagConsoleChatUseChromeFocusUtils and FocusNavigationStore.getChatInputBarFocused(false) then
				FocusUtils.FocusOnChrome(function() --[[ Line: 216 ]]
					-- upvalues: FocusNavigationStore (upval)
					FocusNavigationStore.unfocusChatInputBar()
				end, "chat")
				ChatSelectorModule:SetVisible(false)
				GameSettings.ChatVisible = false
				
				return
			else
				ChatSelectorModule:SetVisible(true)
				GameSettings.ChatVisible = true
				ChatSelectorModule:FocusChatBar()
				FocusSelectExpChatModule("chat")
			end
		end else nil
	})
	ServiceModule:registerShortcut({
		id = "tiltMenu",
		label = "CoreScripts.TopBar.Menu",
		integration = nil,
		actionName = "UnibarGamepadMenu",
		keyCode = Enum.KeyCode.ButtonR2,
		activated = function() --[[ Line: 251 ]]
			-- upvalues: RobloxGui (upval), FFlagConsoleChatUseChromeFocusUtils (upval), FocusNavigationStore (upval), IsSideSheetEnabledModule (upval), FFlagSideSheetFocusNav (upval), GetSideSheetVisibilityFunction (upval), ToggleSideSheetFunction (upval)
			local SettingsHubModule = require(RobloxGui.Modules.Settings.SettingsHub)
			
			if SettingsHubModule:GetVisibility() then
				SettingsHubModule:SetVisibility(false)
				
				return
			end
			if FFlagConsoleChatUseChromeFocusUtils and FocusNavigationStore.getChatInputBarFocused(false) then
				FocusNavigationStore.unfocusChatInputBar()
			end
			if not IsSideSheetEnabledModule or not FFlagSideSheetFocusNav then
				SettingsHubModule:SetVisibility(true)
			elseif not GetSideSheetVisibilityFunction() then
				ToggleSideSheetFunction(true)
				
				return
			end
		end
	})
	ServiceModule:registerShortcut({
		id = "back",
		label = "CoreScripts.TopBar.Back",
		integration = nil,
		actionName = "UnibarGamepadBack",
		keyCode = Enum.KeyCode.ButtonB,
		displayPriority = if FFlagEnableConsoleExpControls then -10 else nil,
		activated = activateBack
	})
	
	if FFlagRemoveLeaveShortcutFromLeaveConfirm or FFlagRemoveRespawnShortcutFromRespawnConfirmation then
		ServiceModule:registerShortcut({
			id = "back-invisible",
			label = nil,
			actionName = "UnibarGamepadBackInvisible",
			keyCode = Enum.KeyCode.ButtonB,
			activated = activateBack
		})
	end
	ServiceModule:registerShortcut({
		id = "close",
		label = nil,
		actionName = "UnibarGamepadClose",
		keyCode = Enum.KeyCode.ButtonStart,
		activated = function() --[[ Line: 299 ]]
			-- upvalues: RobloxGui (upval), ServiceModule (upval), GuiService (upval)
			require(RobloxGui.Modules.Settings.SettingsHub):SetVisibility(false)
			ServiceModule:disableFocusNav()
			ServiceModule:setShortcutBar(nil)
			GuiService.SelectedCoreObject = nil
		end
	})
	ServiceModule:registerShortcut({
		id = "virtualCursor",
		label = nil,
		actionName = "VirtualCursorShortcut",
		keyCode = Enum.KeyCode.ButtonSelect,
		activated = function() --[[ Line: 315 ]]
			-- upvalues: ServiceModule (upval), GuiService (upval), GamepadService (upval)
			ServiceModule:disableFocusNav()
			ServiceModule:setShortcutBar(nil)
			GuiService.SelectedCoreObject = nil
			GamepadService.GamepadCursorEnabled = true
		end
	})
	ServiceModule:registerShortcut({
		id = "tiltMenuPreviousTab",
		label = "CoreScripts.InGameMenu.Controls.PreviousTab",
		integration = nil,
		actionName = nil,
		activated = nil,
		keyCode = Enum.KeyCode.ButtonL1
	})
	ServiceModule:registerShortcut({
		id = "tiltMenuNextTab",
		label = "CoreScripts.InGameMenu.Controls.NextTab",
		integration = nil,
		actionName = nil,
		activated = nil,
		keyCode = Enum.KeyCode.ButtonR1
	})
end

function configureShortcutBars() --[[ Line: 345 ]]
	-- upvalues: ServiceModule (copy), ConstantsModule (copy), FFlagShowUnibarOnVirtualCursor (copy), FFlagAddSwitchTabHintsToIEM (copy), FFlagChromeShortcutAddRespawnLeaveToIEM (copy), FFlagChromeShortcutRemoveRespawnOnLeavePage (copy), FFlagChromeShortcutRemoveLeaveOnRespawnPage (copy), FFlagRemoveLeaveShortcutFromLeaveConfirm (copy), FFlagRemoveRespawnShortcutFromRespawnConfirmation (copy)
	ServiceModule:configureShortcutBar(ConstantsModule.UNIBAR_SHORTCUTBAR_ID, if FFlagShowUnibarOnVirtualCursor then {
		"leave", "respawn", "chat", "tiltMenu", "back", "virtualCursor"
	} else {
		"leave",
		"respawn",
		"chat",
		"tiltMenu",
		"back"
	})
	ServiceModule:configureShortcutBar(ConstantsModule.TILTMENU_SHORTCUTBAR_ID, if FFlagAddSwitchTabHintsToIEM then {
		"leave_in_experience_menu",
		"respawn_in_experience_menu",
		"back-invisible",
		"close"
	} elseif FFlagChromeShortcutAddRespawnLeaveToIEM then {
		"leave_in_experience_menu", "respawn_in_experience_menu",
		"tiltMenuPreviousTab", "tiltMenuNextTab", "back", "close"
	} else {
		"tiltMenuPreviousTab",
		"tiltMenuNextTab",
		"back",
		"close"
	})
	
	if not FFlagChromeShortcutRemoveRespawnOnLeavePage or not FFlagChromeShortcutRemoveLeaveOnRespawnPage then
		ServiceModule:configureShortcutBar(ConstantsModule.TILTMENU_DIALOG_SHORTCUTBAR_ID, { "leave", "respawn", "back", "close" })
	end
	if FFlagRemoveLeaveShortcutFromLeaveConfirm then
		ServiceModule:configureShortcutBar(ConstantsModule.TILTMENU_LEAVE_DIALOG_SHORTCUTBAR_ID, { "back-invisible", "close" })
	elseif FFlagChromeShortcutRemoveRespawnOnLeavePage then
		ServiceModule:configureShortcutBar(ConstantsModule.TILTMENU_LEAVE_DIALOG_SHORTCUTBAR_ID, { "leave", "back", "close" })
	end
	if FFlagRemoveRespawnShortcutFromRespawnConfirmation then
		ServiceModule:configureShortcutBar(ConstantsModule.TILTMENU_RESPAWN_DIALOG_SHORTCUTBAR_ID, { "back-invisible", "close" })
		
		return
	end
	if FFlagChromeShortcutRemoveLeaveOnRespawnPage then
		ServiceModule:configureShortcutBar(ConstantsModule.TILTMENU_RESPAWN_DIALOG_SHORTCUTBAR_ID, { "respawn", "back", "close" })
	end
end

return function() --[[ Line: 403 ]]
	registerShortcuts()
	configureShortcutBars()
end