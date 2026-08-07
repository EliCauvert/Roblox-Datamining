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
local var4 = signal.new()
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
local var8 = if fFlagLuaAppResponsiveEnginePreferredInput then {
	[Enum.PreferredInput.Gamepad] = t.Directional,
	[Enum.PreferredInput.Touch] = t.Touch,
	[Enum.PreferredInput.KeyboardAndMouse] = t.Pointer
} else nil

function getPreferredInput() --[[ line: 70 ]]
	-- upvalues: fFlagLuaAppResponsiveEnginePreferredInput (ref), userInputService (ref), var8 (ref), t (ref), appCommonLibModule (ref), t_3 (ref), t_4 (ref)
	if fFlagLuaAppResponsiveEnginePreferredInput then
		return var8[userInputService.PreferredInput or Enum.PreferredInput.KeyboardAndMouse] or t.Pointer
	end
	local platform = userInputService:GetPlatform()
	
	return if appCommonLibModule.isSpatial() then t.Pointer elseif t_3[platform] or false then t.Directional elseif t_4[platform] or false then t.Touch else t.Pointer
end

function updatePreferredInput() --[[ line: 92 ]]
	-- upvalues: t_2 (ref), var4 (ref)
	local var10 = getPreferredInput()
	
	if var10 ~= t_2.preferred then
		t_2.preferred = var10
		
		if t_2.last == nil then
			t_2.last = t_2.preferred
		end
		var4:fire()
	end
end

function updateLastInput() --[[ line: 103 ]]
	-- upvalues: t_1 (ref), userInputService (ref), t_2 (ref), var4 (ref)
	local var11 = t_1[userInputService:GetLastInputType()]
	
	if var11 and var11 ~= t_2.last then
		t_2.last = var11
		var4:fire()
	end
end

function init() --[[ line: 111 ]]
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
	connect = function(p0) --[[ line: 144 ]]
		-- upvalues: var4 (ref)
		return var4:connect(p0)
	end,
	preferred = function() --[[ line: 147 ]]
		-- upvalues: t_2 (ref)
		return t_2.preferred
	end,
	last = function() --[[ line: 150 ]]
		-- upvalues: t_2 (ref)
		return t_2.last
	end
}