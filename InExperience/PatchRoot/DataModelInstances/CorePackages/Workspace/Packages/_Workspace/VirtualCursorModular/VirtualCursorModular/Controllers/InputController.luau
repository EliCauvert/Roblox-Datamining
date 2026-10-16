local Parent = script.Parent.Parent
local ContextActionService = game:GetService("ContextActionService")
local GamepadService = game:GetService("GamepadService")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local UtilModule = require(Parent.Util)
local ProcessThumbstickInputFunction = UtilModule.ProcessThumbstickInput
local GetRectCenterFunction = UtilModule.GetRectCenter
local GetThumbstickInputFromDirectionalInputFunction = UtilModule.GetThumbstickInputFromDirectionalInput
local EnumsModule = require(Parent.Enums)
local InputController = {}
InputController.__index = InputController

function InputController.new(_cursorController) --[[ Line: 37 ]]
	-- upvalues: EnumsModule (copy), InputController (copy)
	return (setmetatable({
		_enabled = false,
		_previousSelection = nil,
		_selectedObjectChangedConnection = nil,
		_gamepadSelectionRect2DChangedConnection = nil,
		_selectedRectChangedConnection = nil,
		_inputBeganConnection = nil,
		_inputEndedConnection = nil,
		_cursorController = _cursorController,
		_moveVector = Vector2.new(),
		_scrollVector = Vector2.new(),
		_behavior = EnumsModule.Behavior.SelectionPreview,
		_activeDirections = {}
	}, InputController))
end

function InputController:Destroy() --[[ Line: 56 ]]
	if self._selectedObjectChangedConnection then
		self._selectedObjectChangedConnection:Disconnect()
	end
	if self._gamepadSelectionRect2DChangedConnection then
		self._gamepadSelectionRect2DChangedConnection:Disconnect()
	end
	if self._selectedRectChangedConnection then
		self._selectedRectChangedConnection:Disconnect()
	end
	if self._inputBeganConnection then
		self._inputBeganConnection:Disconnect()
	end
	if self._inputEndedConnection then
		self._inputEndedConnection:Disconnect()
	end
end

function InputController:OnMove(_, p1) --[[ Line: 78 ]]
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
		self._selectedRectChangedConnection = SelectedObject:GetPropertyChangedSignal("SelectionRect2D"):Connect(function() --[[ Line: 119 ]]
			-- upvalues: SelectedObject (copy), self (copy), EnumsModule (upval), GetRectCenterFunction (upval)
			if SelectedObject and self._behavior == EnumsModule.Behavior.SelectionPreview then
				self._cursorController:TweenPosition(GetRectCenterFunction(SelectedObject.SelectionRect2D))
			end
		end)
		self._cursorController:TweenPosition(GetRectCenterFunction(GuiService.SelectedObject.SelectionRect2D))
	end
	return Enum.ContextActionResult.Pass
end

function InputController:OnScroll(Cancel, p1) --[[ Line: 132 ]]
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

function InputController:OnActivate(UserInputState, _) --[[ Line: 145 ]]
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

function InputController:OnDirectionalButtons(UserInputState, Input) --[[ Line: 159 ]]
	-- upvalues: EnumsModule (copy), GetThumbstickInputFromDirectionalInputFunction (copy), ProcessThumbstickInputFunction (copy)
	if self._behavior ~= EnumsModule.Behavior.VirtualCursor or not Input then
		return Enum.ContextActionResult.Pass
	end
	local KeyCode = Input.KeyCode
	
	if KeyCode ~= Enum.KeyCode.ButtonUp and KeyCode ~= Enum.KeyCode.ButtonDown and KeyCode ~= Enum.KeyCode.ButtonLeft and KeyCode ~= Enum.KeyCode.ButtonRight then
		return Enum.ContextActionResult.Pass
	end
	local Pass = Enum.ContextActionResult.Pass
	
	if UserInputState == Enum.UserInputState.Begin or UserInputState == Enum.UserInputState.Change then
		self._activeDirections[Input.KeyCode] = Input.Position.Z
		Pass = Enum.ContextActionResult.Sink
	else
		self._activeDirections[Input.KeyCode] = nil
	end
	local ZeroVector = Vector2.zero
	
	for i, activeDirection in self._activeDirections do
		ZeroVector += GetThumbstickInputFromDirectionalInputFunction(i, activeDirection)
	end
	if ZeroVector.Magnitude > 1 then
		ZeroVector = ZeroVector.Unit
	end
	self._moveVector = ProcessThumbstickInputFunction(ZeroVector)
	
	return Pass
end

function InputController:GetMoveVector() --[[ Line: 205 ]]
	return self._moveVector
end

function InputController:GetScrollVector() --[[ Line: 209 ]]
	return self._scrollVector
end

function InputController:SetBehavior(_behavior) --[[ Line: 213 ]]
	-- upvalues: EnumsModule (copy), ContextActionService (copy), GamepadService (copy), ProcessThumbstickInputFunction (copy), UserInputService (copy), GuiService (copy)
	local Behavior = self._behavior
	self._behavior = _behavior
	
	if Behavior == EnumsModule.Behavior.VirtualCursor then
		self._moveVector = Vector2.new()
		self._scrollVector = Vector2.new()
		table.clear(self._activeDirections)
		ContextActionService:UnbindCoreAction(EnumsModule.Action.DirectionalMove)
		ContextActionService:UnbindCoreAction(EnumsModule.Action.Scroll)
		local GamepadThumbstick1ChangedConnection = self._gamepadThumbstick1ChangedConnection
		
		if GamepadThumbstick1ChangedConnection then
			GamepadThumbstick1ChangedConnection:Disconnect()
			self._gamepadThumbstick1ChangedConnection = nil
		end
		local InputBeganConnection = self._inputBeganConnection
		
		if InputBeganConnection then
			InputBeganConnection:Disconnect()
			self._inputBeganConnection = nil
		end
		local InputEndedConnection = self._inputEndedConnection
		
		if InputEndedConnection then
			InputEndedConnection:Disconnect()
			self._inputEndedConnection = nil
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
		ContextActionService:BindCoreActionAtPriority(EnumsModule.Action.Scroll, function(_, p1, p2) --[[ Line: 263 ]]
			-- upvalues: self (copy)
			return self:OnScroll(p1, p2)
		end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick2)
		ContextActionService:BindCoreActionAtPriority(EnumsModule.Action.DirectionalMove, function(_, UserInputState, Input) --[[ Line: 273 ]]
			-- upvalues: self (copy)
			return self:OnDirectionalButtons(UserInputState, Input)
		end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.ButtonUp, Enum.KeyCode.ButtonDown, Enum.KeyCode.ButtonLeft, Enum.KeyCode.ButtonRight)
		self._gamepadThumbstick1ChangedConnection = GamepadService.GamepadThumbstick1Changed:Connect(function(Event) --[[ Line: 284 ]]
			-- upvalues: self (copy), ProcessThumbstickInputFunction (upval)
			self._moveVector = ProcessThumbstickInputFunction(Event)
		end)
		self._inputBeganConnection = UserInputService.InputBegan:Connect(function(Input, _) --[[ Line: 289 ]]
			-- upvalues: self (copy)
			if Input.KeyCode == Enum.KeyCode.ButtonA or Input.KeyCode == Enum.KeyCode.ButtonCenter then
				self:OnActivate(Enum.UserInputState.Begin, Input)
			end
		end)
		self._inputEndedConnection = UserInputService.InputEnded:Connect(function(Input, _) --[[ Line: 295 ]]
			-- upvalues: self (copy)
			if Input.KeyCode == Enum.KeyCode.ButtonA or Input.KeyCode == Enum.KeyCode.ButtonCenter then
				self:OnActivate(Enum.UserInputState.End, Input)
			end
		end)
		
		return
	elseif self._behavior == EnumsModule.Behavior.SelectionPreview then
		self._selectedObjectChangedConnection = GuiService:GetPropertyChangedSignal("SelectedObject"):Connect(function() --[[ Line: 301 ]]
			-- upvalues: self (copy), GuiService (upval)
			self:OnMove(Enum.UserInputState.Change, nil)
			self._previousSelection = GuiService.SelectedObject
		end)
		ContextActionService:BindCoreActionAtPriority(EnumsModule.Action.Move, function(_, p1, p2) --[[ Line: 308 ]]
			-- upvalues: self (copy)
			return self:OnMove(p1, p2)
		end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick1)
	end
end

return InputController