local Parent = script.Parent.Parent
local ContextActionService = game:GetService("ContextActionService")
local GamepadService = game:GetService("GamepadService")
local GuiService = game:GetService("GuiService")
local UtilModule = require(Parent.Util)
local ProcessThumbstickInputFunction = UtilModule.ProcessThumbstickInput
local GetRectCenterFunction = UtilModule.GetRectCenter
local EnumsModule = require(Parent.Enums)
local InputController = {}
InputController.__index = InputController

function InputController.new(_cursorController)
	-- upvalues: EnumsModule (copy), InputController (copy)
	return (setmetatable({
		_enabled = false,
		_previousSelection = nil,
		_selectedObjectChangedConnection = nil,
		_gamepadSelectionRect2DChangedConnection = nil,
		_selectedRectChangedConnection = nil,
		_cursorController = _cursorController,
		_moveVector = Vector2.new(),
		_scrollVector = Vector2.new(),
		_behavior = EnumsModule.Behavior.SelectionPreview
	}, InputController))
end

function InputController:Destroy()
	if self._selectedObjectChangedConnection then
		self._selectedObjectChangedConnection:Disconnect()
	end
	if self._gamepadSelectionRect2DChangedConnection then
		self._gamepadSelectionRect2DChangedConnection:Disconnect()
	end
	if self._selectedRectChangedConnection then
		self._selectedRectChangedConnection:Disconnect()
	end
end

function InputController:OnMove(_, p1)
	-- upvalues: EnumsModule (copy), GuiService (copy), ProcessThumbstickInputFunction (copy), GetRectCenterFunction (copy)
	if self._behavior ~= EnumsModule.Behavior.SelectionPreview then
		return Enum.ContextActionResult.Pass
	end
	if GuiService.SelectedObject == nil then
		return Enum.ContextActionResult.Pass
	end
	if p1 then
		self._moveVector = ProcessThumbstickInputFunction(Vector2.new(p1.Position.X, p1.Position.Y))
	end
	local IsNotMoveVectorMatch = self._moveVector ~= Vector2.zero
	local IsNotMoveVectorMatch1: boolean = (GuiService.SelectedCoreObject == nil or GuiService.SelectedObject ~= nil) and IsNotMoveVectorMatch
	
	if IsNotMoveVectorMatch1 and not self._cursorController:GetEnabled() then
		if self._previousSelection then
			self._cursorController:Enable(GetRectCenterFunction(self._previousSelection.SelectionRect2D))
		elseif GuiService.SelectedObject then
			self._cursorController:Enable(GetRectCenterFunction(GuiService.SelectedObject.SelectionRect2D))
		end
	elseif not IsNotMoveVectorMatch1 and self._cursorController:GetEnabled() then
		self._cursorController:Disable()
	end
	local SelectedRectChangedConnection = self._selectedRectChangedConnection
	
	if SelectedRectChangedConnection then
		SelectedRectChangedConnection:Disconnect()
		self._selectedRectChangedConnection = nil
	end
	if IsNotMoveVectorMatch1 and GuiService.SelectedObject then
		local SelectedObject = GuiService.SelectedObject
		self._selectedRectChangedConnection = SelectedObject:GetPropertyChangedSignal("SelectionRect2D"):Connect(function()
			-- upvalues: SelectedObject (copy), self (copy), EnumsModule (upval), GetRectCenterFunction (upval)
			if SelectedObject and self._behavior == EnumsModule.Behavior.SelectionPreview then
				self._cursorController:TweenPosition(GetRectCenterFunction(SelectedObject.SelectionRect2D))
			end
		end)
		self._cursorController:TweenPosition(GetRectCenterFunction(GuiService.SelectedObject.SelectionRect2D))
	end
	return Enum.ContextActionResult.Pass
end

function InputController:OnScroll(Cancel, p1)
	-- upvalues: EnumsModule (copy)
	if self._behavior == EnumsModule.Behavior.VirtualCursor then
		if Cancel == Enum.UserInputState.Change and p1 then
			self._scrollVector = Vector2.new(p1.Position.X, p1.Position.Y) * Vector2.new(1, -1)
			
			return Enum.ContextActionResult.Sink
		end
		self._scrollVector = Vector2.zero
	end
	return Enum.ContextActionResult.Pass
end

function InputController:OnActivate(UserInputState, _)
	-- upvalues: GuiService (copy)
	if UserInputState == Enum.UserInputState.Begin then
		if GuiService.SelectedObject or GuiService.SelectedCoreObject then
			self._cursorController:PlayTweenActivate()
		end
	elseif UserInputState == Enum.UserInputState.End and (GuiService.SelectedObject or GuiService.SelectedCoreObject) then
		self._cursorController:PlayTweenDefault()
	end
	return Enum.ContextActionResult.Pass
end

function InputController:GetMoveVector()
	return self._moveVector
end

function InputController:GetScrollVector()
	return self._scrollVector
end

function InputController:SetBehavior(_behavior)
	-- upvalues: EnumsModule (copy), ContextActionService (copy), GamepadService (copy), ProcessThumbstickInputFunction (copy), GuiService (copy)
	local Behavior = self._behavior
	self._behavior = _behavior
	
	if Behavior == EnumsModule.Behavior.VirtualCursor then
		self._moveVector = Vector2.new()
		self._scrollVector = Vector2.new()
		ContextActionService:UnbindCoreAction(EnumsModule.Action.Activate)
		ContextActionService:UnbindCoreAction(EnumsModule.Action.Scroll)
		local GamepadThumbstick1ChangedConnection = self._gamepadThumbstick1ChangedConnection
		
		if GamepadThumbstick1ChangedConnection then
			GamepadThumbstick1ChangedConnection:Disconnect()
			self._gamepadThumbstick1ChangedConnection = nil
		end
		self:OnScroll(Enum.UserInputState.Cancel, nil)
	elseif Behavior == EnumsModule.Behavior.SelectionPreview then
		ContextActionService:UnbindCoreAction(EnumsModule.Action.Move)
		local SelectedObjectChangedConnection = self._selectedObjectChangedConnection
		
		if SelectedObjectChangedConnection then
			SelectedObjectChangedConnection:Disconnect()
			self._selectedObjectChangedConnection = nil
		end
		local SelectedRectChangedConnection = self._selectedRectChangedConnection
		
		if SelectedRectChangedConnection then
			SelectedRectChangedConnection:Disconnect()
			self._selectedRectChangedConnection = nil
		end
	end
	if self._behavior == EnumsModule.Behavior.VirtualCursor then
		ContextActionService:BindCoreActionAtPriority(EnumsModule.Action.Activate, function(_, UserInputState, p1)
			-- upvalues: self (copy)
			return self:OnActivate(UserInputState, p1)
		end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.ButtonA)
		ContextActionService:BindCoreActionAtPriority(EnumsModule.Action.Scroll, function(_, p1, p2)
			-- upvalues: self (copy)
			return self:OnScroll(p1, p2)
		end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick2)
		self._gamepadThumbstick1ChangedConnection = GamepadService.GamepadThumbstick1Changed:Connect(function(Event)
			-- upvalues: self (copy), ProcessThumbstickInputFunction (upval)
			self._moveVector = ProcessThumbstickInputFunction(Event)
		end)
		
		return
	end
	if self._behavior == EnumsModule.Behavior.SelectionPreview then
		self._selectedObjectChangedConnection = GuiService:GetPropertyChangedSignal("SelectedObject"):Connect(function()
			-- upvalues: self (copy), GuiService (upval)
			self:OnMove(Enum.UserInputState.Change, nil)
			self._previousSelection = GuiService.SelectedObject
		end)
		ContextActionService:BindCoreActionAtPriority(EnumsModule.Action.Move, function(_, p1, p2)
			-- upvalues: self (copy)
			return self:OnMove(p1, p2)
		end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick1)
	end
end

return InputController