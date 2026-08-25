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
local var10 = false
local var11 = false
local var12 = nil
local _ = os.clock()
local var13 = nil
local var14 = nil
local var15 = nil
local var16 = false
local t_1 = {}

local function processThumbstickInput(p0)
	-- upvalues: propertiesModule (ref)
	local var24 = 0
	local var25 = 0
	
	if propertiesModule.ThumbstickDeadzone <= p0.Magnitude then
		local var26 = math.atan2(p0.y, p0.x)
		local absValue = math.abs(math.cos(var26) * propertiesModule.ThumbstickDeadzone)
		local absValue_1 = math.abs(math.sin(var26) * propertiesModule.ThumbstickDeadzone)
		var24 = math.max(math.abs(p0.x) - absValue, 0) / (1 - absValue) * math.sign(p0.x)
		var25 = math.max(math.abs(p0.y) - absValue_1, 0) / (1 - absValue_1) * math.sign(p0.y)
	end
	return Vector2.new(var24, -var25)
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

local function _(p3)
	return (p3.Min + p3.Max) / 2
end

local function processPreviewEnabled(p4)
	-- upvalues: var11 (write), var12 (write), interfaceModule (ref), guiService (ref), var15 (write)
	if p4 and not var11 then
		if var12 then
			local selectionRect2D = var12.SelectionRect2D
			interfaceModule:EnableUI((selectionRect2D.Min + selectionRect2D.Max) / 2)
		else
			local selectionRect2D = guiService.SelectedObject.SelectionRect2D
			interfaceModule:EnableUI((selectionRect2D.Min + selectionRect2D.Max) / 2)
		end
		var11 = true
	elseif not p4 and var11 then
		interfaceModule:DisableUI()
		var11 = false
	end
	if var15 then
		var15:Disconnect()
	end
	if var11 and guiService.SelectedObject then
		local selectedObject = guiService.SelectedObject
		var15 = selectedObject:GetPropertyChangedSignal("SelectionRect2D"):Connect(function()
			-- upvalues: selectedObject (ref), var11 (copy), interfaceModule (copy)
			if selectedObject and var11 then
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

local function onThumbstick1Input()
	-- upvalues: guiService (ref), userInputService (ref), processThumbstickInput (ref), var16 (write), processPreviewEnabled (ref), var11 (write), interfaceModule (ref), var15 (write)
	if guiService.SelectedObject then
		local zero = Vector2.zero
		
		for i, v in userInputService:GetGamepadState(Enum.UserInputType.Gamepad1) do
			if v.KeyCode == Enum.KeyCode.Thumbstick1 then
				zero = processThumbstickInput(v.Position)
			end
		end
		if var16 and zero == Vector2.zero then
			var16 = false
		end
		processPreviewEnabled(zero ~= Vector2.zero and (var16 and guiService.SelectedCoreObject == nil))
		
		return
	elseif var11 then
		interfaceModule:DisableUI()
		var11 = false
	end
	if var15 then
		var15:Disconnect()
	end
	if var11 and guiService.SelectedObject then
		local selectedObject = guiService.SelectedObject
		var15 = selectedObject:GetPropertyChangedSignal("SelectionRect2D"):Connect(function()
			-- upvalues: selectedObject (ref), var11 (copy), interfaceModule (copy)
			if selectedObject and var11 then
				local selectionRect2D = selectedObject.SelectionRect2D
				interfaceModule:TweenCursorPosition((selectionRect2D.Min + selectionRect2D.Max) / 2)
			end
		end)
	end
end

local function onDirectionalButtonsInput(_, p5, p6)
	-- upvalues: fFlagVirtualCursorForTVRemoteKeycodes (ref), var10 (write), t_1 (ref), vector2 (write), getDirectionalMoveVectorModule (ref)
	if not fFlagVirtualCursorForTVRemoteKeycodes or not var10 then
		return Enum.ContextActionResult.Pass
	end
	local pass = Enum.ContextActionResult.Pass
	
	if p5 == Enum.UserInputState.Begin or p5 == Enum.UserInputState.Change then
		t_1[p6.KeyCode] = p6.Position.Z
		pass = Enum.ContextActionResult.Sink
	else
		t_1[p6.KeyCode] = nil
	end
	vector2 = getDirectionalMoveVectorModule(t_1)
	
	return pass
end

local function onSelectedObjectChanged()
	-- upvalues: var16 (write), onThumbstick1Input (ref), var12 (write), guiService (ref)
	var16 = true
	onThumbstick1Input()
	var12 = guiService.SelectedObject
end

userInputService.InputBegan:Connect(function(p7)
	-- upvalues: var10 (write), fFlagVirtualCursorForTVRemoteKeycodes (ref), guiService (ref), interfaceModule (ref)
	if not var10 then return end
	if p7.UserInputType == Enum.UserInputType.Gamepad1 and (p7.KeyCode == Enum.KeyCode.ButtonA or fFlagVirtualCursorForTVRemoteKeycodes and p7.KeyCode == Enum.KeyCode.ButtonCenter) and (guiService.SelectedObject or guiService.SelectedCoreObject) then
		interfaceModule:PlayCursorTweenActivate()
	end
end)
userInputService.InputEnded:Connect(function(p8)
	-- upvalues: var10 (write), fFlagVirtualCursorForTVRemoteKeycodes (ref), interfaceModule (ref), onThumbstick1Input (ref)
	if var10 then
		if p8.UserInputType == Enum.UserInputType.Gamepad1 and (p8.KeyCode == Enum.KeyCode.ButtonA or fFlagVirtualCursorForTVRemoteKeycodes and p8.KeyCode == Enum.KeyCode.ButtonCenter) then
			interfaceModule:PlayCursorTweenDefault()
			
			return
		end
	elseif p8.UserInputType == Enum.UserInputType.Gamepad1 and p8.KeyCode == Enum.KeyCode.Thumbstick1 then
		onThumbstick1Input()
	end
end)
userInputService.InputChanged:Connect(function(p9)
	-- upvalues: var10 (write), onThumbstick1Input (ref)
	if var10 then return end
	if p9.UserInputType == Enum.UserInputType.Gamepad1 and p9.KeyCode == Enum.KeyCode.Thumbstick1 then
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
	-- upvalues: var13 (write), guiService (ref), onSelectedObjectChanged (ref)
	var13 = guiService:GetPropertyChangedSignal("SelectedObject"):Connect(onSelectedObjectChanged)
end

function t.DisablePreview(_)
	-- upvalues: var13 (write)
	if var13 then
		var13:Disconnect()
		var13 = nil
	end
end

function t.EnableInput(_)
	-- upvalues: var14 (write), gamepadService (ref), vector2 (write), processThumbstickInput (ref), contextActionService (ref), onThumbstick2Input (ref), fFlagVirtualCursorForTVRemoteKeycodes (ref), onDirectionalButtonsInput (ref), var10 (write)
	var14 = gamepadService.GamepadThumbstick1Changed:Connect(function(p10)
		-- upvalues: vector2 (copy), processThumbstickInput (copy)
		vector2 = processThumbstickInput(p10)
	end)
	contextActionService:BindCoreActionAtPriority("VirtualCursorThumbstick1Movement", function(_, _, _) end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick1)
	contextActionService:BindCoreActionAtPriority("VirtualCursorThumbstick2Movement", onThumbstick2Input, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick2)
	
	if fFlagVirtualCursorForTVRemoteKeycodes then
		contextActionService:BindCoreActionAtPriority("VirtualCursorDirectionalButtonsMovement", onDirectionalButtonsInput, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.ButtonUp, Enum.KeyCode.ButtonDown, Enum.KeyCode.ButtonLeft, Enum.KeyCode.ButtonRight)
	end
	var10 = true
end

function t.DisableInput(_)
	-- upvalues: var14 (write), vector2 (write), vector2_1 (write), contextActionService (ref), fFlagVirtualCursorForTVRemoteKeycodes (ref), t_1 (ref), var10 (write)
	if var14 then
		var14:Disconnect()
		var14 = nil
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
	var10 = false
end

return t