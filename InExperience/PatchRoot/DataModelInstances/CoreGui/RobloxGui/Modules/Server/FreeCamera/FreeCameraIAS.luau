local ClampFunction = math.clamp
local ExpFunction = math.exp
local RadFunction = math.rad
local SqrtFunction = math.sqrt
local TanFunction = math.tan
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local StarterPlayer = game:GetService("StarterPlayer")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local Success, Result = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamIASRefactor1")
end)
local Result1 = Success and Result
local config = {
	AttributeName = "FreecamEnabled",
	Thumbstick = { Curvature = 2 },
	DoubleTap = { Threshold = 0.25, Debounce = 0.1 },
	PlayerLock = {
		DefaultZoom = 20,
		MinZoom = 5,
		MaxZoom = 50,
		DefaultHeight = 0,
		HeightRange = 10
	},
	Movement = {
		Gain = vector.create(64, 64, 64),
		AdjSpeed = 0.75,
		MinSpeed = 0.01,
		MaxSpeed = 4,
		ShiftMul = 0.25,
		Stiffness = 1.5,
		AdjStiffness = 0.75,
		MinStiffness = 0.01,
		MaxStiffness = 10
	},
	Pan = {
		AdjSpeed = 0.75,
		MinSpeed = 0.01,
		MaxSpeed = 4,
		Stiffness = 1,
		AdjStiffness = 0.75,
		MinStiffness = 0.01,
		MaxStiffness = 10,
		Gain = Vector2.new(0.75, 1) * 8,
		MouseScale = Vector2.new(0.0008181230868723419, -0.0008181230868723419),
		TrackpadScale = Vector2.new(0.011453723216212788, -0.011453723216212788),
		GamepadScale = Vector2.new(0.39269908169872414, 0.39269908169872414)
	},
	Fov = {
		Gain = 300,
		WheelScale = -0.01667,
		PinchScale = -0.008,
		GamepadScale = 0.25,
		AdjSpeed = 0.75,
		MinSpeed = 0.01,
		MaxSpeed = 4,
		Stiffness = 4,
		AdjStiffness = 0.75,
		MinStiffness = 0.01,
		MaxStiffness = 10
	},
	Roll = {
		Gain = -1.5707963267948966,
		AdjSpeed = 0.75,
		MinSpeed = 0.01,
		MaxSpeed = 4,
		Stiffness = 1,
		AdjStiffness = 0.75,
		MinStiffness = 0.01,
		MaxStiffness = 10
	},
	DoF = {
		FarIntensity = { Adj = 0.1, Min = 0, Max = 1 },
		NearIntensity = { Adj = 0.1, Min = 0, Max = 1 },
		FocusDistance = { Adj = 20, Min = 0, Max = 200 },
		FocusRadius = { Adj = 5, Min = 0, Max = 50 }
	},
	Bloom = {
		Intensity = { Adj = 0.05, Min = 0, Max = 1 },
		Size = { Adj = 2, Min = 0, Max = 56 },
		Threshold = {
			Adj = 0.05,
			Min = if Result1 then 0.8 else 0,
			Max = if Result1 then 4 else 1
		}
	},
	Blur = { Size = { Adj = 2, Min = 0, Max = 56 } },
	ColorCorrection = {
		Brightness = { Adj = 0.05, Min = -1, Max = 1 },
		Contrast = { Adj = 0.05, Min = -1, Max = 1 },
		Saturation = { Adj = 0.05, Min = -1, Max = 1 }
	},
	SunRays = {
		Intensity = { Adj = 0.05, Min = 0, Max = 1 },
		Spread = { Adj = 0.05, Min = 0, Max = 1 }
	},
	Keys = {
		Toggle = {
			Keyboard = Enum.KeyCode.P,
			Modifier = Enum.KeyCode.LeftShift
		},
		Pan = {
			Mouse = Enum.KeyCode.MouseDelta,
			Trackpad = Enum.KeyCode.TrackpadPan,
			Gamepad = Enum.KeyCode.Thumbstick2
		},
		MovementMove = {
			Keyboard = {
				Up = Enum.KeyCode.W,
				Down = Enum.KeyCode.S,
				Left = Enum.KeyCode.A,
				Right = Enum.KeyCode.D
			},
			Gamepad = Enum.KeyCode.Thumbstick1
		},
		MovementElevate = {
			Keyboard = { Up = Enum.KeyCode.E, Down = Enum.KeyCode.Q },
			Gamepad = { Up = Enum.KeyCode.ButtonR2, Down = Enum.KeyCode.ButtonL2 }
		},
		ModeSelect = {
			Toggle = {
				Keyboard = Enum.KeyCode.Up,
				Gamepad = Enum.KeyCode.DPadUp
			},
			Next = {
				Keyboard = Enum.KeyCode.Down,
				Gamepad = Enum.KeyCode.DPadDown
			},
			Axis = {
				Up = {
					Keyboard = Enum.KeyCode.Right,
					Gamepad = Enum.KeyCode.DPadRight
				},
				Down = {
					Keyboard = Enum.KeyCode.Left,
					Gamepad = Enum.KeyCode.DPadLeft
				}
			}
		},
		Fov = {
			Mouse = Enum.KeyCode.MouseWheel,
			TrackpadPinch = Enum.KeyCode.TrackpadPinch,
			Gamepad = { Up = Enum.KeyCode.ButtonX, Down = Enum.KeyCode.ButtonY }
		},
		Tilt = {
			Keyboard = { Up = Enum.KeyCode.C, Down = Enum.KeyCode.Z },
			Gamepad = { Up = Enum.KeyCode.ButtonR1, Down = Enum.KeyCode.ButtonL1 }
		},
		Shift = {
			KeyboardPrimary = Enum.KeyCode.LeftShift,
			KeyboardSecondary = Enum.KeyCode.RightShift
		}
	}
}
config.Actions = {
	Toggle = {
		name = "FreecamToggleAction",
		type = Enum.InputActionType.Bool,
		bindings = {
			{
				keyCode = config.Keys.Toggle.Keyboard,
				primaryModifier = config.Keys.Toggle.Modifier
			}
		}
	},
	Pan = {
		name = "PanAction",
		type = Enum.InputActionType.Direction2D,
		bindings = {
			{
				keyCode = config.Keys.Pan.Mouse,
				vector2Scale = config.Pan.MouseScale
			},
			{
				keyCode = config.Keys.Pan.Trackpad,
				vector2Scale = config.Pan.TrackpadScale
			},
			{
				keyCode = config.Keys.Pan.Gamepad,
				responseCurve = config.Thumbstick.Curvature,
				vector2Scale = config.Pan.GamepadScale
			}
		}
	},
	MovementMove = {
		name = "MovementMoveAction",
		type = Enum.InputActionType.Direction2D,
		bindings = {
			{
				up = config.Keys.MovementMove.Keyboard.Up,
				down = config.Keys.MovementMove.Keyboard.Down,
				left = config.Keys.MovementMove.Keyboard.Left,
				right = config.Keys.MovementMove.Keyboard.Right
			},
			{
				keyCode = config.Keys.MovementMove.Gamepad,
				responseCurve = config.Thumbstick.Curvature
			}
		}
	},
	MovementElevate = {
		name = "MovementElevateAction",
		type = Enum.InputActionType.Direction1D,
		bindings = {
			{
				up = config.Keys.MovementElevate.Keyboard.Up,
				down = config.Keys.MovementElevate.Keyboard.Down
			},
			{
				up = config.Keys.MovementElevate.Gamepad.Up,
				down = config.Keys.MovementElevate.Gamepad.Down
			}
		}
	},
	Fov = {
		name = "FovAction",
		type = Enum.InputActionType.Direction1D,
		bindings = {
			{
				keyCode = config.Keys.Fov.Mouse,
				scale = config.Fov.WheelScale
			},
			{
				keyCode = config.Keys.Fov.TrackpadPinch,
				scale = config.Fov.PinchScale
			},
			{
				up = config.Keys.Fov.Gamepad.Up,
				down = config.Keys.Fov.Gamepad.Down,
				scale = config.Fov.GamepadScale
			}
		}
	},
	Tilt = {
		name = "TiltAction",
		type = Enum.InputActionType.Direction1D,
		bindings = {
			{
				up = config.Keys.Tilt.Keyboard.Up,
				down = config.Keys.Tilt.Keyboard.Down
			},
			{
				up = config.Keys.Tilt.Gamepad.Up,
				down = config.Keys.Tilt.Gamepad.Down
			}
		}
	},
	Shift = {
		name = "ShiftAction",
		type = Enum.InputActionType.Bool,
		bindings = {
			{ keyCode = config.Keys.Shift.KeyboardPrimary },
			{ keyCode = config.Keys.Shift.KeyboardSecondary }
		}
	},
	ModeToggle = {
		name = "ModeToggleAction",
		type = Enum.InputActionType.Bool,
		bindings = {
			{ keyCode = config.Keys.ModeSelect.Toggle.Keyboard },
			{ keyCode = config.Keys.ModeSelect.Toggle.Gamepad }
		}
	},
	ModeNext = {
		name = "ModeNextAction",
		type = Enum.InputActionType.Bool,
		bindings = {
			{ keyCode = config.Keys.ModeSelect.Next.Keyboard },
			{ keyCode = config.Keys.ModeSelect.Next.Gamepad }
		}
	},
	ModeAxis = {
		name = "ModeAxisAction",
		type = Enum.InputActionType.Direction1D,
		bindings = {
			{
				up = config.Keys.ModeSelect.Axis.Up.Keyboard,
				down = config.Keys.ModeSelect.Axis.Down.Keyboard
			},
			{
				up = config.Keys.ModeSelect.Axis.Up.Gamepad,
				down = config.Keys.ModeSelect.Axis.Down.Gamepad
			}
		}
	}
}
local LocalPlayer = Players.LocalPlayer

if not LocalPlayer then
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	LocalPlayer = Players.LocalPlayer
end
local Freecam = nil
local CurrentCamera = Workspace.CurrentCamera
Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: Workspace (copy), CurrentCamera (ref)
	local CurrentCamera1 = Workspace.CurrentCamera
	
	if CurrentCamera1 then
		CurrentCamera = CurrentCamera1
	end
end)
local v1 = nil
local v2 = nil
local v3 = nil
local v4 = nil
local v5 = nil
local v6 = nil
local config1 = {
	DepthOfField = {
		Enabled = false,
		FarIntensity = 0.75,
		NearIntensity = 0.75,
		FocusDistance = 0.05,
		InFocusRadius = 10
	},
	Bloom = {
		Enabled = false,
		Intensity = 0.4,
		Size = 24,
		Threshold = 0.95
	},
	Blur = { Enabled = false, Size = 24 },
	ColorCorrection = {
		Enabled = false,
		Brightness = 0,
		Contrast = 0,
		Saturation = 0,
		TintColor = Color3.new(1, 1, 1)
	},
	SunRays = { Enabled = false, Intensity = 0.25, Spread = 1 },
	ColorGrading = {
		Enabled = false,
		TonemapperPreset = Enum.TonemapperPreset.Default
	}
}
local v7 = nil
local Config = nil
local v8 = nil
local Result2_1 = nil
local Success1, Result2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserShowGuiHideToggles")
end)
Result2_1 = Success1 and Result2
local Result3_1 = nil
local Success2, Result3 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserPlayerScriptsRefactor4")
end)
Result3_1 = Success2 and Result3
local Result4_1 = nil
local Success3, Result4 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserPlayerScriptsRefactor5")
end)
Result4_1 = Success3 and Result4
local Result5_1 = nil
local Success4, Result5 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamIASRefactor2")
end)
Result5_1 = Success4 and Result5
local Result6_1 = nil
local Success5, Result6 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamIASRefactor3")
end)
Result6_1 = Success5 and Result6
local Result7_1 = nil
local Success6, Result7 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamIASRefactor4")
end)
Result7_1 = Success6 and Result7
local Inverted = false
local PostEffect, PostEffect2 = (function(ClassName, Callback)
	-- upvalues: CurrentCamera (ref), Lighting (copy)
	local T = {}
	local ChildAddedConnection = nil
	local ChildAddedConnection1 = nil
	
	local function _(Object)
		-- upvalues: ClassName (copy), Callback (copy), T (ref)
		if Object:IsA(ClassName) and Object.Enabled and (not Callback or not Callback(Object)) then
			T[#T + 1] = Object
			Object.Enabled = false
		end
	end
	
	return function()
		-- upvalues: T (ref), CurrentCamera (upval), ClassName (copy), Callback (copy), Lighting (upval), ChildAddedConnection (ref), ChildAddedConnection1 (ref)
		T = {}
		
		for _, child in ipairs(CurrentCamera:GetChildren()) do
			if child:IsA(ClassName) and child.Enabled and (not Callback or not Callback(child)) then
				T[#T + 1] = child
				child.Enabled = false
			end
		end
		for _, child1 in ipairs(Lighting:GetChildren()) do
			if child1:IsA(ClassName) and child1.Enabled and (not Callback or not Callback(child1)) then
				T[#T + 1] = child1
				child1.Enabled = false
			end
		end
		ChildAddedConnection = CurrentCamera.ChildAdded:Connect(function(Child)
			-- upvalues: ClassName (upval), Callback (upval), T (upval)
			if Child:IsA(ClassName) and Child.Enabled and (not Callback or not Callback(Child)) then
				T[#T + 1] = Child
				Child.Enabled = false
			end
		end)
		ChildAddedConnection1 = Lighting.ChildAdded:Connect(function(Child)
			-- upvalues: ClassName (upval), Callback (upval), T (upval)
			if Child:IsA(ClassName) and Child.Enabled and (not Callback or not Callback(Child)) then
				T[#T + 1] = Child
				Child.Enabled = false
			end
		end)
	end, function()
		-- upvalues: T (ref), ChildAddedConnection (ref), ChildAddedConnection1 (ref)
		for _, value in ipairs(T) do
			if value.Parent then
				value.Enabled = true
			end
		end
		if ChildAddedConnection then
			ChildAddedConnection:Disconnect()
			ChildAddedConnection = nil
		end
		if ChildAddedConnection1 then
			ChildAddedConnection1:Disconnect()
			ChildAddedConnection1 = nil
		end
		T = {}
	end
end)("PostEffect", function(p1): boolean
	return p1.Name:sub(1, 7) == "Freecam"
end)
local v9 = nil

local function doToggleMasterEffects()
	-- upvalues: Inverted (ref), PostEffect (copy), PostEffect2 (copy), v9 (ref)
	Inverted = not Inverted
	
	if Inverted then
		PostEffect()
		
		return
	end
	PostEffect2()
	
	for _, value in ipairs(v9) do
		local GetResult = value.get()
		
		if GetResult then
			GetResult.Enabled = false
		end
	end
end

local function doToggleDoF()
	-- upvalues: Result3_1 (ref), Inverted (ref), v1 (ref)
	if Result3_1 and not Inverted then return end
	local v10 = v1
	
	if v10 then
		v10.Enabled = not v10.Enabled
	end
end

local function doToggleBloom()
	-- upvalues: Result3_1 (ref), Inverted (ref), v2 (ref)
	if Result3_1 and not Inverted then return end
	local v10 = v2
	
	if v10 then
		v10.Enabled = not v10.Enabled
	end
end

local function doToggleBlur()
	-- upvalues: Result3_1 (ref), Inverted (ref), v3 (ref)
	if Result3_1 and not Inverted then return end
	local v10 = v3
	
	if v10 then
		v10.Enabled = not v10.Enabled
	end
end

local function doToggleColorCorrection()
	-- upvalues: Result3_1 (ref), Inverted (ref), v4 (ref)
	if Result3_1 and not Inverted then return end
	local v10 = v4
	
	if v10 then
		v10.Enabled = not v10.Enabled
	end
end

local function doToggleSunRays()
	-- upvalues: Result3_1 (ref), Inverted (ref), v5 (ref)
	if Result3_1 and not Inverted then return end
	local v10 = v5
	
	if v10 then
		v10.Enabled = not v10.Enabled
	end
end

local function doToggleColorGrading()
	-- upvalues: Result3_1 (ref), Inverted (ref), v6 (ref)
	if Result3_1 and not Inverted then return end
	local v10 = v6
	
	if v10 then
		v10.Enabled = not v10.Enabled
	end
end

v9 = {
	{
		key = "DepthOfField",
		class = "DepthOfFieldEffect",
		get = function()
			-- upvalues: v1 (ref)
			return v1
		end,
		set = function(p1)
			-- upvalues: v1 (ref)
			v1 = p1
		end,
		props = {
			"FarIntensity",
			"NearIntensity",
			"FocusDistance",
			"InFocusRadius"
		}
	},
	{
		key = "Bloom",
		class = "BloomEffect",
		get = function()
			-- upvalues: v2 (ref)
			return v2
		end,
		set = function(p1)
			-- upvalues: v2 (ref)
			v2 = p1
		end,
		props = { "Intensity", "Size", "Threshold" }
	},
	{
		key = "Blur",
		class = "BlurEffect",
		get = function()
			-- upvalues: v3 (ref)
			return v3
		end,
		set = function(p1)
			-- upvalues: v3 (ref)
			v3 = p1
		end,
		props = { "Size" }
	},
	{
		key = "ColorCorrection",
		class = "ColorCorrectionEffect",
		get = function()
			-- upvalues: v4 (ref)
			return v4
		end,
		set = function(p1)
			-- upvalues: v4 (ref)
			v4 = p1
		end,
		props = { "Brightness", "Contrast", "Saturation", "TintColor" }
	},
	{
		key = "SunRays",
		class = "SunRaysEffect",
		get = function()
			-- upvalues: v5 (ref)
			return v5
		end,
		set = function(p1)
			-- upvalues: v5 (ref)
			v5 = p1
		end,
		props = { "Intensity", "Spread" }
	},
	{
		key = "ColorGrading",
		class = "ColorGradingEffect",
		parent = Result4_1 and Lighting or nil,
		get = function()
			-- upvalues: v6 (ref)
			return v6
		end,
		set = function(p1)
			-- upvalues: v6 (ref)
			v6 = p1
		end,
		props = { "TonemapperPreset" }
	}
}
local ChildAddedConnection = nil
local PlayerAddedConnection = nil
local PlayerRemovingConnection = nil
local Inverted1 = false
local DefaultZoom = config.PlayerLock.DefaultZoom
local DefaultHeight = config.PlayerLock.DefaultHeight
local List = {}
local Index = 1
local RootPart = nil
local Inverted2 = false
local Inverted3 = false
local ClockTime = -1e999
local ClockTime1 = -1e999
local config2 = {
	movement = config.Movement.Stiffness,
	pan = config.Pan.Stiffness,
	fov = config.Fov.Stiffness,
	roll = config.Roll.Stiffness
}
local Humanoid = nil
local Module = {}
Module.__index = Module

function Module.new(Fov, Vector: number)
	-- upvalues: Module (copy)
	local self = setmetatable({}, Module)
	self.f = Fov
	self.p = Vector
	self.v = Vector * 0
	
	return self
end

function Module:Update(p1, FovResult)
	-- upvalues: ExpFunction (copy)
	local ScaledF = self.f * 2 * 3.141592653589793
	local V = self.v
	local FovResultDelta = FovResult - self.p
	local ExpResult = ExpFunction(-ScaledF * p1)
	local NewFovResult = FovResult + (V * p1 - FovResultDelta * (ScaledF * p1 + 1)) * ExpResult
	self.p = NewFovResult
	self.v = (ScaledF * p1 * (FovResultDelta * ScaledF - V) + V) * ExpResult
	
	return NewFovResult
end

function Module:SetFreq(p1)
	self.f = p1
end

function Module:Reset(Vector: number)
	self.p = Vector
	self.v = Vector * 0
end

local _Vector3 = Vector3.new()
local _Vector3_1 = Vector3.new()
local FieldOfView = 0
local NewModule = Module.new(config2.movement, (Vector3.new()))
local NewModule1 = Module.new(config2.pan, Vector2.new())
local NewModule2 = Module.new(config2.fov, 0)
local NewModule3 = Module.new(config2.roll, 0)
local t = {}
local t1 = {}
local config3 = { movement = 1, pan = 1, fov = 1, roll = 1 }
local Flag = false
local Reset = nil
local Flag1 = false
local v10 = 1
local List1 = {}
local Flag2 = false
local Flag3 = false

local function findPlayerLockRootPart(p1: number)
	-- upvalues: List (ref), Index (ref), Inverted1 (ref)
	if not List or #List < 1 then
		return nil
	end
	local Humanoid = nil
	for _ = 1, #List do
		Index = (Index - 1 + p1) % #List + 1
		local Entry = List[Index]
		local Character = Entry and Entry.Character
		
		if Character then
			Humanoid = Character:FindFirstChildOfClass("Humanoid")
			
			if Humanoid and Humanoid.RootPart then
				return Humanoid.RootPart
			end
		end
		if p1 == 0 then
			p1 = 1
		end
	end
	Inverted1 = false
	
	return nil
end

local list = {
	{ name = "Custom", color = nil },
	{ name = "White", color = Color3.new(1, 1, 1) },
	{ name = "Warm", color = Color3.fromRGB(255, 230, 200) },
	{ name = "Cool", color = Color3.fromRGB(200, 220, 255) },
	{ name = "Red", color = Color3.new(1, 0, 0) },
	{ name = "Green", color = Color3.new(0, 1, 0) },
	{ name = "Blue", color = Color3.new(0, 0, 1) },
	{ name = "Yellow", color = Color3.new(1, 1, 0) },
	{ name = "Cyan", color = Color3.new(0, 1, 1) },
	{ name = "Magenta", color = Color3.new(1, 0, 1) },
	{ name = "Orange", color = Color3.fromRGB(255, 140, 0) },
	{ name = "Purple", color = Color3.fromRGB(128, 0, 255) }
}
local Index1 = 1
local _Color3 = Color3.new(1, 1, 1)

local function makeEffectGroup(Name, Toggle, Callback, p2, p3)
	local Modes = {
		{
			type = "toggle",
			name = "Enable",
			toggle = Toggle,
			isEnabled = function()
				-- upvalues: Callback (copy)
				local CallbackResult = Callback()
				
				return CallbackResult and CallbackResult.Enabled
			end
		}
	}
	local Iterator = ipairs
	local P23 = p2 or {}
	for _, value in Iterator(P23) do
		Modes[#Modes + 1] = {
			type = "axis",
			name = value.name,
			adj = value.adjCfg.Adj,
			min = value.adjCfg.Min,
			max = value.adjCfg.Max,
			get = function()
				-- upvalues: Callback (copy), value (copy)
				local CallbackResult = Callback()
				
				return CallbackResult and CallbackResult[value.prop] or 0
			end,
			set = function(p4)
				-- upvalues: Callback (copy), value (copy)
				local CallbackResult = Callback()
				
				if CallbackResult then
					CallbackResult[value.prop] = p4
				end
			end
		}
	end
	local Iterator1 = ipairs
	local P24 = p3 or {}
	for _, value1 in Iterator1(P24) do
		Modes[#Modes + 1] = value1
	end
	return { type = "group", name = Name, modes = Modes }
end

local function makeTintChannel(Text)
	-- upvalues: Result5_1 (ref), v4 (ref), _Color3 (ref), Index1 (ref)
	return if Result5_1 then {
		type = "axis",
		adj = 64,
		min = 0,
		max = 255,
		format = "%.0f",
		name = "Tint " .. Text,
		get = function()
			-- upvalues: v4 (upval), _Color3 (upval), Text (copy)
			return (v4 and v4.TintColor or _Color3)[Text] * 255
		end,
		set = function(p4: number)
			-- upvalues: v4 (upval), _Color3 (upval), Text (copy), Index1 (upval)
			local TintColor = v4 and v4.TintColor or _Color3
			local R = TintColor.R
			local G = TintColor.G
			local B = TintColor.B
			
			if Text == "R" then
				R = p4 / 255
			elseif Text == "G" then
				G = p4 / 255
			else
				B = p4 / 255
			end
			_Color3 = Color3.new(R, G, B)
			Index1 = 1
			
			if v4 then
				v4.TintColor = _Color3
			end
		end
	} else {
		type = "axis",
		adj = 0.02,
		min = 0,
		max = 1,
		name = "Tint " .. Text,
		get = function()
			-- upvalues: _Color3 (upval), Text (copy)
			return _Color3[Text]
		end,
		set = function(p4)
			-- upvalues: _Color3 (upval), Text (copy), Index1 (upval), v4 (upval)
			local R = _Color3.R
			local G = _Color3.G
			local B = _Color3.B
			
			if Text == "R" then
				R = p4
			elseif Text == "G" then
				G = p4
			else
				B = p4
			end
			_Color3 = Color3.new(R, G, B)
			Index1 = 1
			
			if v4 then
				v4.TintColor = _Color3
			end
		end
	}
end

local function makeSpeedStiffnessGroup(Name, Fov, p4, p5, NewResult)
	-- upvalues: config3 (copy), config2 (copy)
	return {
		type = "group",
		name = Name,
		modes = {
			{
				type = "axis",
				name = "Speed",
				adj = Fov.AdjSpeed,
				min = Fov.MinSpeed,
				max = Fov.MaxSpeed,
				get = function()
					-- upvalues: config3 (upval), p4 (copy)
					return config3[p4]
				end,
				set = function(p6)
					-- upvalues: config3 (upval), p4 (copy)
					config3[p4] = p6
				end
			},
			{
				type = "axis",
				name = "Stiffness",
				adj = Fov.AdjStiffness,
				min = Fov.MinStiffness,
				max = Fov.MaxStiffness,
				get = function()
					-- upvalues: config2 (upval), p5 (copy)
					return config2[p5]
				end,
				set = function(p6)
					-- upvalues: config2 (upval), p5 (copy), NewResult (copy)
					config2[p5] = p6
					NewResult:SetFreq(p6)
				end
			}
		}
	}
end

local _modes = {
	(function()
		-- upvalues: doToggleMasterEffects (copy), Inverted (ref), makeEffectGroup (copy), doToggleDoF (copy), v1 (ref), config (copy), doToggleBloom (copy), v2 (ref), doToggleBlur (copy), v3 (ref), doToggleColorCorrection (copy), v4 (ref), list (copy), Index1 (ref), _Color3 (ref), Result5_1 (ref), makeTintChannel (copy), doToggleSunRays (copy), v5 (ref), doToggleColorGrading (copy), v6 (ref), Result3_1 (ref)
		local config1 = {
			type = "group",
			name = "Custom Post Processing",
			modes = {
				{
					type = "toggle",
					name = "Enable",
					toggle = doToggleMasterEffects,
					isEnabled = function()
						-- upvalues: Inverted (upval)
						return Inverted
					end
				},
				makeEffectGroup("Depth of Field", doToggleDoF, function()
					-- upvalues: v1 (upval)
					return v1
				end, {
					{
						name = "Far",
						prop = "FarIntensity",
						adjCfg = config.DoF.FarIntensity
					},
					{
						name = "Near",
						prop = "NearIntensity",
						adjCfg = config.DoF.NearIntensity
					},
					{
						name = "Focus Distance",
						prop = "FocusDistance",
						adjCfg = config.DoF.FocusDistance
					},
					{
						name = "Focus Radius",
						prop = "InFocusRadius",
						adjCfg = config.DoF.FocusRadius
					}
				}),
				makeEffectGroup("Bloom", doToggleBloom, function()
					-- upvalues: v2 (upval)
					return v2
				end, {
					{
						name = "Intensity",
						prop = "Intensity",
						adjCfg = config.Bloom.Intensity
					},
					{ name = "Size", prop = "Size", adjCfg = config.Bloom.Size },
					{
						name = "Threshold",
						prop = "Threshold",
						adjCfg = config.Bloom.Threshold
					}
				}),
				makeEffectGroup("Blur", doToggleBlur, function()
					-- upvalues: v3 (upval)
					return v3
				end, {
					{ name = "Size", prop = "Size", adjCfg = config.Blur.Size }
				}),
				makeEffectGroup("Color Correction", doToggleColorCorrection, function()
					-- upvalues: v4 (upval)
					return v4
				end, {
					{
						name = "Brightness",
						prop = "Brightness",
						adjCfg = config.ColorCorrection.Brightness
					},
					{
						name = "Contrast",
						prop = "Contrast",
						adjCfg = config.ColorCorrection.Contrast
					},
					{
						name = "Saturation",
						prop = "Saturation",
						adjCfg = config.ColorCorrection.Saturation
					}
				}, {
					{
						type = "cycle",
						name = "Tint",
						items = function()
							-- upvalues: list (upval)
							return list
						end,
						getIndex = function()
							-- upvalues: Index1 (upval)
							return Index1
						end,
						setIndex = function(Value)
							-- upvalues: Index1 (upval), v4 (upval), _Color3 (upval), list (upval), Result5_1 (upval)
							Index1 = Value
							
							if v4 then
								if Value == 1 then
									v4.TintColor = _Color3
									
									return
								end
								local Color = list[Value].color
								v4.TintColor = Color
								
								if not Result5_1 then
									_Color3 = Color
								end
							end
						end,
						displayItem = function(p4)
							return p4.name
						end
					},
					makeTintChannel("R"),
					makeTintChannel("G"),
					(makeTintChannel("B"))
				}),
				makeEffectGroup("Sun Rays", doToggleSunRays, function()
					-- upvalues: v5 (upval)
					return v5
				end, {
					{
						name = "Intensity",
						prop = "Intensity",
						adjCfg = config.SunRays.Intensity
					},
					{
						name = "Spread",
						prop = "Spread",
						adjCfg = config.SunRays.Spread
					}
				}),
				(makeEffectGroup("Color Grading", doToggleColorGrading, function()
					-- upvalues: v6 (upval)
					return v6
				end, nil, {
					{
						type = "cycle",
						name = "Tonemap",
						items = function()
							return {
								Enum.TonemapperPreset.Default,
								Enum.TonemapperPreset.Retro
							}
						end,
						getIndex = function(): number
							-- upvalues: v6 (upval)
							return if v6 and v6.TonemapperPreset == Enum.TonemapperPreset.Retro then 2 else 1
						end,
						setIndex = function(p4)
							-- upvalues: v6 (upval)
							if v6 then
								v6.TonemapperPreset = ({
									Enum.TonemapperPreset.Default,
									Enum.TonemapperPreset.Retro
								})[p4]
							end
						end,
						displayItem = function(p4)
							return p4.Name
						end
					}
				}))
			}
		}
		
		if Result3_1 then
			for i = 2, #config1.modes do
				config1.modes[i].disabled = function(): boolean
					-- upvalues: Inverted (upval)
					return not Inverted
				end
				
			end
		end
		return config1
	end)(),
	{
		type = "group",
		name = "Player Lock",
		modes = {
			{
				type = "toggle",
				name = "Enable",
				toggle = function()
					-- upvalues: Inverted1 (ref), DefaultZoom (ref), config (copy), DefaultHeight (ref), RootPart (ref), findPlayerLockRootPart (copy)
					Inverted1 = not Inverted1
					
					if Inverted1 then
						DefaultZoom = config.PlayerLock.DefaultZoom
						DefaultHeight = config.PlayerLock.DefaultHeight
						RootPart = findPlayerLockRootPart(0)
					end
				end,
				isEnabled = function()
					-- upvalues: Inverted1 (ref)
					return Inverted1
				end
			},
			{
				type = "cycle",
				name = "Target",
				items = function()
					-- upvalues: List (ref)
					return List
				end,
				getIndex = function()
					-- upvalues: Index (ref)
					return Index
				end,
				setIndex = function(Value)
					-- upvalues: Index (ref), List (ref), RootPart (ref)
					Index = Value
					local Entry = List[Value]
					local Character = Entry and Entry.Character
					
					if Character then
						local Humanoid = Character:FindFirstChildOfClass("Humanoid")
						RootPart = Humanoid and Humanoid.RootPart or nil
						
						return
					else
						RootPart = nil
					end
				end,
				displayItem = function(p4)
					return p4.Name
				end
			}
		}
	},
	{
		type = "group",
		name = if Result6_1 then "UI Visibility" else "UI",
		modes = {
			{
				type = "toggle",
				name = "Screen GUIs",
				toggle = function()
					-- upvalues: Inverted2 (ref), v8 (ref), Freecam (ref)
					Inverted2 = not Inverted2
					
					if v8 then
						for _, value in pairs(v8.getScreenGuis()) do
							if value.Parent and value ~= Freecam then
								value.Enabled = Inverted2
							end
						end
					end
				end,
				isEnabled = function()
					-- upvalues: Inverted2 (ref)
					return Inverted2
				end
			},
			{
				type = "toggle",
				name = "Leaderboard",
				toggle = function()
					-- upvalues: Inverted3 (ref), StarterGui (copy)
					Inverted3 = not Inverted3
					StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, Inverted3)
				end,
				isEnabled = function()
					-- upvalues: Inverted3 (ref)
					return Inverted3
				end
			}
		}
	},
	makeSpeedStiffnessGroup("Movement", config.Movement, "movement", "movement", NewModule),
	makeSpeedStiffnessGroup("Field of View", config.Fov, "fov", "fov", NewModule2),
	makeSpeedStiffnessGroup(if Result6_1 then "Roll" else "Tilt", config.Roll, "roll", "roll", NewModule3),
	(makeSpeedStiffnessGroup(if Result6_1 then "Rotation" else "Pan", config.Pan, "pan", "pan", NewModule1))
}

if Result6_1 then
	_modes = {
		_modes[4], _modes[7], _modes[6], _modes[5], _modes[1], _modes[2], _modes[3]
	}
end
local Callback: ((any) -> any)? = nil
local Callback1: ((any, number, any) -> number)? = nil

if Result3_1 then
	Callback = function(Mode)
		return Mode.disabled and Mode.disabled()
	end
	
	Callback1 = function(Modes, Index: number, p4): number
		-- upvalues: Callback (ref)
		local CountModes = #Modes
		
		for _ = 1, CountModes do
			Index = (Index - 1 + p4) % CountModes + 1
			
			if not Callback(Modes[Index]) then
				return Index
			end
		end
		return Index
	end
end
local function _()
	-- upvalues: List1 (ref), _modes (ref), v10 (ref)
	if #List1 > 0 then
		local Entry = List1[#List1]
		
		return Entry.modes[Entry.index]
	else
		return _modes[v10]
	end
end

local function createBinding(Parent, p4)
	local InputBinding = Instance.new("InputBinding")
	
	if p4.keyCode then
		InputBinding.KeyCode = p4.keyCode
	end
	if p4.up then
		InputBinding.Up = p4.up
	end
	if p4.down then
		InputBinding.Down = p4.down
	end
	if p4.left then
		InputBinding.Left = p4.left
	end
	if p4.right then
		InputBinding.Right = p4.right
	end
	if p4.scale then
		InputBinding.Scale = p4.scale
	end
	if p4.vector2Scale then
		InputBinding.Vector2Scale = p4.vector2Scale
	end
	if p4.responseCurve then
		InputBinding.ResponseCurve = p4.responseCurve
	end
	if p4.primaryModifier then
		InputBinding.PrimaryModifier = p4.primaryModifier
	end
	InputBinding.Parent = Parent
	
	return InputBinding
end

local function createAction(InputContext, Fov)
	-- upvalues: createBinding (copy)
	local InputAction = Instance.new("InputAction")
	InputAction.Name = Fov.name
	InputAction.Type = Fov.type
	InputAction.Parent = InputContext
	
	for _, binding in ipairs(Fov.bindings) do
		createBinding(InputAction, binding)
	end
	return InputAction
end

local _ = function(p4, p5, p6)
	local v11 = nil
	local v12 = 0
	
	return function(Value: number)
		-- upvalues: v11 (ref), p4 (copy), v12 (ref), p5 (copy), p6 (copy)
		if math.abs(Value) > 0.01 then
			local ClockTime = os.clock()
			
			if v11 == nil or ClockTime - v11 > p4 then
				v11 = ClockTime
			else
				if p5 <= ClockTime - v12 then
					p6()
					v12 = ClockTime
				end
				v11 = nil
				
				return
			end
		end
	end, function()
		-- upvalues: v11 (ref)
		v11 = nil
	end
end

;(function()
	-- upvalues: config (copy), Result7_1 (ref), StarterPlayer (copy), Humanoid (ref), createAction (copy), t (copy), t1 (copy), Reset (ref), _Vector3_1 (ref), NewModule3 (copy), Flag (ref), Result3_1 (ref), Flag1 (ref), Flag3 (ref), List1 (ref), Callback1 (ref), _modes (ref), v10 (ref), Flag2 (ref), Callback (ref)
	local Actions = config.Actions
	local Folder = nil
	
	if Result7_1 then
		local FreecamInput = Instance.new("Folder")
		FreecamInput.Name = "FreecamInput"
		FreecamInput.Parent = StarterPlayer
		script.Destroying:Connect(function()
			-- upvalues: FreecamInput (copy)
			FreecamInput:Destroy()
		end)
		Folder = FreecamInput
	else
		Folder = script
	end
	local FreecamToggleContext = Instance.new("InputContext")
	FreecamToggleContext.Name = "FreecamToggleContext"
	FreecamToggleContext.Priority = 3000
	FreecamToggleContext.Sink = false
	FreecamToggleContext.Enabled = true
	FreecamToggleContext.Parent = Folder
	Humanoid = createAction(FreecamToggleContext, Actions.Toggle)
	local FreecamInputContext = Instance.new("InputContext")
	FreecamInputContext.Name = "FreecamInputContext"
	FreecamInputContext.Priority = 2000
	FreecamInputContext.Sink = true
	FreecamInputContext.Enabled = false
	FreecamInputContext.Parent = Folder
	t._sinkContext = FreecamInputContext
	t1.Pan = createAction(FreecamInputContext, Actions.Pan)
	t1.MovementMove = createAction(FreecamInputContext, Actions.MovementMove)
	t1.MovementElevate = createAction(FreecamInputContext, Actions.MovementElevate)
	t1.Fov = createAction(FreecamInputContext, Actions.Fov)
	t1.Shift = createAction(FreecamInputContext, Actions.Shift)
	local Action = createAction(FreecamInputContext, Actions.Tilt)
	t1.Tilt = Action
	local detect = nil
	local Threshold = config.DoubleTap.Threshold
	local Debounce = config.DoubleTap.Debounce
	
	local function v188()
		-- upvalues: _Vector3_1 (upval), NewModule3 (upval), Flag (upval)
		_Vector3_1 = Vector3.new(_Vector3_1.x, _Vector3_1.y, 0)
		NewModule3:Reset(0)
		Flag = true
	end
	
	local v11 = nil
	local v12 = 0
	
	Reset = function()
		-- upvalues: v11 (ref)
		v11 = nil
	end
	
	detect = function(Value: number)
		-- upvalues: v11 (ref), Threshold (copy), v12 (ref), Debounce (copy), v188 (copy)
		if math.abs(Value) > 0.01 then
			local ClockTime = os.clock()
			
			if v11 == nil or ClockTime - v11 > Threshold then
				v11 = ClockTime
			else
				if Debounce <= ClockTime - v12 then
					v188()
					v12 = ClockTime
				end
				v11 = nil
				
				return
			end
		end
	end
	
	Action.StateChanged:Connect(function(Value: number)
		-- upvalues: Flag (upval), detect (ref)
		if not Flag then
			detect(Value)
			
			return
		end
		if math.abs(Value) < 0.01 then
			Flag = false
		end
	end)
	createAction(FreecamInputContext, Actions.ModeToggle).StateChanged:Connect(function(OldState)
		-- upvalues: Result3_1 (upval), Flag1 (upval), Flag3 (upval), List1 (upval), Callback1 (upval), _modes (upval), v10 (upval), Flag2 (upval)
		if not OldState then return end
		if Result3_1 then
			if not Flag1 then
				Flag1 = true
				
				return
			end
			if Flag3 then
				Flag3 = false
				
				return
			end
			if #List1 > 0 then
				local Entry = List1[#List1]
				local CallbackResult = Callback1(Entry.modes, Entry.index, -1)
				
				if CallbackResult < Entry.index then
					Entry.index = CallbackResult
					
					return
				else
					List1[#List1] = nil
					
					return
				end
			else
				local CallbackResult1 = Callback1(_modes, v10, -1)
				
				if CallbackResult1 < v10 then
					v10 = CallbackResult1
					
					return
				else
					Flag1 = false
					
					return
				end
			end
		elseif not Flag1 then
			Flag1 = true
			
			return
		else
			if Flag2 then
				Flag2 = false
				
				return
			end
			if #List1 > 0 then
				List1[#List1] = nil
				
				return
			else
				Flag1 = false
			end
		end
	end)
	createAction(FreecamInputContext, Actions.ModeNext).StateChanged:Connect(function(OldState)
		-- upvalues: Result3_1 (upval), Flag1 (upval), Flag3 (upval), List1 (upval), Callback1 (upval), v10 (upval), _modes (upval), Flag2 (upval)
		if not OldState then return end
		if Result3_1 then
			if not Flag1 then
				Flag1 = true
				
				return
			end
			if Flag3 then
				Flag3 = false
				
				return
			end
			if #List1 > 0 then
				local Entry = List1[#List1]
				Entry.index = Callback1(Entry.modes, Entry.index, 1)
				
				return
			else
				v10 = Callback1(_modes, v10, 1)
				
				return
			end
		elseif not Flag1 then return end
		if Flag2 then return end
		if #List1 > 0 then
			local Entry = List1[#List1]
			Entry.index = Entry.index % #Entry.modes + 1
			
			return
		end
		local Mode = _modes[v10]
		
		if Mode.type == "group" then
			table.insert(List1, { index = 1, modes = Mode.modes, groupName = Mode.name })
			
			return
		end
		if Mode.type == "toggle" then
			Mode.toggle()
			
			return
		end
		if Mode.type == "cycle" then
			local ItemsResult = Mode.items()
			
			if #ItemsResult > 0 then
				Mode.setIndex(Mode.getIndex() % #ItemsResult + 1)
				
				return
			end
		elseif Mode.type == "action" then
			Mode.action()
			
			return
		else
			if Mode.type == "axis" then
				Flag2 = true
			end
		end
	end)
	local Action1 = createAction(FreecamInputContext, Actions.ModeAxis)
	Action1.StateChanged:Connect(function(OldState: number)
		-- upvalues: Flag1 (upval), Result3_1 (upval), List1 (upval), _modes (upval), v10 (upval), Flag3 (upval), Callback (upval), Flag2 (upval)
		if not Flag1 or OldState == 0 then return end
		if Result3_1 then
			local Mode = nil
			if #List1 > 0 then
				local Entry = List1[#List1]
				Mode = Entry.modes[Entry.index]
			else
				Mode = _modes[v10]
			end
			if Flag3 then
				if Mode.type == "toggle" then
					Mode.toggle()
					
					return
				end
				if Mode.type == "cycle" then
					local ItemsResult = Mode.items()
					
					if #ItemsResult > 0 then
						if OldState > 0 then
							Mode.setIndex(Mode.getIndex() % #ItemsResult + 1)
							
							return
						else
							Mode.setIndex((Mode.getIndex() - 2) % #ItemsResult + 1)
							
							return
						end
					end
				elseif Mode.type == "action" then
					Mode.action()
					
					return
				else
					if Mode.type == "axis" then return end
				end
			elseif OldState > 0 then
				if Callback(Mode) then return end
				if Mode.type == "group" then
					table.insert(List1, { index = 1, modes = Mode.modes, groupName = Mode.name })
					
					return
				end
				if Mode.type == "action" then
					Mode.action()
					
					return
				else
					Flag3 = true
					
					return
				end
			elseif OldState < 0 then
				Flag3 = false
				
				if #List1 > 0 then
					List1[#List1] = nil
					
					return
				else
					Flag1 = false
					
					return
				end
			end
		else
			if Flag2 then return end
			if #List1 > 0 then
				local Mode = nil
				if #List1 > 0 then
					local Entry = List1[#List1]
					Mode = Entry.modes[Entry.index]
				else
					Mode = _modes[v10]
				end
				if Mode.type == "group" then
					table.insert(List1, { index = 1, modes = Mode.modes, groupName = Mode.name })
					
					return
				end
				if Mode.type == "toggle" then
					Mode.toggle()
					
					return
				end
				if Mode.type == "cycle" then
					local ItemsResult = Mode.items()
					
					if #ItemsResult == 0 then return end
					if OldState > 0 then
						Mode.setIndex(Mode.getIndex() % #ItemsResult + 1)
						
						return
					end
					if OldState < 0 then
						Mode.setIndex((Mode.getIndex() - 2) % #ItemsResult + 1)
						
						return
					end
				elseif Mode.type == "action" then
					Mode.action()
					
					return
				end
			elseif OldState > 0 then
				v10 = v10 % #_modes + 1
				
				return
			else
				if OldState < 0 then
					v10 = (v10 - 2) % #_modes + 1
				end
			end
		end
	end)
	t1.ModeAxis = Action1
end)()

function t.Movement(): Vector3
	-- upvalues: t1 (copy), config3 (copy), config (copy)
	local State = t1.MovementMove:GetState()
	
	return Vector3.new(State.X, t1.MovementElevate:GetState(), State.Y) * (config3.movement * (t1.Shift:GetState() and config.Movement.ShiftMul or 1))
end

function t.Pan(): Vector2
	-- upvalues: t1 (copy), config3 (copy)
	local State = t1.Pan:GetState()
	
	return Vector2.new(State.Y, -State.X) * config3.pan
end

function t.Fov()
	-- upvalues: t1 (copy), config3 (copy)
	return t1.Fov:GetState() * config3.fov
end

function t.Roll()
	-- upvalues: Flag (ref), t1 (copy), config3 (copy)
	return (if Flag then 0 else t1.Tilt:GetState()) * config3.roll
end

function t.ModeControl(p4)
	-- upvalues: Flag1 (ref), Result3_1 (ref), Flag3 (ref), List1 (ref), Flag2 (ref), _modes (ref), v10 (ref), t1 (copy), ClampFunction (copy)
	if not Flag1 then return end
	if Result3_1 then
		if not Flag3 then return end
	elseif #List1 == 0 and not Flag2 then return end
	local Mode = nil
	if #List1 > 0 then
		local Entry = List1[#List1]
		Mode = Entry.modes[Entry.index]
	else
		Mode = _modes[v10]
	end
	if Mode.type ~= "axis" then return end
	local ScaledState = t1.ModeAxis:GetState() * Mode.adj * p4
	
	if ScaledState ~= 0 then
		Mode.set((ClampFunction(Mode.get() + ScaledState, Mode.min, Mode.max)))
	end
end

function t.StartCapture()
	-- upvalues: t (copy)
	t._sinkContext.Enabled = true
end

function t.StopCapture()
	-- upvalues: t (copy), Flag (ref), Reset (ref), Flag1 (ref), Result3_1 (ref), List1 (ref), Flag3 (ref), Flag2 (ref)
	t._sinkContext.Enabled = false
	Flag = false
	
	if Reset then
		Reset()
	end
	Flag1 = false
	
	if Result3_1 then
		table.clear(List1)
		Flag3 = false
	else
		List1 = {}
	end
	Flag2 = false
end

function t.getModeActive()
	-- upvalues: Flag1 (ref)
	return Flag1
end

function t.getModeName()
	-- upvalues: List1 (ref), _modes (ref), v10 (ref)
	local Mode = nil
	if #List1 > 0 then
		local Entry = List1[#List1]
		Mode = Entry.modes[Entry.index]
	else
		Mode = _modes[v10]
	end
	return Mode.name
end

function t.getModeBreadcrumb(): string
	-- upvalues: List1 (ref)
	if #List1 == 0 then
		return ""
	end
	local List = {}
	
	for _, value in ipairs(List1) do
		table.insert(List, value.groupName)
	end
	return table.concat(List, " › ")
end

function t.getModeDisplay()
	-- upvalues: List1 (ref), _modes (ref), v10 (ref), Result5_1 (ref)
	local Mode = nil
	if #List1 > 0 then
		local Entry = List1[#List1]
		Mode = Entry.modes[Entry.index]
	else
		Mode = _modes[v10]
	end
	if Mode.type == "group" then
		return ""
	elseif Mode.type == "axis" then
		return string.format(Result5_1 and Mode.format or "%.2f", Mode.get())
	elseif Mode.type == "toggle" then
		return if Mode.isEnabled() then "ON" else "OFF"
	elseif Mode.type ~= "cycle" then
		return if Mode.type == "action" then "(fire)" else ""
	else
		local ItemsResult = Mode.items()
		
		if #ItemsResult == 0 then
			return "None"
		else
			local ItemsResultEntry = ItemsResult[Mode.getIndex()]
			
			return ItemsResultEntry and Mode.displayItem(ItemsResultEntry) or "None"
		end
	end
end

function t.getModeHint()
	-- upvalues: _modes (ref), v10 (ref), List1 (ref), Flag2 (ref)
	local Mode = _modes[v10]
	
	local function _(p4)
		return if p4 == "axis" then "Hold to adjust" elseif p4 == "toggle" then "Tap to flip" elseif p4 == "cycle" then "Tap to cycle" elseif p4 == "action" then "Tap to fire" elseif p4 == "group" then "Enter" else nil
	end
	
	if #List1 > 0 then
		local Entry = List1[#List1]
		local Text = "[↑] Back  [↓] " .. Entry.modes[Entry.index % #Entry.modes + 1].name
		local Mode1 = nil
		
		if #List1 > 0 then
			local Entry1 = List1[#List1]
			Mode1 = Entry1.modes[Entry1.index]
		else
			Mode1 = _modes[v10]
		end
		local Type = Mode1.type
		local HoldToAdjust = if Type == "axis" then "Hold to adjust" elseif Type == "toggle" then "Tap to flip" elseif Type == "cycle" then "Tap to cycle" elseif Type == "action" then "Tap to fire" elseif Type == "group" then "Enter" else nil
		
		return {
			nav = Text,
			action = HoldToAdjust and "[←][→] " .. HoldToAdjust or ""
		}
	elseif Flag2 then
		local Type = Mode.type
		local HoldToAdjust = if Type == "axis" then "Hold to adjust" elseif Type == "toggle" then "Tap to flip" elseif Type == "cycle" then "Tap to cycle" elseif Type == "action" then "Tap to fire" elseif Type == "group" then "Enter" else nil
		
		return {
			nav = "[↑] Back",
			action = HoldToAdjust and "[←][→] " .. HoldToAdjust or ""
		}
	else
		local Type = Mode.type
		
		return {
			nav = "[↑] Close  [↓] " .. (if Type == "group" then "Enter" elseif Type == "toggle" then "Flip" elseif Type == "cycle" then "Cycle" elseif Type == "action" then "Fire" elseif Type == "axis" then "Adjust" else "Select"),
			action = "[←] " .. _modes[(v10 - 2) % #_modes + 1].name .. "  [→] " .. _modes[v10 % #_modes + 1].name
		}
	end
end

function t.getTintColorName()
	-- upvalues: Index1 (ref), list (copy)
	return if Index1 >= 1 and Index1 <= #list then list[Index1].name else "Custom"
end

function t.getActiveGroupName()
	-- upvalues: Flag1 (ref), List1 (ref)
	return if Flag1 and #List1 ~= 0 then List1[1].groupName else nil
end

if Result3_1 then
	t._navigationStack = List1
	t._modes = _modes
	
	function t._getModeIndex()
		-- upvalues: v10 (ref)
		return v10
	end
	
	function t._isMonitorItemSelected()
		-- upvalues: Flag3 (ref)
		return Flag3
	end
end
local list1 = {
	{
		key = "bloom",
		group = "Custom Post Processing",
		get = function()
			-- upvalues: v2 (ref)
			return v2
		end,
		fmt = function(p4): string
			return string.format("Intensity: %.2f  Size: %.1f\nThreshold: %.2f", p4.Intensity, p4.Size, p4.Threshold)
		end
	},
	{
		key = "blur",
		group = "Custom Post Processing",
		get = function()
			-- upvalues: v3 (ref)
			return v3
		end,
		fmt = function(p4): string
			return string.format("Size: %.1f", p4.Size)
		end
	},
	{
		key = "cc",
		group = "Custom Post Processing",
		get = function()
			-- upvalues: v4 (ref)
			return v4
		end,
		fmt = function(ColorCorrectionEffect): string
			-- upvalues: t (copy)
			return string.format("Brightness: %.2f  Contrast: %.2f\nSaturation: %.2f  Tint: %s", ColorCorrectionEffect.Brightness, ColorCorrectionEffect.Contrast, ColorCorrectionEffect.Saturation, t.getTintColorName())
		end
	},
	{
		key = "sunrays",
		group = "Custom Post Processing",
		get = function()
			-- upvalues: v5 (ref)
			return v5
		end,
		fmt = function(p4): string
			return string.format("Intensity: %.2f  Spread: %.2f", p4.Intensity, p4.Spread)
		end
	},
	{
		key = "colorgrading",
		group = "Custom Post Processing",
		get = function()
			-- upvalues: v6 (ref)
			return v6
		end,
		fmt = function(p4): string
			return string.format("Color Grading: %s", p4.TonemapperPreset.Name)
		end
	},
	{
		key = "dof",
		group = "Custom Post Processing",
		get = function()
			-- upvalues: v1 (ref)
			return v1
		end,
		fmt = function(DepthOfFieldEffect): string
			return string.format("Far: %.2f  Near: %.2f\nDistance: %.1f  Radius: %.1f", DepthOfFieldEffect.FarIntensity, DepthOfFieldEffect.NearIntensity, DepthOfFieldEffect.FocusDistance, DepthOfFieldEffect.InFocusRadius)
		end
	}
}

local _ = function(p4, Text)
	p4.bubble.Visible = Text ~= ""
	
	if Text ~= "" then
		p4.label.Text = Text
	end
end

local Config1 = nil
local T = nil
local v11 = nil
local Callback3: ((any) -> ())? = nil
local v12 = nil
local v13 = nil
local Callback2: (() -> ())? = nil

if Result3_1 then
	T = {}
	v11 = 12
	
	Callback3 = function(Parent)
		-- upvalues: T (ref), v11 (ref), Config1 (ref)
		local FreecamMonitorPanel = Instance.new("Frame")
		FreecamMonitorPanel.Name = "FreecamMonitorPanel"
		FreecamMonitorPanel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		FreecamMonitorPanel.BackgroundTransparency = 0.2
		FreecamMonitorPanel.BorderSizePixel = 0
		FreecamMonitorPanel.Size = UDim2.new(0, 240, 0, 0)
		FreecamMonitorPanel.AutomaticSize = Enum.AutomaticSize.Y
		FreecamMonitorPanel.AnchorPoint = Vector2.new(1, 1)
		FreecamMonitorPanel.Position = UDim2.new(1, -16, 1, -16)
		FreecamMonitorPanel.Visible = false
		local Corner = Instance.new("UICorner")
		Corner.CornerRadius = UDim.new(0, 8)
		Corner.Parent = FreecamMonitorPanel
		local Padding = Instance.new("UIPadding")
		Padding.PaddingTop = UDim.new(0, 8)
		Padding.PaddingBottom = UDim.new(0, 8)
		Padding.PaddingLeft = UDim.new(0, 12)
		Padding.PaddingRight = UDim.new(0, 12)
		Padding.Parent = FreecamMonitorPanel
		local ListLayout = Instance.new("UIListLayout")
		ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		ListLayout.FillDirection = Enum.FillDirection.Vertical
		ListLayout.Padding = UDim.new(0, 1)
		ListLayout.Parent = FreecamMonitorPanel
		local Breadcrumb = Instance.new("TextLabel")
		Breadcrumb.Name = "Breadcrumb"
		Breadcrumb.BackgroundTransparency = 1
		Breadcrumb.TextColor3 = Color3.fromRGB(150, 150, 150)
		Breadcrumb.Font = Enum.Font.GothamMedium
		Breadcrumb.TextSize = 11
		Breadcrumb.TextXAlignment = Enum.TextXAlignment.Left
		Breadcrumb.Size = UDim2.new(1, 0, 0, 16)
		Breadcrumb.LayoutOrder = 0
		Breadcrumb.Visible = false
		Breadcrumb.Parent = FreecamMonitorPanel
		T = {}
		
		for i = 1, v11 do
			local Frame = Instance.new("Frame")
			Frame.Name = "Row" .. i
			Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Frame.BackgroundTransparency = 1
			Frame.BorderSizePixel = 0
			Frame.Size = UDim2.new(1, 0, 0, 22)
			Frame.LayoutOrder = i
			Frame.Visible = false
			local Corner1 = Instance.new("UICorner")
			Corner1.CornerRadius = UDim.new(0, 4)
			Corner1.Parent = Frame
			local Padding1 = Instance.new("UIPadding")
			Padding1.PaddingLeft = UDim.new(0, 6)
			Padding1.PaddingRight = UDim.new(0, 6)
			Padding1.Parent = Frame
			local Name = Instance.new("TextLabel")
			Name.Name = "Name"
			Name.BackgroundTransparency = 1
			Name.TextColor3 = Color3.new(1, 1, 1)
			Name.Font = Enum.Font.GothamMedium
			Name.TextSize = 14
			Name.TextXAlignment = Enum.TextXAlignment.Left
			Name.Size = UDim2.new(0.55, 0, 1, 0)
			Name.Position = UDim2.new(0, 0, 0, 0)
			Name.Parent = Frame
			local Value = Instance.new("TextLabel")
			Value.Name = "Value"
			Value.BackgroundTransparency = 1
			Value.TextColor3 = Color3.fromRGB(180, 180, 180)
			Value.Font = Enum.Font.GothamMedium
			Value.TextSize = 14
			Value.TextXAlignment = Enum.TextXAlignment.Right
			Value.Size = UDim2.new(0.45, 0, 1, 0)
			Value.Position = UDim2.new(0.55, 0, 0, 0)
			Value.Parent = Frame
			Frame.Parent = FreecamMonitorPanel
			T[i] = { frame = Frame, nameLabel = Name, valueLabel = Value }
		end
		local Hint = Instance.new("TextLabel")
		Hint.Name = "Hint"
		Hint.BackgroundTransparency = 1
		Hint.TextColor3 = Color3.fromRGB(120, 120, 120)
		Hint.Font = Enum.Font.Gotham
		Hint.TextSize = 12
		Hint.TextXAlignment = Enum.TextXAlignment.Left
		Hint.Size = UDim2.new(1, 0, 0, 20)
		Hint.LayoutOrder = v11 + 1
		Hint.Parent = FreecamMonitorPanel
		FreecamMonitorPanel.Parent = Parent
		Config1 = {
			panel = FreecamMonitorPanel,
			breadcrumb = Breadcrumb,
			hint = Hint
		}
	end
	
	v12 = function(p4)
		-- upvalues: Result5_1 (ref)
		if p4.type == "group" then
			return "›"
		elseif p4.type == "toggle" then
			return if p4.isEnabled() then "On" else "Off"
		elseif p4.type == "axis" then
			return string.format(Result5_1 and p4.format or "%.2f", p4.get())
		elseif p4.type ~= "cycle" then
			return if p4.type == "action" then "" else ""
		else
			local ItemsResult = p4.items()
			
			if #ItemsResult == 0 then
				return "--"
			else
				local ItemsResultEntry = ItemsResult[p4.getIndex()]
				
				return ItemsResultEntry and p4.displayItem(ItemsResultEntry) or "--"
			end
		end
	end
	
	v13 = function(p4, p5, IsMonitorItemSelected): Color3
		return if p4.type == "toggle" then if p4.isEnabled() then Color3.fromRGB(0, 176, 111) else Color3.fromRGB(150, 150, 150) elseif p5 and IsMonitorItemSelected then Color3.new(1, 1, 1) else Color3.fromRGB(180, 180, 180)
	end
	
	Callback2 = function()
		-- upvalues: Config1 (ref), t (copy), v11 (ref), T (ref), v12 (ref), v13 (ref), Result6_1 (ref)
		if not Config1 then return end
		local Panel = Config1.panel
		
		if not t.getModeActive() then
			Panel.Visible = false
			
			return
		end
		Panel.Visible = true
		local Index = nil
		local Modes = nil
		
		if #t._navigationStack > 0 then
			local NavigationStackEntry = t._navigationStack[#t._navigationStack]
			Modes = NavigationStackEntry.modes
			Index = NavigationStackEntry.index
		else
			Modes = t._modes
			Index = t._getModeIndex()
		end
		local ModeBreadcrumb = t.getModeBreadcrumb()
		Config1.breadcrumb.Text = ModeBreadcrumb
		Config1.breadcrumb.Visible = ModeBreadcrumb ~= ""
		local IsMonitorItemSelected = t._isMonitorItemSelected()
		local Smallest = math.min(#Modes, v11)
		
		for i = 1, v11 do
			local Entry = T[i]
			
			if i > Smallest then
				Entry.frame.Visible = false
				continue
			end
			local Mode = Modes[i]
			local IsIMatch = i == Index
			local DisabledResult = Mode.disabled and Mode.disabled()
			Entry.frame.Visible = true
			
			if IsIMatch and not DisabledResult then
				Entry.nameLabel.Text = "> " .. Mode.name
				Entry.nameLabel.TextColor3 = Color3.new(1, 1, 1)
				Entry.nameLabel.Font = Enum.Font.GothamMedium
				Entry.frame.BackgroundTransparency = if IsMonitorItemSelected then 0.88 else 1
			elseif DisabledResult then
				Entry.nameLabel.Text = "  " .. Mode.name
				Entry.nameLabel.TextColor3 = Color3.fromRGB(80, 80, 80)
				Entry.nameLabel.Font = Enum.Font.GothamMedium
				Entry.frame.BackgroundTransparency = 1
			else
				Entry.nameLabel.Text = "  " .. Mode.name
				Entry.nameLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
				Entry.nameLabel.Font = Enum.Font.GothamMedium
				Entry.frame.BackgroundTransparency = 1
			end
			Entry.valueLabel.Text = v12(Mode)
			Entry.valueLabel.TextColor3 = DisabledResult and Color3.fromRGB(60, 60, 60) or v13(Mode, IsIMatch, IsMonitorItemSelected)
		end
		if not IsMonitorItemSelected then
			Config1.hint.Text = "↑↓ Navigate   → Select   ← Back"
			
			return
		end
		if Result6_1 then
			Config1.hint.Text = "↑↓ Exit selection   ←→ Adjust"
			
			return
		else
			Config1.hint.Text = "←→ Adjust   ↑↓ Exit selection"
		end
	end
end
local function StepFreecam(DeltaTime: number)
	-- upvalues: t (copy), NewModule (copy), NewModule1 (copy), NewModule2 (copy), NewModule3 (copy), FieldOfView (ref), RadFunction (copy), TanFunction (copy), SqrtFunction (copy), config (copy), ClampFunction (copy), ClockTime (ref), ClockTime1 (ref), _Vector3_1 (ref), _Vector3 (ref), Inverted1 (ref), RootPart (ref), DefaultZoom (ref), DefaultHeight (ref), Result3_1 (ref), Callback2 (ref), v7 (ref), Config (ref), Freecam (ref), List (ref), Index (ref), list1 (copy), CurrentCamera (ref)
	t.ModeControl(DeltaTime)
	local UpdateResult = NewModule:Update(DeltaTime, t.Movement())
	local UpdateResult1 = NewModule1:Update(DeltaTime, t.Pan())
	local UpdateResult2: number = NewModule2:Update(DeltaTime, t.Fov())
	local UpdateResult3: number = NewModule3:Update(DeltaTime, t.Roll())
	local SqrtResult = SqrtFunction(0.7002075382097097 / TanFunction((RadFunction(FieldOfView / 2))))
	local FieldOfView1: number = FieldOfView
	FieldOfView = ClampFunction(FieldOfView + UpdateResult2 * config.Fov.Gain * (DeltaTime / SqrtResult), 1, 120)
	
	if math.abs(FieldOfView - FieldOfView1) > 0.01 then
		ClockTime = os.clock()
	end
	if UpdateResult.Magnitude > 0.05 or UpdateResult1.Magnitude > 0.0005 or math.abs(UpdateResult3) > 0.0005 or math.abs(UpdateResult2) > 0.0005 then
		ClockTime1 = os.clock()
	end
	local ScaledUpdateResult = UpdateResult1 * config.Pan.Gain * (DeltaTime / SqrtResult)
	_Vector3_1 += Vector3.new(ScaledUpdateResult.X, ScaledUpdateResult.Y, UpdateResult3 * config.Roll.Gain * (DeltaTime / SqrtResult))
	
	local function _(p4: number): number
		local v14 = p4 % 6.283185307179586
		
		return v14 > 3.141592653589793 and v14 - 6.283185307179586 or v14
	end
	
	local XRemainder = _Vector3_1.x % 6.283185307179586
	local YRemainder = _Vector3_1.y % 6.283185307179586
	local ZRemainder = _Vector3_1.z % 6.283185307179586
	_Vector3_1 = Vector3.new(XRemainder > 3.141592653589793 and XRemainder - 6.283185307179586 or XRemainder, YRemainder > 3.141592653589793 and YRemainder - 6.283185307179586 or YRemainder, ZRemainder > 3.141592653589793 and ZRemainder - 6.283185307179586 or ZRemainder)
	local Focus = CFrame.new(_Vector3) * CFrame.fromOrientation(_Vector3_1.x, _Vector3_1.y, _Vector3_1.z) * CFrame.new(Vector3.new(UpdateResult.X, UpdateResult.Y, -UpdateResult.Z) * config.Movement.Gain * DeltaTime)
	
	if Inverted1 and RootPart and RootPart.Parent then
		local PlayerLock = config.PlayerLock
		local ScaledY = UpdateResult.Y * config.Movement.Gain.Y * DeltaTime
		DefaultZoom = ClampFunction(DefaultZoom + -UpdateResult.Z * config.Movement.Gain.Z * DeltaTime, PlayerLock.MinZoom, PlayerLock.MaxZoom)
		DefaultHeight = ClampFunction(DefaultHeight + ScaledY, -PlayerLock.HeightRange, PlayerLock.HeightRange)
		Focus = CFrame.new(RootPart.Position + Vector3.new(0, DefaultHeight, 0)) * CFrame.fromOrientation(_Vector3_1.x, _Vector3_1.y, _Vector3_1.z) * CFrame.new(0, 0, DefaultZoom)
	end
	if Result3_1 then
		Callback2()
	elseif v7 and v7.Parent and Config and Freecam and Freecam.Parent then
		local Mode = Config.mode
		
		if t.getModeActive() then
			if os.clock() - ClockTime1 < 2 then
				local List1 = {}
				List1[#List1 + 1] = string.format("X: %.0f  Y: %.0f  Z: %.0f", _Vector3.X, _Vector3.Y, _Vector3.Z)
				List1[#List1 + 1] = string.format("Pitch: %.1f°  Yaw: %.1f°  Roll: %.1f°", math.deg(_Vector3_1.X), math.deg(_Vector3_1.Y), (math.deg(_Vector3_1.Z)))
				
				if os.clock() - ClockTime < 2 then
					List1[#List1 + 1] = string.format("Field of View: %.1f", FieldOfView)
				end
				if DeltaTime > 0 then
					local MagnitudeRatio = (Focus.p - _Vector3).Magnitude / DeltaTime
					
					if MagnitudeRatio > 0.5 then
						List1[#List1 + 1] = string.format("Speed: %.1f", MagnitudeRatio)
					end
				end
				local Status = Config.status
				local Joined = table.concat(List1, "\n")
				Status.bubble.Visible = Joined ~= ""
				
				if Joined ~= "" then
					Status.label.Text = Joined
				end
			else
				Config.status.bubble.Visible = false
			end
			if Inverted1 and #List > 0 and t.getActiveGroupName() ~= "Player Lock" then
				local Lock = Config.lock
				local Formatted = string.format("Lock: %s", List[Index].Name)
				Lock.bubble.Visible = Formatted ~= ""
				
				if Formatted ~= "" then
					Lock.label.Text = Formatted
				end
			else
				Config.lock.bubble.Visible = false
			end
			local ActiveGroupName = t.getActiveGroupName()
			
			for _, value in ipairs(list1) do
				local GetResult = value.get()
				
				if GetResult and (GetResult.Enabled and ActiveGroupName ~= value.group) then
					local Entry = Config[value.key]
					local FmtResult = value.fmt(GetResult)
					Entry.bubble.Visible = FmtResult ~= ""
					
					if FmtResult ~= "" then
						Entry.label.Text = FmtResult
					end
				else
					Config[value.key].bubble.Visible = false
				end
			end
			Mode.bubble.Visible = true
			local ModeBreadcrumb = t.getModeBreadcrumb()
			Mode.breadcrumb.Text = ModeBreadcrumb
			Mode.breadcrumb.Visible = ModeBreadcrumb ~= ""
			local ModeName = t.getModeName()
			local ModeDisplay = t.getModeDisplay()
			Mode.title.Text = if ModeDisplay == "" then ModeName else ModeName .. ": " .. ModeDisplay or ModeName
			local ModeHint = t.getModeHint()
			Mode.nav.Text = ModeHint.nav
			Mode.nav.Visible = ModeHint.nav ~= ""
			Mode.action.Text = ModeHint.action
			Mode.action.Visible = ModeHint.action ~= ""
			v7.Visible = true
		else
			v7.Visible = false
		end
	end
	_Vector3 = Focus.p
	CurrentCamera.CFrame = Focus
	CurrentCamera.Focus = Focus
	CurrentCamera.FieldOfView = FieldOfView
end

local Default = nil
local MouseIconEnabled = nil
local CameraType = nil
local Focus = nil
local _CFrame = nil
local FieldOfView1 = nil
local ScreenGuis = {}
local config4 = {
	Backpack = true,
	Chat = true,
	Health = true,
	PlayerList = true
}
local config5 = {
	BadgesNotificationsActive = true,
	PointsNotificationsActive = true
}
v8 = {
	Push = function()
		-- upvalues: config4 (copy), StarterGui (copy), config5 (copy), LocalPlayer (ref), ScreenGuis (ref), ChildAddedConnection (ref), Inverted2 (ref), FieldOfView1 (ref), CurrentCamera (ref), CameraType (ref), _CFrame (ref), Focus (ref), MouseIconEnabled (ref), UserInputService (copy), Default (ref)
		for i in pairs(config4) do
			config4[i] = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[i])
			StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[i], false)
		end
		for CoreName in pairs(config5) do
			config5[CoreName] = StarterGui:GetCore(CoreName)
			StarterGui:SetCore(CoreName, false)
		end
		local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
		
		if PlayerGui then
			for _, ScreenGui in pairs(PlayerGui:GetChildren()) do
				if ScreenGui:IsA("ScreenGui") and ScreenGui.Enabled then
					ScreenGuis[#ScreenGuis + 1] = ScreenGui
					ScreenGui.Enabled = false
				end
			end
			ChildAddedConnection = PlayerGui.ChildAdded:Connect(function(Child)
				-- upvalues: ScreenGuis (upval), Inverted2 (upval)
				if Child:IsA("ScreenGui") and Child.Enabled then
					ScreenGuis[#ScreenGuis + 1] = Child
					Child.Enabled = Inverted2
				end
			end)
		end
		FieldOfView1 = CurrentCamera.FieldOfView
		CurrentCamera.FieldOfView = 70
		CameraType = CurrentCamera.CameraType
		CurrentCamera.CameraType = Enum.CameraType.Custom
		_CFrame = CurrentCamera.CFrame
		Focus = CurrentCamera.Focus
		MouseIconEnabled = UserInputService.MouseIconEnabled
		UserInputService.MouseIconEnabled = false
		Default = Enum.MouseBehavior.Default
		UserInputService.MouseBehavior = Enum.MouseBehavior.Default
	end,
	Pop = function()
		-- upvalues: config4 (copy), StarterGui (copy), config5 (copy), ScreenGuis (ref), Freecam (ref), ChildAddedConnection (ref), CurrentCamera (ref), FieldOfView1 (ref), CameraType (ref), _CFrame (ref), Focus (ref), UserInputService (copy), MouseIconEnabled (ref), Default (ref)
		for i, value in pairs(config4) do
			StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[i], value)
		end
		for CoreName, value1 in pairs(config5) do
			StarterGui:SetCore(CoreName, value1)
		end
		for _, screenGui in pairs(ScreenGuis) do
			if screenGui.Parent and screenGui ~= Freecam then
				screenGui.Enabled = true
			end
		end
		if ChildAddedConnection then
			ChildAddedConnection:Disconnect()
			ChildAddedConnection = nil
		end
		ScreenGuis = {}
		CurrentCamera.FieldOfView = FieldOfView1
		FieldOfView1 = nil
		CurrentCamera.CameraType = CameraType
		CameraType = nil
		CurrentCamera.CFrame = _CFrame
		_CFrame = nil
		CurrentCamera.Focus = Focus
		Focus = nil
		UserInputService.MouseIconEnabled = MouseIconEnabled
		MouseIconEnabled = nil
		UserInputService.MouseBehavior = Default
		Default = nil
	end,
	getScreenGuis = function()
		-- upvalues: ScreenGuis (ref)
		return ScreenGuis
	end
}

local function removePlayerFromList(Player)
	-- upvalues: List (ref), Index (ref), Inverted1 (ref)
	for Index1, value in ipairs(List) do
		if value == Player then
			table.remove(List, Index1)
			
			if Index == Index1 and Inverted1 then
				Inverted1 = false
				Index = 1
			end
			if Index1 < Index then
				Index -= 1
			end
			if #List >= Index and Index >= 1 then break end
			Index = 1
			break
		else
			continue
		end
	end
end

local function initializePlayerList()
	-- upvalues: List (ref), Players (copy), LocalPlayer (ref), Index (ref), PlayerAddedConnection (ref), PlayerRemovingConnection (ref), removePlayerFromList (copy)
	List = Players:GetPlayers()
	
	for i, value in ipairs(List) do
		if value == LocalPlayer then
			Index = i
			break
		end
	end
	PlayerAddedConnection = Players.PlayerAdded:Connect(function(Player)
		-- upvalues: List (upval)
		table.insert(List, Player)
	end)
	PlayerRemovingConnection = Players.PlayerRemoving:Connect(removePlayerFromList)
end

local function StartFreecam()
	-- upvalues: initializePlayerList (copy), CurrentCamera (ref), _Vector3_1 (ref), _Vector3 (ref), FieldOfView (ref), NewModule (copy), NewModule1 (copy), NewModule2 (copy), NewModule3 (copy), Freecam (ref), LocalPlayer (ref), Result3_1 (ref), Config1 (ref), Callback3 (ref), v7 (ref), Config (ref), v8 (ref), v9 (ref), config1 (copy), Result4_1 (ref), RunService (copy), StepFreecam (copy), t (copy)
	initializePlayerList()
	local CurrentCameraCFrame = CurrentCamera.CFrame
	_Vector3_1 = Vector3.new(CurrentCameraCFrame:toEulerAnglesYXZ())
	_Vector3 = CurrentCameraCFrame.p
	FieldOfView = CurrentCamera.FieldOfView
	NewModule:Reset((Vector3.new()))
	NewModule1:Reset(Vector2.new())
	NewModule2:Reset(0)
	NewModule3:Reset(0)
	Freecam = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Freecam")
	
	if Result3_1 then
		if not Config1 then
			Callback3(Freecam)
		end
	elseif not v7 or not v7.Parent then
		local FreecamCustomGui = Instance.new("Frame")
		FreecamCustomGui.Name = "FreecamCustomGui"
		FreecamCustomGui.BackgroundTransparency = 1
		FreecamCustomGui.AutomaticSize = Enum.AutomaticSize.XY
		FreecamCustomGui.AnchorPoint = Vector2.new(1, 1)
		FreecamCustomGui.Position = UDim2.new(1, -16, 1, -16)
		FreecamCustomGui.Size = UDim2.new(0, 0, 0, 0)
		FreecamCustomGui.Visible = false
		local ListLayout = Instance.new("UIListLayout")
		ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		ListLayout.FillDirection = Enum.FillDirection.Vertical
		ListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
		ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
		ListLayout.Padding = UDim.new(0, 6)
		ListLayout.Parent = FreecamCustomGui
		
		local function makeBubble(Name, LayoutOrder)
			-- upvalues: FreecamCustomGui (copy)
			local Frame = Instance.new("Frame")
			Frame.Name = Name
			Frame.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
			Frame.BackgroundTransparency = 0.4
			Frame.BorderSizePixel = 0
			Frame.AutomaticSize = Enum.AutomaticSize.XY
			Frame.Size = UDim2.new(0, 0, 0, 0)
			Frame.LayoutOrder = LayoutOrder
			Frame.Visible = false
			local Corner = Instance.new("UICorner")
			Corner.CornerRadius = UDim.new(0, 8)
			Corner.Parent = Frame
			local Padding = Instance.new("UIPadding")
			Padding.PaddingTop = UDim.new(0, 8)
			Padding.PaddingBottom = UDim.new(0, 8)
			Padding.PaddingLeft = UDim.new(0, 12)
			Padding.PaddingRight = UDim.new(0, 12)
			Padding.Parent = Frame
			local Label = Instance.new("TextLabel")
			Label.Name = "Label"
			Label.BackgroundTransparency = 1
			Label.TextColor3 = Color3.new(1, 1, 1)
			Label.Font = Enum.Font.GothamMedium
			Label.TextSize = 14
			Label.TextXAlignment = Enum.TextXAlignment.Left
			Label.AutomaticSize = Enum.AutomaticSize.XY
			Label.Size = UDim2.new(0, 0, 0, 0)
			Label.Parent = Frame
			Frame.Parent = FreecamCustomGui
			
			return Frame, Label
		end
		
		local BloomBubble, BloomBubble2 = makeBubble("BloomBubble", 1)
		local BlurBubble, BlurBubble2 = makeBubble("BlurBubble", 2)
		local CCBubble, CCBubble2 = makeBubble("CCBubble", 3)
		local SunRaysBubble, SunRaysBubble2 = makeBubble("SunRaysBubble", 4)
		local ColorGradingBubble, ColorGradingBubble2 = makeBubble("ColorGradingBubble", 5)
		local DofBubble, DofBubble2 = makeBubble("DofBubble", 6)
		local LockBubble, LockBubble2 = makeBubble("LockBubble", 7)
		local StatusBubble, StatusBubble2 = makeBubble("StatusBubble", 8)
		local ModeBubble = Instance.new("Frame")
		ModeBubble.Name = "ModeBubble"
		ModeBubble.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
		ModeBubble.BackgroundTransparency = 0.4
		ModeBubble.BorderSizePixel = 0
		ModeBubble.AutomaticSize = Enum.AutomaticSize.XY
		ModeBubble.Size = UDim2.new(0, 0, 0, 0)
		ModeBubble.LayoutOrder = 9
		ModeBubble.Visible = false
		local Corner = Instance.new("UICorner")
		Corner.CornerRadius = UDim.new(0, 8)
		Corner.Parent = ModeBubble
		local Padding = Instance.new("UIPadding")
		Padding.PaddingTop = UDim.new(0, 8)
		Padding.PaddingBottom = UDim.new(0, 8)
		Padding.PaddingLeft = UDim.new(0, 12)
		Padding.PaddingRight = UDim.new(0, 12)
		Padding.Parent = ModeBubble
		local ListLayout1 = Instance.new("UIListLayout")
		ListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
		ListLayout1.FillDirection = Enum.FillDirection.Vertical
		ListLayout1.Padding = UDim.new(0, 2)
		ListLayout1.Parent = ModeBubble
		
		local function makeModeLabel(Name, LayoutOrder, Gotham, TextSize, Color)
			-- upvalues: ModeBubble (copy)
			local Label = Instance.new("TextLabel")
			Label.Name = Name
			Label.BackgroundTransparency = 1
			Label.TextColor3 = Color
			Label.Font = Gotham
			Label.TextSize = TextSize
			Label.TextXAlignment = Enum.TextXAlignment.Left
			Label.AutomaticSize = Enum.AutomaticSize.XY
			Label.Size = UDim2.new(0, 0, 0, 0)
			Label.LayoutOrder = LayoutOrder
			Label.Parent = ModeBubble
			
			return Label
		end
		
		local Breadcrumb = makeModeLabel("Breadcrumb", 1, Enum.Font.Gotham, 11, Color3.fromRGB(100, 100, 100))
		local Title = makeModeLabel("Title", 2, Enum.Font.GothamBold, 14, Color3.new(1, 1, 1))
		local NavHint = makeModeLabel("NavHint", 3, Enum.Font.Gotham, 12, Color3.fromRGB(120, 120, 120))
		local ActionHint = makeModeLabel("ActionHint", 4, Enum.Font.GothamMedium, 12, Color3.fromRGB(200, 200, 200))
		ModeBubble.Parent = FreecamCustomGui
		v7 = FreecamCustomGui
		Config = {
			bloom = { bubble = BloomBubble, label = BloomBubble2 },
			blur = { bubble = BlurBubble, label = BlurBubble2 },
			cc = { bubble = CCBubble, label = CCBubble2 },
			sunrays = { bubble = SunRaysBubble, label = SunRaysBubble2 },
			colorgrading = { bubble = ColorGradingBubble, label = ColorGradingBubble2 },
			dof = { bubble = DofBubble, label = DofBubble2 },
			lock = { bubble = LockBubble, label = LockBubble2 },
			status = { bubble = StatusBubble, label = StatusBubble2 },
			mode = {
				bubble = ModeBubble,
				breadcrumb = Breadcrumb,
				title = Title,
				nav = NavHint,
				action = ActionHint
			}
		}
		FreecamCustomGui.Parent = Freecam
	end
	v8.Push()
	Freecam.Enabled = true
	
	local function _(p4, Name)
		-- upvalues: CurrentCamera (upval)
		local NewInstance = Instance.new(p4)
		NewInstance.Name = Name
		NewInstance.Parent = CurrentCamera
		
		return NewInstance
	end
	
	for _, value in ipairs(v9) do
		local Entry = config1[value.key]
		local NewInstance = Instance.new(value.class)
		NewInstance.Name = "Freecam" .. value.key
		NewInstance.Parent = CurrentCamera
		
		if Result4_1 and value.parent then
			NewInstance.Parent = value.parent
		end
		for _, prop in ipairs(value.props) do
			NewInstance[prop] = Entry[prop]
		end
		NewInstance.Enabled = Entry.Enabled
		value.set(NewInstance)
	end
	RunService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
	t.StartCapture()
end

local function StopFreecam()
	-- upvalues: PlayerAddedConnection (ref), PlayerRemovingConnection (ref), Inverted1 (ref), Index (ref), List (ref), PostEffect2 (copy), Inverted (ref), v9 (ref), config1 (copy), Result3_1 (ref), Config1 (ref), Freecam (ref), Inverted2 (ref), Inverted3 (ref), t (copy), RunService (copy), v8 (ref)
	if PlayerAddedConnection then
		PlayerAddedConnection:Disconnect()
		PlayerAddedConnection = nil
	end
	if PlayerRemovingConnection then
		PlayerRemovingConnection:Disconnect()
		PlayerRemovingConnection = nil
	end
	Inverted1 = false
	Index = 1
	List = {}
	PostEffect2()
	Inverted = false
	
	for _, value in ipairs(v9) do
		local GetResult = value.get()
		
		if GetResult then
			local Entry = config1[value.key]
			Entry.Enabled = GetResult.Enabled
			
			for _, prop in ipairs(value.props) do
				Entry[prop] = GetResult[prop]
			end
			GetResult:Destroy()
			value.set(nil)
		end
	end
	if Result3_1 and Config1 then
		Config1.panel.Visible = false
	end
	if Freecam and Freecam.Parent then
		Freecam.Enabled = false
	end
	Inverted2 = false
	Inverted3 = false
	t.StopCapture()
	RunService:UnbindFromRenderStep("Freecam")
	v8.Pop()
end

local Inverted4 = false

local _ = function()
	-- upvalues: Inverted4 (ref), StopFreecam (copy), StartFreecam (copy), Result2_1 (ref), config (copy)
	if Inverted4 then
		StopFreecam()
	else
		StartFreecam()
	end
	Inverted4 = not Inverted4
	
	if Result2_1 then
		script:SetAttribute(config.AttributeName, Inverted4)
	end
end

Humanoid.StateChanged:Connect(function(OldState)
	-- upvalues: Inverted4 (ref), StopFreecam (copy), StartFreecam (copy), Result2_1 (ref), config (copy)
	if OldState then
		if Inverted4 then
			StopFreecam()
		else
			StartFreecam()
		end
		Inverted4 = not Inverted4
		
		if Result2_1 then
			script:SetAttribute(config.AttributeName, Inverted4)
		end
	end
end)

if Result2_1 then
	script:SetAttribute(config.AttributeName, Inverted4)
	script:GetAttributeChangedSignal(config.AttributeName):Connect(function()
		-- upvalues: config (copy), Inverted4 (ref), StartFreecam (copy), StopFreecam (copy)
		local Attribute = script:GetAttribute(config.AttributeName)
		
		if typeof(Attribute) ~= "boolean" then
			script:SetAttribute(config.AttributeName, Inverted4)
			
			return
		end
		if Attribute ~= Inverted4 then
			if Attribute then
				StartFreecam()
				Inverted4 = true
				
				return
			end
			StopFreecam()
			Inverted4 = false
		end
	end)
end
return {}