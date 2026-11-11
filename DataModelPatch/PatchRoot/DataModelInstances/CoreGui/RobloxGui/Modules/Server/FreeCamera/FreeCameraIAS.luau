local ClampFunction = math.clamp
local ExpFunction = math.exp
local RadFunction = math.rad
local SqrtFunction = math.sqrt
local TanFunction = math.tan
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
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
		Threshold = { Adj = 0.05, Min = 0, Max = 1 }
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
local Result1 = nil
local Success, Result = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserShowGuiHideToggles")
end)
Result1 = Success and Result
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
	-- upvalues: v1 (ref)
	local v10 = v1
	
	if v10 then
		v10.Enabled = not v10.Enabled
	end
end

local function doToggleBloom()
	-- upvalues: v2 (ref)
	local v10 = v2
	
	if v10 then
		v10.Enabled = not v10.Enabled
	end
end

local function doToggleBlur()
	-- upvalues: v3 (ref)
	local v10 = v3
	
	if v10 then
		v10.Enabled = not v10.Enabled
	end
end

local function doToggleColorCorrection()
	-- upvalues: v4 (ref)
	local v10 = v4
	
	if v10 then
		v10.Enabled = not v10.Enabled
	end
end

local function doToggleSunRays()
	-- upvalues: v5 (ref)
	local v10 = v5
	
	if v10 then
		v10.Enabled = not v10.Enabled
	end
end

local function doToggleColorGrading()
	-- upvalues: v6 (ref)
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

local list1 = {
	(function()
		-- upvalues: doToggleMasterEffects (copy), Inverted (ref), makeEffectGroup (copy), doToggleDoF (copy), v1 (ref), config (copy), doToggleBloom (copy), v2 (ref), doToggleBlur (copy), v3 (ref), doToggleColorCorrection (copy), v4 (ref), list (copy), Index1 (ref), _Color3 (ref), doToggleSunRays (copy), v5 (ref), doToggleColorGrading (copy), v6 (ref)
		return {
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
							-- upvalues: Index1 (upval), v4 (upval), _Color3 (upval), list (upval)
							Index1 = Value
							
							if v4 then
								if Value == 1 then
									v4.TintColor = _Color3
									
									return
								end
								local Color = list[Value].color
								v4.TintColor = Color
								_Color3 = Color
							end
						end,
						displayItem = function(p4)
							return p4.name
						end
					},
					{
						type = "axis",
						name = "Tint R",
						adj = 0.02,
						min = 0,
						max = 1,
						get = function()
							-- upvalues: _Color3 (upval)
							return _Color3.R
						end,
						set = function(p4)
							-- upvalues: _Color3 (upval), Index1 (upval), v4 (upval)
							_Color3 = Color3.new(p4, _Color3.G, _Color3.B)
							Index1 = 1
							
							if v4 then
								v4.TintColor = _Color3
							end
						end
					},
					{
						type = "axis",
						name = "Tint G",
						adj = 0.02,
						min = 0,
						max = 1,
						get = function()
							-- upvalues: _Color3 (upval)
							return _Color3.G
						end,
						set = function(p4)
							-- upvalues: _Color3 (upval), Index1 (upval), v4 (upval)
							_Color3 = Color3.new(_Color3.R, p4, _Color3.B)
							Index1 = 1
							
							if v4 then
								v4.TintColor = _Color3
							end
						end
					},
					{
						type = "axis",
						name = "Tint B",
						adj = 0.02,
						min = 0,
						max = 1,
						get = function()
							-- upvalues: _Color3 (upval)
							return _Color3.B
						end,
						set = function(p4)
							-- upvalues: _Color3 (upval), Index1 (upval), v4 (upval)
							_Color3 = Color3.new(_Color3.R, _Color3.G, p4)
							Index1 = 1
							
							if v4 then
								v4.TintColor = _Color3
							end
						end
					}
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
		name = "UI",
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
	makeSpeedStiffnessGroup("Tilt", config.Roll, "roll", "roll", NewModule3),
	(makeSpeedStiffnessGroup("Pan", config.Pan, "pan", "pan", NewModule1))
}

local function _()
	-- upvalues: List1 (ref), list1 (copy), v10 (ref)
	if #List1 > 0 then
		local Entry = List1[#List1]
		
		return Entry.modes[Entry.index]
	else
		return list1[v10]
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
	-- upvalues: config (copy), Humanoid (ref), createAction (copy), t (copy), t1 (copy), Reset (ref), _Vector3_1 (ref), NewModule3 (copy), Flag (ref), Flag1 (ref), Flag2 (ref), List1 (ref), list1 (copy), v10 (ref)
	local Actions = config.Actions
	local FreecamToggleContext = Instance.new("InputContext")
	FreecamToggleContext.Name = "FreecamToggleContext"
	FreecamToggleContext.Priority = 3000
	FreecamToggleContext.Sink = false
	FreecamToggleContext.Enabled = true
	FreecamToggleContext.Parent = script
	Humanoid = createAction(FreecamToggleContext, Actions.Toggle)
	local FreecamInputContext = Instance.new("InputContext")
	FreecamInputContext.Name = "FreecamInputContext"
	FreecamInputContext.Priority = 2000
	FreecamInputContext.Sink = true
	FreecamInputContext.Enabled = false
	FreecamInputContext.Parent = script
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
	
	local function v142()
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
		-- upvalues: v11 (ref), Threshold (copy), v12 (ref), Debounce (copy), v142 (copy)
		if math.abs(Value) > 0.01 then
			local ClockTime = os.clock()
			
			if v11 == nil or ClockTime - v11 > Threshold then
				v11 = ClockTime
			else
				if Debounce <= ClockTime - v12 then
					v142()
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
		-- upvalues: Flag1 (upval), Flag2 (upval), List1 (upval)
		if not OldState then return end
		if not Flag1 then
			Flag1 = true
			
			return
		end
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
	end)
	createAction(FreecamInputContext, Actions.ModeNext).StateChanged:Connect(function(OldState)
		-- upvalues: Flag1 (upval), Flag2 (upval), List1 (upval), list1 (upval), v10 (upval)
		if not OldState or not Flag1 then return end
		if Flag2 then return end
		if #List1 > 0 then
			local Entry = List1[#List1]
			Entry.index = Entry.index % #Entry.modes + 1
			
			return
		end
		local Entry = list1[v10]
		
		if Entry.type == "group" then
			table.insert(List1, { index = 1, modes = Entry.modes, groupName = Entry.name })
			
			return
		end
		if Entry.type == "toggle" then
			Entry.toggle()
			
			return
		end
		if Entry.type == "cycle" then
			local ItemsResult = Entry.items()
			
			if #ItemsResult > 0 then
				Entry.setIndex(Entry.getIndex() % #ItemsResult + 1)
				
				return
			end
		elseif Entry.type == "action" then
			Entry.action()
			
			return
		else
			if Entry.type == "axis" then
				Flag2 = true
			end
		end
	end)
	local Action1 = createAction(FreecamInputContext, Actions.ModeAxis)
	Action1.StateChanged:Connect(function(OldState: number)
		-- upvalues: Flag1 (upval), Flag2 (upval), List1 (upval), list1 (upval), v10 (upval)
		if not Flag1 or OldState == 0 then return end
		if Flag2 then return end
		if #List1 > 0 then
			local Mode = nil
			if #List1 > 0 then
				local Entry = List1[#List1]
				Mode = Entry.modes[Entry.index]
			else
				Mode = list1[v10]
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
			v10 = v10 % #list1 + 1
			
			return
		else
			if OldState < 0 then
				v10 = (v10 - 2) % #list1 + 1
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
	-- upvalues: Flag1 (ref), List1 (ref), Flag2 (ref), list1 (copy), v10 (ref), t1 (copy), ClampFunction (copy)
	if not Flag1 then return end
	if #List1 == 0 and not Flag2 then return end
	local Mode = nil
	if #List1 > 0 then
		local Entry = List1[#List1]
		Mode = Entry.modes[Entry.index]
	else
		Mode = list1[v10]
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
	-- upvalues: t (copy), Flag (ref), Reset (ref), Flag1 (ref), List1 (ref), Flag2 (ref)
	t._sinkContext.Enabled = false
	Flag = false
	
	if Reset then
		Reset()
	end
	Flag1 = false
	List1 = {}
	Flag2 = false
end

function t.getModeActive()
	-- upvalues: Flag1 (ref)
	return Flag1
end

function t.getModeName()
	-- upvalues: List1 (ref), list1 (copy), v10 (ref)
	local Mode = nil
	if #List1 > 0 then
		local Entry = List1[#List1]
		Mode = Entry.modes[Entry.index]
	else
		Mode = list1[v10]
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
	-- upvalues: List1 (ref), list1 (copy), v10 (ref)
	local Mode = nil
	if #List1 > 0 then
		local Entry = List1[#List1]
		Mode = Entry.modes[Entry.index]
	else
		Mode = list1[v10]
	end
	if Mode.type == "group" then
		return ""
	elseif Mode.type == "axis" then
		return string.format("%.2f", Mode.get())
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
	-- upvalues: list1 (copy), v10 (ref), List1 (ref), Flag2 (ref)
	local Entry = list1[v10]
	
	local function _(p4)
		return if p4 == "axis" then "Hold to adjust" elseif p4 == "toggle" then "Tap to flip" elseif p4 == "cycle" then "Tap to cycle" elseif p4 == "action" then "Tap to fire" elseif p4 == "group" then "Enter" else nil
	end
	
	if #List1 > 0 then
		local Entry1 = List1[#List1]
		local Text = "[↑] Back  [↓] " .. Entry1.modes[Entry1.index % #Entry1.modes + 1].name
		local Mode = nil
		
		if #List1 > 0 then
			local Entry2 = List1[#List1]
			Mode = Entry2.modes[Entry2.index]
		else
			Mode = list1[v10]
		end
		local Type = Mode.type
		local HoldToAdjust = if Type == "axis" then "Hold to adjust" elseif Type == "toggle" then "Tap to flip" elseif Type == "cycle" then "Tap to cycle" elseif Type == "action" then "Tap to fire" elseif Type == "group" then "Enter" else nil
		
		return {
			nav = Text,
			action = HoldToAdjust and "[←][→] " .. HoldToAdjust or ""
		}
	elseif Flag2 then
		local Type = Entry.type
		local HoldToAdjust = if Type == "axis" then "Hold to adjust" elseif Type == "toggle" then "Tap to flip" elseif Type == "cycle" then "Tap to cycle" elseif Type == "action" then "Tap to fire" elseif Type == "group" then "Enter" else nil
		
		return {
			nav = "[↑] Back",
			action = HoldToAdjust and "[←][→] " .. HoldToAdjust or ""
		}
	else
		local Type = Entry.type
		
		return {
			nav = "[↑] Close  [↓] " .. (if Type == "group" then "Enter" elseif Type == "toggle" then "Flip" elseif Type == "cycle" then "Cycle" elseif Type == "action" then "Fire" elseif Type == "axis" then "Adjust" else "Select"),
			action = "[←] " .. list1[(v10 - 2) % #list1 + 1].name .. "  [→] " .. list1[v10 % #list1 + 1].name
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

local list2 = {
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

local function StepFreecam(DeltaTime: number)
	-- upvalues: t (copy), NewModule (copy), NewModule1 (copy), NewModule2 (copy), NewModule3 (copy), FieldOfView (ref), RadFunction (copy), TanFunction (copy), SqrtFunction (copy), config (copy), ClampFunction (copy), ClockTime (ref), ClockTime1 (ref), _Vector3_1 (ref), _Vector3 (ref), Inverted1 (ref), RootPart (ref), DefaultZoom (ref), DefaultHeight (ref), v7 (ref), Config (ref), Freecam (ref), List (ref), Index (ref), list2 (copy), CurrentCamera (ref)
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
		local v11 = p4 % 6.283185307179586
		
		return v11 > 3.141592653589793 and v11 - 6.283185307179586 or v11
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
	if v7 and v7.Parent and Config and Freecam and Freecam.Parent then
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
			
			for _, value in ipairs(list2) do
				local GetResult = value.get()
				
				if GetResult and GetResult.Enabled and ActiveGroupName ~= value.group then
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
	-- upvalues: initializePlayerList (copy), CurrentCamera (ref), _Vector3_1 (ref), _Vector3 (ref), FieldOfView (ref), NewModule (copy), NewModule1 (copy), NewModule2 (copy), NewModule3 (copy), Freecam (ref), LocalPlayer (ref), v7 (ref), Config (ref), v8 (ref), v9 (ref), config1 (copy), RunService (copy), StepFreecam (copy), t (copy)
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
	
	if not v7 or not v7.Parent then
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
	-- upvalues: PlayerAddedConnection (ref), PlayerRemovingConnection (ref), Inverted1 (ref), Index (ref), List (ref), PostEffect2 (copy), Inverted (ref), v9 (ref), config1 (copy), Freecam (ref), Inverted2 (ref), Inverted3 (ref), t (copy), RunService (copy), v8 (ref)
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
	-- upvalues: Inverted4 (ref), StopFreecam (copy), StartFreecam (copy), Result1 (ref), config (copy)
	if Inverted4 then
		StopFreecam()
	else
		StartFreecam()
	end
	Inverted4 = not Inverted4
	
	if Result1 then
		script:SetAttribute(config.AttributeName, Inverted4)
	end
end

Humanoid.StateChanged:Connect(function(OldState)
	-- upvalues: Inverted4 (ref), StopFreecam (copy), StartFreecam (copy), Result1 (ref), config (copy)
	if OldState then
		if Inverted4 then
			StopFreecam()
		else
			StartFreecam()
		end
		Inverted4 = not Inverted4
		
		if Result1 then
			script:SetAttribute(config.AttributeName, Inverted4)
		end
	end
end)

if Result1 then
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