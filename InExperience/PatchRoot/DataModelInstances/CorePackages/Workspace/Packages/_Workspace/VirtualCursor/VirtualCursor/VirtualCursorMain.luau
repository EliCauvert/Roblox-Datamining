local parent = script.Parent
local parent_1 = parent.Parent
local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local gamepadService = game:GetService("GamepadService")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local fFlagVCWasDisabledFromMenuOpen = require(parent_1.SharedFlags).FFlagVCWasDisabledFromMenuOpen
local inputModule = require(parent:WaitForChild("Input"))
local interfaceModule = require(parent:WaitForChild("Interface"))
local onRenderStepModule = require(parent:WaitForChild("OnRenderStep"))
local var7 = nil
local var8 = nil
local var9 = nil
local var10 = false
local var11 = false

local function enableVirtualCursor(p0) --[[ line: 39 ]]
	-- upvalues: var7 (write), interfaceModule (ref), gamepadService (ref), inputModule (ref), runService (ref), var9 (write), guiService (ref), fFlagVCWasDisabledFromMenuOpen (ref), var11 (write)
	if var7 then
		p0 = p0 or var7.CursorPosition
		var7.Enabled = true
		var7.CursorPosition = p0
		interfaceModule:EnableUI(p0)
		gamepadService:SetGamepadCursorPosition(p0)
		inputModule:EnableInput()
		inputModule:DisablePreview()
		runService:BindToRenderStep("VirtualCursorStepped", Enum.RenderPriority.Input.Value + 1, var7.OnRenderStep)
		var9 = guiService.MenuOpened:Connect(function() --[[ line: 59 ]]
			-- upvalues: fFlagVCWasDisabledFromMenuOpen (copy), var11 (copy), gamepadService (copy)
			if fFlagVCWasDisabledFromMenuOpen then
				var11 = true
			end
			gamepadService.GamepadCursorEnabled = false
		end)
		
		return
	end
end

local function disableVirtualCursor() --[[ line: 67 ]]
	-- upvalues: var7 (write), var9 (write), interfaceModule (ref), inputModule (ref), runService (ref), fFlagVCWasDisabledFromMenuOpen (ref), var11 (write), guiService (ref)
	if not var7.Enabled then return end
	var9:Disconnect()
	var9 = nil
	var7.PreviouslySelectedObject = nil
	interfaceModule:DisableUI()
	inputModule:DisableInput()
	inputModule:EnablePreview()
	runService:UnbindFromRenderStep("VirtualCursorStepped")
	
	if var7.SelectedObject then
		if fFlagVCWasDisabledFromMenuOpen and not var11 then
			guiService.SelectedCoreObject = nil
		end
		guiService.SelectedObject = nil
		
		if not fFlagVCWasDisabledFromMenuOpen then
			guiService.SelectedCoreObject = nil
		end
		var7.SelectedObject = nil
	end
	if fFlagVCWasDisabledFromMenuOpen then
		var11 = false
	end
	var7.Enabled = false
end

local t = {}
t.__index = t

function t:GetEnabled() --[[ line: 104 ]]
	return self.Enabled
end

function t.new() --[[ line: 108 ]]
	-- upvalues: onRenderStepModule (ref), var8 (write), userInputService (ref), gamepadService (ref), var10 (write), inputModule (ref), t (ref), var7 (write)
	local t_1 = {
		Enabled = false,
		SelectedObject = nil,
		PreviouslySelectedObject = nil,
		CursorPosition = Vector2.new()
	}
	
	function t_1.OnRenderStep(p1) --[[ line: 116 ]]
		-- upvalues: onRenderStepModule (copy), t_1 (ref)
		onRenderStepModule(t_1, p1)
	end
	
	var8 = userInputService.LastInputTypeChanged:Connect(function(p2) --[[ line: 120 ]]
		-- upvalues: gamepadService (copy), var10 (copy)
		if p2 ~= Enum.UserInputType.Gamepad1 and p2 ~= Enum.UserInputType.Focus and gamepadService.GamepadCursorEnabled then
			gamepadService.GamepadCursorEnabled = false
			var10 = true
			
			return
		elseif p2 == Enum.UserInputType.Gamepad1 and var10 then
			gamepadService.GamepadCursorEnabled = true
			var10 = false
		end
	end)
	inputModule:EnablePreview()
	setmetatable(t_1, t)
	var7 = t_1
	
	return t_1
end

gamepadService:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(function() --[[ line: 143 ]]
	-- upvalues: gamepadService (ref), var7 (write), userInputService (ref), enableVirtualCursor (ref), disableVirtualCursor (ref)
	local gamepadCursorEnabled = gamepadService.GamepadCursorEnabled
	
	if var7 then
		if gamepadCursorEnabled then
			enableVirtualCursor(userInputService:GetMouseLocation())
			
			return
		end
		disableVirtualCursor()
	end
end)

return t.new()