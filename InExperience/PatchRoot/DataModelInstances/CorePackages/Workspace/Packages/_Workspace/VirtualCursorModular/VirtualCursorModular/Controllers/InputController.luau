local parent = script.Parent.Parent
local contextActionService = game:GetService("ContextActionService")
local gamepadService = game:GetService("GamepadService")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local utilModule = require(parent.Util)
local processThumbstickInput = utilModule.ProcessThumbstickInput
local getRectCenter = utilModule.GetRectCenter
local getThumbstickInputFromDirectionalInput = utilModule.GetThumbstickInputFromDirectionalInput
local enumsModule = require(parent.Enums)
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: enumsModule (ref), t (ref)
	return setmetatable({
		_enabled = false,
		_previousSelection = nil,
		_selectedObjectChangedConnection = nil,
		_gamepadSelectionRect2DChangedConnection = nil,
		_selectedRectChangedConnection = nil,
		_inputBeganConnection = nil,
		_inputEndedConnection = nil,
		_cursorController = p1,
		_moveVector = Vector2.new(),
		_scrollVector = Vector2.new(),
		_behavior = enumsModule.Behavior.SelectionPreview,
		_activeDirections = {}
	}, t)
end

function t:Destroy()
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

function t:OnMove(_, p1)
	-- upvalues: enumsModule (ref), guiService (ref), processThumbstickInput (ref), getRectCenter (ref)
	if self._behavior ~= enumsModule.Behavior.SelectionPreview then
		return Enum.ContextActionResult.Pass
	elseif guiService.SelectedObject == nil then
		return Enum.ContextActionResult.Pass
	elseif p1 then
		self._moveVector = processThumbstickInput(Vector2.new(p1.Position.X, p1.Position.Y))
	end
	local var1 = (if guiService.SelectedCoreObject ~= nil then guiService.SelectedObject ~= nil else true) and self._moveVector ~= Vector2.zero
	
	if var1 and not self._cursorController:GetEnabled() then
		if self._previousSelection then
			self._cursorController:Enable(getRectCenter(self._previousSelection.SelectionRect2D))
		elseif guiService.SelectedObject then
			self._cursorController:Enable(getRectCenter(guiService.SelectedObject.SelectionRect2D))
		end
	elseif not var1 and self._cursorController:GetEnabled() then
		self._cursorController:Disable()
	end
	local selectedRectChangedConnection = self._selectedRectChangedConnection
	
	if selectedRectChangedConnection then
		selectedRectChangedConnection:Disconnect()
		self._selectedRectChangedConnection = nil
	end
	if var1 and guiService.SelectedObject then
		local selectedObject = guiService.SelectedObject
		self._selectedRectChangedConnection = selectedObject:GetPropertyChangedSignal("SelectionRect2D"):Connect(function()
			-- upvalues: selectedObject (ref), self (ref), enumsModule (copy), getRectCenter (copy)
			if selectedObject and self._behavior == enumsModule.Behavior.SelectionPreview then
				self._cursorController:TweenPosition(getRectCenter(selectedObject.SelectionRect2D))
			end
		end)
		self._cursorController:TweenPosition(getRectCenter(guiService.SelectedObject.SelectionRect2D))
	end
	return Enum.ContextActionResult.Pass
end

function t:OnScroll(p1, p2)
	-- upvalues: enumsModule (ref)
	if self._behavior == enumsModule.Behavior.VirtualCursor then
		if p1 == Enum.UserInputState.Change and p2 then
			self._scrollVector = Vector2.new(p2.Position.X, p2.Position.Y) * Vector2.new(1, -1)
			
			return Enum.ContextActionResult.Sink
		end
		self._scrollVector = Vector2.zero
	end
	return Enum.ContextActionResult.Pass
end

function t:OnActivate(p1, _)
	-- upvalues: guiService (ref)
	if p1 == Enum.UserInputState.Begin then
		if guiService.SelectedObject or guiService.SelectedCoreObject then
			self._cursorController:PlayTweenActivate()
		end
	elseif p1 == Enum.UserInputState.End and (guiService.SelectedObject or guiService.SelectedCoreObject) then
		self._cursorController:PlayTweenDefault()
	end
	return Enum.ContextActionResult.Pass
end

function t:OnDirectionalButtons(p1, p2)
	-- upvalues: enumsModule (ref), getThumbstickInputFromDirectionalInput (ref), processThumbstickInput (ref)
	if self._behavior ~= enumsModule.Behavior.VirtualCursor or not p2 then
		return Enum.ContextActionResult.Pass
	end
	local pass = Enum.ContextActionResult.Pass
	
	if p1 == Enum.UserInputState.Begin or p1 == Enum.UserInputState.Change then
		self._activeDirections[p2.KeyCode] = p2.Position.Z
		pass = Enum.ContextActionResult.Sink
	else
		self._activeDirections[p2.KeyCode] = nil
	end
	local zero = Vector2.zero
	
	for i, v in self._activeDirections do
		zero += getThumbstickInputFromDirectionalInput(i, v)
	end
	if zero.Magnitude > 1 then
		zero = zero.Unit
	end
	self._moveVector = processThumbstickInput(zero)
	
	return pass
end

function t:GetMoveVector()
	return self._moveVector
end

function t:GetScrollVector()
	return self._scrollVector
end

function t:SetBehavior(p3)
	-- upvalues: enumsModule (ref), contextActionService (ref), gamepadService (ref), processThumbstickInput (ref), userInputService (ref), guiService (ref)
	local behavior = self._behavior
	self._behavior = p3
	
	if behavior == enumsModule.Behavior.VirtualCursor then
		self._moveVector = Vector2.new()
		self._scrollVector = Vector2.new()
		table.clear(self._activeDirections)
		contextActionService:UnbindCoreAction(enumsModule.Action.DirectionalMove)
		contextActionService:UnbindCoreAction(enumsModule.Action.Scroll)
		local gamepadThumbstick1ChangedConnection = self._gamepadThumbstick1ChangedConnection
		
		if gamepadThumbstick1ChangedConnection then
			gamepadThumbstick1ChangedConnection:Disconnect()
			self._gamepadThumbstick1ChangedConnection = nil
		end
		local inputBeganConnection = self._inputBeganConnection
		
		if inputBeganConnection then
			inputBeganConnection:Disconnect()
			self._inputBeganConnection = nil
		end
		local inputEndedConnection = self._inputEndedConnection
		
		if inputEndedConnection then
			inputEndedConnection:Disconnect()
			self._inputEndedConnection = nil
		end
		self:OnScroll(Enum.UserInputState.Cancel, nil)
	elseif behavior == enumsModule.Behavior.SelectionPreview then
		contextActionService:UnbindCoreAction(enumsModule.Action.Move)
		local selectedObjectChangedConnection = self._selectedObjectChangedConnection
		
		if selectedObjectChangedConnection then
			selectedObjectChangedConnection:Disconnect()
			self._selectedObjectChangedConnection = nil
		end
		local selectedRectChangedConnection = self._selectedRectChangedConnection
		
		if selectedRectChangedConnection then
			selectedRectChangedConnection:Disconnect()
			self._selectedRectChangedConnection = nil
		end
	end
	if self._behavior == enumsModule.Behavior.VirtualCursor then
		contextActionService:BindCoreActionAtPriority(enumsModule.Action.Scroll, function(_, p4, p5)
			-- upvalues: self (ref)
			return self:OnScroll(p4, p5)
		end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick2)
		contextActionService:BindCoreActionAtPriority(enumsModule.Action.DirectionalMove, function(_, p4, p5)
			-- upvalues: self (ref)
			return self:OnDirectionalButtons(p4, p5)
		end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.ButtonUp, Enum.KeyCode.ButtonDown, Enum.KeyCode.ButtonLeft, Enum.KeyCode.ButtonRight)
		self._gamepadThumbstick1ChangedConnection = gamepadService.GamepadThumbstick1Changed:Connect(function(p4)
			-- upvalues: self (ref), processThumbstickInput (copy)
			self._moveVector = processThumbstickInput(p4)
		end)
		self._inputBeganConnection = userInputService.InputBegan:Connect(function(p4, _)
			-- upvalues: self (ref)
			if p4.KeyCode == Enum.KeyCode.ButtonA or p4.KeyCode == Enum.KeyCode.ButtonCenter then
				self:OnActivate(Enum.UserInputState.Begin, p4)
			end
		end)
		self._inputEndedConnection = userInputService.InputEnded:Connect(function(p4, _)
			-- upvalues: self (ref)
			if p4.KeyCode == Enum.KeyCode.ButtonA or p4.KeyCode == Enum.KeyCode.ButtonCenter then
				self:OnActivate(Enum.UserInputState.End, p4)
			end
		end)
		
		return
	elseif self._behavior == enumsModule.Behavior.SelectionPreview then
		self._selectedObjectChangedConnection = guiService:GetPropertyChangedSignal("SelectedObject"):Connect(function()
			-- upvalues: self (ref), guiService (copy)
			self:OnMove(Enum.UserInputState.Change, nil)
			self._previousSelection = guiService.SelectedObject
		end)
		contextActionService:BindCoreActionAtPriority(enumsModule.Action.Move, function(_, p4, p5)
			-- upvalues: self (ref)
			return self:OnMove(p4, p5)
		end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick1)
	end
end

return t