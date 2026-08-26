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
local var1 = nil
local var2 = nil
local var3 = nil
local var4 = false
local var5 = false

local function enableVirtualCursor(p1)
	-- upvalues: var1 (write), interfaceModule (ref), gamepadService (ref), inputModule (ref), runService (ref), var3 (write), guiService (ref), fFlagVCWasDisabledFromMenuOpen (ref), var5 (write)
	if var1 then
		p1 = p1 or var1.CursorPosition
		var1.Enabled = true
		var1.CursorPosition = p1
		interfaceModule:EnableUI(p1)
		gamepadService:SetGamepadCursorPosition(p1)
		inputModule:EnableInput()
		inputModule:DisablePreview()
		runService:BindToRenderStep("VirtualCursorStepped", Enum.RenderPriority.Input.Value + 1, var1.OnRenderStep)
		var3 = guiService.MenuOpened:Connect(function()
			-- upvalues: fFlagVCWasDisabledFromMenuOpen (copy), var5 (copy), gamepadService (copy)
			if fFlagVCWasDisabledFromMenuOpen then
				var5 = true
			end
			gamepadService.GamepadCursorEnabled = false
		end)
		
		return
	end
end

local function disableVirtualCursor()
	-- upvalues: var1 (write), var3 (write), interfaceModule (ref), inputModule (ref), runService (ref), fFlagVCWasDisabledFromMenuOpen (ref), var5 (write), guiService (ref)
	if not var1.Enabled then return end
	var3:Disconnect()
	var3 = nil
	var1.PreviouslySelectedObject = nil
	interfaceModule:DisableUI()
	inputModule:DisableInput()
	inputModule:EnablePreview()
	runService:UnbindFromRenderStep("VirtualCursorStepped")
	
	if var1.SelectedObject then
		if fFlagVCWasDisabledFromMenuOpen and not var5 then
			guiService.SelectedCoreObject = nil
		end
		guiService.SelectedObject = nil
		
		if not fFlagVCWasDisabledFromMenuOpen then
			guiService.SelectedCoreObject = nil
		end
		var1.SelectedObject = nil
	end
	if fFlagVCWasDisabledFromMenuOpen then
		var5 = false
	end
	var1.Enabled = false
end

local t = {}
t.__index = t

function t:GetEnabled()
	return self.Enabled
end

function t.new()
	-- upvalues: onRenderStepModule (ref), var2 (write), userInputService (ref), gamepadService (ref), var4 (write), inputModule (ref), t (ref), var1 (write)
	local t_1 = {
		Enabled = false,
		SelectedObject = nil,
		PreviouslySelectedObject = nil,
		CursorPosition = Vector2.new()
	}
	
	function t_1.OnRenderStep(p1)
		-- upvalues: onRenderStepModule (copy), t_1 (ref)
		onRenderStepModule(t_1, p1)
	end
	
	var2 = userInputService.LastInputTypeChanged:Connect(function(p1)
		-- upvalues: gamepadService (copy), var4 (copy)
		if p1 ~= Enum.UserInputType.Gamepad1 and p1 ~= Enum.UserInputType.Focus and gamepadService.GamepadCursorEnabled then
			gamepadService.GamepadCursorEnabled = false
			var4 = true
			
			return
		elseif p1 == Enum.UserInputType.Gamepad1 and var4 then
			gamepadService.GamepadCursorEnabled = true
			var4 = false
		end
	end)
	inputModule:EnablePreview()
	setmetatable(t_1, t)
	var1 = t_1
	
	return t_1
end

gamepadService:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(function()
	-- upvalues: gamepadService (ref), var1 (write), userInputService (ref), enableVirtualCursor (ref), disableVirtualCursor (ref)
	local gamepadCursorEnabled = gamepadService.GamepadCursorEnabled
	
	if var1 then
		if gamepadCursorEnabled then
			enableVirtualCursor(userInputService:GetMouseLocation())
			
			return
		end
		disableVirtualCursor()
	end
end)

return t.new()