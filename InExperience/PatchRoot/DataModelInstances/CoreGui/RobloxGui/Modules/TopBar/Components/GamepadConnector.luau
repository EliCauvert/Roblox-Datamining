local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local coreGuiService = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local gamepadService = game:GetService("GamepadService")
local appCommonLibModule = require(corePackagesService.Workspace.Packages.AppCommonLib)
local responsiveModule = require(corePackagesService.Workspace.Packages.Responsive)
local inputModeStore = responsiveModule.GetInputModeStore(false)
local IXPServiceWrapper = require(corePackagesService.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local appUserLayers = require(corePackagesService.Workspace.Packages.ExperimentLayers).AppUserLayers
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local signalsModule = require(corePackagesService.Packages.Signals)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagShowUnibarOnVirtualCursor = sharedFlagsModule.FFlagShowUnibarOnVirtualCursor
local fFlagConsoleChatUseChromeFocusUtils = sharedFlagsModule.FFlagConsoleChatUseChromeFocusUtils
local fFlagExperienceMenuGamepadExposureEnabled = sharedFlagsModule.FFlagExperienceMenuGamepadExposureEnabled
local PTFBackButtonAlwaysAsButtonBEngineFeature = game:GetEngineFeature("PTFBackButtonAlwaysAsButtonB")
local fFlagAddNewPlayerListFocusNav = playerListModule.Flags.FFlagAddNewPlayerListFocusNav
local fFlagAddNewPlayerListMobileFocusNav = playerListModule.Flags.FFlagAddNewPlayerListMobileFocusNav
local parent = script.Parent.Parent.Parent
local topBar = parent.TopBar
local fFlagAddTopBarScrimModule = require(topBar.Flags.FFlagAddTopBarScrim)
local isSpatial = appCommonLibModule.isSpatial
local logGamepadOpenExperienceControlsMenu = require(topBar:WaitForChild("Telemetry")).LogGamepadOpenExperienceControlsMenu
local chrome = parent.Chrome
local var14 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local var15 = if var14 then require(chrome.Service) else nil
local focusUtils = require(corePackagesService.Workspace.Packages.Chrome).FocusUtils
local var16 = if var14 and fFlagEnableConsoleExpControls then require(chrome.ChromeShared.Service.ChromeUtils).ObservableValue else nil
local var17 = if var14 then require(chrome.ChromeShared.Unibar.Constants) else nil
local toastNotificationConstants = require(corePackagesService.Workspace.Packages.ToastNotification).ToastNotificationConstants
local constantsModule = require(script.Parent.Parent.Constants)
local settingsShowSignal = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local playerListManagerModule = require(parent.PlayerList.PlayerListManager)
local menuIconSelectedSignal = focusUtils.MenuIconSelectedSignal
local coreGuiCommonModule = require(corePackagesService.Workspace.Packages.CoreGuiCommon)
local fFlagEnableUISelector = coreGuiCommonModule.Flags.FFlagEnableUISelector
local var21 = if fFlagEnableUISelector then coreGuiCommonModule.Stores.GetUiSelectorSignalStore else nil
local focusNavigationStore = require(corePackagesService.Workspace.Packages.ExpChat).Stores.GetFocusNavigationStore(false)
local var23 = nil
local var24 = nil
local var25 = nil
task.spawn(function() --[[ line: 67 ]]
	-- upvalues: var23 (write), coreGuiService (ref), var24 (write), var25 (write)
	var23 = coreGuiService:WaitForChild("ToastNotification", 3)
	var24 = if var23 ~= nil then nil else var23:WaitForChild("ToastNotificationWrapper", 3)
	var25 = if var24 ~= nil then nil else var24:FindFirstChild("Toast", true)
end)

local function _() --[[ line: 125 | named "createSelectedCoreObject" ]]
	-- upvalues: var16 (ref), guiService (ref)
	local var27 = var16.new(guiService.SelectedCoreObject)
	guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ line: 127 ]]
		-- upvalues: var27 (ref), guiService (copy)
		var27:set(guiService.SelectedCoreObject)
	end)
	
	return var27
end

local _ = function(p0) --[[ line: 134 | named "isInputGamepad" ]]
	-- upvalues: constantsModule (ref)
	for i, v in constantsModule.GamepadInputTypes do
		if p0 == v then
			return true
		end
	end
	return false
end

local t = {}
t.__index = t

function t.new() --[[ line: 147 ]]
	-- upvalues: guiService (ref), var15 (ref), var14 (ref), fFlagEnableConsoleExpControls (ref), var16 (ref), userInputService (ref), constantsModule (ref), fFlagAddNewPlayerListFocusNav (ref), settingsShowSignal (ref), playerListManagerModule (ref), fFlagAddNewPlayerListMobileFocusNav (ref), isSpatial (ref), fFlagEnableUISelector (ref), var21 (ref), fFlagShowUnibarOnVirtualCursor (ref), gamepadService (ref), menuIconSelectedSignal (ref), fFlagAddTopBarScrimModule (ref), signalsModule (ref), t (ref)
	local var29
	local t_1 = {
		_loggedExperienceMenuGamepadExposure = false,
		_devSetCoreGuiNavEnabled = guiService.CoreGuiNavigationEnabled,
		_chromeFocused = if var15 then var15:inFocusNav() else false,
		_lastMenuButtonPress = 0,
		_dismissFocusConnections = {}
	}
	
	if var14 and fFlagEnableConsoleExpControls then
		local var30 = var16.new(guiService.SelectedCoreObject)
		guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ line: 127 ]]
			-- upvalues: var30 (ref), guiService (copy)
			var30:set(guiService.SelectedCoreObject)
		end)
		var29 = var30
	else
		var29 = nil
	end
	local lastInputType
	t_1._selectedCoreObject = var29
	t_1._connections = {}
	
	if var14 and fFlagEnableConsoleExpControls then
		local var32
		local new = var16.new
		lastInputType = userInputService:GetLastInputType()
		
		for i, v in constantsModule.GamepadInputTypes do
			if lastInputType == v then
				var32 = true
				t_1._gamepadActive = new(var32)
				t_1._tiltMenuOpen = var16.new(false)
				t_1._playerListModalOpen = if fFlagAddNewPlayerListFocusNav then var16.new(false) else nil
				t_1._showTopBar = var16.new(true)
				userInputService.LastInputTypeChanged:Connect(function(p1) --[[ line: 166 ]]
					-- upvalues: t_1 (ref), constantsModule (copy)
					local var35
					local gamepadActive = t_1._gamepadActive
					
					for i, v in constantsModule.GamepadInputTypes do
						if p1 == v then
							var35 = true
							gamepadActive:set(var35)
							
							return
						end
					end
					var35 = false
				end)
				settingsShowSignal:connect(function(p2) --[[ line: 170 ]]
					-- upvalues: t_1 (ref)
					t_1._tiltMenuOpen:set(p2)
				end)
				
				if fFlagAddNewPlayerListFocusNav then
					playerListManagerModule:GetVisibilityChangedEvent().Event:Connect(function() --[[ line: 175 ]]
						-- upvalues: fFlagAddNewPlayerListMobileFocusNav (copy), playerListManagerModule (copy), t_1 (ref)
						t_1._playerListModalOpen:set((if fFlagAddNewPlayerListMobileFocusNav then playerListManagerModule:GetIsModal() else true) and playerListManagerModule:GetVisibility())
					end)
				end
				if not isSpatial() then
					local var33 = function() --[[ line: 182 ]]
						-- upvalues: t_1 (ref), fFlagEnableUISelector (copy), var21 (copy), userInputService (copy), fFlagAddNewPlayerListFocusNav (copy), fFlagShowUnibarOnVirtualCursor (copy), gamepadService (copy), guiService (copy)
						local var36 = not t_1._gamepadActive:get()
						
						if not var36 then
							var36 = t_1._chromeFocused:get()
							
							if not var36 and t_1._selectedCoreObject:get() ~= nil then
								var36 = not fFlagEnableUISelector or (not var21(false).getVisibility() or (userInputService.TouchEnabled or (t_1._tiltMenuOpen:get() or (fFlagAddNewPlayerListFocusNav and t_1._playerListModalOpen:get() or (if fFlagShowUnibarOnVirtualCursor then gamepadService.GamepadCursorEnabled else gamepadService.GamepadCursorEnabled)))))
							end
						end
						t_1._showTopBar:set(var36)
						
						if var36 then
							guiService.CoreGuiNavigationEnabled = true
							
							return
						end
						guiService.CoreGuiNavigationEnabled = t_1._devSetCoreGuiNavEnabled
					end
					
					t_1._selectedCoreObject:connect(var33)
					t_1._chromeFocused:connect(var33)
					t_1._tiltMenuOpen:connect(var33)
					gamepadService:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(var33)
					t_1._gamepadActive:connect(var33, true)
				end
			end
		end
		var32 = false
	end
	if fFlagEnableConsoleExpControls then
		guiService:GetPropertyChangedSignal("CoreGuiNavigationEnabled"):Connect(function() --[[ line: 208 ]]
			-- upvalues: t_1 (ref), guiService (copy)
			t_1._devSetCoreGuiNavEnabled = guiService.CoreGuiNavigationEnabled
		end)
	end
	function t_1._isTopBarFocused() --[[ line: 212 ]]
		-- upvalues: gamepadService (copy), t_1 (ref), menuIconSelectedSignal (copy)
		return if gamepadService.GamepadCursorEnabled then false else t_1._chromeFocused:get() or menuIconSelectedSignal:get()
	end
	
	if fFlagAddTopBarScrimModule then
		var34, lastInputType = signalsModule.createSignal(t_1._isTopBarFocused())
		t_1._topBarFocused = var34
		t_1._setTopBarFocused = lastInputType
	end
	return setmetatable(t_1, t)
end

function t:connectToTopbar() --[[ line: 227 ]]
	-- upvalues: var14 (ref), fFlagEnableConsoleExpControls (ref), contextActionService (ref), PTFBackButtonAlwaysAsButtonBEngineFeature (ref), guiService (ref), fFlagAddTopBarScrimModule (ref), var15 (ref), var17 (ref), menuIconSelectedSignal (ref)
	if var14 then
		if fFlagEnableConsoleExpControls then
			self:disconnectFromTopbar()
		end
		contextActionService:BindCoreAction("FocusGamepadToTopbar", self:_bindSelf(self._toggleTopbar), false, Enum.KeyCode.ButtonStart)
		
		if PTFBackButtonAlwaysAsButtonBEngineFeature then
			contextActionService:BindCoreAction("ToggleUISelector", self:_bindSelf(self._toggleUiSelector), false, Enum.KeyCode.ButtonB)
		end
		local var37 = function() --[[ line: 246 ]]
			-- upvalues: self (ref), guiService (copy), fFlagAddTopBarScrimModule (copy), var15 (copy), var17 (copy)
			local var38 = self:_isTopBarFocused()
			guiService:SetMenuIsOpen(var38, "TopbarMenu")
			
			if fFlagAddTopBarScrimModule then
				self._setTopBarFocused(var38)
			end
			if var38 then
				var15:setShortcutBar(var17.UNIBAR_SHORTCUTBAR_ID)
				self:_addDismissFocusConnections()
				
				return
			end
			self:_removeDismissFocusConnections()
		end
		
		table.insert(self._connections, self._chromeFocused:connect(var37))
		table.insert(self._connections, menuIconSelectedSignal:connect(var37))
	end
end

function t:disconnectFromTopbar() --[[ line: 266 ]]
	-- upvalues: contextActionService (ref), PTFBackButtonAlwaysAsButtonBEngineFeature (ref)
	for i, v in self._connections do
		v:disconnect()
	end
	self._connections = {}
	self:_removeDismissFocusConnections()
	contextActionService:UnbindCoreAction("FocusGamepadToTopbar")
	
	if PTFBackButtonAlwaysAsButtonBEngineFeature then
		contextActionService:UnbindCoreAction("ToggleUISelector")
	end
end

function t:getSelectedCoreObject() --[[ line: 279 ]]
	return self._selectedCoreObject
end

function t:getShowTopBar() --[[ line: 283 ]]
	return self._showTopBar
end

function t:getGamepadActive() --[[ line: 287 ]]
	return self._gamepadActive
end

function t:topBarFocused(p3) --[[ line: 291 ]]
	-- upvalues: fFlagAddTopBarScrimModule (ref)
	if fFlagAddTopBarScrimModule then
		return self._topBarFocused(p3)
	end
end

function t:_addDismissFocusConnections() --[[ line: 299 ]]
	-- upvalues: userInputService (ref), inputModeStore (ref), responsiveModule (ref)
	self._dismissFocusConnections = {
		userInputService.InputEnded:Connect(function(p4, p5) --[[ line: 301 ]]
			-- upvalues: inputModeStore (copy), responsiveModule (copy), self (ref)
			local lastInputType = inputModeStore.getLastInputType(false)
			
			if (lastInputType == responsiveModule.Input.Pointer and p4.UserInputType ~= Enum.UserInputType.Keyboard) or lastInputType == responsiveModule.Input.Touch and not p5 then
				self:_unfocusGamepadFromTopBar()
			end
		end)
	}
end

function t:_removeDismissFocusConnections() --[[ line: 317 ]]
	for i, v in self._dismissFocusConnections do
		v:Disconnect()
	end
	self._dismissFocusConnections = {}
end

function t:_toggleTopbar(p6, p7, p8) --[[ line: 324 ]]
	-- upvalues: var14 (ref), fFlagEnableConsoleExpControls (ref), PTFBackButtonAlwaysAsButtonBEngineFeature (ref), fFlagEnableUISelector (ref), userInputService (ref), var15 (ref), focusNavigationStore (ref), logGamepadOpenExperienceControlsMenu (ref), fFlagAddNewPlayerListMobileFocusNav (ref), playerListManagerModule (ref)
	if not var14 or self:_focusToastNotification(p7) or (fFlagEnableConsoleExpControls or p7 ~= Enum.UserInputState.End) and (not fFlagEnableConsoleExpControls or p7 ~= Enum.UserInputState.Begin) then
		return Enum.ContextActionResult.Pass
	elseif not PTFBackButtonAlwaysAsButtonBEngineFeature and fFlagEnableUISelector and not userInputService:GamepadSupports(userInputService:GetLastInputType(), Enum.KeyCode.ButtonSelect) then
		return self:_toggleUiSelector(p6, p7, p8)
	elseif fFlagEnableConsoleExpControls then
		if var15:integrations().nine_dot == nil then
			return Enum.ContextActionResult.Pass
		end
		local var40 = not (self:_isTopBarFocused() or focusNavigationStore.getChatInputBarFocused(false))
		
		if var40 then
			self:_focusGamepadToTopBar()
		else
			self:_unfocusGamepadFromTopBar()
		end
		self:_logExperienceMenuGamepadExposure()
		logGamepadOpenExperienceControlsMenu(var40)
	else
		self:_toggleUnibarMenu()
	end
	if fFlagAddNewPlayerListMobileFocusNav and playerListManagerModule:GetIsModal() and playerListManagerModule:GetVisibility() then
		playerListManagerModule:SetVisibility(false)
	end
	return Enum.ContextActionResult.Sink
end

function t:_toggleUiSelector(_, p9, _) --[[ line: 367 ]]
	-- upvalues: fFlagEnableUISelector (ref), var14 (ref), fFlagEnableConsoleExpControls (ref), userInputService (ref), gamepadService (ref), guiService (ref), var21 (ref)
	if fFlagEnableUISelector and var14 and not self:_focusToastNotification(p9) and (not fFlagEnableConsoleExpControls and p9 == Enum.UserInputState.End or fFlagEnableConsoleExpControls and p9 == Enum.UserInputState.Begin) and not userInputService:GamepadSupports(userInputService:GetLastInputType(), Enum.KeyCode.ButtonSelect) then
		if gamepadService.GamepadCursorEnabled or guiService.SelectedObject ~= nil then
			gamepadService:DisableGamepadCursor()
			guiService.SelectedObject = nil
			
			return Enum.ContextActionResult.Sink
		end
		local var41 = var21(false)
		
		if var41.getVisibility(false) then
			var41.setVisibility(false)
			
			return Enum.ContextActionResult.Sink
		elseif self:_isTopBarFocused() then
			return Enum.ContextActionResult.Pass
		else
			var41.setVisibility(true)
			
			return Enum.ContextActionResult.Sink
		end
	end
end

function t:_toggleUnibarMenu() --[[ line: 395 ]]
	-- upvalues: fFlagEnableConsoleExpControls (ref), var15 (ref), logGamepadOpenExperienceControlsMenu (ref)
	local var42 = self._chromeFocused:get()
	
	if var42 then
		if fFlagEnableConsoleExpControls then
			self:_unfocusGamepadFromTopBar()
		else
			var15:disableFocusNav()
		end
	elseif fFlagEnableConsoleExpControls then
		self:_focusGamepadToTopBar()
	else
		var15:enableFocusNav()
	end
	self:_logExperienceMenuGamepadExposure()
	logGamepadOpenExperienceControlsMenu(var42)
end

function t._focusGamepadToTopBar(_) --[[ line: 414 ]]
	-- upvalues: focusUtils (ref)
	focusUtils.FocusOnChrome()
end

function t._unfocusGamepadFromTopBar(_) --[[ line: 418 ]]
	-- upvalues: focusUtils (ref), fFlagConsoleChatUseChromeFocusUtils (ref), focusNavigationStore (ref), guiService (ref)
	focusUtils.FocusOffChrome(function() --[[ line: 419 ]]
		-- upvalues: fFlagConsoleChatUseChromeFocusUtils (copy), focusNavigationStore (copy), guiService (copy)
		if fFlagConsoleChatUseChromeFocusUtils and focusNavigationStore.getChatInputBarFocused(false) then
			focusNavigationStore.unfocusChatInputBar()
		end
		guiService.SelectedCoreObject = nil
	end)
end

function t:_focusToastNotification(p10) --[[ line: 427 ]]
	-- upvalues: var25 (write), toastNotificationConstants (ref)
	local function _() --[[ line: 428 | named "buttonHoldTime" ]]
		-- upvalues: self (ref)
		return tick() - self._lastMenuButtonPress
	end
	
	local var43 = var25 ~= nil and var25.Visible
	
	if p10 == Enum.UserInputState.Begin then
		self._lastMenuButtonPress = tick()
		
		return false
	end
	return p10 == Enum.UserInputState.End and (var43 and tick() - self._lastMenuButtonPress < toastNotificationConstants.MenuButtonPressHoldTime)
end

function t:_logExperienceMenuGamepadExposure() --[[ line: 443 ]]
	-- upvalues: fFlagExperienceMenuGamepadExposureEnabled (ref), IXPServiceWrapper (ref), appUserLayers (ref)
	if fFlagExperienceMenuGamepadExposureEnabled and not self._loggedExperienceMenuGamepadExposure then
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(appUserLayers.ExperienceMenuGamepadExposureLayer)
		self._loggedExperienceMenuGamepadExposure = true
	end
end

function t._bindSelf(p11, p12) --[[ line: 450 ]]
	return function(...) --[[ line: 451 ]]
		-- upvalues: p12 (ref), p11 (ref)
		return p12(p11, ...)
	end
end

return if fFlagEnableConsoleExpControls then t.new() else t