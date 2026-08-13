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

function t.new(p0) --[[ line: 37 ]]
	-- upvalues: enumsModule (ref), t (ref)
	return setmetatable({
		_enabled = false,
		_previousSelection = nil,
		_selectedObjectChangedConnection = nil,
		_gamepadSelectionRect2DChangedConnection = nil,
		_selectedRectChangedConnection = nil,
		_inputBeganConnection = nil,
		_inputEndedConnection = nil,
		_cursorController = p0,
		_moveVector = Vector2.new(),
		_scrollVector = Vector2.new(),
		_behavior = enumsModule.Behavior.SelectionPreview,
		_activeDirections = {}
	}, t)
end

function t:Destroy() --[[ line: 56 ]]
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

function t:OnMove(_, p1) --[[ line: 78 ]]
	-- upvalues: enumsModule (ref), guiService (ref), processThumbstickInput (ref), getRectCenter (ref)
	if self._behavior ~= enumsModule.Behavior.SelectionPreview then
		return Enum.ContextActionResult.Pass
	elseif guiService.SelectedObject == nil then
		return Enum.ContextActionResult.Pass
	elseif p1 then
		self._moveVector = processThumbstickInput(Vector2.new(p1.Position.X, p1.Position.Y))
	end
	local var7 = (if guiService.SelectedCoreObject ~= nil then guiService.SelectedObject ~= nil else true) and self._moveVector ~= Vector2.zero
	
	if var7 and not self._cursorController:GetEnabled() then
		if self._previousSelection then
			self._cursorController:Enable(getRectCenter(self._previousSelection.SelectionRect2D))
		elseif guiService.SelectedObject then
			self._cursorController:Enable(getRectCenter(guiService.SelectedObject.SelectionRect2D))
		end
	elseif not var7 and self._cursorController:GetEnabled() then
		self._cursorController:Disable()
	end
	local selectedRectChangedConnection = self._selectedRectChangedConnection
	
	if selectedRectChangedConnection then
		selectedRectChangedConnection:Disconnect()
		self._selectedRectChangedConnection = nil
	end
	if var7 and guiService.SelectedObject then
		local selectedObject = guiService.SelectedObject
		self._selectedRectChangedConnection = selectedObject:GetPropertyChangedSignal("SelectionRect2D"):Connect(function() --[[ line: 119 ]]
			-- upvalues: selectedObject (ref), self (ref), enumsModule (copy), getRectCenter (copy)
			if selectedObject and self._behavior == enumsModule.Behavior.SelectionPreview then
				self._cursorController:TweenPosition(getRectCenter(selectedObject.SelectionRect2D))
			end
		end)
		self._cursorController:TweenPosition(getRectCenter(guiService.SelectedObject.SelectionRect2D))
	end
	return Enum.ContextActionResult.Pass
end

function t:OnScroll(p2, p3) --[[ line: 132 ]]
	-- upvalues: enumsModule (ref)
	if self._behavior == enumsModule.Behavior.VirtualCursor then
		if p2 == Enum.UserInputState.Change and p3 then
			self._scrollVector = Vector2.new(p3.Position.X, p3.Position.Y) * Vector2.new(1, -1)
			
			return Enum.ContextActionResult.Sink
		end
		self._scrollVector = Vector2.zero
	end
	return Enum.ContextActionResult.Pass
end

function t:OnActivate(p4, _) --[[ line: 145 ]]
	-- upvalues: guiService (ref)
	if p4 == Enum.UserInputState.Begin then
		if guiService.SelectedObject or guiService.SelectedCoreObject then
			self._cursorController:PlayTweenActivate()
		end
	elseif p4 == Enum.UserInputState.End and (guiService.SelectedObject or guiService.SelectedCoreObject) then
		self._cursorController:PlayTweenDefault()
	end
	return Enum.ContextActionResult.Pass
end

function t:OnDirectionalButtons(p5, p6) --[[ line: 159 ]]
	-- upvalues: enumsModule (ref), getThumbstickInputFromDirectionalInput (ref), processThumbstickInput (ref)
	if self._behavior ~= enumsModule.Behavior.VirtualCursor or not p6 then
		return Enum.ContextActionResult.Pass
	end
	local pass = Enum.ContextActionResult.Pass
	
	if p5 == Enum.UserInputState.Begin or p5 == Enum.UserInputState.Change then
		self._activeDirections[p6.KeyCode] = p6.Position.Z
		pass = Enum.ContextActionResult.Sink
	else
		self._activeDirections[p6.KeyCode] = nil
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

function t:GetMoveVector() --[[ line: 193 ]]
	return self._moveVector
end

function t:GetScrollVector() --[[ line: 197 ]]
	return self._scrollVector
end

function t:SetBehavior(p7) --[[ line: 201 ]]
	-- upvalues: enumsModule (ref), contextActionService (ref), gamepadService (ref), processThumbstickInput (ref), userInputService (ref), guiService (ref)
	local behavior = self._behavior
	self._behavior = p7
	
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
		contextActionService:BindCoreActionAtPriority(enumsModule.Action.Scroll, function(_, p8, p9) --[[ line: 251 ]]
			-- upvalues: self (ref)
			return self:OnScroll(p8, p9)
		end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick2)
		contextActionService:BindCoreActionAtPriority(enumsModule.Action.DirectionalMove, function(_, p10, p11) --[[ line: 261 ]]
			-- upvalues: self (ref)
			return self:OnDirectionalButtons(p10, p11)
		end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.ButtonUp, Enum.KeyCode.ButtonDown, Enum.KeyCode.ButtonLeft, Enum.KeyCode.ButtonRight)
		self._gamepadThumbstick1ChangedConnection = gamepadService.GamepadThumbstick1Changed:Connect(function(p12) --[[ line: 272 ]]
			-- upvalues: self (ref), processThumbstickInput (copy)
			self._moveVector = processThumbstickInput(p12)
		end)
		self._inputBeganConnection = userInputService.InputBegan:Connect(function(p13, _) --[[ line: 277 ]]
			-- upvalues: self (ref)
			if p13.KeyCode == Enum.KeyCode.ButtonA or p13.KeyCode == Enum.KeyCode.ButtonCenter then
				self:OnActivate(Enum.UserInputState.Begin, p13)
			end
		end)
		self._inputEndedConnection = userInputService.InputEnded:Connect(function(p14, _) --[[ line: 283 ]]
			-- upvalues: self (ref)
			if p14.KeyCode == Enum.KeyCode.ButtonA or p14.KeyCode == Enum.KeyCode.ButtonCenter then
				self:OnActivate(Enum.UserInputState.End, p14)
			end
		end)
		
		return
	elseif self._behavior == enumsModule.Behavior.SelectionPreview then
		self._selectedObjectChangedConnection = guiService:GetPropertyChangedSignal("SelectedObject"):Connect(function() --[[ line: 289 ]]
			-- upvalues: self (ref), guiService (copy)
			self:OnMove(Enum.UserInputState.Change, nil)
			self._previousSelection = guiService.SelectedObject
		end)
		contextActionService:BindCoreActionAtPriority(enumsModule.Action.Move, function(_, p15, p16) --[[ line: 296 ]]
			-- upvalues: self (ref)
			return self:OnMove(p15, p16)
		end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick1)
	end
end

return t