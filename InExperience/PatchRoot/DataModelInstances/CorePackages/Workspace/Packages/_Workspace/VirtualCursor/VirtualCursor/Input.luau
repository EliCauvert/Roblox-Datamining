local parent = script.Parent
local parent_1 = parent.Parent
local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local gamepadService = game:GetService("GamepadService")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local fFlagVirtualCursorForTVRemoteKeycodes = require(parent_1.SharedFlags).FFlagVirtualCursorForTVRemoteKeycodes
local propertiesModule = require(parent.Properties)
local interfaceModule = require(parent.Interface)
local getDirectionalMoveVectorModule = require(parent.getDirectionalMoveVector)
local t = {}
local vector2 = Vector2.new()
local vector2_1 = Vector2.new()
local var1 = false
local var2 = false
local var3 = nil
local _ = os.clock()
local var4 = nil
local var5 = nil
local var6 = nil
local var7 = false
local t_1 = {}

local function processThumbstickInput(p1)
	-- upvalues: propertiesModule (ref)
	local var8 = 0
	local var9 = 0
	
	if propertiesModule.ThumbstickDeadzone <= p1.Magnitude then
		local var10 = math.atan2(p1.y, p1.x)
		local absValue = math.abs(math.cos(var10) * propertiesModule.ThumbstickDeadzone)
		local absValue_1 = math.abs(math.sin(var10) * propertiesModule.ThumbstickDeadzone)
		var8 = math.max(math.abs(p1.x) - absValue, 0) / (1 - absValue) * math.sign(p1.x)
		var9 = math.max(math.abs(p1.y) - absValue_1, 0) / (1 - absValue_1) * math.sign(p1.y)
	end
	return Vector2.new(var8, -var9)
end

local function onThumbstick2Input(_, p1, p2)
	-- upvalues: vector2_1 (write)
	if p1 == Enum.UserInputState.Change then
		vector2_1 = Vector2.new(p2.Position.x, p2.Position.y * -1)
		
		return Enum.ContextActionResult.Sink
	end
	vector2_1 = Vector2.new()
	
	return Enum.ContextActionResult.Pass
end

local function _(p1)
	return (p1.Min + p1.Max) / 2
end

local function processPreviewEnabled(p1)
	-- upvalues: var2 (write), var3 (write), interfaceModule (ref), guiService (ref), var6 (write)
	if p1 and not var2 then
		if var3 then
			local selectionRect2D = var3.SelectionRect2D
			interfaceModule:EnableUI((selectionRect2D.Min + selectionRect2D.Max) / 2)
		else
			local selectionRect2D = guiService.SelectedObject.SelectionRect2D
			interfaceModule:EnableUI((selectionRect2D.Min + selectionRect2D.Max) / 2)
		end
		var2 = true
	elseif not p1 and var2 then
		interfaceModule:DisableUI()
		var2 = false
	end
	if var6 then
		var6:Disconnect()
	end
	if var2 and guiService.SelectedObject then
		local selectedObject = guiService.SelectedObject
		var6 = selectedObject:GetPropertyChangedSignal("SelectionRect2D"):Connect(function()
			-- upvalues: selectedObject (ref), var2 (copy), interfaceModule (copy)
			if selectedObject and var2 then
				local selectionRect2D = selectedObject.SelectionRect2D
				interfaceModule:TweenCursorPosition((selectionRect2D.Min + selectionRect2D.Max) / 2)
			end
		end)
	end
	if p1 then
		local selectionRect2D = guiService.SelectedObject.SelectionRect2D
		interfaceModule:TweenCursorPosition((selectionRect2D.Min + selectionRect2D.Max) / 2)
	end
end

local function onThumbstick1Input()
	-- upvalues: guiService (ref), userInputService (ref), processThumbstickInput (ref), var7 (write), processPreviewEnabled (ref), var2 (write), interfaceModule (ref), var6 (write)
	if guiService.SelectedObject then
		local zero = Vector2.zero
		
		for i, v in userInputService:GetGamepadState(Enum.UserInputType.Gamepad1) do
			if v.KeyCode == Enum.KeyCode.Thumbstick1 then
				zero = processThumbstickInput(v.Position)
			end
		end
		if var7 and zero == Vector2.zero then
			var7 = false
		end
		processPreviewEnabled(zero ~= Vector2.zero and (var7 and guiService.SelectedCoreObject == nil))
		
		return
	elseif var2 then
		interfaceModule:DisableUI()
		var2 = false
	end
	if var6 then
		var6:Disconnect()
	end
	if var2 and guiService.SelectedObject then
		local selectedObject = guiService.SelectedObject
		var6 = selectedObject:GetPropertyChangedSignal("SelectionRect2D"):Connect(function()
			-- upvalues: selectedObject (ref), var2 (copy), interfaceModule (copy)
			if selectedObject and var2 then
				local selectionRect2D = selectedObject.SelectionRect2D
				interfaceModule:TweenCursorPosition((selectionRect2D.Min + selectionRect2D.Max) / 2)
			end
		end)
	end
end

local function onDirectionalButtonsInput(_, p1, p2)
	-- upvalues: fFlagVirtualCursorForTVRemoteKeycodes (ref), var1 (write), t_1 (ref), vector2 (write), getDirectionalMoveVectorModule (ref)
	if not fFlagVirtualCursorForTVRemoteKeycodes or not var1 then
		return Enum.ContextActionResult.Pass
	end
	local pass = Enum.ContextActionResult.Pass
	
	if p1 == Enum.UserInputState.Begin or p1 == Enum.UserInputState.Change then
		t_1[p2.KeyCode] = p2.Position.Z
		pass = Enum.ContextActionResult.Sink
	else
		t_1[p2.KeyCode] = nil
	end
	vector2 = getDirectionalMoveVectorModule(t_1)
	
	return pass
end

local function onSelectedObjectChanged()
	-- upvalues: var7 (write), onThumbstick1Input (ref), var3 (write), guiService (ref)
	var7 = true
	onThumbstick1Input()
	var3 = guiService.SelectedObject
end

userInputService.InputBegan:Connect(function(p1)
	-- upvalues: var1 (write), fFlagVirtualCursorForTVRemoteKeycodes (ref), guiService (ref), interfaceModule (ref)
	if not var1 then return end
	if p1.UserInputType == Enum.UserInputType.Gamepad1 and (p1.KeyCode == Enum.KeyCode.ButtonA or fFlagVirtualCursorForTVRemoteKeycodes and p1.KeyCode == Enum.KeyCode.ButtonCenter) and (guiService.SelectedObject or guiService.SelectedCoreObject) then
		interfaceModule:PlayCursorTweenActivate()
	end
end)
userInputService.InputEnded:Connect(function(p1)
	-- upvalues: var1 (write), fFlagVirtualCursorForTVRemoteKeycodes (ref), interfaceModule (ref), onThumbstick1Input (ref)
	if var1 then
		if p1.UserInputType == Enum.UserInputType.Gamepad1 and (p1.KeyCode == Enum.KeyCode.ButtonA or fFlagVirtualCursorForTVRemoteKeycodes and p1.KeyCode == Enum.KeyCode.ButtonCenter) then
			interfaceModule:PlayCursorTweenDefault()
			
			return
		end
	elseif p1.UserInputType == Enum.UserInputType.Gamepad1 and p1.KeyCode == Enum.KeyCode.Thumbstick1 then
		onThumbstick1Input()
	end
end)
userInputService.InputChanged:Connect(function(p1)
	-- upvalues: var1 (write), onThumbstick1Input (ref)
	if var1 then return end
	if p1.UserInputType == Enum.UserInputType.Gamepad1 and p1.KeyCode == Enum.KeyCode.Thumbstick1 then
		onThumbstick1Input()
	end
end)

function t.GetThumbstickVector(_)
	-- upvalues: vector2 (write)
	return vector2
end

function t.GetThumbstick2Vector(_)
	-- upvalues: vector2_1 (write)
	return vector2_1
end

function t.EnablePreview(_)
	-- upvalues: var4 (write), guiService (ref), onSelectedObjectChanged (ref)
	var4 = guiService:GetPropertyChangedSignal("SelectedObject"):Connect(onSelectedObjectChanged)
end

function t.DisablePreview(_)
	-- upvalues: var4 (write)
	if var4 then
		var4:Disconnect()
		var4 = nil
	end
end

function t.EnableInput(_)
	-- upvalues: var5 (write), gamepadService (ref), vector2 (write), processThumbstickInput (ref), contextActionService (ref), onThumbstick2Input (ref), fFlagVirtualCursorForTVRemoteKeycodes (ref), onDirectionalButtonsInput (ref), var1 (write)
	var5 = gamepadService.GamepadThumbstick1Changed:Connect(function(p1)
		-- upvalues: vector2 (copy), processThumbstickInput (copy)
		vector2 = processThumbstickInput(p1)
	end)
	contextActionService:BindCoreActionAtPriority("VirtualCursorThumbstick1Movement", function(_, _, _) end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick1)
	contextActionService:BindCoreActionAtPriority("VirtualCursorThumbstick2Movement", onThumbstick2Input, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick2)
	
	if fFlagVirtualCursorForTVRemoteKeycodes then
		contextActionService:BindCoreActionAtPriority("VirtualCursorDirectionalButtonsMovement", onDirectionalButtonsInput, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.ButtonUp, Enum.KeyCode.ButtonDown, Enum.KeyCode.ButtonLeft, Enum.KeyCode.ButtonRight)
	end
	var1 = true
end

function t.DisableInput(_)
	-- upvalues: var5 (write), vector2 (write), vector2_1 (write), contextActionService (ref), fFlagVirtualCursorForTVRemoteKeycodes (ref), t_1 (ref), var1 (write)
	if var5 then
		var5:Disconnect()
		var5 = nil
	end
	local sink
	vector2 = Vector2.new()
	vector2_1 = Vector2.new()
	contextActionService:UnbindCoreAction("VirtualCursorThumbstick1Movement")
	contextActionService:UnbindCoreAction("VirtualCursorThumbstick2Movement")
	
	if fFlagVirtualCursorForTVRemoteKeycodes then
		contextActionService:UnbindCoreAction("VirtualCursorDirectionalButtonsMovement")
		table.clear(t_1)
	end
	if Enum.UserInputState.Cancel == Enum.UserInputState.Change then
		vector2_1 = Vector2.new((nil).Position.x, (nil).Position.y * -1)
		sink = Enum.ContextActionResult.Sink
	else
		vector2_1 = Vector2.new()
		sink = Enum.ContextActionResult.Pass
	end
	var1 = false
end

return t