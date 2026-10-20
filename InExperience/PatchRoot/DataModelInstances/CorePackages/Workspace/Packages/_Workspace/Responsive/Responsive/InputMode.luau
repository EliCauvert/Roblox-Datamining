local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("Responsive").Parent
local AppCommonLibModule = require(Parent.AppCommonLib)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppResponsiveEnginePreferredInput = SharedFlagsModule.FFlagLuaAppResponsiveEnginePreferredInput
local FFlagLuaSupportMicroGamepadPreferredInput = SharedFlagsModule.FFlagLuaSupportMicroGamepadPreferredInput
local config = {
	Pointer = "Pointer",
	Touch = "Touch",
	Directional = "Directional"
}
local config1 = {
	[Enum.UserInputType.MouseButton1] = config.Pointer,
	[Enum.UserInputType.MouseButton2] = config.Pointer,
	[Enum.UserInputType.MouseButton3] = config.Pointer,
	[Enum.UserInputType.MouseWheel] = config.Pointer,
	[Enum.UserInputType.MouseMovement] = config.Pointer,
	[Enum.UserInputType.Keyboard] = config.Pointer,
	[Enum.UserInputType.TextInput] = config.Pointer,
	[Enum.UserInputType.Gamepad1] = config.Directional,
	[Enum.UserInputType.Gamepad2] = config.Directional,
	[Enum.UserInputType.Gamepad3] = config.Directional,
	[Enum.UserInputType.Gamepad4] = config.Directional,
	[Enum.UserInputType.Gamepad5] = config.Directional,
	[Enum.UserInputType.Gamepad6] = config.Directional,
	[Enum.UserInputType.Gamepad7] = config.Directional,
	[Enum.UserInputType.Gamepad8] = config.Directional,
	[Enum.UserInputType.Touch] = config.Touch,
	[Enum.UserInputType.None] = config.Pointer
}
local NewResult = AppCommonLibModule.Signal.new()
local config2 = { preferred = nil, last = nil }
local config3 = {
	[Enum.Platform.XBoxOne] = true,
	[Enum.Platform.XBox360] = true,
	[Enum.Platform.WiiU] = true,
	[Enum.Platform.PS3] = true,
	[Enum.Platform.PS4] = true,
	[Enum.Platform.PS5] = true,
	[Enum.Platform.Ouya] = true,
	[Enum.Platform.AndroidTV] = true
}
local config4 = {
	[Enum.Platform.IOS] = true,
	[Enum.Platform.Android] = true
}
local Config = if FFlagLuaAppResponsiveEnginePreferredInput then {
	[Enum.PreferredInput.Gamepad] = config.Directional,
	[Enum.PreferredInput.Touch] = config.Touch,
	[Enum.PreferredInput.KeyboardAndMouse] = config.Pointer
} else nil

if FFlagLuaAppResponsiveEnginePreferredInput and FFlagLuaSupportMicroGamepadPreferredInput then
	Config[Enum.PreferredInput.MicroGamepad] = config.Directional
end
function getPreferredInput()
	-- upvalues: FFlagLuaAppResponsiveEnginePreferredInput (copy), UserInputService (copy), Config (copy), config (copy), AppCommonLibModule (copy), config3 (copy), config4 (copy)
	if FFlagLuaAppResponsiveEnginePreferredInput then
		return Config[UserInputService.PreferredInput or Enum.PreferredInput.KeyboardAndMouse] or config.Pointer
	else
		local Platform = UserInputService:GetPlatform()
		local Entry = config3[Platform] or false
		local Entry1 = config4[Platform] or false
		
		return if AppCommonLibModule.isSpatial() then config.Pointer elseif Entry then config.Directional elseif Entry1 then config.Touch else config.Pointer
	end
end

function updatePreferredInput()
	-- upvalues: config2 (copy), NewResult (copy)
	local PreferredInput = getPreferredInput()
	
	if PreferredInput ~= config2.preferred then
		config2.preferred = PreferredInput
		
		if config2.last == nil then
			config2.last = config2.preferred
		end
		NewResult:fire()
	end
end

function updateLastInput()
	-- upvalues: config1 (copy), UserInputService (copy), config2 (copy), NewResult (copy)
	local Entry = config1[UserInputService:GetLastInputType()]
	
	if Entry and Entry ~= config2.last then
		config2.last = Entry
		NewResult:fire()
	end
end

function init()
	-- upvalues: FFlagLuaAppResponsiveEnginePreferredInput (copy), UserInputService (copy), AppCommonLibModule (copy)
	if FFlagLuaAppResponsiveEnginePreferredInput then
		UserInputService:GetPropertyChangedSignal("PreferredInput"):Connect(updatePreferredInput)
	end
	UserInputService.GamepadConnected:Connect(updatePreferredInput)
	UserInputService:GetPropertyChangedSignal("KeyboardEnabled"):Connect(updatePreferredInput)
	UserInputService:GetPropertyChangedSignal("MouseEnabled"):Connect(updatePreferredInput)
	UserInputService:GetPropertyChangedSignal("TouchEnabled"):Connect(updatePreferredInput)
	UserInputService:GetPropertyChangedSignal("GamepadEnabled"):Connect(updatePreferredInput)
	AppCommonLibModule.connectToIsSpatialChanged(updatePreferredInput)
	UserInputService.LastInputTypeChanged:Connect(updateLastInput)
	updateLastInput()
	updatePreferredInput()
end

init()

return {
	Enum = config,
	preferredInputRules = {
		{
			Key = config.Directional,
			preferredInput = config.Directional
		},
		{ Key = config.Pointer, preferredInput = config.Pointer },
		{ Key = config.Touch, preferredInput = config.Touch }
	},
	lastInputRules = {
		{ Key = config.Directional, lastInput = config.Directional },
		{ Key = config.Pointer, lastInput = config.Pointer },
		{ Key = config.Touch, lastInput = config.Touch }
	},
	connect = function(p1)
		-- upvalues: NewResult (copy)
		return NewResult:connect(p1)
	end,
	preferred = function()
		-- upvalues: config2 (copy)
		return config2.preferred
	end,
	last = function()
		-- upvalues: config2 (copy)
		return config2.last
	end
}