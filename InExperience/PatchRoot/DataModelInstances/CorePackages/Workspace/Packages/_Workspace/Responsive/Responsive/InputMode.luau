local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("Responsive").Parent
local appCommonLibModule = require(parent.AppCommonLib)
local signal = appCommonLibModule.Signal
local fFlagLuaAppResponsiveEnginePreferredInput = require(parent.SharedFlags).FFlagLuaAppResponsiveEnginePreferredInput
local t = {
	Pointer = "Pointer",
	Touch = "Touch",
	Directional = "Directional"
}
local t_1 = {
	[Enum.UserInputType.MouseButton1] = t.Pointer,
	[Enum.UserInputType.MouseButton2] = t.Pointer,
	[Enum.UserInputType.MouseButton3] = t.Pointer,
	[Enum.UserInputType.MouseWheel] = t.Pointer,
	[Enum.UserInputType.MouseMovement] = t.Pointer,
	[Enum.UserInputType.Keyboard] = t.Pointer,
	[Enum.UserInputType.TextInput] = t.Pointer,
	[Enum.UserInputType.Gamepad1] = t.Directional,
	[Enum.UserInputType.Gamepad2] = t.Directional,
	[Enum.UserInputType.Gamepad3] = t.Directional,
	[Enum.UserInputType.Gamepad4] = t.Directional,
	[Enum.UserInputType.Gamepad5] = t.Directional,
	[Enum.UserInputType.Gamepad6] = t.Directional,
	[Enum.UserInputType.Gamepad7] = t.Directional,
	[Enum.UserInputType.Gamepad8] = t.Directional,
	[Enum.UserInputType.Touch] = t.Touch,
	[Enum.UserInputType.None] = t.Pointer
}
local var1 = signal.new()
local t_2 = { preferred = nil, last = nil }
local t_3 = {
	[Enum.Platform.XBoxOne] = true,
	[Enum.Platform.XBox360] = true,
	[Enum.Platform.WiiU] = true,
	[Enum.Platform.PS3] = true,
	[Enum.Platform.PS4] = true,
	[Enum.Platform.PS5] = true,
	[Enum.Platform.Ouya] = true,
	[Enum.Platform.AndroidTV] = true
}
local t_4 = {
	[Enum.Platform.IOS] = true,
	[Enum.Platform.Android] = true
}
local var2 = if fFlagLuaAppResponsiveEnginePreferredInput then {
	[Enum.PreferredInput.Gamepad] = t.Directional,
	[Enum.PreferredInput.Touch] = t.Touch,
	[Enum.PreferredInput.KeyboardAndMouse] = t.Pointer
} else nil

function getPreferredInput()
	-- upvalues: fFlagLuaAppResponsiveEnginePreferredInput (ref), userInputService (ref), var2 (ref), t (ref), appCommonLibModule (ref), t_3 (ref), t_4 (ref)
	if fFlagLuaAppResponsiveEnginePreferredInput then
		return var2[userInputService.PreferredInput or Enum.PreferredInput.KeyboardAndMouse] or t.Pointer
	end
	local platform = userInputService:GetPlatform()
	
	return if appCommonLibModule.isSpatial() then t.Pointer elseif t_3[platform] or false then t.Directional elseif t_4[platform] or false then t.Touch else t.Pointer
end

function updatePreferredInput()
	-- upvalues: t_2 (ref), var1 (ref)
	local var3 = getPreferredInput()
	
	if var3 ~= t_2.preferred then
		t_2.preferred = var3
		
		if t_2.last == nil then
			t_2.last = t_2.preferred
		end
		var1:fire()
	end
end

function updateLastInput()
	-- upvalues: t_1 (ref), userInputService (ref), t_2 (ref), var1 (ref)
	local var3 = t_1[userInputService:GetLastInputType()]
	
	if var3 and var3 ~= t_2.last then
		t_2.last = var3
		var1:fire()
	end
end

function init()
	-- upvalues: fFlagLuaAppResponsiveEnginePreferredInput (ref), userInputService (ref), appCommonLibModule (ref)
	if fFlagLuaAppResponsiveEnginePreferredInput then
		userInputService:GetPropertyChangedSignal("PreferredInput"):Connect(updatePreferredInput)
	end
	userInputService.GamepadConnected:Connect(updatePreferredInput)
	userInputService:GetPropertyChangedSignal("KeyboardEnabled"):Connect(updatePreferredInput)
	userInputService:GetPropertyChangedSignal("MouseEnabled"):Connect(updatePreferredInput)
	userInputService:GetPropertyChangedSignal("TouchEnabled"):Connect(updatePreferredInput)
	userInputService:GetPropertyChangedSignal("GamepadEnabled"):Connect(updatePreferredInput)
	appCommonLibModule.connectToIsSpatialChanged(updatePreferredInput)
	userInputService.LastInputTypeChanged:Connect(updateLastInput)
	updateLastInput()
	updatePreferredInput()
end

init()

return {
	Enum = t,
	preferredInputRules = {
		{ Key = t.Directional, preferredInput = t.Directional },
		{ Key = t.Pointer, preferredInput = t.Pointer },
		{ Key = t.Touch, preferredInput = t.Touch }
	},
	lastInputRules = {
		{ Key = t.Directional, lastInput = t.Directional },
		{ Key = t.Pointer, lastInput = t.Pointer },
		{ Key = t.Touch, lastInput = t.Touch }
	},
	connect = function(p1)
		-- upvalues: var1 (ref)
		return var1:connect(p1)
	end,
	preferred = function()
		-- upvalues: t_2 (ref)
		return t_2.preferred
	end,
	last = function()
		-- upvalues: t_2 (ref)
		return t_2.last
	end
}