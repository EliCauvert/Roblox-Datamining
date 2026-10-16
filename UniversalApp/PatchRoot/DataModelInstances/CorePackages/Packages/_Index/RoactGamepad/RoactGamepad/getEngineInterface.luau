local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local config = {
	getGamepadConnected = function(GamepadNum) --[[ Line: 13 ]]
		-- upvalues: UserInputService (copy)
		return UserInputService:GetGamepadConnected(GamepadNum)
	end,
	getGamepadState = function(GamepadNum) --[[ Line: 17 ]]
		-- upvalues: UserInputService (copy)
		return UserInputService:GetGamepadState(GamepadNum)
	end,
	getNavigationGamepads = function() --[[ Line: 21 ]]
		-- upvalues: UserInputService (copy)
		return UserInputService:GetNavigationGamepads()
	end,
	getSelection = function() --[[ Line: 25 ]]
		-- upvalues: GuiService (copy)
		return GuiService.SelectedCoreObject
	end,
	setSelection = function(SelectedCoreObject) --[[ Line: 29 ]]
		-- upvalues: GuiService (copy)
		GuiService.SelectedCoreObject = SelectedCoreObject
	end,
	subscribeToSelectionChanged = function(Callback) --[[ Line: 33 ]]
		-- upvalues: GuiService (copy)
		return GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(Callback)
	end,
	subscribeToRenderStepped = function(Callback) --[[ Line: 37 ]]
		-- upvalues: RunService (copy)
		return RunService.RenderStepped:Connect(Callback)
	end,
	subscribeToGamepadConnected = function(Callback) --[[ Line: 41 ]]
		-- upvalues: UserInputService (copy)
		return UserInputService.GamepadConnected:Connect(Callback)
	end,
	subscribeToGamepadDisconnected = function(Callback) --[[ Line: 45 ]]
		-- upvalues: UserInputService (copy)
		return UserInputService.GamepadDisconnected:Connect(Callback)
	end,
	subscribeToInputBegan = function(Callback) --[[ Line: 49 ]]
		-- upvalues: UserInputService (copy)
		return UserInputService.InputBegan:Connect(Callback)
	end,
	subscribeToInputEnded = function(Callback) --[[ Line: 53 ]]
		-- upvalues: UserInputService (copy)
		return UserInputService.InputEnded:Connect(Callback)
	end
}
local config1 = {
	getSelection = function() --[[ Line: 63 ]]
		-- upvalues: GuiService (copy)
		return GuiService.SelectedObject
	end,
	setSelection = function(SelectedObject) --[[ Line: 67 ]]
		-- upvalues: GuiService (copy)
		GuiService.SelectedObject = SelectedObject
	end,
	subscribeToSelectionChanged = function(Callback) --[[ Line: 71 ]]
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

return function(Object) --[[ Line: 87 ]]
	-- upvalues: CoreGui (copy), config (copy), config1 (copy)
	if Object:IsDescendantOf(CoreGui) then
		return config
	end
	if Object:FindFirstAncestorWhichIsA("PlayerGui") == nil then
		error("Gamepad navigation not supported. Must be a child of CoreGui or a PlayerGui")
	end
	return config1
end