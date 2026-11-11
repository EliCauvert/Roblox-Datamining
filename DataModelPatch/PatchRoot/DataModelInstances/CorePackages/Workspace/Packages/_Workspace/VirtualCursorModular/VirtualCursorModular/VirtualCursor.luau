local VirtualCursorModular = script:FindFirstAncestor("VirtualCursorModular")
local _ = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local GamepadService = game:GetService("GamepadService")
local SharedFlagsModule = require(VirtualCursorModular.Parent.SharedFlags)
local FFlagEnableSnapInVirtualCursor = SharedFlagsModule.FFlagEnableSnapInVirtualCursor
local FFlagVCWasDisabledFromMenuOpen = SharedFlagsModule.FFlagVCWasDisabledFromMenuOpen
local FFlagEnableVirtualCursorDebugging = SharedFlagsModule.FFlagEnableVirtualCursorDebugging
local InputControllerModule = require(VirtualCursorModular.Controllers.InputController)
local CursorControllerModule = require(VirtualCursorModular.Controllers.CursorController)
local SelectionControllerModule = require(VirtualCursorModular.Controllers.SelectionController)
local SnapControllerModule = require(VirtualCursorModular.Controllers.SnapController)
local EnumsModule = require(VirtualCursorModular.Enums)
local PropertiesModule = require(VirtualCursorModular.Properties)
local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: CursorControllerModule (copy), InputControllerModule (copy), FFlagEnableSnapInVirtualCursor (copy), SnapControllerModule (copy), SelectionControllerModule (copy), EnumsModule (copy), PropertiesModule (copy), Module (copy)
	local NewCursorController = CursorControllerModule.new()
	local NewInputController = InputControllerModule.new(NewCursorController)
	local NewSnapController = if FFlagEnableSnapInVirtualCursor then SnapControllerModule.new() else nil
	local NewSelectionController = SelectionControllerModule.new(NewInputController, NewCursorController, NewSnapController)
	
	if FFlagEnableSnapInVirtualCursor and NewSnapController then
		NewSnapController:setMethodStrength(EnumsModule.SnapAssistMethod.Friction, PropertiesModule.SnapFrictionStrength)
		NewSnapController:setMethodStrength(EnumsModule.SnapAssistMethod.Tracking, PropertiesModule.SnapTrackingStrength)
		NewSnapController:setMethodStrength(EnumsModule.SnapAssistMethod.Centering, PropertiesModule.SnapCenteringStrength)
	end
	local self = setmetatable({
		_selectedObject = nil,
		_previouslySelectedObject = nil,
		_wasDisabledFromOtherInput = false,
		_lastInputTypeChangedEventConnection = nil,
		_gamepadCursorEnabledConnection = nil,
		_menuOpenedEventConnection = nil,
		_boundToRenderStep = false,
		_wasDisabledFromMenuOpen = false,
		_cursorPosition = Vector2.new(),
		_cursorController = NewCursorController,
		_inputController = NewInputController,
		_selectionController = NewSelectionController,
		_snapController = NewSnapController
	}, Module)
	self:initialize()
	
	return self
end

function Module:Destroy()
	-- upvalues: RunService (copy)
	local LastInputTypeChangedEventConnection = self._lastInputTypeChangedEventConnection
	
	if LastInputTypeChangedEventConnection then
		LastInputTypeChangedEventConnection:Disconnect()
		self._lastInputTypeChangedEventConnection = nil
	end
	local GamepadCursorEnabledConnection = self._gamepadCursorEnabledConnection
	
	if GamepadCursorEnabledConnection then
		GamepadCursorEnabledConnection:Disconnect()
		self._gamepadCursorEnabledConnection = nil
	end
	local MenuOpenedEventConnection = self._menuOpenedEventConnection
	
	if MenuOpenedEventConnection then
		MenuOpenedEventConnection:Disconnect()
		self._menuOpenedEventConnection = nil
	end
	if self._boundToRenderStep then
		RunService:UnbindFromRenderStep("VirtualCursorStepped")
		self._boundToRenderStep = false
	end
	if self._inputController then
		self._inputController:Destroy()
	end
	if self._cursorController then
		self._cursorController:Destroy()
	end
end

function Module:UpdateGamepadCursor()
	-- upvalues: GamepadService (copy), UserInputService (copy)
	if GamepadService.GamepadCursorEnabled then
		self:EnableVirtualCursor((UserInputService:GetMouseLocation()))
		
		return
	else
		self:EnableSelectionPreview()
	end
end

function Module:initialize()
	-- upvalues: UserInputService (copy), GamepadService (copy), FFlagEnableVirtualCursorDebugging (copy)
	self._lastInputTypeChangedEventConnection = UserInputService.LastInputTypeChanged:Connect(function(UserInputType)
		-- upvalues: GamepadService (upval), self (copy), FFlagEnableVirtualCursorDebugging (upval)
		if UserInputType == Enum.UserInputType.Gamepad1 or UserInputType == Enum.UserInputType.Focus or not GamepadService.GamepadCursorEnabled then
			if UserInputType == Enum.UserInputType.Gamepad1 and self._wasDisabledFromOtherInput then
				GamepadService.GamepadCursorEnabled = true
				self._wasDisabledFromOtherInput = false
			end
		else
			GamepadService.GamepadCursorEnabled = false
			self._wasDisabledFromOtherInput = true
		end
		if FFlagEnableVirtualCursorDebugging then
			print("LastInputTypeChanged", UserInputType, GamepadService.GamepadCursorEnabled, self._wasDisabledFromOtherInput)
		end
	end)
	self._gamepadCursorEnabledConnection = GamepadService:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(function()
		-- upvalues: self (copy)
		self:UpdateGamepadCursor()
	end)
	self:UpdateGamepadCursor()
end

function Module:onRenderStep(p1)
	self._selectionController:onRenderStep(p1)
end

function Module:EnableVirtualCursor(MouseLocation)
	-- upvalues: GamepadService (copy), EnumsModule (copy), RunService (copy), GuiService (copy), FFlagVCWasDisabledFromMenuOpen (copy)
	self._cursorController:Enable(MouseLocation)
	GamepadService:SetGamepadCursorPosition(MouseLocation)
	self._inputController:SetBehavior(EnumsModule.Behavior.VirtualCursor)
	
	if not self._boundToRenderStep then
		RunService:BindToRenderStep("VirtualCursorStepped", Enum.RenderPriority.Input.Value + 1, function(DeltaTime)
			-- upvalues: self (copy)
			self:onRenderStep(DeltaTime)
		end)
		self._boundToRenderStep = true
	end
	self._menuOpenedEventConnection = GuiService.MenuOpened:Connect(function()
		-- upvalues: GamepadService (upval), FFlagVCWasDisabledFromMenuOpen (upval), self (copy)
		GamepadService.GamepadCursorEnabled = false
		
		if FFlagVCWasDisabledFromMenuOpen then
			self._wasDisabledFromMenuOpen = true
		end
	end)
end

function Module:EnableSelectionPreview()
	-- upvalues: EnumsModule (copy), RunService (copy), GuiService (copy), FFlagVCWasDisabledFromMenuOpen (copy)
	local MenuOpenedEventConnection = self._menuOpenedEventConnection
	
	if MenuOpenedEventConnection then
		MenuOpenedEventConnection:Disconnect()
		self._menuOpenedEventConnection = nil
	end
	self._cursorController:Disable()
	self._inputController:SetBehavior(EnumsModule.Behavior.SelectionPreview)
	
	if self._boundToRenderStep then
		RunService:UnbindFromRenderStep("VirtualCursorStepped")
		self._boundToRenderStep = false
	end
	GuiService.SelectedObject = nil
	
	if not FFlagVCWasDisabledFromMenuOpen or not self._wasDisabledFromMenuOpen then
		GuiService.SelectedCoreObject = nil
	end
	if FFlagVCWasDisabledFromMenuOpen then
		self._wasDisabledFromMenuOpen = false
	end
end

return Module.new()