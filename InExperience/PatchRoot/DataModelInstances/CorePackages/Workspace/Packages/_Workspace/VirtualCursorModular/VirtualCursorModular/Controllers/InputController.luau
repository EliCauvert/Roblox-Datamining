local parent = script.Parent.Parent
local contextActionService = game:GetService("ContextActionService")
local gamepadService = game:GetService("GamepadService")
local guiService = game:GetService("GuiService")
local utilModule = require(parent.Util)
local processThumbstickInput = utilModule.ProcessThumbstickInput
local getRectCenter = utilModule.GetRectCenter
local enumsModule = require(parent.Enums)
local t = {}
t.__index = t

function t.new(p0) --[[ line: 32 ]]
	-- upvalues: enumsModule (ref), t (ref)
	return setmetatable({
		_enabled = false,
		_previousSelection = nil,
		_selectedObjectChangedConnection = nil,
		_gamepadSelectionRect2DChangedConnection = nil,
		_selectedRectChangedConnection = nil,
		_cursorController = p0,
		_moveVector = Vector2.new(),
		_scrollVector = Vector2.new(),
		_behavior = enumsModule.Behavior.SelectionPreview
	}, t)
end

function t:Destroy() --[[ line: 48 ]]
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

function t:OnMove(_, p1) --[[ line: 62 ]]
	-- upvalues: enumsModule (ref), guiService (ref), processThumbstickInput (ref), getRectCenter (ref)
	if self._behavior ~= enumsModule.Behavior.SelectionPreview then
		return Enum.ContextActionResult.Pass
	elseif guiService.SelectedObject == nil then
		return Enum.ContextActionResult.Pass
	elseif p1 then
		self._moveVector = processThumbstickInput(Vector2.new(p1.Position.X, p1.Position.Y))
	end
	local var6 = (if guiService.SelectedCoreObject ~= nil then guiService.SelectedObject ~= nil else true) and self._moveVector ~= Vector2.zero
	
	if var6 and not self._cursorController:GetEnabled() then
		if self._previousSelection then
			self._cursorController:Enable(getRectCenter(self._previousSelection.SelectionRect2D))
		elseif guiService.SelectedObject then
			self._cursorController:Enable(getRectCenter(guiService.SelectedObject.SelectionRect2D))
		end
	elseif not var6 and self._cursorController:GetEnabled() then
		self._cursorController:Disable()
	end
	local selectedRectChangedConnection = self._selectedRectChangedConnection
	
	if selectedRectChangedConnection then
		selectedRectChangedConnection:Disconnect()
		self._selectedRectChangedConnection = nil
	end
	if var6 and guiService.SelectedObject then
		local selectedObject = guiService.SelectedObject
		self._selectedRectChangedConnection = selectedObject:GetPropertyChangedSignal("SelectionRect2D"):Connect(function() --[[ line: 103 ]]
			-- upvalues: selectedObject (ref), self (ref), enumsModule (copy), getRectCenter (copy)
			if selectedObject and self._behavior == enumsModule.Behavior.SelectionPreview then
				self._cursorController:TweenPosition(getRectCenter(selectedObject.SelectionRect2D))
			end
		end)
		self._cursorController:TweenPosition(getRectCenter(guiService.SelectedObject.SelectionRect2D))
	end
	return Enum.ContextActionResult.Pass
end

function t:OnScroll(p2, p3) --[[ line: 116 ]]
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

function t:OnActivate(p4, _) --[[ line: 129 ]]
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

function t:GetMoveVector() --[[ line: 143 ]]
	return self._moveVector
end

function t:GetScrollVector() --[[ line: 147 ]]
	return self._scrollVector
end

function t:SetBehavior(p5) --[[ line: 151 ]]
	-- upvalues: enumsModule (ref), contextActionService (ref), gamepadService (ref), processThumbstickInput (ref), guiService (ref)
	local behavior = self._behavior
	self._behavior = p5
	
	if behavior == enumsModule.Behavior.VirtualCursor then
		self._moveVector = Vector2.new()
		self._scrollVector = Vector2.new()
		contextActionService:UnbindCoreAction(enumsModule.Action.Activate)
		contextActionService:UnbindCoreAction(enumsModule.Action.Scroll)
		local gamepadThumbstick1ChangedConnection = self._gamepadThumbstick1ChangedConnection
		
		if gamepadThumbstick1ChangedConnection then
			gamepadThumbstick1ChangedConnection:Disconnect()
			self._gamepadThumbstick1ChangedConnection = nil
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
		contextActionService:BindCoreActionAtPriority(enumsModule.Action.Activate, function(_, p6, p7) --[[ line: 188 ]]
			-- upvalues: self (ref)
			return self:OnActivate(p6, p7)
		end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.ButtonA)
		contextActionService:BindCoreActionAtPriority(enumsModule.Action.Scroll, function(_, p8, p9) --[[ line: 198 ]]
			-- upvalues: self (ref)
			return self:OnScroll(p8, p9)
		end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick2)
		self._gamepadThumbstick1ChangedConnection = gamepadService.GamepadThumbstick1Changed:Connect(function(p10) --[[ line: 206 ]]
			-- upvalues: self (ref), processThumbstickInput (copy)
			self._moveVector = processThumbstickInput(p10)
		end)
		
		return
	elseif self._behavior == enumsModule.Behavior.SelectionPreview then
		self._selectedObjectChangedConnection = guiService:GetPropertyChangedSignal("SelectedObject"):Connect(function() --[[ line: 210 ]]
			-- upvalues: self (ref), guiService (copy)
			self:OnMove(Enum.UserInputState.Change, nil)
			self._previousSelection = guiService.SelectedObject
		end)
		contextActionService:BindCoreActionAtPriority(enumsModule.Action.Move, function(_, p11, p12) --[[ line: 217 ]]
			-- upvalues: self (ref)
			return self:OnMove(p11, p12)
		end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick1)
	end
end

return t