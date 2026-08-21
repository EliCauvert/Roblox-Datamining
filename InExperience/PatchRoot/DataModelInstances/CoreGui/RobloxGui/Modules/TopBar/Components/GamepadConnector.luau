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
local fFlagUseObservableDefaultForChromeFocusedModule = require(topBar.Flags.FFlagUseObservableDefaultForChromeFocused)
local isSpatial = appCommonLibModule.isSpatial
local logGamepadOpenExperienceControlsMenu = require(topBar:WaitForChild("Telemetry")).LogGamepadOpenExperienceControlsMenu
local chrome = parent.Chrome
local var15 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local var16 = if var15 then require(chrome.Service) else nil
local focusUtils = require(corePackagesService.Workspace.Packages.Chrome).FocusUtils
local var17 = if fFlagUseObservableDefaultForChromeFocusedModule or var15 and fFlagEnableConsoleExpControls then require(chrome.ChromeShared.Service.ChromeUtils).ObservableValue else nil
local var18 = if var15 then require(chrome.ChromeShared.Unibar.Constants) else nil
local toastNotificationConstants = require(corePackagesService.Workspace.Packages.ToastNotification).ToastNotificationConstants
local constantsModule = require(script.Parent.Parent.Constants)
local settingsShowSignal = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local playerListManagerModule = require(parent.PlayerList.PlayerListManager)
local menuIconSelectedSignal = focusUtils.MenuIconSelectedSignal
local coreGuiCommonModule = require(corePackagesService.Workspace.Packages.CoreGuiCommon)
local fFlagEnableUISelector = coreGuiCommonModule.Flags.FFlagEnableUISelector
local var22 = if fFlagEnableUISelector then coreGuiCommonModule.Stores.GetUiSelectorSignalStore else nil
local focusNavigationStore = require(corePackagesService.Workspace.Packages.ExpChat).Stores.GetFocusNavigationStore(false)
local var24 = nil
local var25 = nil
local var26 = nil
task.spawn(function() --[[ line: 69 ]]
	-- upvalues: var24 (write), coreGuiService (ref), var25 (write), var26 (write)
	var24 = coreGuiService:WaitForChild("ToastNotification", 3)
	var25 = if var24 ~= nil then nil else var24:WaitForChild("ToastNotificationWrapper", 3)
	var26 = if var25 ~= nil then nil else var25:FindFirstChild("Toast", true)
end)

local function _() --[[ line: 127 | named "createSelectedCoreObject" ]]
	-- upvalues: var17 (ref), guiService (ref)
	local var28 = var17.new(guiService.SelectedCoreObject)
	guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ line: 129 ]]
		-- upvalues: var28 (ref), guiService (copy)
		var28:set(guiService.SelectedCoreObject)
	end)
	
	return var28
end

local _ = function(p0) --[[ line: 136 | named "isInputGamepad" ]]
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

function t.new() --[[ line: 149 ]]
	-- upvalues: guiService (ref), var16 (ref), fFlagUseObservableDefaultForChromeFocusedModule (ref), var17 (ref), var15 (ref), fFlagEnableConsoleExpControls (ref), userInputService (ref), constantsModule (ref), fFlagAddNewPlayerListFocusNav (ref), settingsShowSignal (ref), playerListManagerModule (ref), fFlagAddNewPlayerListMobileFocusNav (ref), isSpatial (ref), fFlagEnableUISelector (ref), var22 (ref), fFlagShowUnibarOnVirtualCursor (ref), gamepadService (ref), menuIconSelectedSignal (ref), fFlagAddTopBarScrimModule (ref), signalsModule (ref), t (ref)
	local var30
	local t_1 = {
		_loggedExperienceMenuGamepadExposure = false,
		_devSetCoreGuiNavEnabled = guiService.CoreGuiNavigationEnabled,
		_chromeFocused = if var16 then var16:inFocusNav() elseif fFlagUseObservableDefaultForChromeFocusedModule then var17.new(false) else false,
		_lastMenuButtonPress = 0,
		_dismissFocusConnections = {}
	}
	
	if var15 and fFlagEnableConsoleExpControls then
		local var31 = var17.new(guiService.SelectedCoreObject)
		guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ line: 129 ]]
			-- upvalues: var31 (ref), guiService (copy)
			var31:set(guiService.SelectedCoreObject)
		end)
		var30 = var31
	else
		var30 = nil
	end
	local lastInputType
	t_1._selectedCoreObject = var30
	t_1._connections = {}
	
	if var15 and fFlagEnableConsoleExpControls then
		local var33
		local new = var17.new
		lastInputType = userInputService:GetLastInputType()
		
		for i, v in constantsModule.GamepadInputTypes do
			if lastInputType == v then
				var33 = true
				t_1._gamepadActive = new(var33)
				t_1._tiltMenuOpen = var17.new(false)
				t_1._playerListModalOpen = if fFlagAddNewPlayerListFocusNav then var17.new(false) else nil
				t_1._showTopBar = var17.new(true)
				userInputService.LastInputTypeChanged:Connect(function(p1) --[[ line: 171 ]]
					-- upvalues: t_1 (ref), constantsModule (copy)
					local var36
					local gamepadActive = t_1._gamepadActive
					
					for i, v in constantsModule.GamepadInputTypes do
						if p1 == v then
							var36 = true
							gamepadActive:set(var36)
							
							return
						end
					end
					var36 = false
				end)
				settingsShowSignal:connect(function(p2) --[[ line: 175 ]]
					-- upvalues: t_1 (ref)
					t_1._tiltMenuOpen:set(p2)
				end)
				
				if fFlagAddNewPlayerListFocusNav then
					playerListManagerModule:GetVisibilityChangedEvent().Event:Connect(function() --[[ line: 180 ]]
						-- upvalues: fFlagAddNewPlayerListMobileFocusNav (copy), playerListManagerModule (copy), t_1 (ref)
						t_1._playerListModalOpen:set((if fFlagAddNewPlayerListMobileFocusNav then playerListManagerModule:GetIsModal() else true) and playerListManagerModule:GetVisibility())
					end)
				end
				if not isSpatial() then
					local var34 = function() --[[ line: 187 ]]
						-- upvalues: t_1 (ref), fFlagEnableUISelector (copy), var22 (copy), userInputService (copy), fFlagAddNewPlayerListFocusNav (copy), fFlagShowUnibarOnVirtualCursor (copy), gamepadService (copy), guiService (copy)
						local var37 = not t_1._gamepadActive:get()
						
						if not var37 then
							var37 = t_1._chromeFocused:get()
							
							if not var37 and t_1._selectedCoreObject:get() ~= nil then
								var37 = not fFlagEnableUISelector or (not var22(false).getVisibility() or (userInputService.TouchEnabled or (t_1._tiltMenuOpen:get() or (fFlagAddNewPlayerListFocusNav and t_1._playerListModalOpen:get() or (if fFlagShowUnibarOnVirtualCursor then gamepadService.GamepadCursorEnabled else gamepadService.GamepadCursorEnabled)))))
							end
						end
						t_1._showTopBar:set(var37)
						
						if var37 then
							guiService.CoreGuiNavigationEnabled = true
							
							return
						end
						guiService.CoreGuiNavigationEnabled = t_1._devSetCoreGuiNavEnabled
					end
					
					t_1._selectedCoreObject:connect(var34)
					t_1._chromeFocused:connect(var34)
					t_1._tiltMenuOpen:connect(var34)
					gamepadService:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(var34)
					t_1._gamepadActive:connect(var34, true)
				end
			end
		end
		var33 = false
	end
	if fFlagEnableConsoleExpControls then
		guiService:GetPropertyChangedSignal("CoreGuiNavigationEnabled"):Connect(function() --[[ line: 213 ]]
			-- upvalues: t_1 (ref), guiService (copy)
			t_1._devSetCoreGuiNavEnabled = guiService.CoreGuiNavigationEnabled
		end)
	end
	function t_1._isTopBarFocused() --[[ line: 217 ]]
		-- upvalues: gamepadService (copy), t_1 (ref), menuIconSelectedSignal (copy)
		return if gamepadService.GamepadCursorEnabled then false else t_1._chromeFocused:get() or menuIconSelectedSignal:get()
	end
	
	if fFlagAddTopBarScrimModule then
		var35, lastInputType = signalsModule.createSignal(t_1._isTopBarFocused())
		t_1._topBarFocused = var35
		t_1._setTopBarFocused = lastInputType
	end
	return setmetatable(t_1, t)
end

function t:connectToTopbar() --[[ line: 232 ]]
	-- upvalues: var15 (ref), fFlagEnableConsoleExpControls (ref), contextActionService (ref), PTFBackButtonAlwaysAsButtonBEngineFeature (ref), guiService (ref), fFlagAddTopBarScrimModule (ref), var16 (ref), var18 (ref), menuIconSelectedSignal (ref)
	if var15 then
		if fFlagEnableConsoleExpControls then
			self:disconnectFromTopbar()
		end
		contextActionService:BindCoreAction("FocusGamepadToTopbar", self:_bindSelf(self._toggleTopbar), false, Enum.KeyCode.ButtonStart)
		
		if PTFBackButtonAlwaysAsButtonBEngineFeature then
			contextActionService:BindCoreAction("ToggleUISelector", self:_bindSelf(self._toggleUiSelector), false, Enum.KeyCode.ButtonB)
		end
		local var38 = function() --[[ line: 251 ]]
			-- upvalues: self (ref), guiService (copy), fFlagAddTopBarScrimModule (copy), var16 (copy), var18 (copy)
			local var39 = self:_isTopBarFocused()
			guiService:SetMenuIsOpen(var39, "TopbarMenu")
			
			if fFlagAddTopBarScrimModule then
				self._setTopBarFocused(var39)
			end
			if var39 then
				var16:setShortcutBar(var18.UNIBAR_SHORTCUTBAR_ID)
				self:_addDismissFocusConnections()
				
				return
			end
			self:_removeDismissFocusConnections()
		end
		
		table.insert(self._connections, self._chromeFocused:connect(var38))
		table.insert(self._connections, menuIconSelectedSignal:connect(var38))
	end
end

function t:disconnectFromTopbar() --[[ line: 271 ]]
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

function t:getSelectedCoreObject() --[[ line: 284 ]]
	return self._selectedCoreObject
end

function t:getShowTopBar() --[[ line: 288 ]]
	return self._showTopBar
end

function t:getGamepadActive() --[[ line: 292 ]]
	return self._gamepadActive
end

function t:topBarFocused(p3) --[[ line: 296 ]]
	-- upvalues: fFlagAddTopBarScrimModule (ref)
	if fFlagAddTopBarScrimModule then
		return self._topBarFocused(p3)
	end
end

function t:_addDismissFocusConnections() --[[ line: 304 ]]
	-- upvalues: userInputService (ref), inputModeStore (ref), responsiveModule (ref)
	self._dismissFocusConnections = {
		userInputService.InputEnded:Connect(function(p4, p5) --[[ line: 306 ]]
			-- upvalues: inputModeStore (copy), responsiveModule (copy), self (ref)
			local lastInputType = inputModeStore.getLastInputType(false)
			
			if (lastInputType == responsiveModule.Input.Pointer and p4.UserInputType ~= Enum.UserInputType.Keyboard) or lastInputType == responsiveModule.Input.Touch and not p5 then
				self:_unfocusGamepadFromTopBar()
			end
		end)
	}
end

function t:_removeDismissFocusConnections() --[[ line: 322 ]]
	for i, v in self._dismissFocusConnections do
		v:Disconnect()
	end
	self._dismissFocusConnections = {}
end

function t:_toggleTopbar(p6, p7, p8) --[[ line: 329 ]]
	-- upvalues: var15 (ref), fFlagEnableConsoleExpControls (ref), PTFBackButtonAlwaysAsButtonBEngineFeature (ref), fFlagEnableUISelector (ref), userInputService (ref), var16 (ref), focusNavigationStore (ref), logGamepadOpenExperienceControlsMenu (ref), fFlagAddNewPlayerListMobileFocusNav (ref), playerListManagerModule (ref)
	if not var15 or self:_focusToastNotification(p7) or (fFlagEnableConsoleExpControls or p7 ~= Enum.UserInputState.End) and (not fFlagEnableConsoleExpControls or p7 ~= Enum.UserInputState.Begin) then
		return Enum.ContextActionResult.Pass
	elseif not PTFBackButtonAlwaysAsButtonBEngineFeature and fFlagEnableUISelector and not userInputService:GamepadSupports(userInputService:GetLastInputType(), Enum.KeyCode.ButtonSelect) then
		return self:_toggleUiSelector(p6, p7, p8)
	elseif fFlagEnableConsoleExpControls then
		if var16:integrations().nine_dot == nil then
			return Enum.ContextActionResult.Pass
		end
		local var41 = not (self:_isTopBarFocused() or focusNavigationStore.getChatInputBarFocused(false))
		
		if var41 then
			self:_focusGamepadToTopBar()
		else
			self:_unfocusGamepadFromTopBar()
		end
		self:_logExperienceMenuGamepadExposure()
		logGamepadOpenExperienceControlsMenu(var41)
	else
		self:_toggleUnibarMenu()
	end
	if fFlagAddNewPlayerListMobileFocusNav and playerListManagerModule:GetIsModal() and playerListManagerModule:GetVisibility() then
		playerListManagerModule:SetVisibility(false)
	end
	return Enum.ContextActionResult.Sink
end

function t:_toggleUiSelector(_, p9, _) --[[ line: 372 ]]
	-- upvalues: fFlagEnableUISelector (ref), var15 (ref), fFlagEnableConsoleExpControls (ref), userInputService (ref), gamepadService (ref), guiService (ref), var22 (ref)
	if fFlagEnableUISelector and var15 and not self:_focusToastNotification(p9) and (not fFlagEnableConsoleExpControls and p9 == Enum.UserInputState.End or fFlagEnableConsoleExpControls and p9 == Enum.UserInputState.Begin) and not userInputService:GamepadSupports(userInputService:GetLastInputType(), Enum.KeyCode.ButtonSelect) then
		if gamepadService.GamepadCursorEnabled or guiService.SelectedObject ~= nil then
			gamepadService:DisableGamepadCursor()
			guiService.SelectedObject = nil
			
			return Enum.ContextActionResult.Sink
		end
		local var42 = var22(false)
		
		if var42.getVisibility(false) then
			var42.setVisibility(false)
			
			return Enum.ContextActionResult.Sink
		elseif self:_isTopBarFocused() then
			return Enum.ContextActionResult.Pass
		else
			var42.setVisibility(true)
			
			return Enum.ContextActionResult.Sink
		end
	end
end

function t:_toggleUnibarMenu() --[[ line: 400 ]]
	-- upvalues: fFlagEnableConsoleExpControls (ref), var16 (ref), logGamepadOpenExperienceControlsMenu (ref)
	local var43 = self._chromeFocused:get()
	
	if var43 then
		if fFlagEnableConsoleExpControls then
			self:_unfocusGamepadFromTopBar()
		else
			var16:disableFocusNav()
		end
	elseif fFlagEnableConsoleExpControls then
		self:_focusGamepadToTopBar()
	else
		var16:enableFocusNav()
	end
	self:_logExperienceMenuGamepadExposure()
	logGamepadOpenExperienceControlsMenu(var43)
end

function t._focusGamepadToTopBar(_) --[[ line: 419 ]]
	-- upvalues: focusUtils (ref)
	focusUtils.FocusOnChrome()
end

function t._unfocusGamepadFromTopBar(_) --[[ line: 423 ]]
	-- upvalues: focusUtils (ref), fFlagConsoleChatUseChromeFocusUtils (ref), focusNavigationStore (ref), guiService (ref)
	focusUtils.FocusOffChrome(function() --[[ line: 424 ]]
		-- upvalues: fFlagConsoleChatUseChromeFocusUtils (copy), focusNavigationStore (copy), guiService (copy)
		if fFlagConsoleChatUseChromeFocusUtils and focusNavigationStore.getChatInputBarFocused(false) then
			focusNavigationStore.unfocusChatInputBar()
		end
		guiService.SelectedCoreObject = nil
	end)
end

function t:_focusToastNotification(p10) --[[ line: 432 ]]
	-- upvalues: var26 (write), toastNotificationConstants (ref)
	local function _() --[[ line: 433 | named "buttonHoldTime" ]]
		-- upvalues: self (ref)
		return tick() - self._lastMenuButtonPress
	end
	
	local var44 = var26 ~= nil and var26.Visible
	
	if p10 == Enum.UserInputState.Begin then
		self._lastMenuButtonPress = tick()
		
		return false
	end
	return p10 == Enum.UserInputState.End and (var44 and tick() - self._lastMenuButtonPress < toastNotificationConstants.MenuButtonPressHoldTime)
end

function t:_logExperienceMenuGamepadExposure() --[[ line: 448 ]]
	-- upvalues: fFlagExperienceMenuGamepadExposureEnabled (ref), IXPServiceWrapper (ref), appUserLayers (ref)
	if fFlagExperienceMenuGamepadExposureEnabled and not self._loggedExperienceMenuGamepadExposure then
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(appUserLayers.ExperienceMenuGamepadExposureLayer)
		self._loggedExperienceMenuGamepadExposure = true
	end
end

function t._bindSelf(p11, p12) --[[ line: 455 ]]
	return function(...) --[[ line: 456 ]]
		-- upvalues: p12 (ref), p11 (ref)
		return p12(p11, ...)
	end
end

return if fFlagEnableConsoleExpControls then t.new() else t