local Parent = script.Parent
local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local GamepadService = game:GetService("GamepadService")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local PropertiesModule = require(Parent.Properties)
local InterfaceModule = require(Parent.Interface)
local InputModule = {}
local _Vector2 = Vector2.new()
local _Vector2_1 = Vector2.new()
local Flag = false
local Flag1 = false
local SelectedObject = nil
local _ = os.clock()
local Connection = nil
local GamepadThumbstick1ChangedConnection = nil
local Connection1 = nil
local Flag2 = false

local function processThumbstickInput(Vector): Vector2
	-- upvalues: PropertiesModule (copy)
	local X = 0
	local ScaledLargest = 0
	
	if PropertiesModule.ThumbstickDeadzone <= Vector.Magnitude then
		local Angle = math.atan2(Vector.y, Vector.x)
		local Magnitude = math.abs(math.cos(Angle) * PropertiesModule.ThumbstickDeadzone)
		local Magnitude1 = math.abs(math.sin(Angle) * PropertiesModule.ThumbstickDeadzone)
		X = math.max(math.abs(Vector.x) - Magnitude, 0) / (1 - Magnitude) * math.sign(Vector.x)
		ScaledLargest = math.max(math.abs(Vector.y) - Magnitude1, 0) / (1 - Magnitude1) * math.sign(Vector.y)
	end
	return Vector2.new(X, -ScaledLargest)
end

local function onThumbstick2Input(_, UserInputState, p1)
	-- upvalues: _Vector2_1 (ref)
	if UserInputState == Enum.UserInputState.Change then
		_Vector2_1 = Vector2.new(p1.Position.x, p1.Position.y * -1)
		
		return Enum.ContextActionResult.Sink
	else
		_Vector2_1 = Vector2.new()
		
		return Enum.ContextActionResult.Pass
	end
end

local function _(p1)
	return (p1.Min + p1.Max) / 2
end

local function processPreviewEnabled(NoSelectedCoreObject)
	-- upvalues: Flag1 (ref), SelectedObject (ref), InterfaceModule (copy), GuiService (copy), Connection1 (ref)
	if NoSelectedCoreObject and not Flag1 then
		if SelectedObject then
			local SelectionRect2D = SelectedObject.SelectionRect2D
			InterfaceModule:EnableUI((SelectionRect2D.Min + SelectionRect2D.Max) / 2)
		else
			local SelectionRect2D = GuiService.SelectedObject.SelectionRect2D
			InterfaceModule:EnableUI((SelectionRect2D.Min + SelectionRect2D.Max) / 2)
		end
		Flag1 = true
	elseif not NoSelectedCoreObject and Flag1 then
		InterfaceModule:DisableUI()
		Flag1 = false
	end
	if Connection1 then
		Connection1:Disconnect()
	end
	if Flag1 and GuiService.SelectedObject then
		local SelectedObject1 = GuiService.SelectedObject
		Connection1 = SelectedObject1:GetPropertyChangedSignal("SelectionRect2D"):Connect(function()
			-- upvalues: SelectedObject1 (copy), Flag1 (upval), InterfaceModule (upval)
			if SelectedObject1 and Flag1 then
				local SelectionRect2D = SelectedObject1.SelectionRect2D
				InterfaceModule:TweenCursorPosition((SelectionRect2D.Min + SelectionRect2D.Max) / 2)
			end
		end)
	end
	if NoSelectedCoreObject then
		local SelectionRect2D = GuiService.SelectedObject.SelectionRect2D
		InterfaceModule:TweenCursorPosition((SelectionRect2D.Min + SelectionRect2D.Max) / 2)
	end
end

local function onThumbstick1Input()
	-- upvalues: GuiService (copy), UserInputService (copy), processThumbstickInput (copy), Flag2 (ref), processPreviewEnabled (copy), Flag1 (ref), InterfaceModule (copy), Connection1 (ref)
	if GuiService.SelectedObject then
		local ZeroVector = Vector2.zero
		
		for _, Input in UserInputService:GetGamepadState(Enum.UserInputType.Gamepad1) do
			if Input.KeyCode == Enum.KeyCode.Thumbstick1 then
				ZeroVector = processThumbstickInput(Input.Position)
			end
		end
		if Flag2 and ZeroVector == Vector2.zero then
			Flag2 = false
		end
		processPreviewEnabled(ZeroVector ~= Vector2.zero and (Flag2 and GuiService.SelectedCoreObject == nil))
		
		return
	else
		if Flag1 then
			InterfaceModule:DisableUI()
			Flag1 = false
		end
		if Connection1 then
			Connection1:Disconnect()
		end
		if Flag1 and GuiService.SelectedObject then
			local SelectedObject = GuiService.SelectedObject
			Connection1 = SelectedObject:GetPropertyChangedSignal("SelectionRect2D"):Connect(function()
				-- upvalues: SelectedObject (copy), Flag1 (upval), InterfaceModule (upval)
				if SelectedObject and Flag1 then
					local SelectionRect2D = SelectedObject.SelectionRect2D
					InterfaceModule:TweenCursorPosition((SelectionRect2D.Min + SelectionRect2D.Max) / 2)
				end
			end)
		end
	end
end

local function onSelectedObjectChanged()
	-- upvalues: Flag2 (ref), onThumbstick1Input (copy), SelectedObject (ref), GuiService (copy)
	Flag2 = true
	onThumbstick1Input()
	SelectedObject = GuiService.SelectedObject
end

UserInputService.InputBegan:Connect(function(Input)
	-- upvalues: Flag (ref), GuiService (copy), InterfaceModule (copy)
	if not Flag then return end
	if Input.UserInputType == Enum.UserInputType.Gamepad1 and Input.KeyCode == Enum.KeyCode.ButtonA and (GuiService.SelectedObject or GuiService.SelectedCoreObject) then
		InterfaceModule:PlayCursorTweenActivate()
	end
end)
UserInputService.InputEnded:Connect(function(Input)
	-- upvalues: Flag (ref), InterfaceModule (copy), onThumbstick1Input (copy)
	if Flag then
		if Input.UserInputType == Enum.UserInputType.Gamepad1 and Input.KeyCode == Enum.KeyCode.ButtonA then
			InterfaceModule:PlayCursorTweenDefault()
			
			return
		end
	elseif Input.UserInputType == Enum.UserInputType.Gamepad1 and Input.KeyCode == Enum.KeyCode.Thumbstick1 then
		onThumbstick1Input()
	end
end)
UserInputService.InputChanged:Connect(function(Input)
	-- upvalues: Flag (ref), onThumbstick1Input (copy)
	if Flag then return end
	if Input.UserInputType == Enum.UserInputType.Gamepad1 and Input.KeyCode == Enum.KeyCode.Thumbstick1 then
		onThumbstick1Input()
	end
end)

function InputModule:GetThumbstickVector()
	-- upvalues: _Vector2 (ref)
	return _Vector2
end

function InputModule:GetThumbstick2Vector()
	-- upvalues: _Vector2_1 (ref)
	return _Vector2_1
end

function InputModule:EnablePreview()
	-- upvalues: Connection (ref), GuiService (copy), onSelectedObjectChanged (copy)
	Connection = GuiService:GetPropertyChangedSignal("SelectedObject"):Connect(onSelectedObjectChanged)
end

function InputModule:DisablePreview()
	-- upvalues: Connection (ref)
	if Connection then
		Connection:Disconnect()
		Connection = nil
	end
end

function InputModule:EnableInput()
	-- upvalues: GamepadThumbstick1ChangedConnection (ref), GamepadService (copy), _Vector2 (ref), processThumbstickInput (copy), ContextActionService (copy), onThumbstick2Input (copy), Flag (ref)
	GamepadThumbstick1ChangedConnection = GamepadService.GamepadThumbstick1Changed:Connect(function(Event)
		-- upvalues: _Vector2 (upval), processThumbstickInput (upval)
		_Vector2 = processThumbstickInput(Event)
	end)
	ContextActionService:BindCoreActionAtPriority("VirtualCursorThumbstick1Movement", function(_, _, _) end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick1)
	ContextActionService:BindCoreActionAtPriority("VirtualCursorThumbstick2Movement", onThumbstick2Input, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick2)
	Flag = true
end

function InputModule:DisableInput()
	-- upvalues: GamepadThumbstick1ChangedConnection (ref), _Vector2 (ref), _Vector2_1 (ref), ContextActionService (copy), Flag (ref)
	if GamepadThumbstick1ChangedConnection then
		GamepadThumbstick1ChangedConnection:Disconnect()
		GamepadThumbstick1ChangedConnection = nil
	end
	_Vector2 = Vector2.new()
	_Vector2_1 = Vector2.new()
	ContextActionService:UnbindCoreAction("VirtualCursorThumbstick1Movement")
	ContextActionService:UnbindCoreAction("VirtualCursorThumbstick2Movement")
	
	if Enum.UserInputState.Cancel == Enum.UserInputState.Change then
		_Vector2_1 = Vector2.new((nil).Position.x, (nil).Position.y * -1)
		local _ = Enum.ContextActionResult.Sink
	else
		_Vector2_1 = Vector2.new()
		local _ = Enum.ContextActionResult.Pass
	end
	Flag = false
end

return InputModule