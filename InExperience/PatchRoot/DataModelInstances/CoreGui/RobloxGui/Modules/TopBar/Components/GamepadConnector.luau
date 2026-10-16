local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local GamepadService = game:GetService("GamepadService")
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local InputModeStore = ResponsiveModule.GetInputModeStore(false)
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local SignalsModule = require(CorePackages.Packages.Signals)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagShowUnibarOnVirtualCursor = SharedFlagsModule.FFlagShowUnibarOnVirtualCursor
local FFlagConsoleChatUseChromeFocusUtils = SharedFlagsModule.FFlagConsoleChatUseChromeFocusUtils
local FFlagExperienceMenuGamepadExposureEnabled = SharedFlagsModule.FFlagExperienceMenuGamepadExposureEnabled
local PTFBackButtonAlwaysAsButtonBEngineFeature = game:GetEngineFeature("PTFBackButtonAlwaysAsButtonB")
local FFlagAddNewPlayerListFocusNav = PlayerListModule.Flags.FFlagAddNewPlayerListFocusNav
local FFlagAddNewPlayerListMobileFocusNav = PlayerListModule.Flags.FFlagAddNewPlayerListMobileFocusNav
local Parent = script.Parent.Parent.Parent
local TopBar = Parent.TopBar
local FFlagAddTopBarScrimModule = require(TopBar.Flags.FFlagAddTopBarScrim)
local FFlagUseObservableDefaultForChromeFocusedModule = require(TopBar.Flags.FFlagUseObservableDefaultForChromeFocused)
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local LogGamepadOpenExperienceControlsMenuFunction = require(TopBar:WaitForChild("Telemetry")).LogGamepadOpenExperienceControlsMenu
local Chrome = Parent.Chrome
local EnabledResult = require(CorePackages.Workspace.Packages.Chrome).Enabled()
local ServiceModule = if EnabledResult then require(Chrome.Service) else nil
local ChromeUtilsModule = require(Chrome.ChromeShared.Service.ChromeUtils)
local FocusUtils = require(CorePackages.Workspace.Packages.Chrome).FocusUtils
local ObservableValue = if FFlagUseObservableDefaultForChromeFocusedModule or EnabledResult and FFlagEnableConsoleExpControls then ChromeUtilsModule.ObservableValue else nil
local ConstantsModule = if EnabledResult then require(Chrome.ChromeShared.Unibar.Constants) else nil
local ToastNotificationConstants = require(CorePackages.Workspace.Packages.ToastNotification).ToastNotificationConstants
local ConstantsModule1 = require(script.Parent.Parent.Constants)
local SettingsShowSignal = require(CorePackages.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local PlayerListManagerModule = require(Parent.PlayerList.PlayerListManager)
local MenuIconSelectedSignal = FocusUtils.MenuIconSelectedSignal
local CoreGuiCommonModule = require(CorePackages.Workspace.Packages.CoreGuiCommon)
local FFlagEnableUISelector = CoreGuiCommonModule.Flags.FFlagEnableUISelector
local GetUiSelectorSignalStore = if FFlagEnableUISelector then CoreGuiCommonModule.Stores.GetUiSelectorSignalStore else nil
local FocusNavigationStore = require(CorePackages.Workspace.Packages.ExpChat).Stores.GetFocusNavigationStore(false)
local IsSideSheetEnabledModule = require(CorePackages.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local FFlagSideSheetFocusNav = SharedFlagsModule.FFlagSideSheetFocusNav
local GetSideSheetVisibilityFunction = require(CorePackages.Workspace.Packages.InExperienceSideSheet).getSideSheetVisibility
local ToastNotification = nil
local ToastNotificationWrapper = nil
local Toast = nil
task.spawn(function() --[[ Line: 73 ]]
	-- upvalues: ToastNotification (ref), CoreGui (copy), ToastNotificationWrapper (ref), Toast (ref)
	ToastNotification = CoreGui:WaitForChild("ToastNotification", 3)
	ToastNotificationWrapper = if ToastNotification == nil then nil else ToastNotification:WaitForChild("ToastNotificationWrapper", 3)
	Toast = if ToastNotificationWrapper == nil then nil else ToastNotificationWrapper:FindFirstChild("Toast", true)
end)

local function _() --[[ Line: 131 | Named "createSelectedCoreObject" ]]
	-- upvalues: ObservableValue (copy), GuiService (copy)
	local NewObservableValue = ObservableValue.new(GuiService.SelectedCoreObject)
	GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 133 ]]
		-- upvalues: NewObservableValue (copy), GuiService (upval)
		NewObservableValue:set(GuiService.SelectedCoreObject)
	end)
	
	return NewObservableValue
end

local _ = function(p1): boolean --[[ Line: 140 | Named "isInputGamepad" ]]
	-- upvalues: ConstantsModule1 (copy)
	for _, gamepadInputType in ConstantsModule1.GamepadInputTypes do
		if p1 == gamepadInputType then
			return true
		end
	end
	return false
end

local Module = {}
Module.__index = Module

function Module.new() --[[ Line: 153 ]]
	-- upvalues: GuiService (copy), ServiceModule (copy), FFlagUseObservableDefaultForChromeFocusedModule (copy), ObservableValue (copy), EnabledResult (copy), FFlagEnableConsoleExpControls (copy), UserInputService (copy), ConstantsModule1 (copy), FFlagAddNewPlayerListFocusNav (copy), SettingsShowSignal (copy), PlayerListManagerModule (copy), FFlagAddNewPlayerListMobileFocusNav (copy), IsSpatialFunction (copy), FFlagEnableUISelector (copy), GetUiSelectorSignalStore (copy), FFlagShowUnibarOnVirtualCursor (copy), GamepadService (copy), MenuIconSelectedSignal (copy), FFlagAddTopBarScrimModule (copy), SignalsModule (copy), Module (copy)
	local config = {
		_loggedExperienceMenuGamepadExposure = false,
		_devSetCoreGuiNavEnabled = GuiService.CoreGuiNavigationEnabled,
		_chromeFocused = if ServiceModule then ServiceModule:inFocusNav() elseif FFlagUseObservableDefaultForChromeFocusedModule then ObservableValue.new(false) else false,
		_lastMenuButtonPress = 0,
		_dismissFocusConnections = {}
	}
	local _selectedCoreObject = nil
	
	if EnabledResult and FFlagEnableConsoleExpControls then
		local NewObservableValue = ObservableValue.new(GuiService.SelectedCoreObject)
		GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 133 ]]
			-- upvalues: NewObservableValue (copy), GuiService (upval)
			NewObservableValue:set(GuiService.SelectedCoreObject)
		end)
		_selectedCoreObject = NewObservableValue
	else
		_selectedCoreObject = nil
	end
	config._selectedCoreObject = _selectedCoreObject
	config._connections = {}
	
	if EnabledResult and FFlagEnableConsoleExpControls then
		local NewFunction = ObservableValue.new
		local LastInputType = UserInputService:GetLastInputType()
		local Flag = false
		
		for _, gamepadInputType in ConstantsModule1.GamepadInputTypes do
			if LastInputType == gamepadInputType then
				Flag = true
				break
			end
		end
		config._gamepadActive = NewFunction(Flag)
		config._tiltMenuOpen = ObservableValue.new(false)
		config._playerListModalOpen = if FFlagAddNewPlayerListFocusNav then ObservableValue.new(false) else nil
		config._showTopBar = ObservableValue.new(true)
		UserInputService.LastInputTypeChanged:Connect(function(LastInputType) --[[ Line: 175 ]]
			-- upvalues: config (copy), ConstantsModule1 (upval)
			local GamepadActive = config._gamepadActive
			local Flag = false
			
			for _, gamepadInputType in ConstantsModule1.GamepadInputTypes do
				if LastInputType == gamepadInputType then
					Flag = true
					break
				end
			end
			GamepadActive:set(Flag)
		end)
		SettingsShowSignal:connect(function(p2) --[[ Line: 179 ]]
			-- upvalues: config (copy)
			config._tiltMenuOpen:set(p2)
		end)
		
		if FFlagAddNewPlayerListFocusNav then
			PlayerListManagerModule:GetVisibilityChangedEvent().Event:Connect(function() --[[ Line: 184 ]]
				-- upvalues: FFlagAddNewPlayerListMobileFocusNav (upval), PlayerListManagerModule (upval), config (copy)
				config._playerListModalOpen:set((not FFlagAddNewPlayerListMobileFocusNav or PlayerListManagerModule:GetIsModal()) and PlayerListManagerModule:GetVisibility())
			end)
		end
		if not IsSpatialFunction() then
			local function Callback() --[[ Line: 191 ]]
				-- upvalues: config (copy), FFlagEnableUISelector (upval), GetUiSelectorSignalStore (upval), UserInputService (upval), FFlagAddNewPlayerListFocusNav (upval), FFlagShowUnibarOnVirtualCursor (upval), GamepadService (upval), GuiService (upval)
				local Inverted = not config._gamepadActive:get() or (config._chromeFocused:get() or ((if config._selectedCoreObject:get() == nil then UserInputService.TouchEnabled else not FFlagEnableUISelector or (not GetUiSelectorSignalStore(false).getVisibility() or UserInputService.TouchEnabled)) or (config._tiltMenuOpen:get() or (FFlagAddNewPlayerListFocusNav and config._playerListModalOpen:get() or (FFlagShowUnibarOnVirtualCursor and GamepadService.GamepadCursorEnabled or GamepadService.GamepadCursorEnabled)))))
				config._showTopBar:set(Inverted)
				
				if Inverted then
					GuiService.CoreGuiNavigationEnabled = true
					
					return
				else
					GuiService.CoreGuiNavigationEnabled = config._devSetCoreGuiNavEnabled
				end
			end
			
			config._selectedCoreObject:connect(Callback)
			config._chromeFocused:connect(Callback)
			config._tiltMenuOpen:connect(Callback)
			GamepadService:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(Callback)
			config._gamepadActive:connect(Callback, true)
		end
	end
	if FFlagEnableConsoleExpControls then
		GuiService:GetPropertyChangedSignal("CoreGuiNavigationEnabled"):Connect(function() --[[ Line: 217 ]]
			-- upvalues: config (copy), GuiService (upval)
			config._devSetCoreGuiNavEnabled = GuiService.CoreGuiNavigationEnabled
		end)
	end
	function config._isTopBarFocused() --[[ Line: 221 ]]
		-- upvalues: GamepadService (upval), config (copy), MenuIconSelectedSignal (upval)
		return not GamepadService.GamepadCursorEnabled and (config._chromeFocused:get() or MenuIconSelectedSignal:get())
	end
	
	if FFlagAddTopBarScrimModule then
		config._topBarFocused, config._setTopBarFocused = SignalsModule.createSignal((config._isTopBarFocused()))
	end
	return (setmetatable(config, Module))
end

function Module:connectToTopbar() --[[ Line: 236 ]]
	-- upvalues: EnabledResult (copy), FFlagEnableConsoleExpControls (copy), ContextActionService (copy), PTFBackButtonAlwaysAsButtonBEngineFeature (copy), GuiService (copy), FFlagAddTopBarScrimModule (copy), ServiceModule (copy), ConstantsModule (copy), MenuIconSelectedSignal (copy)
	if EnabledResult then
		if FFlagEnableConsoleExpControls then
			self:disconnectFromTopbar()
		end
		ContextActionService:BindCoreAction("FocusGamepadToTopbar", self:_bindSelf(self._toggleTopbar), false, Enum.KeyCode.ButtonStart)
		
		if PTFBackButtonAlwaysAsButtonBEngineFeature then
			ContextActionService:BindCoreAction("ToggleUISelector", self:_bindSelf(self._toggleUiSelector), false, Enum.KeyCode.ButtonB)
		end
		local function v58() --[[ Line: 255 ]]
			-- upvalues: self (copy), GuiService (upval), FFlagAddTopBarScrimModule (upval), ServiceModule (upval), ConstantsModule (upval)
			local IsTopBarFocused = self:_isTopBarFocused()
			GuiService:SetMenuIsOpen(IsTopBarFocused, "TopbarMenu")
			
			if FFlagAddTopBarScrimModule then
				self._setTopBarFocused(IsTopBarFocused)
			end
			if IsTopBarFocused then
				ServiceModule:setShortcutBar(ConstantsModule.UNIBAR_SHORTCUTBAR_ID)
				self:_addDismissFocusConnections()
				
				return
			else
				self:_removeDismissFocusConnections()
			end
		end
		
		table.insert(self._connections, self._chromeFocused:connect(v58))
		table.insert(self._connections, MenuIconSelectedSignal:connect(v58))
	end
end

function Module:disconnectFromTopbar() --[[ Line: 275 ]]
	-- upvalues: ContextActionService (copy), PTFBackButtonAlwaysAsButtonBEngineFeature (copy)
	for _, connection in self._connections do
		connection:disconnect()
	end
	self._connections = {}
	self:_removeDismissFocusConnections()
	ContextActionService:UnbindCoreAction("FocusGamepadToTopbar")
	
	if PTFBackButtonAlwaysAsButtonBEngineFeature then
		ContextActionService:UnbindCoreAction("ToggleUISelector")
	end
end

function Module:getSelectedCoreObject() --[[ Line: 288 ]]
	return self._selectedCoreObject
end

function Module:getShowTopBar() --[[ Line: 292 ]]
	return self._showTopBar
end

function Module:getGamepadActive() --[[ Line: 296 ]]
	return self._gamepadActive
end

function Module:topBarFocused(p2) --[[ Line: 300 ]]
	-- upvalues: FFlagAddTopBarScrimModule (copy)
	if not FFlagAddTopBarScrimModule then return end
	return self._topBarFocused(p2)
end

function Module:_addDismissFocusConnections() --[[ Line: 308 ]]
	-- upvalues: UserInputService (copy), InputModeStore (copy), ResponsiveModule (copy)
	self._dismissFocusConnections = {
		(UserInputService.InputEnded:Connect(function(Input, GameProcessed) --[[ Line: 310 ]]
			-- upvalues: InputModeStore (upval), ResponsiveModule (upval), self (copy)
			local LastInputType = InputModeStore.getLastInputType(false)
			local IsLastInputTypeMatch = LastInputType == ResponsiveModule.Input.Touch
			
			if LastInputType == ResponsiveModule.Input.Pointer and Input.UserInputType ~= Enum.UserInputType.Keyboard or IsLastInputTypeMatch and not GameProcessed then
				self:_unfocusGamepadFromTopBar()
			end
		end))
	}
end

function Module:_removeDismissFocusConnections() --[[ Line: 326 ]]
	for _, dismissFocusConnection in self._dismissFocusConnections do
		dismissFocusConnection:Disconnect()
	end
	self._dismissFocusConnections = {}
end

function Module:_toggleTopbar(p2, UserInputState, p3) --[[ Line: 333 ]]
	-- upvalues: EnabledResult (copy), FFlagEnableConsoleExpControls (copy), PTFBackButtonAlwaysAsButtonBEngineFeature (copy), FFlagEnableUISelector (copy), UserInputService (copy), ServiceModule (copy), IsSideSheetEnabledModule (copy), FFlagSideSheetFocusNav (copy), GetSideSheetVisibilityFunction (copy), FocusNavigationStore (copy), LogGamepadOpenExperienceControlsMenuFunction (copy), FFlagAddNewPlayerListMobileFocusNav (copy), PlayerListManagerModule (copy)
	if not EnabledResult or self:_focusToastNotification(UserInputState) or (FFlagEnableConsoleExpControls or UserInputState ~= Enum.UserInputState.End) and (not FFlagEnableConsoleExpControls or UserInputState ~= Enum.UserInputState.Begin) then
		return Enum.ContextActionResult.Pass
	end
	if not PTFBackButtonAlwaysAsButtonBEngineFeature and FFlagEnableUISelector and not UserInputService:GamepadSupports(UserInputService:GetLastInputType(), Enum.KeyCode.ButtonSelect) then
		return self:_toggleUiSelector(p2, UserInputState, p3)
	end
	if FFlagEnableConsoleExpControls then
		if ServiceModule:integrations().nine_dot == nil then
			return Enum.ContextActionResult.Pass
		end
		if IsSideSheetEnabledModule and FFlagSideSheetFocusNav and GetSideSheetVisibilityFunction() then
			return Enum.ContextActionResult.Pass
		end
		local Inverted = not (self:_isTopBarFocused() or FocusNavigationStore.getChatInputBarFocused(false))
		
		if Inverted then
			self:_focusGamepadToTopBar()
		else
			self:_unfocusGamepadFromTopBar()
		end
		self:_logExperienceMenuGamepadExposure()
		LogGamepadOpenExperienceControlsMenuFunction(Inverted)
	else
		self:_toggleUnibarMenu()
	end
	if FFlagAddNewPlayerListMobileFocusNav and PlayerListManagerModule:GetIsModal() and PlayerListManagerModule:GetVisibility() then
		PlayerListManagerModule:SetVisibility(false)
	end
	return Enum.ContextActionResult.Sink
end

function Module:_toggleUiSelector(_, UserInputState, _) --[[ Line: 379 ]]
	-- upvalues: FFlagEnableUISelector (copy), EnabledResult (copy), FFlagEnableConsoleExpControls (copy), UserInputService (copy), GamepadService (copy), GuiService (copy), GetUiSelectorSignalStore (copy)
	if FFlagEnableUISelector and EnabledResult and not self:_focusToastNotification(UserInputState) and (not FFlagEnableConsoleExpControls and UserInputState == Enum.UserInputState.End or FFlagEnableConsoleExpControls and UserInputState == Enum.UserInputState.Begin) and not UserInputService:GamepadSupports(UserInputService:GetLastInputType(), Enum.KeyCode.ButtonSelect) then
		if GamepadService.GamepadCursorEnabled or GuiService.SelectedObject ~= nil then
			GamepadService:DisableGamepadCursor()
			GuiService.SelectedObject = nil
			
			return Enum.ContextActionResult.Sink
		end
		local UiSelectorSignalStore = GetUiSelectorSignalStore(false)
		
		if UiSelectorSignalStore.getVisibility(false) then
			UiSelectorSignalStore.setVisibility(false)
			
			return Enum.ContextActionResult.Sink
		elseif not self:_isTopBarFocused() then
			UiSelectorSignalStore.setVisibility(true)
			
			return Enum.ContextActionResult.Sink
		end
	end
	return Enum.ContextActionResult.Pass
end

function Module:_toggleUnibarMenu() --[[ Line: 407 ]]
	-- upvalues: FFlagEnableConsoleExpControls (copy), ServiceModule (copy), LogGamepadOpenExperienceControlsMenuFunction (copy)
	local GetResult = self._chromeFocused:get()
	
	if GetResult then
		if FFlagEnableConsoleExpControls then
			self:_unfocusGamepadFromTopBar()
		else
			ServiceModule:disableFocusNav()
		end
	elseif FFlagEnableConsoleExpControls then
		self:_focusGamepadToTopBar()
	else
		ServiceModule:enableFocusNav()
	end
	self:_logExperienceMenuGamepadExposure()
	LogGamepadOpenExperienceControlsMenuFunction(GetResult)
end

function Module:_focusGamepadToTopBar() --[[ Line: 426 ]]
	-- upvalues: FocusUtils (copy)
	FocusUtils.FocusOnChrome()
end

function Module:_unfocusGamepadFromTopBar() --[[ Line: 430 ]]
	-- upvalues: FocusUtils (copy), FFlagConsoleChatUseChromeFocusUtils (copy), FocusNavigationStore (copy), GuiService (copy)
	FocusUtils.FocusOffChrome(function() --[[ Line: 431 ]]
		-- upvalues: FFlagConsoleChatUseChromeFocusUtils (upval), FocusNavigationStore (upval), GuiService (upval)
		if FFlagConsoleChatUseChromeFocusUtils and FocusNavigationStore.getChatInputBarFocused(false) then
			FocusNavigationStore.unfocusChatInputBar()
		end
		GuiService.SelectedCoreObject = nil
	end)
end

function Module:_focusToastNotification(UserInputState): boolean --[[ Line: 439 ]]
	-- upvalues: Toast (ref), ToastNotificationConstants (copy)
	local function _(): number --[[ Line: 440 | Named "buttonHoldTime" ]]
		-- upvalues: self (copy)
		return tick() - self._lastMenuButtonPress
	end
	
	local Visible = Toast ~= nil and Toast.Visible
	
	if UserInputState == Enum.UserInputState.Begin then
		self._lastMenuButtonPress = tick()
		
		return false
	else
		return UserInputState == Enum.UserInputState.End and (Visible and tick() - self._lastMenuButtonPress < ToastNotificationConstants.MenuButtonPressHoldTime)
	end
end

function Module:_logExperienceMenuGamepadExposure() --[[ Line: 455 ]]
	-- upvalues: FFlagExperienceMenuGamepadExposureEnabled (copy), IXPServiceWrapper (copy), AppUserLayers (copy)
	if FFlagExperienceMenuGamepadExposureEnabled and not self._loggedExperienceMenuGamepadExposure then
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AppUserLayers.ExperienceMenuGamepadExposureLayer)
		self._loggedExperienceMenuGamepadExposure = true
	end
end

function Module._bindSelf(p2, Callback) --[[ Line: 462 ]]
	return function(...) --[[ Line: 463 ]]
		-- upvalues: Callback (copy), p2 (copy)
		return Callback(p2, ...)
	end
end

return if FFlagEnableConsoleExpControls then Module.new() else Module