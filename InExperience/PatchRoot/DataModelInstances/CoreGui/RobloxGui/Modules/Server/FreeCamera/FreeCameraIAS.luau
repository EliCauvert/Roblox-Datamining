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
local var19 = false
local var20, var21 = (function(p1, p2) --[[ line: 304 | named "makeEffectOverride" ]]
	-- upvalues: currentCamera (write), lightingService (ref)
	local t = {}
	local var76 = nil
	local var77 = nil
	
	local function _(p3) --[[ line: 317 | named "trySuppress" ]]
		-- upvalues: p1 (ref), p2 (ref), t (write)
		if p3:IsA(p1) and p3.Enabled and (not p2 or not p2(p3)) then
			t[#t + 1] = p3
			p3.Enabled = false
		end
	end
	
	return function() --[[ line: 324 | named "enable" ]]
		-- upvalues: t (write), currentCamera (copy), p1 (ref), p2 (ref), lightingService (copy), var76 (write), var77 (write)
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
		var76 = currentCamera.ChildAdded:Connect(function(p4) --[[ line: 328 ]]
			-- upvalues: p1 (copy), p2 (copy), t (copy)
			if p4:IsA(p1) and p4.Enabled and (not p2 or not p2(p4)) then
				t[#t + 1] = p4
				p4.Enabled = false
			end
		end)
		var77 = lightingService.ChildAdded:Connect(function(p5) --[[ line: 329 ]]
			-- upvalues: p1 (copy), p2 (copy), t (copy)
			if p5:IsA(p1) and p5.Enabled and (not p2 or not p2(p5)) then
				t[#t + 1] = p5
				p5.Enabled = false
			end
		end)
	end, function() --[[ line: 308 | named "disable" ]]
		-- upvalues: t (write), var76 (write), var77 (write)
		for i, v in ipairs(t) do
			if v.Parent then
				v.Enabled = true
			end
		end
		if var76 then
			var76:Disconnect()
			var76 = nil
		end
		if var77 then
			var77:Disconnect()
			var77 = nil
		end
		t = {}
	end
end)("PostEffect", function(p0) --[[ line: 337 ]]
	return p0.Name:sub(1, 7) == "Freecam"
end)
local list = nil

local function doToggleMasterEffects() --[[ line: 343 ]]
	-- upvalues: var19 (write), var20 (ref), var21 (ref), list (write)
	var19 = not var19
	
	if var19 then
		var20()
		
		return
	end
	var21()
	
	for i, v in ipairs(list) do
		local var78 = v.get()
		
		if var78 then
			var78.Enabled = false
		end
	end
end

local function doToggleDoF() --[[ line: 356 ]]
	-- upvalues: var8 (write)
	if var8 then
		var8.Enabled = not var8.Enabled
	end
end

local function doToggleBloom() --[[ line: 357 ]]
	-- upvalues: var9 (write)
	if var9 then
		var9.Enabled = not var9.Enabled
	end
end

local function doToggleBlur() --[[ line: 358 ]]
	-- upvalues: var10 (write)
	if var10 then
		var10.Enabled = not var10.Enabled
	end
end

local function doToggleColorCorrection() --[[ line: 359 ]]
	-- upvalues: var11 (write)
	if var11 then
		var11.Enabled = not var11.Enabled
	end
end

local function doToggleSunRays() --[[ line: 360 ]]
	-- upvalues: var12 (write)
	if var12 then
		var12.Enabled = not var12.Enabled
	end
end

local function doToggleColorGrading() --[[ line: 361 ]]
	-- upvalues: var13 (write)
	if var13 then
		var13.Enabled = not var13.Enabled
	end
end

list = {
	{
		key = "DepthOfField",
		class = "DepthOfFieldEffect",
		get = function() --[[ line: 365 ]]
			-- upvalues: var8 (write)
			return var8
		end,
		set = function(value) --[[ line: 366 ]]
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
		get = function() --[[ line: 369 ]]
			-- upvalues: var9 (write)
			return var9
		end,
		set = function(value) --[[ line: 370 ]]
			-- upvalues: var9 (write)
			var9 = value
		end,
		props = { "Intensity", "Size", "Threshold" }
	},
	{
		key = "Blur",
		class = "BlurEffect",
		get = function() --[[ line: 373 ]]
			-- upvalues: var10 (write)
			return var10
		end,
		set = function(value) --[[ line: 374 ]]
			-- upvalues: var10 (write)
			var10 = value
		end,
		props = { "Size" }
	},
	{
		key = "ColorCorrection",
		class = "ColorCorrectionEffect",
		get = function() --[[ line: 377 ]]
			-- upvalues: var11 (write)
			return var11
		end,
		set = function(value) --[[ line: 378 ]]
			-- upvalues: var11 (write)
			var11 = value
		end,
		props = { "Brightness", "Contrast", "Saturation", "TintColor" }
	},
	{
		key = "SunRays",
		class = "SunRaysEffect",
		get = function() --[[ line: 381 ]]
			-- upvalues: var12 (write)
			return var12
		end,
		set = function(value) --[[ line: 382 ]]
			-- upvalues: var12 (write)
			var12 = value
		end,
		props = { "Intensity", "Spread" }
	},
	{
		key = "ColorGrading",
		class = "ColorGradingEffect",
		get = function() --[[ line: 385 ]]
			-- upvalues: var13 (write)
			return var13
		end,
		set = function(value) --[[ line: 386 ]]
			-- upvalues: var13 (write)
			var13 = value
		end,
		props = { "TonemapperPreset" }
	}
}
local var30 = nil
local var31 = nil
local var32 = nil
local var33 = false
local defaultZoom = t.PlayerLock.DefaultZoom
local defaultHeight = t.PlayerLock.DefaultHeight
local t_3 = {}
local var35 = 1
local var36 = nil
local var37 = false
local var38 = false
local var39 = -1e999
local var40 = -1e999
local t_4 = {
	movement = t.Movement.Stiffness,
	pan = t.Pan.Stiffness,
	fov = t.Fov.Stiffness,
	roll = t.Roll.Stiffness
}
local var42 = nil
local t_5 = {}
t_5.__index = t_5

function t_5.new(p6, p7) --[[ line: 422 ]]
	-- upvalues: t_5 (ref)
	local tbl = setmetatable({}, t_5)
	tbl.f = p6
	tbl.p = p7
	tbl.v = p7 * 0
	
	return tbl
end

function t_5:Update(p8, p9) --[[ line: 430 ]]
	-- upvalues: exp (ref)
	local var80 = self.f * 2 * 3.14159265359
	local v = self.v
	local var81 = p9 - self.p
	local var82 = exp(-var80 * p8)
	local var83 = p9 + (v * p8 - var81 * (var80 * p8 + 1)) * var82
	local var84 = (var80 * p8 * (var81 * var80 - v) + v) * var82
	self.p = var83
	self.v = var84
	
	return var83
end

function t_5:SetFreq(p10) --[[ line: 443 ]]
	self.f = p10
end

function t_5:Reset(p11) --[[ line: 445 ]]
	self.p = p11
	self.v = p11 * 0
end

local vector3 = Vector3.new()
local vector3_1 = Vector3.new()
local var46 = 0
local var47 = t_5.new(t_4.movement, Vector3.new())
local var48 = t_5.new(t_4.pan, Vector2.new())
local var49 = t_5.new(t_4.fov, 0)
local var50 = t_5.new(t_4.roll, 0)
local t_6 = {}
local t_7 = {}
local t_8 = { movement = 1, pan = 1, fov = 1, roll = 1 }
local StepFreecam = false
local removePlayerFromList = nil
local initializePlayerList = false
local var57 = 1
local t_9 = {}
local var59 = false

local function findPlayerLockRootPart(p12) --[[ line: 483 ]]
	-- upvalues: t_3 (write), var35 (write), var33 (write)
	if not t_3 or #t_3 < 1 then
		return nil
	end
	for _ = 1, #t_3 do
		var35 = (var35 - 1 + p12) % #t_3 + 1
		local var85 = t_3[var35]
		local character = var85 and var85.Character
		
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
	var33 = false
	
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
local var62 = 1
local color3 = Color3.new(1, 1, 1)

local function doTogglePlayerLock() --[[ line: 517 ]]
	-- upvalues: var33 (write), defaultZoom (write), t (ref), defaultHeight (write), var36 (write), findPlayerLockRootPart (ref)
	var33 = not var33
	
	if var33 then
		defaultZoom = t.PlayerLock.DefaultZoom
		defaultHeight = t.PlayerLock.DefaultHeight
		var36 = findPlayerLockRootPart(0)
	end
end

local function doToggleScreenGuis() --[[ line: 526 ]]
	-- upvalues: var37 (write), t_2 (write), var7 (write)
	var37 = not var37
	
	if t_2 then
		for i, v in pairs(t_2.getScreenGuis()) do
			if v.Parent and v ~= var7 then
				v.Enabled = var37
			end
		end
	end
end

local function doToggleLeaderboard() --[[ line: 537 ]]
	-- upvalues: var38 (write), starterGuiService (ref)
	var38 = not var38
	starterGuiService:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, var38)
end

local function makeEffectGroup(p13, p14, p15, p16, p17) --[[ line: 549 ]]
	local list = {
		{
			type = "toggle",
			name = "Enable",
			toggle = p14,
			isEnabled = function() --[[ line: 553 ]]
				-- upvalues: p15 (ref)
				local var89 = p15()
				
				return var89 and var89.Enabled
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
			get = function() --[[ line: 559 ]]
				-- upvalues: p15 (ref), v (ref)
				local var90 = p15()
				
				return if var90 then var90[v.prop] else 0
			end,
			set = function(value) --[[ line: 560 ]]
				-- upvalues: p15 (ref), v (ref)
				local var91 = p15()
				
				if var91 then
					var91[v.prop] = value
				end
			end
		}
	end
	for i, v_1 in ipairs(p17 or {}) do
		list[#list + 1] = v_1
	end
	return { type = "group", name = p13, modes = list }
end

local function makeSpeedStiffnessGroup(p18, p19, p20, p21, p22) --[[ line: 664 ]]
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
				get = function() --[[ line: 668 ]]
					-- upvalues: t_8 (copy), p20 (ref)
					return t_8[p20]
				end,
				set = function(value) --[[ line: 669 ]]
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
				get = function() --[[ line: 672 ]]
					-- upvalues: t_4 (copy), p21 (ref)
					return t_4[p21]
				end,
				set = function(value) --[[ line: 673 ]]
					-- upvalues: t_4 (copy), p21 (ref), p22 (ref)
					t_4[p21] = value
					p22:SetFreq(value)
				end
			}
		}
	}
end

local list_2 = {
	(function() --[[ line: 569 | named "buildCustomEffectsGroup" ]]
		-- upvalues: doToggleMasterEffects (ref), var19 (write), makeEffectGroup (ref), doToggleDoF (ref), var8 (write), t (ref), doToggleBloom (ref), var9 (write), doToggleBlur (ref), var10 (write), doToggleColorCorrection (ref), var11 (write), list_1 (ref), var62 (write), color3 (write), doToggleSunRays (ref), var12 (write), doToggleColorGrading (ref), var13 (write)
		return {
			type = "group",
			name = "Custom Post Processing",
			modes = {
				{
					type = "toggle",
					name = "Enable",
					toggle = doToggleMasterEffects,
					isEnabled = function() --[[ line: 575 ]]
						-- upvalues: var19 (copy)
						return var19
					end
				},
				makeEffectGroup("Depth of Field", doToggleDoF, function() --[[ line: 576 ]]
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
				makeEffectGroup("Bloom", doToggleBloom, function() --[[ line: 582 ]]
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
				makeEffectGroup("Blur", doToggleBlur, function() --[[ line: 587 ]]
					-- upvalues: var10 (copy)
					return var10
				end, { { name = "Size", prop = "Size", adjCfg = t.Blur.Size } }),
				makeEffectGroup("Color Correction", doToggleColorCorrection, function() --[[ line: 590 ]]
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
						items = function() --[[ line: 598 ]]
							-- upvalues: list_1 (copy)
							return list_1
						end,
						getIndex = function() --[[ line: 599 ]]
							-- upvalues: var62 (copy)
							return var62
						end,
						setIndex = function(value) --[[ line: 600 ]]
							-- upvalues: var62 (copy), var11 (copy), color3 (copy), list_1 (copy)
							var62 = value
							
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
						displayItem = function(p23) --[[ line: 612 ]]
							return p23.name
						end
					},
					{
						type = "axis",
						name = "Tint R",
						adj = 0.02,
						min = 0,
						max = 1,
						get = function() --[[ line: 614 ]]
							-- upvalues: color3 (copy)
							return color3.R
						end,
						set = function(value) --[[ line: 615 ]]
							-- upvalues: color3 (copy), var62 (copy), var11 (copy)
							color3 = Color3.new(value, color3.G, color3.B)
							var62 = 1
							
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
						get = function() --[[ line: 621 ]]
							-- upvalues: color3 (copy)
							return color3.G
						end,
						set = function(value) --[[ line: 622 ]]
							-- upvalues: color3 (copy), var62 (copy), var11 (copy)
							color3 = Color3.new(color3.R, value, color3.B)
							var62 = 1
							
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
						get = function() --[[ line: 628 ]]
							-- upvalues: color3 (copy)
							return color3.B
						end,
						set = function(value) --[[ line: 629 ]]
							-- upvalues: color3 (copy), var62 (copy), var11 (copy)
							color3 = Color3.new(color3.R, color3.G, value)
							var62 = 1
							
							if var11 then
								var11.TintColor = color3
							end
						end
					}
				}),
				makeEffectGroup("Sun Rays", doToggleSunRays, function() --[[ line: 636 ]]
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
				makeEffectGroup("Color Grading", doToggleColorGrading, function() --[[ line: 640 ]]
					-- upvalues: var13 (copy)
					return var13
				end, nil, {
					{
						type = "cycle",
						name = "Tonemap",
						items = function() --[[ line: 644 ]]
							return {
								Enum.TonemapperPreset.Default,
								Enum.TonemapperPreset.Retro
							}
						end,
						getIndex = function() --[[ line: 645 ]]
							-- upvalues: var13 (copy)
							return if var13 and var13.TonemapperPreset == Enum.TonemapperPreset.Retro then 2 else 1
						end,
						setIndex = function(value) --[[ line: 651 ]]
							-- upvalues: var13 (copy)
							if var13 then
								var13.TonemapperPreset = ({
									Enum.TonemapperPreset.Default,
									Enum.TonemapperPreset.Retro
								})[value]
							end
						end,
						displayItem = function(p24) --[[ line: 657 ]]
							return p24.Name
						end
					}
				})
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
				toggle = doTogglePlayerLock,
				isEnabled = function() --[[ line: 684 ]]
					-- upvalues: var33 (write)
					return var33
				end
			},
			{
				type = "cycle",
				name = "Target",
				items = function() --[[ line: 686 ]]
					-- upvalues: t_3 (write)
					return t_3
				end,
				getIndex = function() --[[ line: 687 ]]
					-- upvalues: var35 (write)
					return var35
				end,
				setIndex = function(value) --[[ line: 688 ]]
					-- upvalues: var35 (write), t_3 (write), var36 (write)
					var35 = value
					local var92 = t_3[value]
					local character = var92 and var92.Character
					
					if character then
						local humanoid = character:FindFirstChildOfClass("Humanoid")
						var36 = if humanoid then humanoid.RootPart else nil
						
						return
					end
					var36 = nil
				end,
				displayItem = function(p25) --[[ line: 699 ]]
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
				isEnabled = function() --[[ line: 705 ]]
					-- upvalues: var37 (write)
					return var37
				end
			},
			{
				type = "toggle",
				name = "Leaderboard",
				toggle = doToggleLeaderboard,
				isEnabled = function() --[[ line: 708 ]]
					-- upvalues: var38 (write)
					return var38
				end
			}
		}
	},
	makeSpeedStiffnessGroup("Movement", t.Movement, "movement", "movement", var47),
	makeSpeedStiffnessGroup("Field of View", t.Fov, "fov", "fov", var49),
	makeSpeedStiffnessGroup("Tilt", t.Roll, "roll", "roll", var50),
	makeSpeedStiffnessGroup("Pan", t.Pan, "pan", "pan", var48)
}

local function _() --[[ line: 716 | named "currentMode" ]]
	-- upvalues: t_9 (write), list_2 (ref), var57 (write)
	if #t_9 > 0 then
		local var95 = t_9[#t_9]
		
		return var95.modes[var95.index]
	end
	return list_2[var57]
end

local function createBinding(p26, p27) --[[ line: 727 ]]
	local inputBinding = Instance.new("InputBinding")
	
	if p27.keyCode then
		inputBinding.KeyCode = p27.keyCode
	end
	if p27.up then
		inputBinding.Up = p27.up
	end
	if p27.down then
		inputBinding.Down = p27.down
	end
	if p27.left then
		inputBinding.Left = p27.left
	end
	if p27.right then
		inputBinding.Right = p27.right
	end
	if p27.scale then
		inputBinding.Scale = p27.scale
	end
	if p27.vector2Scale then
		inputBinding.Vector2Scale = p27.vector2Scale
	end
	if p27.responseCurve then
		inputBinding.ResponseCurve = p27.responseCurve
	end
	if p27.primaryModifier then
		inputBinding.PrimaryModifier = p27.primaryModifier
	end
	inputBinding.Parent = p26
	
	return inputBinding
end

local function createAction(p28, p29) --[[ line: 742 ]]
	-- upvalues: createBinding (ref)
	local inputAction = Instance.new("InputAction")
	inputAction.Name = p29.name
	inputAction.Type = p29.type
	inputAction.Parent = p28
	
	for i, v in ipairs(p29.bindings) do
		createBinding(inputAction, v)
	end
	return inputAction
end

local _ = function(p30, p31, p32) --[[ line: 754 | named "makeDoubleTapHandler" ]]
	local var98 = nil
	local var99 = 0
	
	return function(p33) --[[ line: 756 | named "detect" ]]
		-- upvalues: var98 (write), p30 (ref), var99 (write), p31 (ref), p32 (ref)
		if math.abs(p33) > 0.01 then
			local processTime = os.clock()
			
			if var98 == nil or processTime - var98 > p30 then
				var98 = processTime
			elseif p31 <= processTime - var99 then
				p32()
				var99 = processTime
			end
			var98 = nil
			
			return
		end
	end, function() --[[ line: 770 | named "reset" ]]
		-- upvalues: var98 (write)
		var98 = nil
	end
end

;(function() --[[ line: 774 | named "createIASContexts" ]]
	-- upvalues: t (ref), var42 (write), createAction (ref), t_6 (ref), t_7 (ref), removePlayerFromList (write), vector3_1 (write), var50 (ref), StepFreecam (write), initializePlayerList (write), var59 (write), t_9 (write), list_2 (ref), var57 (write)
	local actions = t.Actions
	local freecamToggleContext = Instance.new("InputContext")
	freecamToggleContext.Name = "FreecamToggleContext"
	freecamToggleContext.Priority = 3000
	freecamToggleContext.Sink = false
	freecamToggleContext.Enabled = true
	freecamToggleContext.Parent = script
	var42 = createAction(freecamToggleContext, actions.Toggle)
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
	local var103 = createAction(freecamInputContext, actions.Tilt)
	t_7.Tilt = var103
	local _ = nil
	local threshold = t.DoubleTap.Threshold
	local debounce = t.DoubleTap.Debounce
	
	local var104 = function() --[[ line: 807 ]]
		-- upvalues: vector3_1 (copy), var50 (copy), StepFreecam (copy)
		vector3_1 = Vector3.new(vector3_1.x, vector3_1.y, 0)
		var50:Reset(0)
		StepFreecam = true
	end
	
	local var105 = nil
	local var106 = 0
	
	removePlayerFromList = function() --[[ line: 770 | named "reset" ]]
		-- upvalues: var105 (write)
		var98 = nil
	end
	
	local function detect(p34) --[[ line: 756 ]]
		-- upvalues: var105 (write), threshold (ref), var106 (write), debounce (ref), var104 (ref)
		if math.abs(p34) > 0.01 then
			local processTime = os.clock()
			
			if var105 == nil or processTime - var105 > threshold then
				var105 = processTime
			elseif debounce <= processTime - var106 then
				var104()
				var106 = processTime
			end
			var105 = nil
			
			return
		end
	end
	
	var103.StateChanged:Connect(function(p35) --[[ line: 813 ]]
		-- upvalues: StepFreecam (copy), detect (write)
		if not StepFreecam then
			detect(p35)
			
			return
		elseif math.abs(p35) < 0.01 then
			StepFreecam = false
		end
	end)
	createAction(freecamInputContext, actions.ModeToggle).StateChanged:Connect(function(p36) --[[ line: 822 ]]
		-- upvalues: initializePlayerList (copy), var59 (copy), t_9 (copy)
		if not p36 then return end
		if not initializePlayerList then
			initializePlayerList = true
			
			return
		elseif var59 then
			var59 = false
			
			return
		elseif #t_9 > 0 then
			t_9[#t_9] = nil
			
			return
		end
		initializePlayerList = false
	end)
	createAction(freecamInputContext, actions.ModeNext).StateChanged:Connect(function(p37) --[[ line: 838 ]]
		-- upvalues: initializePlayerList (copy), var59 (copy), t_9 (copy), list_2 (copy), var57 (copy)
		if not p37 or not initializePlayerList then return end
		if var59 then return end
		if #t_9 > 0 then
			local var109 = t_9[#t_9]
			var109.index = var109.index % #var109.modes + 1
			
			return
		end
		local var110 = list_2[var57]
		
		if var110.type == "group" then
			table.insert(t_9, { index = 1, modes = var110.modes, groupName = var110.name })
			
			return
		elseif var110.type == "toggle" then
			var110.toggle()
			
			return
		elseif var110.type == "cycle" then
			local var111 = var110.items()
			
			if #var111 > 0 then
				var110.setIndex(var110.getIndex() % #var111 + 1)
				
				return
			end
		elseif var110.type == "action" then
			var110.action()
			
			return
		elseif var110.type == "axis" then
			var59 = true
		end
	end)
	local var108 = createAction(freecamInputContext, actions.ModeAxis)
	var108.StateChanged:Connect(function(p38) --[[ line: 863 ]]
		-- upvalues: initializePlayerList (copy), var59 (copy), t_9 (copy), list_2 (copy), var57 (copy)
		if not initializePlayerList or p38 == 0 then return end
		if var59 then return end
		if #t_9 > 0 then
			local index
			if #t_9 > 0 then
				local var112 = t_9[#t_9]
				index = var112.modes[var112.index]
			else
				index = list_2[var57]
			end
			if index.type == "group" then
				table.insert(t_9, { index = 1, modes = index.modes, groupName = index.name })
				
				return
			elseif index.type == "toggle" then
				index.toggle()
				
				return
			elseif index.type == "cycle" then
				local var113 = index.items()
				
				if #var113 == 0 then return end
				if p38 > 0 then
					index.setIndex(index.getIndex() % #var113 + 1)
					
					return
				elseif p38 < 0 then
					index.setIndex((index.getIndex() - 2) % #var113 + 1)
					
					return
				end
			elseif index.type == "action" then
				index.action()
				
				return
			end
		elseif p38 > 0 then
			var57 = var57 % #list_2 + 1
			
			return
		elseif p38 < 0 then
			var57 = (var57 - 2) % #list_2 + 1
		end
	end)
	t_7.ModeAxis = var108
end)()

function t_6.Movement() --[[ line: 899 ]]
	-- upvalues: t_7 (ref), t_8 (ref), t (ref)
	local state = t_7.MovementMove:GetState()
	
	return Vector3.new(state.X, t_7.MovementElevate:GetState(), state.Y) * (t_8.movement * (if t_7.Shift:GetState() then t.Movement.ShiftMul else 1))
end

function t_6.Pan() --[[ line: 905 ]]
	-- upvalues: t_7 (ref), t_8 (ref)
	local state = t_7.Pan:GetState()
	
	return Vector2.new(state.Y, -state.X) * t_8.pan
end

function t_6.Fov() --[[ line: 910 ]]
	-- upvalues: t_7 (ref), t_8 (ref)
	return t_7.Fov:GetState() * t_8.fov
end

function t_6.Roll() --[[ line: 914 ]]
	-- upvalues: StepFreecam (write), t_7 (ref), t_8 (ref)
	return (if StepFreecam then 0 else t_7.Tilt:GetState()) * t_8.roll
end

function t_6.ModeControl(p39) --[[ line: 918 ]]
	-- upvalues: initializePlayerList (write), t_9 (write), var59 (write), list_2 (ref), var57 (write), t_7 (ref), clamp (ref)
	local index
	if not initializePlayerList then return end
	if #t_9 == 0 and not var59 then return end
	if #t_9 > 0 then
		local var116 = t_9[#t_9]
		index = var116.modes[var116.index]
	else
		index = list_2[var57]
	end
	if index.type ~= "axis" then return end
	local var117 = t_7.ModeAxis:GetState() * index.adj * p39
	
	if var117 ~= 0 then
		index.set(clamp(index.get() + var117, index.min, index.max))
	end
end

function t_6.StartCapture() --[[ line: 929 ]]
	-- upvalues: t_6 (ref)
	t_6._sinkContext.Enabled = true
end

function t_6.StopCapture() --[[ line: 933 ]]
	-- upvalues: t_6 (ref), StepFreecam (write), removePlayerFromList (write), initializePlayerList (write), t_9 (write), var59 (write)
	t_6._sinkContext.Enabled = false
	StepFreecam = false
	
	if removePlayerFromList then
		removePlayerFromList()
	end
	initializePlayerList = false
	t_9 = {}
	var59 = false
end

function t_6.getModeActive() --[[ line: 942 ]]
	-- upvalues: initializePlayerList (write)
	return initializePlayerList
end

function t_6.getModeName() --[[ line: 944 ]]
	-- upvalues: t_9 (write), list_2 (ref), var57 (write)
	local index
	if #t_9 > 0 then
		local var118 = t_9[#t_9]
		index = var118.modes[var118.index]
	else
		index = list_2[var57]
	end
	return index.name
end

function t_6.getModeBreadcrumb() --[[ line: 948 ]]
	-- upvalues: t_9 (write)
	if #t_9 == 0 then
		return ""
	end
	local t = {}
	
	for i, v in ipairs(t_9) do
		table.insert(t, v.groupName)
	end
	return table.concat(t, " \226\128\186 ")
end

function t_6.getModeDisplay() --[[ line: 956 ]]
	-- upvalues: t_9 (write), list_2 (ref), var57 (write)
	local index
	if #t_9 > 0 then
		local var120 = t_9[#t_9]
		index = var120.modes[var120.index]
	else
		index = list_2[var57]
	end
	if index.type == "group" then
		return ""
	elseif index.type == "axis" then
		return string.format("%.2f", index.get())
	elseif index.type == "toggle" then
		return if index.isEnabled() then "ON" else "OFF"
	elseif index.type == "cycle" then
		local var121 = index.items()
		
		if #var121 == 0 then
			return "None"
		end
		local var122 = var121[index.getIndex()]
		
		return var122 and index.displayItem(var122) or "None"
	else
		return if index.type == "action" then "(fire)" else ""
	end
end

function t_6.getModeHint() --[[ line: 975 ]]
	-- upvalues: list_2 (ref), var57 (write), t_9 (write), var59 (write)
	local var123 = list_2[var57]
	
	local function _(p40) --[[ line: 978 | named "lrVerb" ]]
		return if p40 == "axis" then "Hold to adjust" elseif p40 == "toggle" then "Tap to flip" elseif p40 == "cycle" then "Tap to cycle" elseif p40 == "action" then "Tap to fire" elseif p40 == "group" then "Enter" else nil
	end
	
	if #t_9 > 0 then
		local index
		local var124 = t_9[#t_9]
		local text = "[\226\134\145] Back  [\226\134\147] " .. var124.modes[var124.index % #var124.modes + 1].name
		
		if #t_9 > 0 then
			local var126 = t_9[#t_9]
			index = var126.modes[var126.index]
		else
			index = list_2[var57]
		end
		index = index.type
		local var127 = if index == "axis" then "Hold to adjust" elseif index == "toggle" then "Tap to flip" elseif index == "cycle" then "Tap to cycle" elseif index == "action" then "Tap to fire" elseif index == "group" then "Enter" else nil
		
		return {
			nav = text,
			action = if var127 then "[\226\134\144][\226\134\146] " .. var127 else ""
		}
	elseif var59 then
		local type = var123.type
		local var128 = if type == "axis" then "Hold to adjust" elseif type == "toggle" then "Tap to flip" elseif type == "cycle" then "Tap to cycle" elseif type == "action" then "Tap to fire" elseif type == "group" then "Enter" else nil
		
		return {
			nav = "[\226\134\145] Back",
			action = if var128 then "[\226\134\144][\226\134\146] " .. var128 else ""
		}
	end
	local type = var123.type
	
	return {
		nav = "[\226\134\145] Close  [\226\134\147] " .. (if type == "group" then "Enter" elseif type == "toggle" then "Flip" elseif type == "cycle" then "Cycle" elseif type == "action" then "Fire" elseif type == "axis" then "Adjust" else "Select"),
		action = "[\226\134\144] " .. list_2[(var57 - 2) % #list_2 + 1].name .. "  [\226\134\146] " .. list_2[var57 % #list_2 + 1].name
	}
end

function t_6.getTintColorName() --[[ line: 1017 ]]
	-- upvalues: var62 (write), list_1 (ref)
	return if var62 >= 1 and var62 <= #list_1 then list_1[var62].name else "Custom"
end

function t_6.getActiveGroupName() --[[ line: 1023 ]]
	-- upvalues: initializePlayerList (write), t_9 (write)
	return if initializePlayerList and #t_9 ~= 0 then t_9[1].groupName else nil
end

local list_3 = {
	{
		key = "bloom",
		group = "Custom Post Processing",
		get = function() --[[ line: 1032 ]]
			-- upvalues: var9 (write)
			return var9
		end,
		fmt = function(p41) --[[ line: 1033 ]]
			return string.format("Intensity: %.2f  Size: %.1f\nThreshold: %.2f", p41.Intensity, p41.Size, p41.Threshold)
		end
	},
	{
		key = "blur",
		group = "Custom Post Processing",
		get = function() --[[ line: 1035 ]]
			-- upvalues: var10 (write)
			return var10
		end,
		fmt = function(p42) --[[ line: 1036 ]]
			return string.format("Size: %.1f", p42.Size)
		end
	},
	{
		key = "cc",
		group = "Custom Post Processing",
		get = function() --[[ line: 1037 ]]
			-- upvalues: var11 (write)
			return var11
		end,
		fmt = function(p43) --[[ line: 1038 ]]
			-- upvalues: t_6 (ref)
			return string.format("Brightness: %.2f  Contrast: %.2f\nSaturation: %.2f  Tint: %s", p43.Brightness, p43.Contrast, p43.Saturation, t_6.getTintColorName())
		end
	},
	{
		key = "sunrays",
		group = "Custom Post Processing",
		get = function() --[[ line: 1040 ]]
			-- upvalues: var12 (write)
			return var12
		end,
		fmt = function(p44) --[[ line: 1041 ]]
			return string.format("Intensity: %.2f  Spread: %.2f", p44.Intensity, p44.Spread)
		end
	},
	{
		key = "colorgrading",
		group = "Custom Post Processing",
		get = function() --[[ line: 1043 ]]
			-- upvalues: var13 (write)
			return var13
		end,
		fmt = function(p45) --[[ line: 1044 ]]
			return string.format("Color Grading: %s", p45.TonemapperPreset.Name)
		end
	},
	{
		key = "dof",
		group = "Custom Post Processing",
		get = function() --[[ line: 1045 ]]
			-- upvalues: var8 (write)
			return var8
		end,
		fmt = function(p46) --[[ line: 1046 ]]
			return string.format("Far: %.2f  Near: %.2f\nDistance: %.1f  Radius: %.1f", p46.FarIntensity, p46.NearIntensity, p46.FocusDistance, p46.InFocusRadius)
		end
	}
}

local _ = function(value, p47) --[[ line: 1050 | named "setBubble" ]]
	value.bubble.Visible = p47 ~= ""
	
	if p47 ~= "" then
		value.label.Text = p47
	end
end

StepFreecam = function(p48) --[[ line: 1055 | named "StepFreecam" ]]
	-- upvalues: t_6 (ref), var47 (ref), var48 (ref), var49 (ref), var50 (ref), var46 (write), rad (ref), tan (ref), sqrt (ref), t (ref), clamp (ref), var39 (write), var40 (write), vector3_1 (write), vector3 (write), var33 (write), var36 (write), defaultZoom (write), defaultHeight (write), var15 (write), var16 (write), var7 (write), t_3 (write), var35 (write), list_3 (ref), currentCamera (write)
	t_6.ModeControl(p48)
	local var129 = var47:Update(p48, t_6.Movement())
	local var130 = var48:Update(p48, t_6.Pan())
	local var131 = var49:Update(p48, t_6.Fov())
	local var132 = var50:Update(p48, t_6.Roll())
	local var133 = sqrt(0.70020753821 / tan(rad(var46 / 2)))
	var46 = clamp(var46 + var131 * t.Fov.Gain * (p48 / var133), 1, 120)
	
	if math.abs(var46 - var46) > 0.01 then
		var39 = os.clock()
	end
	if var129.Magnitude > 0.05 or var130.Magnitude > 0.0005 or (math.abs(var132) > 0.0005 or math.abs(var131) > 0.0005) then
		var40 = os.clock()
	end
	local var134 = var130 * t.Pan.Gain * (p48 / var133)
	vector3_1 += Vector3.new(var134.X, var134.Y, var132 * t.Roll.Gain * (p48 / var133))
	
	local function _(vectorA) --[[ line: 1077 | named "wrapAngle" ]]
		vectorA %= 6.28318530718
		
		return if vectorA > 3.14159265359 then vectorA - 6.28318530718 else vectorA
	end
	
	local var135 = vector3_1.x % 6.28318530718
	local var136 = if var135 > 3.14159265359 then var135 - 6.28318530718 else var135
	local var137 = vector3_1.y % 6.28318530718
	local var138 = vector3_1.z % 6.28318530718
	vector3_1 = Vector3.new(var136, if var137 > 3.14159265359 then var137 - 6.28318530718 else var137, if var138 > 3.14159265359 then var138 - 6.28318530718 else var138)
	local var139 = CFrame.new(vector3) * CFrame.fromOrientation(vector3_1.x, vector3_1.y, vector3_1.z) * CFrame.new(Vector3.new(var129.X, var129.Y, -var129.Z) * t.Movement.Gain * p48)
	
	if var33 and var36 and var36.Parent then
		local playerLock = t.PlayerLock
		defaultZoom = clamp(defaultZoom + -var129.Z * t.Movement.Gain.Z * p48, playerLock.MinZoom, playerLock.MaxZoom)
		defaultHeight = clamp(defaultHeight + var129.Y * t.Movement.Gain.Y * p48, -playerLock.HeightRange, playerLock.HeightRange)
		var139 = CFrame.new(var36.Position + Vector3.new(0, defaultHeight, 0)) * CFrame.fromOrientation(vector3_1.x, vector3_1.y, vector3_1.z) * CFrame.new(0, 0, defaultZoom)
	end
	if var15 and var15.Parent and (var16 and var7) and var7.Parent then
		local mode = var16.mode
		
		if t_6.getModeActive() then
			if os.clock() - var40 < 2 then
				local t_1 = {}
				t_1[#t_1 + 1] = string.format("X: %.0f  Y: %.0f  Z: %.0f", vector3.X, vector3.Y, vector3.Z)
				t_1[#t_1 + 1] = string.format("Pitch: %.1f\194\176  Yaw: %.1f\194\176  Roll: %.1f\194\176", math.deg(vector3_1.X), math.deg(vector3_1.Y), math.deg(vector3_1.Z))
				
				if os.clock() - var39 < 2 then
					t_1[#t_1 + 1] = string.format("Field of View: %.1f", var46)
				end
				if p48 > 0 then
					local var141 = (var139.p - vector3).Magnitude / p48
					
					if var141 > 0.5 then
						t_1[#t_1 + 1] = string.format("Speed: %.1f", var141)
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
			if var33 and #t_3 > 0 and t_6.getActiveGroupName() ~= "Player Lock" then
				local lock = var16.lock
				local formattedText = string.format("Lock: %s", t_3[var35].Name)
				lock.bubble.Visible = formattedText ~= ""
				
				if formattedText ~= "" then
					lock.label.Text = formattedText
				end
			else
				var16.lock.bubble.Visible = false
			end
			local activeGroupName = t_6.getActiveGroupName()
			
			for i, v in ipairs(list_3) do
				local var149 = v.get()
				
				if var149 and var149.Enabled and activeGroupName ~= v.group then
					local key = var16[v.key]
					local var150 = v.fmt(var149)
					key.bubble.Visible = var150 ~= ""
					
					if var150 ~= "" then
						key.label.Text = var150
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
	vector3 = var139.p
	currentCamera.CFrame = var139
	currentCamera.Focus = var139
	currentCamera.FieldOfView = var46
end

t_2 = {}
removePlayerFromList = nil
initializePlayerList = nil
var57 = nil
t_9 = nil
var59 = nil
local ToggleFreecam = nil
local t_10 = {}
var62 = {
	Backpack = true,
	Chat = true,
	Health = true,
	PlayerList = true
}
color3 = {
	BadgesNotificationsActive = true,
	PointsNotificationsActive = true
}

function t_2.Push() --[[ line: 1186 ]]
	-- upvalues: var62 (ref), starterGuiService (ref), color3 (ref), localPlayer (write), t_10 (write), var30 (write), var37 (write), ToggleFreecam (write), currentCamera (write), var57 (write), var59 (write), t_9 (write), initializePlayerList (write), userInputService (ref), removePlayerFromList (write)
	for i in pairs(var62) do
		var62[i] = starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType[i])
		starterGuiService:SetCoreGuiEnabled(Enum.CoreGuiType[i], false)
	end
	for i_1 in pairs(color3) do
		color3[i_1] = starterGuiService:GetCore(i_1)
		starterGuiService:SetCore(i_1, false)
	end
	local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
	
	if playerGui then
		for i_2, v in pairs(playerGui:GetChildren()) do
			if v:IsA("ScreenGui") and v.Enabled then
				t_10[#t_10 + 1] = v
				v.Enabled = false
			end
		end
		var30 = playerGui.ChildAdded:Connect(function(p49) --[[ line: 1203 ]]
			-- upvalues: t_10 (copy), var37 (copy)
			if p49:IsA("ScreenGui") and p49.Enabled then
				t_10[#t_10 + 1] = p49
				p49.Enabled = var37
			end
		end)
	end
	ToggleFreecam = currentCamera.FieldOfView
	currentCamera.FieldOfView = 70
	var57 = currentCamera.CameraType
	currentCamera.CameraType = Enum.CameraType.Custom
	var59 = currentCamera.CFrame
	t_9 = currentCamera.Focus
	initializePlayerList = userInputService.MouseIconEnabled
	userInputService.MouseIconEnabled = false
	removePlayerFromList = Enum.MouseBehavior.Default
	userInputService.MouseBehavior = Enum.MouseBehavior.Default
end

function t_2.Pop() --[[ line: 1227 ]]
	-- upvalues: var62 (ref), starterGuiService (ref), color3 (ref), t_10 (write), var7 (write), var30 (write), currentCamera (write), ToggleFreecam (write), var57 (write), var59 (write), t_9 (write), userInputService (ref), initializePlayerList (write), removePlayerFromList (write)
	for i, v in pairs(var62) do
		starterGuiService:SetCoreGuiEnabled(Enum.CoreGuiType[i], v)
	end
	for i_1, v_1 in pairs(color3) do
		starterGuiService:SetCore(i_1, v_1)
	end
	for i_2, v_2 in pairs(t_10) do
		if v_2.Parent and v_2 ~= var7 then
			v_2.Enabled = true
		end
	end
	if var30 then
		var30:Disconnect()
		var30 = nil
	end
	t_10 = {}
	currentCamera.FieldOfView = ToggleFreecam
	ToggleFreecam = nil
	currentCamera.CameraType = var57
	var57 = nil
	currentCamera.CFrame = var59
	var59 = nil
	currentCamera.Focus = t_9
	t_9 = nil
	userInputService.MouseIconEnabled = initializePlayerList
	initializePlayerList = nil
	userInputService.MouseBehavior = removePlayerFromList
	removePlayerFromList = nil
end

function t_2.getScreenGuis() --[[ line: 1252 ]]
	-- upvalues: t_10 (write)
	return t_10
end

removePlayerFromList = function(p50) --[[ line: 1255 | named "removePlayerFromList" ]]
	-- upvalues: t_3 (write), var35 (write), var33 (write)
	for i, v in ipairs(t_3) do
		if v == p50 then
			table.remove(t_3, i)
			
			if var35 == i and var33 then
				var33 = false
				var35 = 1
			end
			if i < var35 then
				var35 -= 1
			end
			if #t_3 >= var35 and var35 >= 1 then break end
			var35 = 1
			
			return
		end
	end
end

initializePlayerList = function() --[[ line: 1270 | named "initializePlayerList" ]]
	-- upvalues: t_3 (write), playersService (ref), localPlayer (write), var35 (write), var31 (write), var32 (write), removePlayerFromList (ref)
	t_3 = playersService:GetPlayers()
	
	for i, v in ipairs(t_3) do
		if v == localPlayer then
			var35 = i
			break
		end
	end
	var31 = playersService.PlayerAdded:Connect(function(p51) --[[ line: 1275 ]]
		-- upvalues: t_3 (copy)
		table.insert(t_3, p51)
	end)
	var32 = playersService.PlayerRemoving:Connect(removePlayerFromList)
end

var57 = function() --[[ line: 1279 | named "StartFreecam" ]]
	-- upvalues: initializePlayerList (ref), currentCamera (write), vector3_1 (write), vector3 (write), var46 (write), var47 (ref), var48 (ref), var49 (ref), var50 (ref), var7 (write), localPlayer (write), var15 (write), var16 (write), t_2 (write), list (write), t_1 (ref), runService (ref), StepFreecam (ref), t_6 (ref)
	initializePlayerList()
	local cFrame = currentCamera.CFrame
	vector3_1 = Vector3.new(cFrame:toEulerAnglesYXZ())
	vector3 = cFrame.p
	var46 = currentCamera.FieldOfView
	var47:Reset(Vector3.new())
	var48:Reset(Vector2.new())
	var49:Reset(0)
	var50:Reset(0)
	var7 = localPlayer:WaitForChild("PlayerGui"):WaitForChild("Freecam")
	
	if not var15 or not var15.Parent then
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
		
		local function makeBubble(p52, p53) --[[ line: 1311 ]]
			-- upvalues: freecamCustomGui (ref)
			local frame = Instance.new("Frame")
			frame.Name = p52
			frame.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
			frame.BackgroundTransparency = 0.4
			frame.BorderSizePixel = 0
			frame.AutomaticSize = Enum.AutomaticSize.XY
			frame.Size = UDim2.new(0, 0, 0, 0)
			frame.LayoutOrder = p53
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
		
		local var155, var156 = makeBubble("BloomBubble", 1)
		local var157, var158 = makeBubble("BlurBubble", 2)
		local var159, var160 = makeBubble("CCBubble", 3)
		local var161, var162 = makeBubble("SunRaysBubble", 4)
		local var163, var164 = makeBubble("ColorGradingBubble", 5)
		local var165, var166 = makeBubble("DofBubble", 6)
		local var167, var168 = makeBubble("LockBubble", 7)
		local var169, var170 = makeBubble("StatusBubble", 8)
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
		
		local function makeModeLabel(p54, p55, p56, p57, p58) --[[ line: 1376 ]]
			-- upvalues: modeBubble (ref)
			local textLabel = Instance.new("TextLabel")
			textLabel.Name = p54
			textLabel.BackgroundTransparency = 1
			textLabel.TextColor3 = p58
			textLabel.Font = p56
			textLabel.TextSize = p57
			textLabel.TextXAlignment = Enum.TextXAlignment.Left
			textLabel.AutomaticSize = Enum.AutomaticSize.XY
			textLabel.Size = UDim2.new(0, 0, 0, 0)
			textLabel.LayoutOrder = p55
			textLabel.Parent = modeBubble
			
			return textLabel
		end
		
		local var176 = makeModeLabel("Breadcrumb", 1, Enum.Font.Gotham, 11, Color3.fromRGB(100, 100, 100))
		local var177 = makeModeLabel("Title", 2, Enum.Font.GothamBold, 14, Color3.new(1, 1, 1))
		local var178 = makeModeLabel("NavHint", 3, Enum.Font.Gotham, 12, Color3.fromRGB(120, 120, 120))
		local var179 = makeModeLabel("ActionHint", 4, Enum.Font.GothamMedium, 12, Color3.fromRGB(200, 200, 200))
		modeBubble.Parent = freecamCustomGui
		var15 = freecamCustomGui
		var16 = {
			bloom = { bubble = var155, label = var156 },
			blur = { bubble = var157, label = var158 },
			cc = { bubble = var159, label = var160 },
			sunrays = { bubble = var161, label = var162 },
			colorgrading = { bubble = var163, label = var164 },
			dof = { bubble = var165, label = var166 },
			lock = { bubble = var167, label = var168 },
			status = { bubble = var169, label = var170 },
			mode = {
				bubble = modeBubble,
				breadcrumb = var176,
				title = var177,
				nav = var178,
				action = var179
			}
		}
		freecamCustomGui.Parent = var7
	end
	t_2.Push()
	var7.Enabled = true
	
	local function _(p59, p60) --[[ line: 1415 | named "makeEffect" ]]
		-- upvalues: currentCamera (copy)
		local var187 = Instance.new(p59)
		var187.Name = p60
		var187.Parent = currentCamera
		
		return var187
	end
	
	for i, v in ipairs(list) do
		local key = t_1[v.key]
		local var180 = Instance.new(v.class)
		var180.Name = "Freecam" .. v.key
		var180.Parent = currentCamera
		local var181 = var180
		
		for i_1, v_1 in ipairs(v.props) do
			var181[v_1] = key[v_1]
		end
		var181.Enabled = key.Enabled
		v.set(var181)
	end
	runService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
	t_6.StartCapture()
end

t_9 = function() --[[ line: 1433 | named "StopFreecam" ]]
	-- upvalues: var31 (write), var32 (write), var33 (write), var35 (write), t_3 (write), var21 (ref), var19 (write), list (write), t_1 (ref), var7 (write), var37 (write), var38 (write), t_6 (ref), runService (ref), t_2 (write)
	if var31 then
		var31:Disconnect()
		var31 = nil
	end
	if var32 then
		var32:Disconnect()
		var32 = nil
	end
	var33 = false
	var35 = 1
	t_3 = {}
	var21()
	var19 = false
	
	for i, v in ipairs(list) do
		local var188 = v.get()
		
		if var188 then
			local key = t_1[v.key]
			key.Enabled = var188.Enabled
			
			for i_1, v_1 in ipairs(v.props) do
				key[v_1] = var188[v_1]
			end
			var188:Destroy()
			v.set(nil)
		end
	end
	if var7 and var7.Parent then
		var7.Enabled = false
	end
	var37 = false
	var38 = false
	t_6.StopCapture()
	runService:UnbindFromRenderStep("Freecam")
	t_2.Pop()
end

var59 = false

ToggleFreecam = function() --[[ line: 1467 | named "ToggleFreecam" ]]
	-- upvalues: var59 (write), t_9 (ref), var57 (ref), status_1 (write), t (ref)
	if var59 then
		t_9()
	else
		var57()
	end
	var59 = not var59
	
	if status_1 then
		script:SetAttribute(t.AttributeName, var59)
	end
end

var42.StateChanged:Connect(function(p61) --[[ line: 1475 ]]
	-- upvalues: var59 (write), t_9 (ref), var57 (ref), status_1 (write), t (ref)
	if p61 then
		if var59 then
			t_9()
		else
			var57()
		end
		var59 = not var59
		
		if status_1 then
			script:SetAttribute(t.AttributeName, var59)
		end
	end
end)

if status_1 then
	script:SetAttribute(t.AttributeName, var59)
	script:GetAttributeChangedSignal(t.AttributeName):Connect(function() --[[ line: 1481 ]]
		-- upvalues: t (ref), var59 (write), var57 (ref), t_9 (ref)
		local attributeNameAttribute = script:GetAttribute(t.AttributeName)
		
		if typeof(attributeNameAttribute) ~= "boolean" then
			script:SetAttribute(t.AttributeName, var59)
			
			return
		elseif attributeNameAttribute ~= var59 then
			if attributeNameAttribute then
				var57()
				var59 = true
				
				return
			end
			t_9()
			var59 = false
		end
	end)
end
return {}