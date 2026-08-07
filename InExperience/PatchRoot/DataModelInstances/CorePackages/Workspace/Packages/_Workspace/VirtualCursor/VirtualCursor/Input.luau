local parent = script.Parent
local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local gamepadService = game:GetService("GamepadService")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local propertiesModule = require(parent.Properties)
local interfaceModule = require(parent.Interface)
local t = {}
local vector2 = Vector2.new()
local vector2_1 = Vector2.new()
local var9 = false
local var10 = false
local var11 = nil
local _ = os.clock()
local var12 = nil
local var13 = nil
local var14 = nil
local var15 = false

local function processThumbstickInput(p0) --[[ line: 29 ]]
	-- upvalues: propertiesModule (ref)
	local var21 = 0
	local var22 = 0
	
	if propertiesModule.ThumbstickDeadzone <= p0.Magnitude then
		local var23 = math.atan2(p0.y, p0.x)
		local absValue = math.abs(math.cos(var23) * propertiesModule.ThumbstickDeadzone)
		local absValue_1 = math.abs(math.sin(var23) * propertiesModule.ThumbstickDeadzone)
		var21 = math.max(math.abs(p0.x) - absValue, 0) / (1 - absValue) * math.sign(p0.x)
		var22 = math.max(math.abs(p0.y) - absValue_1, 0) / (1 - absValue_1) * math.sign(p0.y)
	end
	return Vector2.new(var21, -var22)
end

local function onThumbstick2Input(_, p1, p2) --[[ line: 42 ]]
	-- upvalues: vector2_1 (write)
	if p1 == Enum.UserInputState.Change then
		vector2_1 = Vector2.new(p2.Position.x, p2.Position.y * -1)
		
		return Enum.ContextActionResult.Sink
	end
	vector2_1 = Vector2.new()
	
	return Enum.ContextActionResult.Pass
end

local function _(p3) --[[ line: 53 | named "getRectCenter" ]]
	return (p3.Min + p3.Max) / 2
end

local function processPreviewEnabled(p4) --[[ line: 57 ]]
	-- upvalues: var10 (write), var11 (write), interfaceModule (ref), guiService (ref), var14 (write)
	if p4 and not var10 then
		if var11 then
			local selectionRect2D = var11.SelectionRect2D
			interfaceModule:EnableUI((selectionRect2D.Min + selectionRect2D.Max) / 2)
		else
			local selectionRect2D = guiService.SelectedObject.SelectionRect2D
			interfaceModule:EnableUI((selectionRect2D.Min + selectionRect2D.Max) / 2)
		end
		var10 = true
	elseif not p4 and var10 then
		interfaceModule:DisableUI()
		var10 = false
	end
	if var14 then
		var14:Disconnect()
	end
	if var10 and guiService.SelectedObject then
		local selectedObject = guiService.SelectedObject
		var14 = selectedObject:GetPropertyChangedSignal("SelectionRect2D"):Connect(function() --[[ line: 78 ]]
			-- upvalues: selectedObject (ref), var10 (copy), interfaceModule (copy)
			if selectedObject and var10 then
				local selectionRect2D = selectedObject.SelectionRect2D
				interfaceModule:TweenCursorPosition((selectionRect2D.Min + selectionRect2D.Max) / 2)
			end
		end)
	end
	if p4 then
		local selectionRect2D = guiService.SelectedObject.SelectionRect2D
		interfaceModule:TweenCursorPosition((selectionRect2D.Min + selectionRect2D.Max) / 2)
	end
end

local function onThumbstick1Input() --[[ line: 90 ]]
	-- upvalues: guiService (ref), userInputService (ref), processThumbstickInput (ref), var15 (write), processPreviewEnabled (ref), var10 (write), interfaceModule (ref), var14 (write)
	if guiService.SelectedObject then
		local zero = Vector2.zero
		
		for i, v in userInputService:GetGamepadState(Enum.UserInputType.Gamepad1) do
			if v.KeyCode == Enum.KeyCode.Thumbstick1 then
				zero = processThumbstickInput(v.Position)
			end
		end
		if var15 and zero == Vector2.zero then
			var15 = false
		end
		processPreviewEnabled(zero ~= Vector2.zero and (var15 and guiService.SelectedCoreObject == nil))
		
		return
	elseif var10 then
		interfaceModule:DisableUI()
		var10 = false
	end
	if var14 then
		var14:Disconnect()
	end
	if var10 and guiService.SelectedObject then
		local selectedObject = guiService.SelectedObject
		var14 = selectedObject:GetPropertyChangedSignal("SelectionRect2D"):Connect(function() --[[ line: 78 ]]
			-- upvalues: selectedObject (ref), var10 (copy), interfaceModule (copy)
			if selectedObject and var10 then
				local selectionRect2D = selectedObject.SelectionRect2D
				interfaceModule:TweenCursorPosition((selectionRect2D.Min + selectionRect2D.Max) / 2)
			end
		end)
	end
end

local function onSelectedObjectChanged() --[[ line: 115 ]]
	-- upvalues: var15 (write), onThumbstick1Input (ref), var11 (write), guiService (ref)
	var15 = true
	onThumbstick1Input()
	var11 = guiService.SelectedObject
end

userInputService.InputBegan:Connect(function(p5) --[[ line: 123 ]]
	-- upvalues: var9 (write), guiService (ref), interfaceModule (ref)
	if not var9 then return end
	if p5.UserInputType == Enum.UserInputType.Gamepad1 and p5.KeyCode == Enum.KeyCode.ButtonA and (guiService.SelectedObject or guiService.SelectedCoreObject) then
		interfaceModule:PlayCursorTweenActivate()
	end
end)
userInputService.InputEnded:Connect(function(p6) --[[ line: 136 ]]
	-- upvalues: var9 (write), interfaceModule (ref), onThumbstick1Input (ref)
	if var9 then
		if p6.UserInputType == Enum.UserInputType.Gamepad1 and p6.KeyCode == Enum.KeyCode.ButtonA then
			interfaceModule:PlayCursorTweenDefault()
			
			return
		end
	elseif p6.UserInputType == Enum.UserInputType.Gamepad1 and p6.KeyCode == Enum.KeyCode.Thumbstick1 then
		onThumbstick1Input()
	end
end)
userInputService.InputChanged:Connect(function(p7) --[[ line: 152 ]]
	-- upvalues: var9 (write), onThumbstick1Input (ref)
	if var9 then return end
	if p7.UserInputType == Enum.UserInputType.Gamepad1 and p7.KeyCode == Enum.KeyCode.Thumbstick1 then
		onThumbstick1Input()
	end
end)

function t.GetThumbstickVector(_) --[[ line: 163 ]]
	-- upvalues: vector2 (write)
	return vector2
end

function t.GetThumbstick2Vector(_) --[[ line: 167 ]]
	-- upvalues: vector2_1 (write)
	return vector2_1
end

function t.EnablePreview(_) --[[ line: 171 ]]
	-- upvalues: var12 (write), guiService (ref), onSelectedObjectChanged (ref)
	var12 = guiService:GetPropertyChangedSignal("SelectedObject"):Connect(onSelectedObjectChanged)
end

function t.DisablePreview(_) --[[ line: 176 ]]
	-- upvalues: var12 (write)
	if var12 then
		var12:Disconnect()
		var12 = nil
	end
end

function t.EnableInput(_) --[[ line: 183 ]]
	-- upvalues: var13 (write), gamepadService (ref), vector2 (write), processThumbstickInput (ref), contextActionService (ref), onThumbstick2Input (ref), var9 (write)
	var13 = gamepadService.GamepadThumbstick1Changed:Connect(function(p8) --[[ line: 184 ]]
		-- upvalues: vector2 (copy), processThumbstickInput (copy)
		vector2 = processThumbstickInput(p8)
	end)
	contextActionService:BindCoreActionAtPriority("VirtualCursorThumbstick1Movement", function(_, _, _) --[[ line: 190 ]] end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick1)
	contextActionService:BindCoreActionAtPriority("VirtualCursorThumbstick2Movement", onThumbstick2Input, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick2)
	var9 = true
end

function t.DisableInput(_) --[[ line: 207 ]]
	-- upvalues: var13 (write), vector2 (write), vector2_1 (write), contextActionService (ref), var9 (write)
	if var13 then
		var13:Disconnect()
		var13 = nil
	end
	local sink
	vector2 = Vector2.new()
	vector2_1 = Vector2.new()
	contextActionService:UnbindCoreAction("VirtualCursorThumbstick1Movement")
	contextActionService:UnbindCoreAction("VirtualCursorThumbstick2Movement")
	
	if Enum.UserInputState.Cancel == Enum.UserInputState.Change then
		vector2_1 = Vector2.new((nil).Position.x, (nil).Position.y * -1)
		sink = Enum.ContextActionResult.Sink
	else
		vector2_1 = Vector2.new()
		sink = Enum.ContextActionResult.Pass
	end
	var9 = false
end

return t