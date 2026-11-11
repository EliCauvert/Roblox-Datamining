local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local config = {
	getGamepadConnected = function(GamepadNum)
		-- upvalues: UserInputService (copy)
		return UserInputService:GetGamepadConnected(GamepadNum)
	end,
	getGamepadState = function(GamepadNum)
		-- upvalues: UserInputService (copy)
		return UserInputService:GetGamepadState(GamepadNum)
	end,
	getNavigationGamepads = function()
		-- upvalues: UserInputService (copy)
		return UserInputService:GetNavigationGamepads()
	end,
	getSelection = function()
		-- upvalues: GuiService (copy)
		return GuiService.SelectedCoreObject
	end,
	setSelection = function(SelectedCoreObject)
		-- upvalues: GuiService (copy)
		GuiService.SelectedCoreObject = SelectedCoreObject
	end,
	subscribeToSelectionChanged = function(Callback)
		-- upvalues: GuiService (copy)
		return GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(Callback)
	end,
	subscribeToRenderStepped = function(Callback)
		-- upvalues: RunService (copy)
		return RunService.RenderStepped:Connect(Callback)
	end,
	subscribeToGamepadConnected = function(Callback)
		-- upvalues: UserInputService (copy)
		return UserInputService.GamepadConnected:Connect(Callback)
	end,
	subscribeToGamepadDisconnected = function(Callback)
		-- upvalues: UserInputService (copy)
		return UserInputService.GamepadDisconnected:Connect(Callback)
	end,
	subscribeToInputBegan = function(Callback)
		-- upvalues: UserInputService (copy)
		return UserInputService.InputBegan:Connect(Callback)
	end,
	subscribeToInputEnded = function(Callback)
		-- upvalues: UserInputService (copy)
		return UserInputService.InputEnded:Connect(Callback)
	end
}
local config1 = {
	getSelection = function()
		-- upvalues: GuiService (copy)
		return GuiService.SelectedObject
	end,
	setSelection = function(SelectedObject)
		-- upvalues: GuiService (copy)
		GuiService.SelectedObject = SelectedObject
	end,
	subscribeToSelectionChanged = function(Callback)
		-- upvalues: GuiService (copy)
		return GuiService:GetPropertyChangedSignal("SelectedObject"):Connect(Callback)
	end,
	getGamepadConnected = config.getGamepadConnected,
	getGamepadState = config.getGamepadState,
	getNavigationGamepads = config.getNavigationGamepads,
	subscribeToRenderStepped = config.subscribeToRenderStepped,
	subscribeToGamepadConnected = config.subscribeToGamepadConnected,
	subscribeToGamepadDisconnected = config.subscribeToGamepadDisconnected,
	subscribeToInputBegan = config.subscribeToInputBegan,
	subscribeToInputEnded = config.subscribeToInputEnded
}

return function(Object)
	-- upvalues: CoreGui (copy), config (copy), config1 (copy)
	if Object:IsDescendantOf(CoreGui) then
		return config
	end
	if Object:FindFirstAncestorWhichIsA("PlayerGui") == nil then
		error("Gamepad navigation not supported. Must be a child of CoreGui or a PlayerGui")
	end
	return config1
end