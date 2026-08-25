local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local coreGuiService = game:GetService("CoreGui")
local t = {
	getGamepadConnected = function(p0)
		-- upvalues: userInputService (ref)
		return userInputService:GetGamepadConnected(p0)
	end,
	getGamepadState = function(p1)
		-- upvalues: userInputService (ref)
		return userInputService:GetGamepadState(p1)
	end,
	getNavigationGamepads = function()
		-- upvalues: userInputService (ref)
		return userInputService:GetNavigationGamepads()
	end,
	getSelection = function()
		-- upvalues: guiService (ref)
		return guiService.SelectedCoreObject
	end,
	setSelection = function(value)
		-- upvalues: guiService (ref)
		guiService.SelectedCoreObject = value
	end,
	subscribeToSelectionChanged = function(p2)
		-- upvalues: guiService (ref)
		return guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(p2)
	end,
	subscribeToRenderStepped = function(p3)
		-- upvalues: runService (ref)
		return runService.RenderStepped:Connect(p3)
	end,
	subscribeToGamepadConnected = function(p4)
		-- upvalues: userInputService (ref)
		return userInputService.GamepadConnected:Connect(p4)
	end,
	subscribeToGamepadDisconnected = function(p5)
		-- upvalues: userInputService (ref)
		return userInputService.GamepadDisconnected:Connect(p5)
	end,
	subscribeToInputBegan = function(p6)
		-- upvalues: userInputService (ref)
		return userInputService.InputBegan:Connect(p6)
	end,
	subscribeToInputEnded = function(p7)
		-- upvalues: userInputService (ref)
		return userInputService.InputEnded:Connect(p7)
	end
}
local t_1 = {
	getSelection = function()
		-- upvalues: guiService (ref)
		return guiService.SelectedObject
	end,
	setSelection = function(value)
		-- upvalues: guiService (ref)
		guiService.SelectedObject = value
	end,
	subscribeToSelectionChanged = function(p8)
		-- upvalues: guiService (ref)
		return guiService:GetPropertyChangedSignal("SelectedObject"):Connect(p8)
	end,
	getGamepadConnected = t.getGamepadConnected,
	getGamepadState = t.getGamepadState,
	getNavigationGamepads = t.getNavigationGamepads,
	subscribeToRenderStepped = t.subscribeToRenderStepped,
	subscribeToGamepadConnected = t.subscribeToGamepadConnected,
	subscribeToGamepadDisconnected = t.subscribeToGamepadDisconnected,
	subscribeToInputBegan = t.subscribeToInputBegan,
	subscribeToInputEnded = t.subscribeToInputEnded
}

return function(p9)
	-- upvalues: coreGuiService (ref), t (ref), t_1 (ref)
	if p9:IsDescendantOf(coreGuiService) then
		return t
	elseif p9:FindFirstAncestorWhichIsA("PlayerGui") == nil then
		error("Gamepad navigation not supported. Must be a child of CoreGui or a PlayerGui")
	end
	return t_1
end