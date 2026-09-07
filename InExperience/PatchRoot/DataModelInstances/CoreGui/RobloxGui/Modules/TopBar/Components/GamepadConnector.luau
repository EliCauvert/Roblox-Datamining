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
local var1 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local var2 = if var1 then require(chrome.Service) else nil
local focusUtils = require(corePackagesService.Workspace.Packages.Chrome).FocusUtils
local var3 = if fFlagUseObservableDefaultForChromeFocusedModule or var1 and fFlagEnableConsoleExpControls then require(chrome.ChromeShared.Service.ChromeUtils).ObservableValue else nil
local var4 = if var1 then require(chrome.ChromeShared.Unibar.Constants) else nil
local toastNotificationConstants = require(corePackagesService.Workspace.Packages.ToastNotification).ToastNotificationConstants
local constantsModule = require(script.Parent.Parent.Constants)
local settingsShowSignal = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local playerListManagerModule = require(parent.PlayerList.PlayerListManager)
local menuIconSelectedSignal = focusUtils.MenuIconSelectedSignal
local coreGuiCommonModule = require(corePackagesService.Workspace.Packages.CoreGuiCommon)
local fFlagEnableUISelector = coreGuiCommonModule.Flags.FFlagEnableUISelector
local var5 = if fFlagEnableUISelector then coreGuiCommonModule.Stores.GetUiSelectorSignalStore else nil
local focusNavigationStore = require(corePackagesService.Workspace.Packages.ExpChat).Stores.GetFocusNavigationStore(false)
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet
local fFlagSideSheetFocusNav = sharedFlagsModule.FFlagSideSheetFocusNav
local getSideSheetVisibility = require(corePackagesService.Workspace.Packages.InExperienceSideSheet).getSideSheetVisibility
local var6 = nil
local var7 = nil
local var8 = nil
task.spawn(function()
	-- upvalues: var6 (write), coreGuiService (ref), var7 (write), var8 (write)
	var6 = coreGuiService:WaitForChild("ToastNotification", 3)
	var7 = if var6 ~= nil then nil else var6:WaitForChild("ToastNotificationWrapper", 3)
	var8 = if var7 ~= nil then nil else var7:FindFirstChild("Toast", true)
end)

local function _()
	-- upvalues: var3 (ref), guiService (ref)
	local var9 = var3.new(guiService.SelectedCoreObject)
	guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
		-- upvalues: var9 (ref), guiService (copy)
		var9:set(guiService.SelectedCoreObject)
	end)
	
	return var9
end

local _ = function(p1)
	-- upvalues: constantsModule (ref)
	for i, v in constantsModule.GamepadInputTypes do
		if p1 == v then
			return true
		end
	end
	return false
end

local t = {}
t.__index = t

function t.new()
	-- upvalues: guiService (ref), var2 (ref), fFlagUseObservableDefaultForChromeFocusedModule (ref), var3 (ref), var1 (ref), fFlagEnableConsoleExpControls (ref), userInputService (ref), constantsModule (ref), fFlagAddNewPlayerListFocusNav (ref), settingsShowSignal (ref), playerListManagerModule (ref), fFlagAddNewPlayerListMobileFocusNav (ref), isSpatial (ref), fFlagEnableUISelector (ref), var5 (ref), fFlagShowUnibarOnVirtualCursor (ref), gamepadService (ref), menuIconSelectedSignal (ref), fFlagAddTopBarScrimModule (ref), signalsModule (ref), t (ref)
	local var9
	local t_1 = {
		_loggedExperienceMenuGamepadExposure = false,
		_devSetCoreGuiNavEnabled = guiService.CoreGuiNavigationEnabled,
		_chromeFocused = if var2 then var2:inFocusNav() elseif fFlagUseObservableDefaultForChromeFocusedModule then var3.new(false) else false,
		_lastMenuButtonPress = 0,
		_dismissFocusConnections = {}
	}
	
	if var1 and fFlagEnableConsoleExpControls then
		local var10 = var3.new(guiService.SelectedCoreObject)
		guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
			-- upvalues: var10 (ref), guiService (copy)
			var10:set(guiService.SelectedCoreObject)
		end)
		var9 = var10
	else
		var9 = nil
	end
	local lastInputType
	t_1._selectedCoreObject = var9
	t_1._connections = {}
	
	if var1 and fFlagEnableConsoleExpControls then
		local var11
		local new = var3.new
		lastInputType = userInputService:GetLastInputType()
		
		for i, v in constantsModule.GamepadInputTypes do
			if lastInputType == v then
				var11 = true
				t_1._gamepadActive = new(var11)
				t_1._tiltMenuOpen = var3.new(false)
				t_1._playerListModalOpen = if fFlagAddNewPlayerListFocusNav then var3.new(false) else nil
				t_1._showTopBar = var3.new(true)
				userInputService.LastInputTypeChanged:Connect(function(p2)
					-- upvalues: t_1 (ref), constantsModule (copy)
					local var12
					local gamepadActive = t_1._gamepadActive
					
					for i, v in constantsModule.GamepadInputTypes do
						if p2 == v then
							var12 = true
							gamepadActive:set(var12)
							
							return
						end
					end
					var12 = false
				end)
				settingsShowSignal:connect(function(p3)
					-- upvalues: t_1 (ref)
					t_1._tiltMenuOpen:set(p3)
				end)
				
				if fFlagAddNewPlayerListFocusNav then
					playerListManagerModule:GetVisibilityChangedEvent().Event:Connect(function()
						-- upvalues: fFlagAddNewPlayerListMobileFocusNav (copy), playerListManagerModule (copy), t_1 (ref)
						t_1._playerListModalOpen:set((if fFlagAddNewPlayerListMobileFocusNav then playerListManagerModule:GetIsModal() else true) and playerListManagerModule:GetVisibility())
					end)
				end
				if not isSpatial() then
					local var13 = function()
						-- upvalues: t_1 (ref), fFlagEnableUISelector (copy), var5 (copy), userInputService (copy), fFlagAddNewPlayerListFocusNav (copy), fFlagShowUnibarOnVirtualCursor (copy), gamepadService (copy), guiService (copy)
						local var14 = not t_1._gamepadActive:get()
						
						if not var14 then
							var14 = t_1._chromeFocused:get()
							
							if not var14 and t_1._selectedCoreObject:get() ~= nil then
								var14 = not fFlagEnableUISelector or (not var5(false).getVisibility() or (userInputService.TouchEnabled or (t_1._tiltMenuOpen:get() or (fFlagAddNewPlayerListFocusNav and t_1._playerListModalOpen:get() or (if fFlagShowUnibarOnVirtualCursor then gamepadService.GamepadCursorEnabled else gamepadService.GamepadCursorEnabled)))))
							end
						end
						t_1._showTopBar:set(var14)
						
						if var14 then
							guiService.CoreGuiNavigationEnabled = true
							
							return
						end
						guiService.CoreGuiNavigationEnabled = t_1._devSetCoreGuiNavEnabled
					end
					
					t_1._selectedCoreObject:connect(var13)
					t_1._chromeFocused:connect(var13)
					t_1._tiltMenuOpen:connect(var13)
					gamepadService:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(var13)
					t_1._gamepadActive:connect(var13, true)
				end
			end
		end
		var11 = false
	end
	if fFlagEnableConsoleExpControls then
		guiService:GetPropertyChangedSignal("CoreGuiNavigationEnabled"):Connect(function()
			-- upvalues: t_1 (ref), guiService (copy)
			t_1._devSetCoreGuiNavEnabled = guiService.CoreGuiNavigationEnabled
		end)
	end
	function t_1._isTopBarFocused()
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

function t:connectToTopbar()
	-- upvalues: var1 (ref), fFlagEnableConsoleExpControls (ref), contextActionService (ref), PTFBackButtonAlwaysAsButtonBEngineFeature (ref), guiService (ref), fFlagAddTopBarScrimModule (ref), var2 (ref), var4 (ref), menuIconSelectedSignal (ref)
	if var1 then
		if fFlagEnableConsoleExpControls then
			self:disconnectFromTopbar()
		end
		contextActionService:BindCoreAction("FocusGamepadToTopbar", self:_bindSelf(self._toggleTopbar), false, Enum.KeyCode.ButtonStart)
		
		if PTFBackButtonAlwaysAsButtonBEngineFeature then
			contextActionService:BindCoreAction("ToggleUISelector", self:_bindSelf(self._toggleUiSelector), false, Enum.KeyCode.ButtonB)
		end
		local var12 = function()
			-- upvalues: self (ref), guiService (copy), fFlagAddTopBarScrimModule (copy), var2 (copy), var4 (copy)
			local var13 = self:_isTopBarFocused()
			guiService:SetMenuIsOpen(var13, "TopbarMenu")
			
			if fFlagAddTopBarScrimModule then
				self._setTopBarFocused(var13)
			end
			if var13 then
				var2:setShortcutBar(var4.UNIBAR_SHORTCUTBAR_ID)
				self:_addDismissFocusConnections()
				
				return
			end
			self:_removeDismissFocusConnections()
		end
		
		table.insert(self._connections, self._chromeFocused:connect(var12))
		table.insert(self._connections, menuIconSelectedSignal:connect(var12))
	end
end

function t:disconnectFromTopbar()
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

function t:getSelectedCoreObject()
	return self._selectedCoreObject
end

function t:getShowTopBar()
	return self._showTopBar
end

function t:getGamepadActive()
	return self._gamepadActive
end

function t:topBarFocused(p2)
	-- upvalues: fFlagAddTopBarScrimModule (ref)
	if fFlagAddTopBarScrimModule then
		return self._topBarFocused(p2)
	end
end

function t:_addDismissFocusConnections()
	-- upvalues: userInputService (ref), inputModeStore (ref), responsiveModule (ref)
	self._dismissFocusConnections = {
		userInputService.InputEnded:Connect(function(p2, p3)
			-- upvalues: inputModeStore (copy), responsiveModule (copy), self (ref)
			local lastInputType = inputModeStore.getLastInputType(false)
			
			if (lastInputType == responsiveModule.Input.Pointer and p2.UserInputType ~= Enum.UserInputType.Keyboard) or lastInputType == responsiveModule.Input.Touch and not p3 then
				self:_unfocusGamepadFromTopBar()
			end
		end)
	}
end

function t:_removeDismissFocusConnections()
	for i, v in self._dismissFocusConnections do
		v:Disconnect()
	end
	self._dismissFocusConnections = {}
end

function t:_toggleTopbar(p2, p3, p4)
	-- upvalues: var1 (ref), fFlagEnableConsoleExpControls (ref), PTFBackButtonAlwaysAsButtonBEngineFeature (ref), fFlagEnableUISelector (ref), userInputService (ref), var2 (ref), fFlagEnableSideSheet (ref), fFlagSideSheetFocusNav (ref), getSideSheetVisibility (ref), focusNavigationStore (ref), logGamepadOpenExperienceControlsMenu (ref), fFlagAddNewPlayerListMobileFocusNav (ref), playerListManagerModule (ref)
	if not var1 or self:_focusToastNotification(p3) or (fFlagEnableConsoleExpControls or p3 ~= Enum.UserInputState.End) and (not fFlagEnableConsoleExpControls or p3 ~= Enum.UserInputState.Begin) then
		return Enum.ContextActionResult.Pass
	elseif not PTFBackButtonAlwaysAsButtonBEngineFeature and fFlagEnableUISelector and not userInputService:GamepadSupports(userInputService:GetLastInputType(), Enum.KeyCode.ButtonSelect) then
		return self:_toggleUiSelector(p2, p3, p4)
	elseif fFlagEnableConsoleExpControls then
		if var2:integrations().nine_dot == nil then
			return Enum.ContextActionResult.Pass
		elseif fFlagEnableSideSheet and fFlagSideSheetFocusNav and getSideSheetVisibility() then
			return Enum.ContextActionResult.Pass
		end
		local var12 = not (self:_isTopBarFocused() or focusNavigationStore.getChatInputBarFocused(false))
		
		if var12 then
			self:_focusGamepadToTopBar()
		else
			self:_unfocusGamepadFromTopBar()
		end
		self:_logExperienceMenuGamepadExposure()
		logGamepadOpenExperienceControlsMenu(var12)
	else
		self:_toggleUnibarMenu()
	end
	if fFlagAddNewPlayerListMobileFocusNav and playerListManagerModule:GetIsModal() and playerListManagerModule:GetVisibility() then
		playerListManagerModule:SetVisibility(false)
	end
	return Enum.ContextActionResult.Sink
end

function t:_toggleUiSelector(_, p2, _)
	-- upvalues: fFlagEnableUISelector (ref), var1 (ref), fFlagEnableConsoleExpControls (ref), userInputService (ref), gamepadService (ref), guiService (ref), var5 (ref)
	if fFlagEnableUISelector and var1 and not self:_focusToastNotification(p2) and (not fFlagEnableConsoleExpControls and p2 == Enum.UserInputState.End or fFlagEnableConsoleExpControls and p2 == Enum.UserInputState.Begin) and not userInputService:GamepadSupports(userInputService:GetLastInputType(), Enum.KeyCode.ButtonSelect) then
		if gamepadService.GamepadCursorEnabled or guiService.SelectedObject ~= nil then
			gamepadService:DisableGamepadCursor()
			guiService.SelectedObject = nil
			
			return Enum.ContextActionResult.Sink
		end
		local var12 = var5(false)
		
		if var12.getVisibility(false) then
			var12.setVisibility(false)
			
			return Enum.ContextActionResult.Sink
		elseif self:_isTopBarFocused() then
			return Enum.ContextActionResult.Pass
		else
			var12.setVisibility(true)
			
			return Enum.ContextActionResult.Sink
		end
	end
end

function t:_toggleUnibarMenu()
	-- upvalues: fFlagEnableConsoleExpControls (ref), var2 (ref), logGamepadOpenExperienceControlsMenu (ref)
	local var12 = self._chromeFocused:get()
	
	if var12 then
		if fFlagEnableConsoleExpControls then
			self:_unfocusGamepadFromTopBar()
		else
			var2:disableFocusNav()
		end
	elseif fFlagEnableConsoleExpControls then
		self:_focusGamepadToTopBar()
	else
		var2:enableFocusNav()
	end
	self:_logExperienceMenuGamepadExposure()
	logGamepadOpenExperienceControlsMenu(var12)
end

function t._focusGamepadToTopBar(_)
	-- upvalues: focusUtils (ref)
	focusUtils.FocusOnChrome()
end

function t._unfocusGamepadFromTopBar(_)
	-- upvalues: focusUtils (ref), fFlagConsoleChatUseChromeFocusUtils (ref), focusNavigationStore (ref), guiService (ref)
	focusUtils.FocusOffChrome(function()
		-- upvalues: fFlagConsoleChatUseChromeFocusUtils (copy), focusNavigationStore (copy), guiService (copy)
		if fFlagConsoleChatUseChromeFocusUtils and focusNavigationStore.getChatInputBarFocused(false) then
			focusNavigationStore.unfocusChatInputBar()
		end
		guiService.SelectedCoreObject = nil
	end)
end

function t:_focusToastNotification(p2)
	-- upvalues: var8 (write), toastNotificationConstants (ref)
	local function _()
		-- upvalues: self (ref)
		return tick() - self._lastMenuButtonPress
	end
	
	local var12 = var8 ~= nil and var8.Visible
	
	if p2 == Enum.UserInputState.Begin then
		self._lastMenuButtonPress = tick()
		
		return false
	end
	return p2 == Enum.UserInputState.End and (var12 and tick() - self._lastMenuButtonPress < toastNotificationConstants.MenuButtonPressHoldTime)
end

function t:_logExperienceMenuGamepadExposure()
	-- upvalues: fFlagExperienceMenuGamepadExposureEnabled (ref), IXPServiceWrapper (ref), appUserLayers (ref)
	if fFlagExperienceMenuGamepadExposureEnabled and not self._loggedExperienceMenuGamepadExposure then
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(appUserLayers.ExperienceMenuGamepadExposureLayer)
		self._loggedExperienceMenuGamepadExposure = true
	end
end

function t._bindSelf(p2, p3)
	return function(...)
		-- upvalues: p3 (ref), p2 (ref)
		return p3(p2, ...)
	end
end

return if fFlagEnableConsoleExpControls then t.new() else t