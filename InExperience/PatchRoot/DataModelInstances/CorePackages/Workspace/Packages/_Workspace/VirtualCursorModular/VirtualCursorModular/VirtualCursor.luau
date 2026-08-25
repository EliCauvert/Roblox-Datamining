local virtualCursorModular = script:FindFirstAncestor("VirtualCursorModular")
local parent = virtualCursorModular.Parent
local _ = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local gamepadService = game:GetService("GamepadService")
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableSnapInVirtualCursor = sharedFlagsModule.FFlagEnableSnapInVirtualCursor
local fFlagVCWasDisabledFromMenuOpen = sharedFlagsModule.FFlagVCWasDisabledFromMenuOpen
local fFlagEnableVirtualCursorDebugging = sharedFlagsModule.FFlagEnableVirtualCursorDebugging
local inputControllerModule = require(virtualCursorModular.Controllers.InputController)
local cursorControllerModule = require(virtualCursorModular.Controllers.CursorController)
local selectionControllerModule = require(virtualCursorModular.Controllers.SelectionController)
local snapControllerModule = require(virtualCursorModular.Controllers.SnapController)
local enumsModule = require(virtualCursorModular.Enums)
local propertiesModule = require(virtualCursorModular.Properties)
local t = {}
t.__index = t

function t.new()
	-- upvalues: cursorControllerModule (ref), inputControllerModule (ref), fFlagEnableSnapInVirtualCursor (ref), snapControllerModule (ref), selectionControllerModule (ref), enumsModule (ref), propertiesModule (ref), t (ref)
	local var13 = cursorControllerModule.new()
	local var14 = inputControllerModule.new(var13)
	local var15 = if fFlagEnableSnapInVirtualCursor then snapControllerModule.new() else nil
	local var16 = selectionControllerModule.new(var14, var13, var15)
	
	if fFlagEnableSnapInVirtualCursor and var15 then
		var15:setMethodStrength(enumsModule.SnapAssistMethod.Friction, propertiesModule.SnapFrictionStrength)
		var15:setMethodStrength(enumsModule.SnapAssistMethod.Tracking, propertiesModule.SnapTrackingStrength)
		var15:setMethodStrength(enumsModule.SnapAssistMethod.Centering, propertiesModule.SnapCenteringStrength)
	end
	local tbl = setmetatable({
		_selectedObject = nil,
		_previouslySelectedObject = nil,
		_wasDisabledFromOtherInput = false,
		_lastInputTypeChangedEventConnection = nil,
		_gamepadCursorEnabledConnection = nil,
		_menuOpenedEventConnection = nil,
		_boundToRenderStep = false,
		_wasDisabledFromMenuOpen = false,
		_cursorPosition = Vector2.new(),
		_cursorController = var13,
		_inputController = var14,
		_selectionController = var16,
		_snapController = var15
	}, t)
	tbl:initialize()
	
	return tbl
end

function t:Destroy()
	-- upvalues: runService (ref)
	local lastInputTypeChangedEventConnection = self._lastInputTypeChangedEventConnection
	
	if lastInputTypeChangedEventConnection then
		lastInputTypeChangedEventConnection:Disconnect()
		self._lastInputTypeChangedEventConnection = nil
	end
	local gamepadCursorEnabledConnection = self._gamepadCursorEnabledConnection
	
	if gamepadCursorEnabledConnection then
		gamepadCursorEnabledConnection:Disconnect()
		self._gamepadCursorEnabledConnection = nil
	end
	local menuOpenedEventConnection = self._menuOpenedEventConnection
	
	if menuOpenedEventConnection then
		menuOpenedEventConnection:Disconnect()
		self._menuOpenedEventConnection = nil
	end
	if self._boundToRenderStep then
		runService:UnbindFromRenderStep("VirtualCursorStepped")
		self._boundToRenderStep = false
	end
	if self._inputController then
		self._inputController:Destroy()
	end
	if self._cursorController then
		self._cursorController:Destroy()
	end
end

function t:UpdateGamepadCursor()
	-- upvalues: gamepadService (ref), userInputService (ref)
	if gamepadService.GamepadCursorEnabled then
		self:EnableVirtualCursor(userInputService:GetMouseLocation())
		
		return
	end
	self:EnableSelectionPreview()
end

function t:initialize()
	-- upvalues: userInputService (ref), gamepadService (ref), fFlagEnableVirtualCursorDebugging (ref)
	self._lastInputTypeChangedEventConnection = userInputService.LastInputTypeChanged:Connect(function(p0)
		-- upvalues: gamepadService (copy), self (ref), fFlagEnableVirtualCursorDebugging (copy)
		if p0 ~= Enum.UserInputType.Gamepad1 and p0 ~= Enum.UserInputType.Focus and gamepadService.GamepadCursorEnabled then
			gamepadService.GamepadCursorEnabled = false
			self._wasDisabledFromOtherInput = true
		elseif p0 == Enum.UserInputType.Gamepad1 and self._wasDisabledFromOtherInput then
			gamepadService.GamepadCursorEnabled = true
			self._wasDisabledFromOtherInput = false
		end
		if fFlagEnableVirtualCursorDebugging then
			print("LastInputTypeChanged", p0, gamepadService.GamepadCursorEnabled, self._wasDisabledFromOtherInput)
		end
	end)
	self._gamepadCursorEnabledConnection = gamepadService:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(function()
		-- upvalues: self (ref)
		self:UpdateGamepadCursor()
	end)
	self:UpdateGamepadCursor()
end

function t:onRenderStep(p1)
	self._selectionController:onRenderStep(p1)
end

function t:EnableVirtualCursor(p2)
	-- upvalues: gamepadService (ref), enumsModule (ref), runService (ref), guiService (ref), fFlagVCWasDisabledFromMenuOpen (ref)
	self._cursorController:Enable(p2)
	gamepadService:SetGamepadCursorPosition(p2)
	self._inputController:SetBehavior(enumsModule.Behavior.VirtualCursor)
	
	if not self._boundToRenderStep then
		runService:BindToRenderStep("VirtualCursorStepped", Enum.RenderPriority.Input.Value + 1, function(p3)
			-- upvalues: self (ref)
			self:onRenderStep(p3)
		end)
		self._boundToRenderStep = true
	end
	self._menuOpenedEventConnection = guiService.MenuOpened:Connect(function()
		-- upvalues: gamepadService (copy), fFlagVCWasDisabledFromMenuOpen (copy), self (ref)
		gamepadService.GamepadCursorEnabled = false
		
		if fFlagVCWasDisabledFromMenuOpen then
			self._wasDisabledFromMenuOpen = true
		end
	end)
end

function t:EnableSelectionPreview()
	-- upvalues: enumsModule (ref), runService (ref), guiService (ref), fFlagVCWasDisabledFromMenuOpen (ref)
	local menuOpenedEventConnection = self._menuOpenedEventConnection
	
	if menuOpenedEventConnection then
		menuOpenedEventConnection:Disconnect()
		self._menuOpenedEventConnection = nil
	end
	self._cursorController:Disable()
	self._inputController:SetBehavior(enumsModule.Behavior.SelectionPreview)
	
	if self._boundToRenderStep then
		runService:UnbindFromRenderStep("VirtualCursorStepped")
		self._boundToRenderStep = false
	end
	guiService.SelectedObject = nil
	
	if not fFlagVCWasDisabledFromMenuOpen or not self._wasDisabledFromMenuOpen then
		guiService.SelectedCoreObject = nil
	end
	if fFlagVCWasDisabledFromMenuOpen then
		self._wasDisabledFromMenuOpen = false
	end
end

return t.new()