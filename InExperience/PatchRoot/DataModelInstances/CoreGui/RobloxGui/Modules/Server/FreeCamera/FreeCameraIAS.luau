local clamp = math.clamp
local exp = math.exp
local rad = math.rad
local sqrt = math.sqrt
local tan = math.tan
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local starterGuiService = game:GetService("StarterGui")
local userInputService = game:GetService("UserInputService")
local workspaceService = game:GetService("Workspace")
local lightingService = game:GetService("Lighting")
local t = {
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
		Gain = Vector3.new(64, 64, 64),
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
		MouseScale = Vector2.new(0.000818123087, -0.000818123087),
		TrackpadScale = Vector2.new(0.011453723216, -0.011453723216),
		GamepadScale = Vector2.new(0.392699081699, 0.392699081699)
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
		Gain = -1.570796326795,
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
t.Actions = {
	Toggle = {
		name = "FreecamToggleAction",
		type = Enum.InputActionType.Bool,
		bindings = {
			{
				keyCode = t.Keys.Toggle.Keyboard,
				primaryModifier = t.Keys.Toggle.Modifier
			}
		}
	},
	Pan = {
		name = "PanAction",
		type = Enum.InputActionType.Direction2D,
		bindings = {
			{
				keyCode = t.Keys.Pan.Mouse,
				vector2Scale = t.Pan.MouseScale
			},
			{
				keyCode = t.Keys.Pan.Trackpad,
				vector2Scale = t.Pan.TrackpadScale
			},
			{
				keyCode = t.Keys.Pan.Gamepad,
				responseCurve = t.Thumbstick.Curvature,
				vector2Scale = t.Pan.GamepadScale
			}
		}
	},
	MovementMove = {
		name = "MovementMoveAction",
		type = Enum.InputActionType.Direction2D,
		bindings = {
			{
				up = t.Keys.MovementMove.Keyboard.Up,
				down = t.Keys.MovementMove.Keyboard.Down,
				left = t.Keys.MovementMove.Keyboard.Left,
				right = t.Keys.MovementMove.Keyboard.Right
			},
			{
				keyCode = t.Keys.MovementMove.Gamepad,
				responseCurve = t.Thumbstick.Curvature
			}
		}
	},
	MovementElevate = {
		name = "MovementElevateAction",
		type = Enum.InputActionType.Direction1D,
		bindings = {
			{
				up = t.Keys.MovementElevate.Keyboard.Up,
				down = t.Keys.MovementElevate.Keyboard.Down
			},
			{
				up = t.Keys.MovementElevate.Gamepad.Up,
				down = t.Keys.MovementElevate.Gamepad.Down
			}
		}
	},
	Fov = {
		name = "FovAction",
		type = Enum.InputActionType.Direction1D,
		bindings = {
			{ keyCode = t.Keys.Fov.Mouse, scale = t.Fov.WheelScale },
			{
				keyCode = t.Keys.Fov.TrackpadPinch,
				scale = t.Fov.PinchScale
			},
			{
				up = t.Keys.Fov.Gamepad.Up,
				down = t.Keys.Fov.Gamepad.Down,
				scale = t.Fov.GamepadScale
			}
		}
	},
	Tilt = {
		name = "TiltAction",
		type = Enum.InputActionType.Direction1D,
		bindings = {
			{
				up = t.Keys.Tilt.Keyboard.Up,
				down = t.Keys.Tilt.Keyboard.Down
			},
			{
				up = t.Keys.Tilt.Gamepad.Up,
				down = t.Keys.Tilt.Gamepad.Down
			}
		}
	},
	Shift = {
		name = "ShiftAction",
		type = Enum.InputActionType.Bool,
		bindings = {
			{ keyCode = t.Keys.Shift.KeyboardPrimary },
			{ keyCode = t.Keys.Shift.KeyboardSecondary }
		}
	},
	ModeToggle = {
		name = "ModeToggleAction",
		type = Enum.InputActionType.Bool,
		bindings = {
			{ keyCode = t.Keys.ModeSelect.Toggle.Keyboard },
			{ keyCode = t.Keys.ModeSelect.Toggle.Gamepad }
		}
	},
	ModeNext = {
		name = "ModeNextAction",
		type = Enum.InputActionType.Bool,
		bindings = {
			{ keyCode = t.Keys.ModeSelect.Next.Keyboard },
			{ keyCode = t.Keys.ModeSelect.Next.Gamepad }
		}
	},
	ModeAxis = {
		name = "ModeAxisAction",
		type = Enum.InputActionType.Direction1D,
		bindings = {
			{
				up = t.Keys.ModeSelect.Axis.Up.Keyboard,
				down = t.Keys.ModeSelect.Axis.Down.Keyboard
			},
			{
				up = t.Keys.ModeSelect.Axis.Up.Gamepad,
				down = t.Keys.ModeSelect.Axis.Down.Gamepad
			}
		}
	}
}
local localPlayer = playersService.LocalPlayer

if not localPlayer then
	playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
	localPlayer = playersService.LocalPlayer
end
local var7 = nil
local currentCamera = workspaceService.CurrentCamera
workspaceService:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ line: 267 ]]
	-- upvalues: workspaceService (ref), currentCamera (write)
	local currentCamera_1 = workspaceService.CurrentCamera
	
	if currentCamera_1 then
		currentCamera = currentCamera_1
	end
end)
local var8 = nil
local var9 = nil
local var10 = nil
local var11 = nil
local var12 = nil
local var13 = nil
local t_1 = {
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
local var15 = nil
local var16 = nil
local t_2 = nil
local _ = nil
local ok, status = pcall(function() --[[ line: 296 ]]
	return UserSettings():IsUserFeatureEnabled("UserShowGuiHideToggles")
end)
local status_1 = ok and status
local _ = nil
local ok_1, status_2 = pcall(function() --[[ line: 304 ]]
	return UserSettings():IsUserFeatureEnabled("UserPlayerScriptsRefactor4")
end)
local status_2_1 = ok_1 and status_2
local _ = nil
local ok_2, status_3 = pcall(function() --[[ line: 312 ]]
	return UserSettings():IsUserFeatureEnabled("UserPlayerScriptsRefactor5")
end)
local status_3_1 = ok_2 and status_3
local var21 = false
local var22, var23 = (function(p1, p2) --[[ line: 320 | named "makeEffectOverride" ]]
	-- upvalues: currentCamera (write), lightingService (ref)
	local t = {}
	local var87 = nil
	local var88 = nil
	
	local function _(p3) --[[ line: 333 | named "trySuppress" ]]
		-- upvalues: p1 (ref), p2 (ref), t (write)
		if p3:IsA(p1) and p3.Enabled and (not p2 or not p2(p3)) then
			t[#t + 1] = p3
			p3.Enabled = false
		end
	end
	
	return function() --[[ line: 340 | named "enable" ]]
		-- upvalues: t (write), currentCamera (copy), p1 (ref), p2 (ref), lightingService (copy), var87 (write), var88 (write)
		t = {}
		
		for i, v in ipairs(currentCamera:GetChildren()) do
			if v:IsA(p1) and v.Enabled and (not p2 or not p2(v)) then
				t[#t + 1] = v
				v.Enabled = false
			end
		end
		for i, v_1 in ipairs(lightingService:GetChildren()) do
			if v_1:IsA(p1) and v_1.Enabled and (not p2 or not p2(v_1)) then
				t[#t + 1] = v_1
				v_1.Enabled = false
			end
		end
		var87 = currentCamera.ChildAdded:Connect(function(p4) --[[ line: 344 ]]
			-- upvalues: p1 (copy), p2 (copy), t (copy)
			if p4:IsA(p1) and p4.Enabled and (not p2 or not p2(p4)) then
				t[#t + 1] = p4
				p4.Enabled = false
			end
		end)
		var88 = lightingService.ChildAdded:Connect(function(p5) --[[ line: 345 ]]
			-- upvalues: p1 (copy), p2 (copy), t (copy)
			if p5:IsA(p1) and p5.Enabled and (not p2 or not p2(p5)) then
				t[#t + 1] = p5
				p5.Enabled = false
			end
		end)
	end, function() --[[ line: 324 | named "disable" ]]
		-- upvalues: t (write), var87 (write), var88 (write)
		for i, v in ipairs(t) do
			if v.Parent then
				v.Enabled = true
			end
		end
		if var87 then
			var87:Disconnect()
			var87 = nil
		end
		if var88 then
			var88:Disconnect()
			var88 = nil
		end
		t = {}
	end
end)("PostEffect", function(p0) --[[ line: 353 ]]
	return p0.Name:sub(1, 7) == "Freecam"
end)
local list = nil

local function doToggleMasterEffects() --[[ line: 359 ]]
	-- upvalues: var21 (write), var22 (ref), var23 (ref), list (write)
	var21 = not var21
	
	if var21 then
		var22()
		
		return
	end
	var23()
	
	for i, v in ipairs(list) do
		local var89 = v.get()
		
		if var89 then
			var89.Enabled = false
		end
	end
end

local function doToggleDoF() --[[ line: 372 ]]
	-- upvalues: status_2_1 (write), var21 (write), var8 (write)
	if status_2_1 and not var21 then return end
	if var8 then
		var8.Enabled = not var8.Enabled
	end
end

local function doToggleBloom() --[[ line: 373 ]]
	-- upvalues: status_2_1 (write), var21 (write), var9 (write)
	if status_2_1 and not var21 then return end
	if var9 then
		var9.Enabled = not var9.Enabled
	end
end

local function doToggleBlur() --[[ line: 374 ]]
	-- upvalues: status_2_1 (write), var21 (write), var10 (write)
	if status_2_1 and not var21 then return end
	if var10 then
		var10.Enabled = not var10.Enabled
	end
end

local function doToggleColorCorrection() --[[ line: 375 ]]
	-- upvalues: status_2_1 (write), var21 (write), var11 (write)
	if status_2_1 and not var21 then return end
	if var11 then
		var11.Enabled = not var11.Enabled
	end
end

local function doToggleSunRays() --[[ line: 376 ]]
	-- upvalues: status_2_1 (write), var21 (write), var12 (write)
	if status_2_1 and not var21 then return end
	if var12 then
		var12.Enabled = not var12.Enabled
	end
end

local function doToggleColorGrading() --[[ line: 377 ]]
	-- upvalues: status_2_1 (write), var21 (write), var13 (write)
	if status_2_1 and not var21 then return end
	if var13 then
		var13.Enabled = not var13.Enabled
	end
end

list = {
	{
		key = "DepthOfField",
		class = "DepthOfFieldEffect",
		get = function() --[[ line: 381 ]]
			-- upvalues: var8 (write)
			return var8
		end,
		set = function(value) --[[ line: 382 ]]
			-- upvalues: var8 (write)
			var8 = value
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
		get = function() --[[ line: 385 ]]
			-- upvalues: var9 (write)
			return var9
		end,
		set = function(value) --[[ line: 386 ]]
			-- upvalues: var9 (write)
			var9 = value
		end,
		props = { "Intensity", "Size", "Threshold" }
	},
	{
		key = "Blur",
		class = "BlurEffect",
		get = function() --[[ line: 389 ]]
			-- upvalues: var10 (write)
			return var10
		end,
		set = function(value) --[[ line: 390 ]]
			-- upvalues: var10 (write)
			var10 = value
		end,
		props = { "Size" }
	},
	{
		key = "ColorCorrection",
		class = "ColorCorrectionEffect",
		get = function() --[[ line: 393 ]]
			-- upvalues: var11 (write)
			return var11
		end,
		set = function(value) --[[ line: 394 ]]
			-- upvalues: var11 (write)
			var11 = value
		end,
		props = { "Brightness", "Contrast", "Saturation", "TintColor" }
	},
	{
		key = "SunRays",
		class = "SunRaysEffect",
		get = function() --[[ line: 397 ]]
			-- upvalues: var12 (write)
			return var12
		end,
		set = function(value) --[[ line: 398 ]]
			-- upvalues: var12 (write)
			var12 = value
		end,
		props = { "Intensity", "Spread" }
	},
	{
		key = "ColorGrading",
		class = "ColorGradingEffect",
		parent = if status_3_1 then lightingService else nil,
		get = function() --[[ line: 401 ]]
			-- upvalues: var13 (write)
			return var13
		end,
		set = function(value) --[[ line: 402 ]]
			-- upvalues: var13 (write)
			var13 = value
		end,
		props = { "TonemapperPreset" }
	}
}
local var32 = nil
local var33 = nil
local var34 = nil
local var35 = false
local defaultZoom = t.PlayerLock.DefaultZoom
local defaultHeight = t.PlayerLock.DefaultHeight
local t_3 = {}
local var37 = 1
local var38 = nil
local var39 = false
local var40 = false
local var41 = -1e999
local var42 = -1e999
local t_4 = {
	movement = t.Movement.Stiffness,
	pan = t.Pan.Stiffness,
	fov = t.Fov.Stiffness,
	roll = t.Roll.Stiffness
}
local var44 = nil
local t_5 = {}
t_5.__index = t_5

function t_5.new(p6, p7) --[[ line: 438 ]]
	-- upvalues: t_5 (ref)
	local tbl = setmetatable({}, t_5)
	tbl.f = p6
	tbl.p = p7
	tbl.v = p7 * 0
	
	return tbl
end

function t_5:Update(p8, p9) --[[ line: 446 ]]
	-- upvalues: exp (ref)
	local var91 = self.f * 2 * 3.14159265359
	local v = self.v
	local var92 = p9 - self.p
	local var93 = exp(-var91 * p8)
	local var94 = p9 + (v * p8 - var92 * (var91 * p8 + 1)) * var93
	local var95 = (var91 * p8 * (var92 * var91 - v) + v) * var93
	self.p = var94
	self.v = var95
	
	return var94
end

function t_5:SetFreq(p10) --[[ line: 459 ]]
	self.f = p10
end

function t_5:Reset(p11) --[[ line: 461 ]]
	self.p = p11
	self.v = p11 * 0
end

local vector3 = Vector3.new()
local vector3_1 = Vector3.new()
local var48 = 0
local var49 = t_5.new(t_4.movement, Vector3.new())
local var50 = t_5.new(t_4.pan, Vector2.new())
local var51 = t_5.new(t_4.fov, 0)
local var52 = t_5.new(t_4.roll, 0)
local t_6 = {}
local t_7 = {}
local t_8 = { movement = 1, pan = 1, fov = 1, roll = 1 }
local var56 = false
local t_9 = nil
local var58 = false
local var59 = 1
local t_10 = {}
local var61 = false
local var62 = false

local function findPlayerLockRootPart(p12) --[[ line: 500 ]]
	-- upvalues: t_3 (write), var37 (write), var35 (write)
	if not t_3 or #t_3 < 1 then
		return nil
	end
	for _ = 1, #t_3 do
		var37 = (var37 - 1 + p12) % #t_3 + 1
		local var96 = t_3[var37]
		local character = var96 and var96.Character
		
		if character then
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			
			if not humanoid or not humanoid.RootPart then
				if p12 == 0 then
					p12 = 1
				end
			end
			return humanoid.RootPart
		end
	end
	var35 = false
	
	return nil
end

local list_1 = {
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
local var65 = 1
local color3 = Color3.new(1, 1, 1)

local function doTogglePlayerLock() --[[ line: 534 ]]
	-- upvalues: var35 (write), defaultZoom (write), t (ref), defaultHeight (write), var38 (write), findPlayerLockRootPart (ref)
	var35 = not var35
	
	if var35 then
		defaultZoom = t.PlayerLock.DefaultZoom
		defaultHeight = t.PlayerLock.DefaultHeight
		var38 = findPlayerLockRootPart(0)
	end
end

local function doToggleScreenGuis() --[[ line: 543 ]]
	-- upvalues: var39 (write), t_2 (write), var7 (write)
	var39 = not var39
	
	if t_2 then
		for i, v in pairs(t_2.getScreenGuis()) do
			if v.Parent and v ~= var7 then
				v.Enabled = var39
			end
		end
	end
end

local function doToggleLeaderboard() --[[ line: 554 ]]
	-- upvalues: var40 (write), starterGuiService (ref)
	var40 = not var40
	starterGuiService:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, var40)
end

local function makeEffectGroup(p13, p14, p15, p16, p17) --[[ line: 566 ]]
	local list = {
		{
			type = "toggle",
			name = "Enable",
			toggle = p14,
			isEnabled = function() --[[ line: 570 ]]
				-- upvalues: p15 (ref)
				local var100 = p15()
				
				return var100 and var100.Enabled
			end
		}
	}
	
	for i, v in ipairs(p16 or {}) do
		list[#list + 1] = {
			type = "axis",
			name = v.name,
			adj = v.adjCfg.Adj,
			min = v.adjCfg.Min,
			max = v.adjCfg.Max,
			get = function() --[[ line: 576 ]]
				-- upvalues: p15 (ref), v (ref)
				local var101 = p15()
				
				return if var101 then var101[v.prop] else 0
			end,
			set = function(value) --[[ line: 577 ]]
				-- upvalues: p15 (ref), v (ref)
				local var102 = p15()
				
				if var102 then
					var102[v.prop] = value
				end
			end
		}
	end
	for i, v_1 in ipairs(p17 or {}) do
		list[#list + 1] = v_1
	end
	return { type = "group", name = p13, modes = list }
end

local function makeSpeedStiffnessGroup(p18, p19, p20, p21, p22) --[[ line: 687 ]]
	-- upvalues: t_8 (ref), t_4 (ref)
	return {
		type = "group",
		name = p18,
		modes = {
			{
				type = "axis",
				name = "Speed",
				adj = p19.AdjSpeed,
				min = p19.MinSpeed,
				max = p19.MaxSpeed,
				get = function() --[[ line: 691 ]]
					-- upvalues: t_8 (copy), p20 (ref)
					return t_8[p20]
				end,
				set = function(value) --[[ line: 692 ]]
					-- upvalues: t_8 (copy), p20 (ref)
					t_8[p20] = value
				end
			},
			{
				type = "axis",
				name = "Stiffness",
				adj = p19.AdjStiffness,
				min = p19.MinStiffness,
				max = p19.MaxStiffness,
				get = function() --[[ line: 695 ]]
					-- upvalues: t_4 (copy), p21 (ref)
					return t_4[p21]
				end,
				set = function(value) --[[ line: 696 ]]
					-- upvalues: t_4 (copy), p21 (ref), p22 (ref)
					t_4[p21] = value
					p22:SetFreq(value)
				end
			}
		}
	}
end

local list_2 = {
	(function() --[[ line: 586 | named "buildCustomEffectsGroup" ]]
		-- upvalues: doToggleMasterEffects (ref), var21 (write), makeEffectGroup (ref), doToggleDoF (ref), var8 (write), t (ref), doToggleBloom (ref), var9 (write), doToggleBlur (ref), var10 (write), doToggleColorCorrection (ref), var11 (write), list_1 (ref), var65 (write), color3 (write), doToggleSunRays (ref), var12 (write), doToggleColorGrading (ref), var13 (write), status_2_1 (write)
		local t_1 = {
			type = "group",
			name = "Custom Post Processing",
			modes = {
				{
					type = "toggle",
					name = "Enable",
					toggle = doToggleMasterEffects,
					isEnabled = function() --[[ line: 592 ]]
						-- upvalues: var21 (copy)
						return var21
					end
				},
				makeEffectGroup("Depth of Field", doToggleDoF, function() --[[ line: 593 ]]
					-- upvalues: var8 (copy)
					return var8
				end, {
					{
						name = "Far",
						prop = "FarIntensity",
						adjCfg = t.DoF.FarIntensity
					},
					{
						name = "Near",
						prop = "NearIntensity",
						adjCfg = t.DoF.NearIntensity
					},
					{
						name = "Focus Distance",
						prop = "FocusDistance",
						adjCfg = t.DoF.FocusDistance
					},
					{
						name = "Focus Radius",
						prop = "InFocusRadius",
						adjCfg = t.DoF.FocusRadius
					}
				}),
				makeEffectGroup("Bloom", doToggleBloom, function() --[[ line: 599 ]]
					-- upvalues: var9 (copy)
					return var9
				end, {
					{
						name = "Intensity",
						prop = "Intensity",
						adjCfg = t.Bloom.Intensity
					},
					{ name = "Size", prop = "Size", adjCfg = t.Bloom.Size },
					{
						name = "Threshold",
						prop = "Threshold",
						adjCfg = t.Bloom.Threshold
					}
				}),
				makeEffectGroup("Blur", doToggleBlur, function() --[[ line: 604 ]]
					-- upvalues: var10 (copy)
					return var10
				end, { { name = "Size", prop = "Size", adjCfg = t.Blur.Size } }),
				makeEffectGroup("Color Correction", doToggleColorCorrection, function() --[[ line: 607 ]]
					-- upvalues: var11 (copy)
					return var11
				end, {
					{
						name = "Brightness",
						prop = "Brightness",
						adjCfg = t.ColorCorrection.Brightness
					},
					{
						name = "Contrast",
						prop = "Contrast",
						adjCfg = t.ColorCorrection.Contrast
					},
					{
						name = "Saturation",
						prop = "Saturation",
						adjCfg = t.ColorCorrection.Saturation
					}
				}, {
					{
						type = "cycle",
						name = "Tint",
						items = function() --[[ line: 615 ]]
							-- upvalues: list_1 (copy)
							return list_1
						end,
						getIndex = function() --[[ line: 616 ]]
							-- upvalues: var65 (copy)
							return var65
						end,
						setIndex = function(value) --[[ line: 617 ]]
							-- upvalues: var65 (copy), var11 (copy), color3 (copy), list_1 (copy)
							var65 = value
							
							if var11 then
								if value == 1 then
									var11.TintColor = color3
									
									return
								end
								local color = list_1[value].color
								var11.TintColor = color
								color3 = color
							end
						end,
						displayItem = function(p23) --[[ line: 629 ]]
							return p23.name
						end
					},
					{
						type = "axis",
						name = "Tint R",
						adj = 0.02,
						min = 0,
						max = 1,
						get = function() --[[ line: 631 ]]
							-- upvalues: color3 (copy)
							return color3.R
						end,
						set = function(value) --[[ line: 632 ]]
							-- upvalues: color3 (copy), var65 (copy), var11 (copy)
							color3 = Color3.new(value, color3.G, color3.B)
							var65 = 1
							
							if var11 then
								var11.TintColor = color3
							end
						end
					},
					{
						type = "axis",
						name = "Tint G",
						adj = 0.02,
						min = 0,
						max = 1,
						get = function() --[[ line: 638 ]]
							-- upvalues: color3 (copy)
							return color3.G
						end,
						set = function(value) --[[ line: 639 ]]
							-- upvalues: color3 (copy), var65 (copy), var11 (copy)
							color3 = Color3.new(color3.R, value, color3.B)
							var65 = 1
							
							if var11 then
								var11.TintColor = color3
							end
						end
					},
					{
						type = "axis",
						name = "Tint B",
						adj = 0.02,
						min = 0,
						max = 1,
						get = function() --[[ line: 645 ]]
							-- upvalues: color3 (copy)
							return color3.B
						end,
						set = function(value) --[[ line: 646 ]]
							-- upvalues: color3 (copy), var65 (copy), var11 (copy)
							color3 = Color3.new(color3.R, color3.G, value)
							var65 = 1
							
							if var11 then
								var11.TintColor = color3
							end
						end
					}
				}),
				makeEffectGroup("Sun Rays", doToggleSunRays, function() --[[ line: 653 ]]
					-- upvalues: var12 (copy)
					return var12
				end, {
					{
						name = "Intensity",
						prop = "Intensity",
						adjCfg = t.SunRays.Intensity
					},
					{
						name = "Spread",
						prop = "Spread",
						adjCfg = t.SunRays.Spread
					}
				}),
				makeEffectGroup("Color Grading", doToggleColorGrading, function() --[[ line: 657 ]]
					-- upvalues: var13 (copy)
					return var13
				end, nil, {
					{
						type = "cycle",
						name = "Tonemap",
						items = function() --[[ line: 661 ]]
							return {
								Enum.TonemapperPreset.Default,
								Enum.TonemapperPreset.Retro
							}
						end,
						getIndex = function() --[[ line: 662 ]]
							-- upvalues: var13 (copy)
							return if var13 and var13.TonemapperPreset == Enum.TonemapperPreset.Retro then 2 else 1
						end,
						setIndex = function(value) --[[ line: 668 ]]
							-- upvalues: var13 (copy)
							if var13 then
								var13.TonemapperPreset = ({
									Enum.TonemapperPreset.Default,
									Enum.TonemapperPreset.Retro
								})[value]
							end
						end,
						displayItem = function(p24) --[[ line: 674 ]]
							return p24.Name
						end
					}
				})
			}
		}
		
		if status_2_1 then
			for i = 2, #t_1.modes do
				t_1.modes[i].disabled = function() --[[ line: 681 ]]
					-- upvalues: var21 (copy)
					return not var21
				end
			end
		end
		return t_1
	end)(),
	{
		type = "group",
		name = "Player Lock",
		modes = {
			{
				type = "toggle",
				name = "Enable",
				toggle = doTogglePlayerLock,
				isEnabled = function() --[[ line: 707 ]]
					-- upvalues: var35 (write)
					return var35
				end
			},
			{
				type = "cycle",
				name = "Target",
				items = function() --[[ line: 709 ]]
					-- upvalues: t_3 (write)
					return t_3
				end,
				getIndex = function() --[[ line: 710 ]]
					-- upvalues: var37 (write)
					return var37
				end,
				setIndex = function(value) --[[ line: 711 ]]
					-- upvalues: var37 (write), t_3 (write), var38 (write)
					var37 = value
					local var104 = t_3[value]
					local character = var104 and var104.Character
					
					if character then
						local humanoid = character:FindFirstChildOfClass("Humanoid")
						var38 = if humanoid then humanoid.RootPart else nil
						
						return
					end
					var38 = nil
				end,
				displayItem = function(p25) --[[ line: 722 ]]
					return p25.Name
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
				toggle = doToggleScreenGuis,
				isEnabled = function() --[[ line: 728 ]]
					-- upvalues: var39 (write)
					return var39
				end
			},
			{
				type = "toggle",
				name = "Leaderboard",
				toggle = doToggleLeaderboard,
				isEnabled = function() --[[ line: 731 ]]
					-- upvalues: var40 (write)
					return var40
				end
			}
		}
	},
	makeSpeedStiffnessGroup("Movement", t.Movement, "movement", "movement", var49),
	makeSpeedStiffnessGroup("Field of View", t.Fov, "fov", "fov", var51),
	makeSpeedStiffnessGroup("Tilt", t.Roll, "roll", "roll", var52),
	makeSpeedStiffnessGroup("Pan", t.Pan, "pan", "pan", var50)
}
local isDisabled = nil
local nextEnabledIndex = nil

if status_2_1 then
	isDisabled = function(p26) --[[ line: 742 | named "isDisabled" ]]
		return p26.disabled and p26.disabled()
	end
	
	nextEnabledIndex = function(p27, p28, p29) --[[ line: 746 | named "nextEnabledIndex" ]]
		-- upvalues: isDisabled (write)
		local p27Count = #p27
		
		for _ = 1, p27Count do
			p28 = (p28 - 1 + p29) % p27Count + 1
			
			if isDisabled(p27[p28]) then
				continue
			end
			return p28
		end
		return p28
	end
end
local function _() --[[ line: 756 | named "currentMode" ]]
	-- upvalues: t_10 (write), list_2 (ref), var59 (write)
	if #t_10 > 0 then
		local var108 = t_10[#t_10]
		
		return var108.modes[var108.index]
	end
	return list_2[var59]
end

local function createBinding(p30, p31) --[[ line: 767 ]]
	local inputBinding = Instance.new("InputBinding")
	
	if p31.keyCode then
		inputBinding.KeyCode = p31.keyCode
	end
	if p31.up then
		inputBinding.Up = p31.up
	end
	if p31.down then
		inputBinding.Down = p31.down
	end
	if p31.left then
		inputBinding.Left = p31.left
	end
	if p31.right then
		inputBinding.Right = p31.right
	end
	if p31.scale then
		inputBinding.Scale = p31.scale
	end
	if p31.vector2Scale then
		inputBinding.Vector2Scale = p31.vector2Scale
	end
	if p31.responseCurve then
		inputBinding.ResponseCurve = p31.responseCurve
	end
	if p31.primaryModifier then
		inputBinding.PrimaryModifier = p31.primaryModifier
	end
	inputBinding.Parent = p30
	
	return inputBinding
end

local function createAction(p32, p33) --[[ line: 782 ]]
	-- upvalues: createBinding (ref)
	local inputAction = Instance.new("InputAction")
	inputAction.Name = p33.name
	inputAction.Type = p33.type
	inputAction.Parent = p32
	
	for i, v in ipairs(p33.bindings) do
		createBinding(inputAction, v)
	end
	return inputAction
end

local _ = function(p34, p35, p36) --[[ line: 794 | named "makeDoubleTapHandler" ]]
	local var111 = nil
	local var112 = 0
	
	return function(p37) --[[ line: 796 | named "detect" ]]
		-- upvalues: var111 (write), p34 (ref), var112 (write), p35 (ref), p36 (ref)
		if math.abs(p37) > 0.01 then
			local processTime = os.clock()
			
			if var111 == nil or processTime - var111 > p34 then
				var111 = processTime
			elseif p35 <= processTime - var112 then
				p36()
				var112 = processTime
			end
			var111 = nil
			
			return
		end
	end, function() --[[ line: 810 | named "reset" ]]
		-- upvalues: var111 (write)
		var111 = nil
	end
end

;(function() --[[ line: 814 | named "createIASContexts" ]]
	-- upvalues: t (ref), var44 (write), createAction (ref), t_6 (ref), t_7 (ref), t_9 (write), vector3_1 (write), var52 (ref), var56 (write), status_2_1 (write), var58 (write), var62 (write), t_10 (write), nextEnabledIndex (write), list_2 (ref), var59 (write), var61 (write), isDisabled (write)
	local actions = t.Actions
	local freecamToggleContext = Instance.new("InputContext")
	freecamToggleContext.Name = "FreecamToggleContext"
	freecamToggleContext.Priority = 3000
	freecamToggleContext.Sink = false
	freecamToggleContext.Enabled = true
	freecamToggleContext.Parent = script
	var44 = createAction(freecamToggleContext, actions.Toggle)
	local freecamInputContext = Instance.new("InputContext")
	freecamInputContext.Name = "FreecamInputContext"
	freecamInputContext.Priority = 2000
	freecamInputContext.Sink = true
	freecamInputContext.Enabled = false
	freecamInputContext.Parent = script
	t_6._sinkContext = freecamInputContext
	t_7.Pan = createAction(freecamInputContext, actions.Pan)
	t_7.MovementMove = createAction(freecamInputContext, actions.MovementMove)
	t_7.MovementElevate = createAction(freecamInputContext, actions.MovementElevate)
	t_7.Fov = createAction(freecamInputContext, actions.Fov)
	t_7.Shift = createAction(freecamInputContext, actions.Shift)
	local var116 = createAction(freecamInputContext, actions.Tilt)
	t_7.Tilt = var116
	local _ = nil
	local threshold = t.DoubleTap.Threshold
	local debounce = t.DoubleTap.Debounce
	
	local var117 = function() --[[ line: 847 ]]
		-- upvalues: vector3_1 (copy), var52 (copy), var56 (copy)
		vector3_1 = Vector3.new(vector3_1.x, vector3_1.y, 0)
		var52:Reset(0)
		var56 = true
	end
	
	local var118 = nil
	local var119 = 0
	
	t_9 = function() --[[ line: 810 | named "reset" ]]
		-- upvalues: var118 (write)
		var111 = nil
	end
	
	local function detect(p38) --[[ line: 796 ]]
		-- upvalues: var118 (write), threshold (ref), var119 (write), debounce (ref), var117 (ref)
		if math.abs(p38) > 0.01 then
			local processTime = os.clock()
			
			if var118 == nil or processTime - var118 > threshold then
				var118 = processTime
			elseif debounce <= processTime - var119 then
				var117()
				var119 = processTime
			end
			var118 = nil
			
			return
		end
	end
	
	var116.StateChanged:Connect(function(p39) --[[ line: 853 ]]
		-- upvalues: var56 (copy), detect (write)
		if not var56 then
			detect(p39)
			
			return
		elseif math.abs(p39) < 0.01 then
			var56 = false
		end
	end)
	createAction(freecamInputContext, actions.ModeToggle).StateChanged:Connect(function(p40) --[[ line: 862 ]]
		-- upvalues: status_2_1 (copy), var58 (copy), var62 (copy), t_10 (copy), nextEnabledIndex (copy), list_2 (copy), var59 (copy), var61 (copy)
		if not p40 then return end
		if status_2_1 then
			if not var58 then
				var58 = true
				
				return
			elseif var62 then
				var62 = false
				
				return
			elseif #t_10 > 0 then
				local var122 = t_10[#t_10]
				local var123 = nextEnabledIndex(var122.modes, var122.index, -1)
				
				if var123 < var122.index then
					var122.index = var123
					
					return
				end
				t_10[#t_10] = nil
				
				return
			else
				local var124 = nextEnabledIndex(list_2, var59, -1)
				
				if var124 < var59 then
					var59 = var124
					
					return
				end
				var58 = false
				
				return
			end
		elseif not var58 then
			var58 = true
			
			return
		elseif var61 then
			var61 = false
			
			return
		elseif #t_10 > 0 then
			t_10[#t_10] = nil
			
			return
		end
		var58 = false
	end)
	createAction(freecamInputContext, actions.ModeNext).StateChanged:Connect(function(p41) --[[ line: 903 ]]
		-- upvalues: status_2_1 (copy), var58 (copy), var62 (copy), t_10 (copy), nextEnabledIndex (copy), var59 (copy), list_2 (copy), var61 (copy)
		if not p41 then return end
		if status_2_1 then
			if not var58 then
				var58 = true
				
				return
			elseif var62 then
				var62 = false
				
				return
			elseif #t_10 > 0 then
				local var125 = t_10[#t_10]
				var125.index = nextEnabledIndex(var125.modes, var125.index, 1)
				
				return
			end
			var59 = nextEnabledIndex(list_2, var59, 1)
			
			return
		elseif not var58 then return end
		if var61 then return end
		if #t_10 > 0 then
			local var126 = t_10[#t_10]
			var126.index = var126.index % #var126.modes + 1
			
			return
		end
		local var127 = list_2[var59]
		
		if var127.type == "group" then
			table.insert(t_10, { index = 1, modes = var127.modes, groupName = var127.name })
			
			return
		elseif var127.type == "toggle" then
			var127.toggle()
			
			return
		elseif var127.type == "cycle" then
			local var128 = var127.items()
			
			if #var128 > 0 then
				var127.setIndex(var127.getIndex() % #var128 + 1)
				
				return
			end
		elseif var127.type == "action" then
			var127.action()
			
			return
		elseif var127.type == "axis" then
			var61 = true
		end
	end)
	local var121 = createAction(freecamInputContext, actions.ModeAxis)
	var121.StateChanged:Connect(function(p42) --[[ line: 942 ]]
		-- upvalues: var58 (copy), status_2_1 (copy), t_10 (copy), list_2 (copy), var59 (copy), var62 (copy), isDisabled (copy), var61 (copy)
		local index
		if not var58 or p42 == 0 then return end
		if status_2_1 then
			if #t_10 > 0 then
				local var129 = t_10[#t_10]
				index = var129.modes[var129.index]
			else
				index = list_2[var59]
			end
			if var62 then
				if index.type == "toggle" then
					index.toggle()
					
					return
				elseif index.type == "cycle" then
					local var130 = index.items()
					
					if #var130 <= 0 then return end
					if p42 > 0 then
						index.setIndex(index.getIndex() % #var130 + 1)
						
						return
					end
					index.setIndex((index.getIndex() - 2) % #var130 + 1)
					
					return
				elseif index.type == "action" then
					index.action()
					
					return
				elseif index.type == "axis" then
					return
				end
			elseif p42 > 0 then
				if isDisabled(index) then return end
				if index.type == "group" then
					table.insert(t_10, { index = 1, modes = index.modes, groupName = index.name })
					
					return
				elseif index.type == "action" then
					index.action()
					
					return
				end
				var62 = true
				
				return
			elseif p42 >= 0 then return end
			var62 = false
			
			if #t_10 > 0 then
				t_10[#t_10] = nil
				
				return
			end
			var58 = false
			
			return
		elseif var61 then return end
		if #t_10 > 0 then
			if #t_10 > 0 then
				local var131 = t_10[#t_10]
				index = var131.modes[var131.index]
			else
				index = list_2[var59]
			end
			if index.type == "group" then
				table.insert(t_10, { index = 1, modes = index.modes, groupName = index.name })
				
				return
			elseif index.type == "toggle" then
				index.toggle()
				
				return
			elseif index.type == "cycle" then
				local var132 = index.items()
				
				if #var132 == 0 then return end
				if p42 > 0 then
					index.setIndex(index.getIndex() % #var132 + 1)
					
					return
				elseif p42 < 0 then
					index.setIndex((index.getIndex() - 2) % #var132 + 1)
					
					return
				end
			elseif index.type == "action" then
				index.action()
				
				return
			end
		elseif p42 > 0 then
			var59 = var59 % #list_2 + 1
			
			return
		elseif p42 < 0 then
			var59 = (var59 - 2) % #list_2 + 1
		end
	end)
	t_7.ModeAxis = var121
end)()

function t_6.Movement() --[[ line: 1017 ]]
	-- upvalues: t_7 (ref), t_8 (ref), t (ref)
	local state = t_7.MovementMove:GetState()
	
	return Vector3.new(state.X, t_7.MovementElevate:GetState(), state.Y) * (t_8.movement * (if t_7.Shift:GetState() then t.Movement.ShiftMul else 1))
end

function t_6.Pan() --[[ line: 1023 ]]
	-- upvalues: t_7 (ref), t_8 (ref)
	local state = t_7.Pan:GetState()
	
	return Vector2.new(state.Y, -state.X) * t_8.pan
end

function t_6.Fov() --[[ line: 1028 ]]
	-- upvalues: t_7 (ref), t_8 (ref)
	return t_7.Fov:GetState() * t_8.fov
end

function t_6.Roll() --[[ line: 1032 ]]
	-- upvalues: var56 (write), t_7 (ref), t_8 (ref)
	return (if var56 then 0 else t_7.Tilt:GetState()) * t_8.roll
end

function t_6.ModeControl(p43) --[[ line: 1036 ]]
	-- upvalues: var58 (write), status_2_1 (write), var62 (write), t_10 (write), var61 (write), list_2 (ref), var59 (write), t_7 (ref), clamp (ref)
	local index
	if not var58 then return end
	if status_2_1 then
		if not var62 then return end
	elseif #t_10 == 0 and not var61 then return end
	if #t_10 > 0 then
		local var135 = t_10[#t_10]
		index = var135.modes[var135.index]
	else
		index = list_2[var59]
	end
	if index.type ~= "axis" then return end
	local var136 = t_7.ModeAxis:GetState() * index.adj * p43
	
	if var136 ~= 0 then
		index.set(clamp(index.get() + var136, index.min, index.max))
	end
end

function t_6.StartCapture() --[[ line: 1051 ]]
	-- upvalues: t_6 (ref)
	t_6._sinkContext.Enabled = true
end

function t_6.StopCapture() --[[ line: 1055 ]]
	-- upvalues: t_6 (ref), var56 (write), t_9 (write), var58 (write), status_2_1 (write), t_10 (write), var62 (write), var61 (write)
	t_6._sinkContext.Enabled = false
	var56 = false
	
	if t_9 then
		t_9()
	end
	var58 = false
	
	if status_2_1 then
		table.clear(t_10)
		var62 = false
	else
		t_10 = {}
	end
	var61 = false
end

function t_6.getModeActive() --[[ line: 1069 ]]
	-- upvalues: var58 (write)
	return var58
end

function t_6.getModeName() --[[ line: 1071 ]]
	-- upvalues: t_10 (write), list_2 (ref), var59 (write)
	local index
	if #t_10 > 0 then
		local var137 = t_10[#t_10]
		index = var137.modes[var137.index]
	else
		index = list_2[var59]
	end
	return index.name
end

function t_6.getModeBreadcrumb() --[[ line: 1075 ]]
	-- upvalues: t_10 (write)
	if #t_10 == 0 then
		return ""
	end
	local t = {}
	
	for i, v in ipairs(t_10) do
		table.insert(t, v.groupName)
	end
	return table.concat(t, " \226\128\186 ")
end

function t_6.getModeDisplay() --[[ line: 1083 ]]
	-- upvalues: t_10 (write), list_2 (ref), var59 (write)
	local index
	if #t_10 > 0 then
		local var139 = t_10[#t_10]
		index = var139.modes[var139.index]
	else
		index = list_2[var59]
	end
	if index.type == "group" then
		return ""
	elseif index.type == "axis" then
		return string.format("%.2f", index.get())
	elseif index.type == "toggle" then
		return if index.isEnabled() then "ON" else "OFF"
	elseif index.type == "cycle" then
		local var140 = index.items()
		
		if #var140 == 0 then
			return "None"
		end
		local var141 = var140[index.getIndex()]
		
		return var141 and index.displayItem(var141) or "None"
	else
		return if index.type == "action" then "(fire)" else ""
	end
end

function t_6.getModeHint() --[[ line: 1102 ]]
	-- upvalues: list_2 (ref), var59 (write), t_10 (write), var61 (write)
	local var142 = list_2[var59]
	
	local function _(p44) --[[ line: 1105 | named "lrVerb" ]]
		return if p44 == "axis" then "Hold to adjust" elseif p44 == "toggle" then "Tap to flip" elseif p44 == "cycle" then "Tap to cycle" elseif p44 == "action" then "Tap to fire" elseif p44 == "group" then "Enter" else nil
	end
	
	if #t_10 > 0 then
		local index
		local var143 = t_10[#t_10]
		local text = "[\226\134\145] Back  [\226\134\147] " .. var143.modes[var143.index % #var143.modes + 1].name
		
		if #t_10 > 0 then
			local var145 = t_10[#t_10]
			index = var145.modes[var145.index]
		else
			index = list_2[var59]
		end
		index = index.type
		local var146 = if index == "axis" then "Hold to adjust" elseif index == "toggle" then "Tap to flip" elseif index == "cycle" then "Tap to cycle" elseif index == "action" then "Tap to fire" elseif index == "group" then "Enter" else nil
		
		return {
			nav = text,
			action = if var146 then "[\226\134\144][\226\134\146] " .. var146 else ""
		}
	elseif var61 then
		local type = var142.type
		local var147 = if type == "axis" then "Hold to adjust" elseif type == "toggle" then "Tap to flip" elseif type == "cycle" then "Tap to cycle" elseif type == "action" then "Tap to fire" elseif type == "group" then "Enter" else nil
		
		return {
			nav = "[\226\134\145] Back",
			action = if var147 then "[\226\134\144][\226\134\146] " .. var147 else ""
		}
	end
	local type = var142.type
	
	return {
		nav = "[\226\134\145] Close  [\226\134\147] " .. (if type == "group" then "Enter" elseif type == "toggle" then "Flip" elseif type == "cycle" then "Cycle" elseif type == "action" then "Fire" elseif type == "axis" then "Adjust" else "Select"),
		action = "[\226\134\144] " .. list_2[(var59 - 2) % #list_2 + 1].name .. "  [\226\134\146] " .. list_2[var59 % #list_2 + 1].name
	}
end

function t_6.getTintColorName() --[[ line: 1144 ]]
	-- upvalues: var65 (write), list_1 (ref)
	return if var65 >= 1 and var65 <= #list_1 then list_1[var65].name else "Custom"
end

function t_6.getActiveGroupName() --[[ line: 1150 ]]
	-- upvalues: var58 (write), t_10 (write)
	return if var58 and #t_10 ~= 0 then t_10[1].groupName else nil
end

if status_2_1 then
	t_6._navigationStack = t_10
	t_6._modes = list_2
	
	function t_6._getModeIndex() --[[ line: 1158 ]]
		-- upvalues: var59 (write)
		return var59
	end
	
	function t_6._isMonitorItemSelected() --[[ line: 1159 ]]
		-- upvalues: var62 (write)
		return var62
	end
end
local list_3 = {
	{
		key = "bloom",
		group = "Custom Post Processing",
		get = function() --[[ line: 1166 ]]
			-- upvalues: var9 (write)
			return var9
		end,
		fmt = function(p45) --[[ line: 1167 ]]
			return string.format("Intensity: %.2f  Size: %.1f\nThreshold: %.2f", p45.Intensity, p45.Size, p45.Threshold)
		end
	},
	{
		key = "blur",
		group = "Custom Post Processing",
		get = function() --[[ line: 1169 ]]
			-- upvalues: var10 (write)
			return var10
		end,
		fmt = function(p46) --[[ line: 1170 ]]
			return string.format("Size: %.1f", p46.Size)
		end
	},
	{
		key = "cc",
		group = "Custom Post Processing",
		get = function() --[[ line: 1171 ]]
			-- upvalues: var11 (write)
			return var11
		end,
		fmt = function(p47) --[[ line: 1172 ]]
			-- upvalues: t_6 (ref)
			return string.format("Brightness: %.2f  Contrast: %.2f\nSaturation: %.2f  Tint: %s", p47.Brightness, p47.Contrast, p47.Saturation, t_6.getTintColorName())
		end
	},
	{
		key = "sunrays",
		group = "Custom Post Processing",
		get = function() --[[ line: 1174 ]]
			-- upvalues: var12 (write)
			return var12
		end,
		fmt = function(p48) --[[ line: 1175 ]]
			return string.format("Intensity: %.2f  Spread: %.2f", p48.Intensity, p48.Spread)
		end
	},
	{
		key = "colorgrading",
		group = "Custom Post Processing",
		get = function() --[[ line: 1177 ]]
			-- upvalues: var13 (write)
			return var13
		end,
		fmt = function(p49) --[[ line: 1178 ]]
			return string.format("Color Grading: %s", p49.TonemapperPreset.Name)
		end
	},
	{
		key = "dof",
		group = "Custom Post Processing",
		get = function() --[[ line: 1179 ]]
			-- upvalues: var8 (write)
			return var8
		end,
		fmt = function(p50) --[[ line: 1180 ]]
			return string.format("Far: %.2f  Near: %.2f\nDistance: %.1f  Radius: %.1f", p50.FarIntensity, p50.NearIntensity, p50.FocusDistance, p50.InFocusRadius)
		end
	}
}

local _ = function(value, p51) --[[ line: 1184 | named "setBubble" ]]
	value.bubble.Visible = p51 ~= ""
	
	if p51 ~= "" then
		value.label.Text = p51
	end
end

var56 = nil
t_9 = nil
var58 = nil
var59 = nil
t_10 = nil
var61 = nil
var62 = nil

if status_2_1 then
	t_9 = {}
	var58 = 12
	
	var59 = function(p52) --[[ line: 1194 ]]
		-- upvalues: t_9 (write), var58 (write), var56 (write)
		local freecamMonitorPanel = Instance.new("Frame")
		freecamMonitorPanel.Name = "FreecamMonitorPanel"
		freecamMonitorPanel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		freecamMonitorPanel.BackgroundTransparency = 0.2
		freecamMonitorPanel.BorderSizePixel = 0
		freecamMonitorPanel.Size = UDim2.new(0, 240, 0, 0)
		freecamMonitorPanel.AutomaticSize = Enum.AutomaticSize.Y
		freecamMonitorPanel.AnchorPoint = Vector2.new(1, 1)
		freecamMonitorPanel.Position = UDim2.new(1, -16, 1, -16)
		freecamMonitorPanel.Visible = false
		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 8)
		UICorner.Parent = freecamMonitorPanel
		local UIPadding = Instance.new("UIPadding")
		UIPadding.PaddingTop = UDim.new(0, 8)
		UIPadding.PaddingBottom = UDim.new(0, 8)
		UIPadding.PaddingLeft = UDim.new(0, 12)
		UIPadding.PaddingRight = UDim.new(0, 12)
		UIPadding.Parent = freecamMonitorPanel
		local UIListLayout = Instance.new("UIListLayout")
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.FillDirection = Enum.FillDirection.Vertical
		UIListLayout.Padding = UDim.new(0, 1)
		UIListLayout.Parent = freecamMonitorPanel
		local breadcrumb = Instance.new("TextLabel")
		breadcrumb.Name = "Breadcrumb"
		breadcrumb.BackgroundTransparency = 1
		breadcrumb.TextColor3 = Color3.fromRGB(150, 150, 150)
		breadcrumb.Font = Enum.Font.GothamMedium
		breadcrumb.TextSize = 11
		breadcrumb.TextXAlignment = Enum.TextXAlignment.Left
		breadcrumb.Size = UDim2.new(1, 0, 0, 16)
		breadcrumb.LayoutOrder = 0
		breadcrumb.Visible = false
		breadcrumb.Parent = freecamMonitorPanel
		t_9 = {}
		
		for i = 1, var58 do
			local frame_1 = Instance.new("Frame")
			frame_1.Name = "Row" .. i
			frame_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			frame_1.BackgroundTransparency = 1
			frame_1.BorderSizePixel = 0
			frame_1.Size = UDim2.new(1, 0, 0, 22)
			frame_1.LayoutOrder = i
			frame_1.Visible = false
			local UICorner_1 = Instance.new("UICorner")
			UICorner_1.CornerRadius = UDim.new(0, 4)
			UICorner_1.Parent = frame_1
			local UIPadding_1 = Instance.new("UIPadding")
			UIPadding_1.PaddingLeft = UDim.new(0, 6)
			UIPadding_1.PaddingRight = UDim.new(0, 6)
			UIPadding_1.Parent = frame_1
			local name = Instance.new("TextLabel")
			name.Name = "Name"
			name.BackgroundTransparency = 1
			name.TextColor3 = Color3.new(1, 1, 1)
			name.Font = Enum.Font.GothamMedium
			name.TextSize = 14
			name.TextXAlignment = Enum.TextXAlignment.Left
			name.Size = UDim2.new(0.55, 0, 1, 0)
			name.Position = UDim2.new(0, 0, 0, 0)
			name.Parent = frame_1
			local value = Instance.new("TextLabel")
			value.Name = "Value"
			value.BackgroundTransparency = 1
			value.TextColor3 = Color3.fromRGB(180, 180, 180)
			value.Font = Enum.Font.GothamMedium
			value.TextSize = 14
			value.TextXAlignment = Enum.TextXAlignment.Right
			value.Size = UDim2.new(0.45, 0, 1, 0)
			value.Position = UDim2.new(0.55, 0, 0, 0)
			value.Parent = frame_1
			frame_1.Parent = freecamMonitorPanel
			t_9[i] = { frame = frame_1, nameLabel = name, valueLabel = value }
		end
		local hint = Instance.new("TextLabel")
		hint.Name = "Hint"
		hint.BackgroundTransparency = 1
		hint.TextColor3 = Color3.fromRGB(120, 120, 120)
		hint.Font = Enum.Font.Gotham
		hint.TextSize = 12
		hint.TextXAlignment = Enum.TextXAlignment.Left
		hint.Size = UDim2.new(1, 0, 0, 20)
		hint.LayoutOrder = var58 + 1
		hint.Parent = freecamMonitorPanel
		freecamMonitorPanel.Parent = p52
		var56 = {
			panel = freecamMonitorPanel,
			breadcrumb = breadcrumb,
			hint = hint
		}
	end
	
	t_10 = function(p53) --[[ line: 1299 ]]
		if p53.type == "group" then
			return "\226\128\186"
		elseif p53.type == "toggle" then
			return if p53.isEnabled() then "On" else "Off"
		elseif p53.type == "axis" then
			return string.format("%.2f", p53.get())
		elseif p53.type == "cycle" then
			local var159 = p53.items()
			
			if #var159 == 0 then
				return "--"
			end
			local var160 = var159[p53.getIndex()]
			
			return var160 and p53.displayItem(var160) or "--"
		else
			return if p53.type == "action" then "" else ""
		end
	end
	
	var61 = function(p54, p55, p56) --[[ line: 1317 ]]
		return if p54.type == "toggle" then if p54.isEnabled() then Color3.fromRGB(0, 176, 111) else Color3.fromRGB(150, 150, 150) elseif p55 and p56 then Color3.new(1, 1, 1) else Color3.fromRGB(180, 180, 180)
	end
	
	var62 = function() --[[ line: 1331 ]]
		-- upvalues: var56 (write), t_6 (ref), var58 (write), t_9 (write), t_10 (write), var61 (write)
		if not var56 then return end
		local panel = var56.panel
		
		if not t_6.getModeActive() then
			panel.Visible = false
			
			return
		end
		local modes, index
		panel.Visible = true
		local _ = nil
		local _ = nil
		
		if #t_6._navigationStack > 0 then
			local var161 = t_6._navigationStack[#t_6._navigationStack]
			modes = var161.modes
			index = var161.index
		else
			modes = t_6._modes
			index = t_6._getModeIndex()
		end
		local var165
		local modeBreadcrumb = t_6.getModeBreadcrumb()
		var56.breadcrumb.Text = modeBreadcrumb
		var56.breadcrumb.Visible = modeBreadcrumb ~= ""
		local var163 = t_6._isMonitorItemSelected()
		local minValue = math.min(#modes, var58)
		
		for i = 1, var58 do
			var165 = t_9[i]
			
			if i > minValue then
				var165.frame.Visible = false
				continue
			end
			local var166 = modes[i]
			local var167 = i == index
			local var168 = var166.disabled and var166.disabled()
			var165.frame.Visible = true
			
			if var167 and not var168 then
				var165.nameLabel.Text = "> " .. var166.name
				var165.nameLabel.TextColor3 = Color3.new(1, 1, 1)
				var165.nameLabel.Font = Enum.Font.GothamMedium
				var165.frame.BackgroundTransparency = if var163 then 0.88 else 1
			elseif var168 then
				var165.nameLabel.Text = "  " .. var166.name
				var165.nameLabel.TextColor3 = Color3.fromRGB(80, 80, 80)
				var165.nameLabel.Font = Enum.Font.GothamMedium
				var165.frame.BackgroundTransparency = 1
			else
				var165.nameLabel.Text = "  " .. var166.name
				var165.nameLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
				var165.nameLabel.Font = Enum.Font.GothamMedium
				var165.frame.BackgroundTransparency = 1
			end
			var165.valueLabel.Text = t_10(var166)
			var165.valueLabel.TextColor3 = var168 and Color3.fromRGB(60, 60, 60) or var61(var166, var167, var163)
		end
		if var163 then
			var56.hint.Text = "\226\134\144\226\134\146 Adjust   \226\134\145\226\134\147 Exit selection"
			
			return
		end
		var56.hint.Text = "\226\134\145\226\134\147 Navigate   \226\134\146 Select   \226\134\144 Back"
	end
end
local function StepFreecam(p57) --[[ line: 1401 ]]
	-- upvalues: t_6 (ref), var49 (ref), var50 (ref), var51 (ref), var52 (ref), var48 (write), rad (ref), tan (ref), sqrt (ref), t (ref), clamp (ref), var41 (write), var42 (write), vector3_1 (write), vector3 (write), var35 (write), var38 (write), defaultZoom (write), defaultHeight (write), status_2_1 (write), var62 (write), var15 (write), var16 (write), var7 (write), t_3 (write), var37 (write), list_3 (ref), currentCamera (write)
	t_6.ModeControl(p57)
	local var169 = var49:Update(p57, t_6.Movement())
	local var170 = var50:Update(p57, t_6.Pan())
	local var171 = var51:Update(p57, t_6.Fov())
	local var172 = var52:Update(p57, t_6.Roll())
	local var173 = sqrt(0.70020753821 / tan(rad(var48 / 2)))
	var48 = clamp(var48 + var171 * t.Fov.Gain * (p57 / var173), 1, 120)
	
	if math.abs(var48 - var48) > 0.01 then
		var41 = os.clock()
	end
	if var169.Magnitude > 0.05 or var170.Magnitude > 0.0005 or (math.abs(var172) > 0.0005 or math.abs(var171) > 0.0005) then
		var42 = os.clock()
	end
	local var174 = var170 * t.Pan.Gain * (p57 / var173)
	vector3_1 += Vector3.new(var174.X, var174.Y, var172 * t.Roll.Gain * (p57 / var173))
	
	local function _(vectorA) --[[ line: 1423 | named "wrapAngle" ]]
		vectorA %= 6.28318530718
		
		return if vectorA > 3.14159265359 then vectorA - 6.28318530718 else vectorA
	end
	
	local var175 = vector3_1.x % 6.28318530718
	local var176 = if var175 > 3.14159265359 then var175 - 6.28318530718 else var175
	local var177 = vector3_1.y % 6.28318530718
	local var178 = vector3_1.z % 6.28318530718
	vector3_1 = Vector3.new(var176, if var177 > 3.14159265359 then var177 - 6.28318530718 else var177, if var178 > 3.14159265359 then var178 - 6.28318530718 else var178)
	local var179 = CFrame.new(vector3) * CFrame.fromOrientation(vector3_1.x, vector3_1.y, vector3_1.z) * CFrame.new(Vector3.new(var169.X, var169.Y, -var169.Z) * t.Movement.Gain * p57)
	
	if var35 and var38 and var38.Parent then
		local playerLock = t.PlayerLock
		defaultZoom = clamp(defaultZoom + -var169.Z * t.Movement.Gain.Z * p57, playerLock.MinZoom, playerLock.MaxZoom)
		defaultHeight = clamp(defaultHeight + var169.Y * t.Movement.Gain.Y * p57, -playerLock.HeightRange, playerLock.HeightRange)
		var179 = CFrame.new(var38.Position + Vector3.new(0, defaultHeight, 0)) * CFrame.fromOrientation(vector3_1.x, vector3_1.y, vector3_1.z) * CFrame.new(0, 0, defaultZoom)
	end
	if status_2_1 then
		var62()
	elseif var15 and var15.Parent and (var16 and var7) and var7.Parent then
		local mode = var16.mode
		
		if t_6.getModeActive() then
			if os.clock() - var42 < 2 then
				local t_1 = {}
				t_1[#t_1 + 1] = string.format("X: %.0f  Y: %.0f  Z: %.0f", vector3.X, vector3.Y, vector3.Z)
				t_1[#t_1 + 1] = string.format("Pitch: %.1f\194\176  Yaw: %.1f\194\176  Roll: %.1f\194\176", math.deg(vector3_1.X), math.deg(vector3_1.Y), math.deg(vector3_1.Z))
				
				if os.clock() - var41 < 2 then
					t_1[#t_1 + 1] = string.format("Field of View: %.1f", var48)
				end
				if p57 > 0 then
					local var181 = (var179.p - vector3).Magnitude / p57
					
					if var181 > 0.5 then
						t_1[#t_1 + 1] = string.format("Speed: %.1f", var181)
					end
				end
				local status = var16.status
				local joined = table.concat(t_1, "\n")
				status.bubble.Visible = joined ~= ""
				
				if joined ~= "" then
					status.label.Text = joined
				end
			else
				var16.status.bubble.Visible = false
			end
			if var35 and #t_3 > 0 and t_6.getActiveGroupName() ~= "Player Lock" then
				local lock = var16.lock
				local formattedText = string.format("Lock: %s", t_3[var37].Name)
				lock.bubble.Visible = formattedText ~= ""
				
				if formattedText ~= "" then
					lock.label.Text = formattedText
				end
			else
				var16.lock.bubble.Visible = false
			end
			local activeGroupName = t_6.getActiveGroupName()
			
			for i, v in ipairs(list_3) do
				local var189 = v.get()
				
				if var189 and var189.Enabled and activeGroupName ~= v.group then
					local key = var16[v.key]
					local var190 = v.fmt(var189)
					key.bubble.Visible = var190 ~= ""
					
					if var190 ~= "" then
						key.label.Text = var190
					end
				else
					var16[v.key].bubble.Visible = false
				end
			end
			mode.bubble.Visible = true
			local modeBreadcrumb = t_6.getModeBreadcrumb()
			mode.breadcrumb.Text = modeBreadcrumb
			mode.breadcrumb.Visible = modeBreadcrumb ~= ""
			local modeName = t_6.getModeName()
			local modeDisplay = t_6.getModeDisplay()
			mode.title.Text = if modeDisplay ~= "" then modeName .. ": " .. modeDisplay else modeName
			local modeHint = t_6.getModeHint()
			mode.nav.Text = modeHint.nav
			mode.nav.Visible = modeHint.nav ~= ""
			mode.action.Text = modeHint.action
			mode.action.Visible = modeHint.action ~= ""
			var15.Visible = true
		else
			var15.Visible = false
		end
	end
	vector3 = var179.p
	currentCamera.CFrame = var179
	currentCamera.Focus = var179
	currentCamera.FieldOfView = var48
end

t_2 = {}
local removePlayerFromList = nil
var65 = nil
color3 = nil
local StopFreecam = nil
local var81 = nil
local ToggleFreecam = nil
local t_11 = {}
local t_12 = {
	Backpack = true,
	Chat = true,
	Health = true,
	PlayerList = true
}
local t_13 = {
	BadgesNotificationsActive = true,
	PointsNotificationsActive = true
}

function t_2.Push() --[[ line: 1534 ]]
	-- upvalues: t_12 (ref), starterGuiService (ref), t_13 (ref), localPlayer (write), t_11 (write), var32 (write), var39 (write), ToggleFreecam (write), currentCamera (write), color3 (write), var81 (write), StopFreecam (write), var65 (write), userInputService (ref), removePlayerFromList (write)
	for i in pairs(t_12) do
		t_12[i] = starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType[i])
		starterGuiService:SetCoreGuiEnabled(Enum.CoreGuiType[i], false)
	end
	for i_1 in pairs(t_13) do
		t_13[i_1] = starterGuiService:GetCore(i_1)
		starterGuiService:SetCore(i_1, false)
	end
	local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
	
	if playerGui then
		for i_2, v in pairs(playerGui:GetChildren()) do
			if v:IsA("ScreenGui") and v.Enabled then
				t_11[#t_11 + 1] = v
				v.Enabled = false
			end
		end
		var32 = playerGui.ChildAdded:Connect(function(p58) --[[ line: 1551 ]]
			-- upvalues: t_11 (copy), var39 (copy)
			if p58:IsA("ScreenGui") and p58.Enabled then
				t_11[#t_11 + 1] = p58
				p58.Enabled = var39
			end
		end)
	end
	ToggleFreecam = currentCamera.FieldOfView
	currentCamera.FieldOfView = 70
	color3 = currentCamera.CameraType
	currentCamera.CameraType = Enum.CameraType.Custom
	var81 = currentCamera.CFrame
	StopFreecam = currentCamera.Focus
	var65 = userInputService.MouseIconEnabled
	userInputService.MouseIconEnabled = false
	removePlayerFromList = Enum.MouseBehavior.Default
	userInputService.MouseBehavior = Enum.MouseBehavior.Default
end

function t_2.Pop() --[[ line: 1575 ]]
	-- upvalues: t_12 (ref), starterGuiService (ref), t_13 (ref), t_11 (write), var7 (write), var32 (write), currentCamera (write), ToggleFreecam (write), color3 (write), var81 (write), StopFreecam (write), userInputService (ref), var65 (write), removePlayerFromList (write)
	for i, v in pairs(t_12) do
		starterGuiService:SetCoreGuiEnabled(Enum.CoreGuiType[i], v)
	end
	for i_1, v_1 in pairs(t_13) do
		starterGuiService:SetCore(i_1, v_1)
	end
	for i_2, v_2 in pairs(t_11) do
		if v_2.Parent and v_2 ~= var7 then
			v_2.Enabled = true
		end
	end
	if var32 then
		var32:Disconnect()
		var32 = nil
	end
	t_11 = {}
	currentCamera.FieldOfView = ToggleFreecam
	ToggleFreecam = nil
	currentCamera.CameraType = color3
	color3 = nil
	currentCamera.CFrame = var81
	var81 = nil
	currentCamera.Focus = StopFreecam
	StopFreecam = nil
	userInputService.MouseIconEnabled = var65
	var65 = nil
	userInputService.MouseBehavior = removePlayerFromList
	removePlayerFromList = nil
end

function t_2.getScreenGuis() --[[ line: 1600 ]]
	-- upvalues: t_11 (write)
	return t_11
end

removePlayerFromList = function(p59) --[[ line: 1603 | named "removePlayerFromList" ]]
	-- upvalues: t_3 (write), var37 (write), var35 (write)
	for i, v in ipairs(t_3) do
		if v == p59 then
			table.remove(t_3, i)
			
			if var37 == i and var35 then
				var35 = false
				var37 = 1
			end
			if i < var37 then
				var37 -= 1
			end
			if #t_3 >= var37 and var37 >= 1 then break end
			var37 = 1
			
			return
		end
	end
end

var65 = function() --[[ line: 1618 | named "initializePlayerList" ]]
	-- upvalues: t_3 (write), playersService (ref), localPlayer (write), var37 (write), var33 (write), var34 (write), removePlayerFromList (ref)
	t_3 = playersService:GetPlayers()
	
	for i, v in ipairs(t_3) do
		if v == localPlayer then
			var37 = i
			break
		end
	end
	var33 = playersService.PlayerAdded:Connect(function(p60) --[[ line: 1623 ]]
		-- upvalues: t_3 (copy)
		table.insert(t_3, p60)
	end)
	var34 = playersService.PlayerRemoving:Connect(removePlayerFromList)
end

color3 = function() --[[ line: 1627 | named "StartFreecam" ]]
	-- upvalues: var65 (ref), currentCamera (write), vector3_1 (write), vector3 (write), var48 (write), var49 (ref), var50 (ref), var51 (ref), var52 (ref), var7 (write), localPlayer (write), status_2_1 (write), var56 (write), var59 (write), var15 (write), var16 (write), t_2 (write), list (write), t_1 (ref), status_3_1 (write), runService (ref), StepFreecam (ref), t_6 (ref)
	var65()
	local cFrame = currentCamera.CFrame
	vector3_1 = Vector3.new(cFrame:toEulerAnglesYXZ())
	vector3 = cFrame.p
	var48 = currentCamera.FieldOfView
	var49:Reset(Vector3.new())
	var50:Reset(Vector2.new())
	var51:Reset(0)
	var52:Reset(0)
	var7 = localPlayer:WaitForChild("PlayerGui"):WaitForChild("Freecam")
	
	if status_2_1 then
		if not var56 then
			var59(var7)
		end
	elseif not var15 or not var15.Parent then
		local freecamCustomGui = Instance.new("Frame")
		freecamCustomGui.Name = "FreecamCustomGui"
		freecamCustomGui.BackgroundTransparency = 1
		freecamCustomGui.AutomaticSize = Enum.AutomaticSize.XY
		freecamCustomGui.AnchorPoint = Vector2.new(1, 1)
		freecamCustomGui.Position = UDim2.new(1, -16, 1, -16)
		freecamCustomGui.Size = UDim2.new(0, 0, 0, 0)
		freecamCustomGui.Visible = false
		local UIListLayout = Instance.new("UIListLayout")
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.FillDirection = Enum.FillDirection.Vertical
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
		UIListLayout.Padding = UDim.new(0, 6)
		UIListLayout.Parent = freecamCustomGui
		
		local function makeBubble(p61, p62) --[[ line: 1663 ]]
			-- upvalues: freecamCustomGui (ref)
			local frame = Instance.new("Frame")
			frame.Name = p61
			frame.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
			frame.BackgroundTransparency = 0.4
			frame.BorderSizePixel = 0
			frame.AutomaticSize = Enum.AutomaticSize.XY
			frame.Size = UDim2.new(0, 0, 0, 0)
			frame.LayoutOrder = p62
			frame.Visible = false
			local UICorner = Instance.new("UICorner")
			UICorner.CornerRadius = UDim.new(0, 8)
			UICorner.Parent = frame
			local UIPadding = Instance.new("UIPadding")
			UIPadding.PaddingTop = UDim.new(0, 8)
			UIPadding.PaddingBottom = UDim.new(0, 8)
			UIPadding.PaddingLeft = UDim.new(0, 12)
			UIPadding.PaddingRight = UDim.new(0, 12)
			UIPadding.Parent = frame
			local label = Instance.new("TextLabel")
			label.Name = "Label"
			label.BackgroundTransparency = 1
			label.TextColor3 = Color3.new(1, 1, 1)
			label.Font = Enum.Font.GothamMedium
			label.TextSize = 14
			label.TextXAlignment = Enum.TextXAlignment.Left
			label.AutomaticSize = Enum.AutomaticSize.XY
			label.Size = UDim2.new(0, 0, 0, 0)
			label.Parent = frame
			frame.Parent = freecamCustomGui
			
			return frame, label
		end
		
		local var195, var196 = makeBubble("BloomBubble", 1)
		local var197, var198 = makeBubble("BlurBubble", 2)
		local var199, var200 = makeBubble("CCBubble", 3)
		local var201, var202 = makeBubble("SunRaysBubble", 4)
		local var203, var204 = makeBubble("ColorGradingBubble", 5)
		local var205, var206 = makeBubble("DofBubble", 6)
		local var207, var208 = makeBubble("LockBubble", 7)
		local var209, var210 = makeBubble("StatusBubble", 8)
		local modeBubble = Instance.new("Frame")
		modeBubble.Name = "ModeBubble"
		modeBubble.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
		modeBubble.BackgroundTransparency = 0.4
		modeBubble.BorderSizePixel = 0
		modeBubble.AutomaticSize = Enum.AutomaticSize.XY
		modeBubble.Size = UDim2.new(0, 0, 0, 0)
		modeBubble.LayoutOrder = 9
		modeBubble.Visible = false
		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 8)
		UICorner.Parent = modeBubble
		local UIPadding = Instance.new("UIPadding")
		UIPadding.PaddingTop = UDim.new(0, 8)
		UIPadding.PaddingBottom = UDim.new(0, 8)
		UIPadding.PaddingLeft = UDim.new(0, 12)
		UIPadding.PaddingRight = UDim.new(0, 12)
		UIPadding.Parent = modeBubble
		local UIListLayout_1 = Instance.new("UIListLayout")
		UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_1.FillDirection = Enum.FillDirection.Vertical
		UIListLayout_1.Padding = UDim.new(0, 2)
		UIListLayout_1.Parent = modeBubble
		
		local function makeModeLabel(p63, p64, p65, p66, p67) --[[ line: 1728 ]]
			-- upvalues: modeBubble (ref)
			local textLabel = Instance.new("TextLabel")
			textLabel.Name = p63
			textLabel.BackgroundTransparency = 1
			textLabel.TextColor3 = p67
			textLabel.Font = p65
			textLabel.TextSize = p66
			textLabel.TextXAlignment = Enum.TextXAlignment.Left
			textLabel.AutomaticSize = Enum.AutomaticSize.XY
			textLabel.Size = UDim2.new(0, 0, 0, 0)
			textLabel.LayoutOrder = p64
			textLabel.Parent = modeBubble
			
			return textLabel
		end
		
		local var216 = makeModeLabel("Breadcrumb", 1, Enum.Font.Gotham, 11, Color3.fromRGB(100, 100, 100))
		local var217 = makeModeLabel("Title", 2, Enum.Font.GothamBold, 14, Color3.new(1, 1, 1))
		local var218 = makeModeLabel("NavHint", 3, Enum.Font.Gotham, 12, Color3.fromRGB(120, 120, 120))
		local var219 = makeModeLabel("ActionHint", 4, Enum.Font.GothamMedium, 12, Color3.fromRGB(200, 200, 200))
		modeBubble.Parent = freecamCustomGui
		var15 = freecamCustomGui
		var16 = {
			bloom = { bubble = var195, label = var196 },
			blur = { bubble = var197, label = var198 },
			cc = { bubble = var199, label = var200 },
			sunrays = { bubble = var201, label = var202 },
			colorgrading = { bubble = var203, label = var204 },
			dof = { bubble = var205, label = var206 },
			lock = { bubble = var207, label = var208 },
			status = { bubble = var209, label = var210 },
			mode = {
				bubble = modeBubble,
				breadcrumb = var216,
				title = var217,
				nav = var218,
				action = var219
			}
		}
		freecamCustomGui.Parent = var7
	end
	t_2.Push()
	var7.Enabled = true
	
	local function _(p68, p69) --[[ line: 1767 | named "makeEffect" ]]
		-- upvalues: currentCamera (copy)
		local var227 = Instance.new(p68)
		var227.Name = p69
		var227.Parent = currentCamera
		
		return var227
	end
	
	for i, v in ipairs(list) do
		local key = t_1[v.key]
		local var220 = Instance.new(v.class)
		var220.Name = "Freecam" .. v.key
		var220.Parent = currentCamera
		local var221 = var220
		
		if status_3_1 and v.parent then
			var221.Parent = v.parent
		end
		for i_1, v_1 in ipairs(v.props) do
			var221[v_1] = key[v_1]
		end
		var221.Enabled = key.Enabled
		v.set(var221)
	end
	runService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
	t_6.StartCapture()
end

StopFreecam = function() --[[ line: 1788 | named "StopFreecam" ]]
	-- upvalues: var33 (write), var34 (write), var35 (write), var37 (write), t_3 (write), var23 (ref), var21 (write), list (write), t_1 (ref), status_2_1 (write), var56 (write), var7 (write), var39 (write), var40 (write), t_6 (ref), runService (ref), t_2 (write)
	if var33 then
		var33:Disconnect()
		var33 = nil
	end
	if var34 then
		var34:Disconnect()
		var34 = nil
	end
	var35 = false
	var37 = 1
	t_3 = {}
	var23()
	var21 = false
	
	for i, v in ipairs(list) do
		local var228 = v.get()
		
		if var228 then
			local key = t_1[v.key]
			key.Enabled = var228.Enabled
			
			for i_1, v_1 in ipairs(v.props) do
				key[v_1] = var228[v_1]
			end
			var228:Destroy()
			v.set(nil)
		end
	end
	if status_2_1 and var56 then
		var56.panel.Visible = false
	end
	if var7 and var7.Parent then
		var7.Enabled = false
	end
	var39 = false
	var40 = false
	t_6.StopCapture()
	runService:UnbindFromRenderStep("Freecam")
	t_2.Pop()
end

var81 = false

ToggleFreecam = function() --[[ line: 1823 | named "ToggleFreecam" ]]
	-- upvalues: var81 (write), StopFreecam (ref), color3 (ref), status_1 (write), t (ref)
	if var81 then
		StopFreecam()
	else
		color3()
	end
	var81 = not var81
	
	if status_1 then
		script:SetAttribute(t.AttributeName, var81)
	end
end

var44.StateChanged:Connect(function(p70) --[[ line: 1831 ]]
	-- upvalues: var81 (write), StopFreecam (ref), color3 (ref), status_1 (write), t (ref)
	if p70 then
		if var81 then
			StopFreecam()
		else
			color3()
		end
		var81 = not var81
		
		if status_1 then
			script:SetAttribute(t.AttributeName, var81)
		end
	end
end)

if status_1 then
	script:SetAttribute(t.AttributeName, var81)
	script:GetAttributeChangedSignal(t.AttributeName):Connect(function() --[[ line: 1837 ]]
		-- upvalues: t (ref), var81 (write), color3 (ref), StopFreecam (ref)
		local attributeNameAttribute = script:GetAttribute(t.AttributeName)
		
		if typeof(attributeNameAttribute) ~= "boolean" then
			script:SetAttribute(t.AttributeName, var81)
			
			return
		elseif attributeNameAttribute ~= var81 then
			if attributeNameAttribute then
				color3()
				var81 = true
				
				return
			end
			StopFreecam()
			var81 = false
		end
	end)
end
return {}