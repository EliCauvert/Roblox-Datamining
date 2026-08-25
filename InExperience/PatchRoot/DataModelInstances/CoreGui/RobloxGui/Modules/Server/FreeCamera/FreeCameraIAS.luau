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
local _ = nil
local ok, status = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamIASRefactor1")
end)
local status_1 = ok and status
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
		Threshold = {
			Adj = 0.05,
			Min = if status_1 then 0.8 else 0,
			Max = if status_1 then 4 else 1
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
local var8 = nil
local currentCamera = workspaceService.CurrentCamera
workspaceService:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: workspaceService (ref), currentCamera (write)
	local currentCamera_1 = workspaceService.CurrentCamera
	
	if currentCamera_1 then
		currentCamera = currentCamera_1
	end
end)
local var9 = nil
local var10 = nil
local var11 = nil
local var12 = nil
local var13 = nil
local var14 = nil
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
local var16 = nil
local var17 = nil
local t_2 = nil
local _ = nil
local ok_1, status_2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserShowGuiHideToggles")
end)
local status_2_1 = ok_1 and status_2
local _ = nil
local ok_2, status_3 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserPlayerScriptsRefactor4")
end)
local status_3_1 = ok_2 and status_3
local _ = nil
local ok_3, status_4 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserPlayerScriptsRefactor5")
end)
local status_4_1 = ok_3 and status_4
local _ = nil
local ok_4, status_5 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamIASRefactor2")
end)
local status_5_1 = ok_4 and status_5
local _ = nil
local ok_5, status_6 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamIASRefactor3")
end)
local status_6_1 = ok_5 and status_6
local var24 = false
local var25, var26 = (function(p1, p2)
	-- upvalues: currentCamera (write), lightingService (ref)
	local t = {}
	local var91 = nil
	local var92 = nil
	
	local function _(p3)
		-- upvalues: p1 (ref), p2 (ref), t (write)
		if p3:IsA(p1) and p3.Enabled and (not p2 or not p2(p3)) then
			t[#t + 1] = p3
			p3.Enabled = false
		end
	end
	
	return function()
		-- upvalues: t (write), currentCamera (copy), p1 (ref), p2 (ref), lightingService (copy), var91 (write), var92 (write)
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
		var91 = currentCamera.ChildAdded:Connect(function(p4)
			-- upvalues: p1 (copy), p2 (copy), t (copy)
			if p4:IsA(p1) and p4.Enabled and (not p2 or not p2(p4)) then
				t[#t + 1] = p4
				p4.Enabled = false
			end
		end)
		var92 = lightingService.ChildAdded:Connect(function(p5)
			-- upvalues: p1 (copy), p2 (copy), t (copy)
			if p5:IsA(p1) and p5.Enabled and (not p2 or not p2(p5)) then
				t[#t + 1] = p5
				p5.Enabled = false
			end
		end)
	end, function()
		-- upvalues: t (write), var91 (write), var92 (write)
		for i, v in ipairs(t) do
			if v.Parent then
				v.Enabled = true
			end
		end
		if var91 then
			var91:Disconnect()
			var91 = nil
		end
		if var92 then
			var92:Disconnect()
			var92 = nil
		end
		t = {}
	end
end)("PostEffect", function(p0)
	return p0.Name:sub(1, 7) == "Freecam"
end)
local list = nil

local function doToggleMasterEffects()
	-- upvalues: var24 (write), var25 (ref), var26 (ref), list (write)
	var24 = not var24
	
	if var24 then
		var25()
		
		return
	end
	var26()
	
	for i, v in ipairs(list) do
		local var93 = v.get()
		
		if var93 then
			var93.Enabled = false
		end
	end
end

local function doToggleDoF()
	-- upvalues: status_3_1 (write), var24 (write), var9 (write)
	if status_3_1 and not var24 then return end
	if var9 then
		var9.Enabled = not var9.Enabled
	end
end

local function doToggleBloom()
	-- upvalues: status_3_1 (write), var24 (write), var10 (write)
	if status_3_1 and not var24 then return end
	if var10 then
		var10.Enabled = not var10.Enabled
	end
end

local function doToggleBlur()
	-- upvalues: status_3_1 (write), var24 (write), var11 (write)
	if status_3_1 and not var24 then return end
	if var11 then
		var11.Enabled = not var11.Enabled
	end
end

local function doToggleColorCorrection()
	-- upvalues: status_3_1 (write), var24 (write), var12 (write)
	if status_3_1 and not var24 then return end
	if var12 then
		var12.Enabled = not var12.Enabled
	end
end

local function doToggleSunRays()
	-- upvalues: status_3_1 (write), var24 (write), var13 (write)
	if status_3_1 and not var24 then return end
	if var13 then
		var13.Enabled = not var13.Enabled
	end
end

local function doToggleColorGrading()
	-- upvalues: status_3_1 (write), var24 (write), var14 (write)
	if status_3_1 and not var24 then return end
	if var14 then
		var14.Enabled = not var14.Enabled
	end
end

list = {
	{
		key = "DepthOfField",
		class = "DepthOfFieldEffect",
		get = function()
			-- upvalues: var9 (write)
			return var9
		end,
		set = function(value)
			-- upvalues: var9 (write)
			var9 = value
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
			-- upvalues: var10 (write)
			return var10
		end,
		set = function(value)
			-- upvalues: var10 (write)
			var10 = value
		end,
		props = { "Intensity", "Size", "Threshold" }
	},
	{
		key = "Blur",
		class = "BlurEffect",
		get = function()
			-- upvalues: var11 (write)
			return var11
		end,
		set = function(value)
			-- upvalues: var11 (write)
			var11 = value
		end,
		props = { "Size" }
	},
	{
		key = "ColorCorrection",
		class = "ColorCorrectionEffect",
		get = function()
			-- upvalues: var12 (write)
			return var12
		end,
		set = function(value)
			-- upvalues: var12 (write)
			var12 = value
		end,
		props = { "Brightness", "Contrast", "Saturation", "TintColor" }
	},
	{
		key = "SunRays",
		class = "SunRaysEffect",
		get = function()
			-- upvalues: var13 (write)
			return var13
		end,
		set = function(value)
			-- upvalues: var13 (write)
			var13 = value
		end,
		props = { "Intensity", "Spread" }
	},
	{
		key = "ColorGrading",
		class = "ColorGradingEffect",
		parent = if status_4_1 then lightingService else nil,
		get = function()
			-- upvalues: var14 (write)
			return var14
		end,
		set = function(value)
			-- upvalues: var14 (write)
			var14 = value
		end,
		props = { "TonemapperPreset" }
	}
}
local var35 = nil
local var36 = nil
local var37 = nil
local var38 = false
local defaultZoom = t.PlayerLock.DefaultZoom
local defaultHeight = t.PlayerLock.DefaultHeight
local t_3 = {}
local var40 = 1
local var41 = nil
local var42 = false
local var43 = false
local var44 = -1e999
local var45 = -1e999
local t_4 = {
	movement = t.Movement.Stiffness,
	pan = t.Pan.Stiffness,
	fov = t.Fov.Stiffness,
	roll = t.Roll.Stiffness
}
local var47 = nil
local t_5 = {}
t_5.__index = t_5

function t_5.new(p6, p7)
	-- upvalues: t_5 (ref)
	local tbl = setmetatable({}, t_5)
	tbl.f = p6
	tbl.p = p7
	tbl.v = p7 * 0
	
	return tbl
end

function t_5:Update(p8, p9)
	-- upvalues: exp (ref)
	local var95 = self.f * 2 * 3.14159265359
	local v = self.v
	local var96 = p9 - self.p
	local var97 = exp(-var95 * p8)
	local var98 = p9 + (v * p8 - var96 * (var95 * p8 + 1)) * var97
	local var99 = (var95 * p8 * (var96 * var95 - v) + v) * var97
	self.p = var98
	self.v = var99
	
	return var98
end

function t_5:SetFreq(p10)
	self.f = p10
end

function t_5:Reset(p11)
	self.p = p11
	self.v = p11 * 0
end

local vector3 = Vector3.new()
local vector3_1 = Vector3.new()
local var51 = 0
local var52 = t_5.new(t_4.movement, Vector3.new())
local var53 = t_5.new(t_4.pan, Vector2.new())
local var54 = t_5.new(t_4.fov, 0)
local var55 = t_5.new(t_4.roll, 0)
local t_6 = {}
local t_7 = {}
local t_8 = { movement = 1, pan = 1, fov = 1, roll = 1 }
local var59 = false
local t_9 = nil
local var61 = false
local var62 = 1
local t_10 = {}
local var64 = false
local var65 = false

local function findPlayerLockRootPart(p12)
	-- upvalues: t_3 (write), var40 (write), var38 (write)
	if not t_3 or #t_3 < 1 then
		return nil
	end
	for _ = 1, #t_3 do
		var40 = (var40 - 1 + p12) % #t_3 + 1
		local var100 = t_3[var40]
		local character = var100 and var100.Character
		
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
	var38 = false
	
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
local var68 = 1
local color3 = Color3.new(1, 1, 1)

local function doTogglePlayerLock()
	-- upvalues: var38 (write), defaultZoom (write), t (ref), defaultHeight (write), var41 (write), findPlayerLockRootPart (ref)
	var38 = not var38
	
	if var38 then
		defaultZoom = t.PlayerLock.DefaultZoom
		defaultHeight = t.PlayerLock.DefaultHeight
		var41 = findPlayerLockRootPart(0)
	end
end

local function doToggleScreenGuis()
	-- upvalues: var42 (write), t_2 (write), var8 (write)
	var42 = not var42
	
	if t_2 then
		for i, v in pairs(t_2.getScreenGuis()) do
			if v.Parent and v ~= var8 then
				v.Enabled = var42
			end
		end
	end
end

local function doToggleLeaderboard()
	-- upvalues: var43 (write), starterGuiService (ref)
	var43 = not var43
	starterGuiService:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, var43)
end

local function makeEffectGroup(p13, p14, p15, p16, p17)
	local list = {
		{
			type = "toggle",
			name = "Enable",
			toggle = p14,
			isEnabled = function()
				-- upvalues: p15 (ref)
				local var104 = p15()
				
				return var104 and var104.Enabled
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
			get = function()
				-- upvalues: p15 (ref), v (ref)
				local var105 = p15()
				
				return if var105 then var105[v.prop] else 0
			end,
			set = function(value)
				-- upvalues: p15 (ref), v (ref)
				local var106 = p15()
				
				if var106 then
					var106[v.prop] = value
				end
			end
		}
	end
	for i, v_1 in ipairs(p17 or {}) do
		list[#list + 1] = v_1
	end
	return { type = "group", name = p13, modes = list }
end

local function makeTintChannel(p18)
	-- upvalues: status_5_1 (write), var12 (write), color3 (write), var68 (write)
	return if status_5_1 then {
		type = "axis",
		adj = 64,
		min = 0,
		max = 255,
		format = "%.0f",
		name = "Tint " .. p18,
		get = function()
			-- upvalues: var12 (copy), color3 (copy), p18 (ref)
			return (if var12 then var12.TintColor else color3)[p18] * 255
		end,
		set = function(value)
			-- upvalues: var12 (copy), color3 (copy), p18 (ref), var68 (copy)
			local var107 = if var12 then var12.TintColor else color3
			local r = var107.R
			local g = var107.G
			local b = var107.B
			
			if p18 == "R" then
				r = value / 255
			elseif p18 == "G" then
				g = value / 255
			else
				b = value / 255
			end
			color3 = Color3.new(r, g, b)
			var68 = 1
			
			if var12 then
				var12.TintColor = color3
			end
		end
	} else {
		type = "axis",
		adj = 0.02,
		min = 0,
		max = 1,
		name = "Tint " .. p18,
		get = function()
			-- upvalues: color3 (copy), p18 (ref)
			return color3[p18]
		end,
		set = function(value)
			-- upvalues: color3 (copy), p18 (ref), var68 (copy), var12 (copy)
			local r = color3.R
			local g = color3.G
			local b = color3.B
			
			if p18 == "R" then
				r = value
			elseif p18 == "G" then
				g = value
			else
				b = value
			end
			color3 = Color3.new(r, g, b)
			var68 = 1
			
			if var12 then
				var12.TintColor = color3
			end
		end
	}
end

local function makeSpeedStiffnessGroup(p19, p20, p21, p22, p23)
	-- upvalues: t_8 (ref), t_4 (ref)
	return {
		type = "group",
		name = p19,
		modes = {
			{
				type = "axis",
				name = "Speed",
				adj = p20.AdjSpeed,
				min = p20.MinSpeed,
				max = p20.MaxSpeed,
				get = function()
					-- upvalues: t_8 (copy), p21 (ref)
					return t_8[p21]
				end,
				set = function(value)
					-- upvalues: t_8 (copy), p21 (ref)
					t_8[p21] = value
				end
			},
			{
				type = "axis",
				name = "Stiffness",
				adj = p20.AdjStiffness,
				min = p20.MinStiffness,
				max = p20.MaxStiffness,
				get = function()
					-- upvalues: t_4 (copy), p22 (ref)
					return t_4[p22]
				end,
				set = function(value)
					-- upvalues: t_4 (copy), p22 (ref), p23 (ref)
					t_4[p22] = value
					p23:SetFreq(value)
				end
			}
		}
	}
end

local list_2 = {
	(function()
		-- upvalues: doToggleMasterEffects (ref), var24 (write), makeEffectGroup (ref), doToggleDoF (ref), var9 (write), t (ref), doToggleBloom (ref), var10 (write), doToggleBlur (ref), var11 (write), doToggleColorCorrection (ref), var12 (write), list_1 (ref), var68 (write), color3 (write), status_5_1 (write), makeTintChannel (ref), doToggleSunRays (ref), var13 (write), doToggleColorGrading (ref), var14 (write), status_3_1 (write)
		local t_1 = {
			type = "group",
			name = "Custom Post Processing",
			modes = {
				{
					type = "toggle",
					name = "Enable",
					toggle = doToggleMasterEffects,
					isEnabled = function()
						-- upvalues: var24 (copy)
						return var24
					end
				},
				makeEffectGroup("Depth of Field", doToggleDoF, function()
					-- upvalues: var9 (copy)
					return var9
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
				makeEffectGroup("Bloom", doToggleBloom, function()
					-- upvalues: var10 (copy)
					return var10
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
				makeEffectGroup("Blur", doToggleBlur, function()
					-- upvalues: var11 (copy)
					return var11
				end, { { name = "Size", prop = "Size", adjCfg = t.Blur.Size } }),
				makeEffectGroup("Color Correction", doToggleColorCorrection, function()
					-- upvalues: var12 (copy)
					return var12
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
						items = function()
							-- upvalues: list_1 (copy)
							return list_1
						end,
						getIndex = function()
							-- upvalues: var68 (copy)
							return var68
						end,
						setIndex = function(value)
							-- upvalues: var68 (copy), var12 (copy), color3 (copy), list_1 (copy), status_5_1 (copy)
							var68 = value
							
							if var12 then
								if value == 1 then
									var12.TintColor = color3
									
									return
								end
								local color = list_1[value].color
								var12.TintColor = color
								
								if not status_5_1 then
									color3 = color
								end
							end
						end,
						displayItem = function(p24)
							return p24.name
						end
					},
					makeTintChannel("R"),
					makeTintChannel("G"),
					makeTintChannel("B")
				}),
				makeEffectGroup("Sun Rays", doToggleSunRays, function()
					-- upvalues: var13 (copy)
					return var13
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
				makeEffectGroup("Color Grading", doToggleColorGrading, function()
					-- upvalues: var14 (copy)
					return var14
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
						getIndex = function()
							-- upvalues: var14 (copy)
							return if var14 and var14.TonemapperPreset == Enum.TonemapperPreset.Retro then 2 else 1
						end,
						setIndex = function(value)
							-- upvalues: var14 (copy)
							if var14 then
								var14.TonemapperPreset = ({
									Enum.TonemapperPreset.Default,
									Enum.TonemapperPreset.Retro
								})[value]
							end
						end,
						displayItem = function(p25)
							return p25.Name
						end
					}
				})
			}
		}
		
		if status_3_1 then
			for i = 2, #t_1.modes do
				t_1.modes[i].disabled = function()
					-- upvalues: var24 (copy)
					return not var24
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
				isEnabled = function()
					-- upvalues: var38 (write)
					return var38
				end
			},
			{
				type = "cycle",
				name = "Target",
				items = function()
					-- upvalues: t_3 (write)
					return t_3
				end,
				getIndex = function()
					-- upvalues: var40 (write)
					return var40
				end,
				setIndex = function(value)
					-- upvalues: var40 (write), t_3 (write), var41 (write)
					var40 = value
					local var109 = t_3[value]
					local character = var109 and var109.Character
					
					if character then
						local humanoid = character:FindFirstChildOfClass("Humanoid")
						var41 = if humanoid then humanoid.RootPart else nil
						
						return
					end
					var41 = nil
				end,
				displayItem = function(p26)
					return p26.Name
				end
			}
		}
	},
	{
		type = "group",
		name = if status_6_1 then "UI Visibility" else "UI",
		modes = {
			{
				type = "toggle",
				name = "Screen GUIs",
				toggle = doToggleScreenGuis,
				isEnabled = function()
					-- upvalues: var42 (write)
					return var42
				end
			},
			{
				type = "toggle",
				name = "Leaderboard",
				toggle = doToggleLeaderboard,
				isEnabled = function()
					-- upvalues: var43 (write)
					return var43
				end
			}
		}
	},
	makeSpeedStiffnessGroup("Movement", t.Movement, "movement", "movement", var52),
	makeSpeedStiffnessGroup("Field of View", t.Fov, "fov", "fov", var54),
	makeSpeedStiffnessGroup(if status_6_1 then "Roll" else "Tilt", t.Roll, "roll", "roll", var55),
	makeSpeedStiffnessGroup(if status_6_1 then "Rotation" else "Pan", t.Pan, "pan", "pan", var53)
}

if status_6_1 then
	list_2 = {
		list_2[4], list_2[7], list_2[6], list_2[5], list_2[1], list_2[2], list_2[3]
	}
end
local isDisabled = nil
local nextEnabledIndex = nil

if status_3_1 then
	isDisabled = function(p27)
		return p27.disabled and p27.disabled()
	end
	
	nextEnabledIndex = function(p28, p29, p30)
		-- upvalues: isDisabled (write)
		local p28Count = #p28
		
		for _ = 1, p28Count do
			p29 = (p29 - 1 + p30) % p28Count + 1
			
			if isDisabled(p28[p29]) then
				continue
			end
			return p29
		end
		return p29
	end
end
local function _()
	-- upvalues: t_10 (write), list_2 (write), var62 (write)
	if #t_10 > 0 then
		local var113 = t_10[#t_10]
		
		return var113.modes[var113.index]
	end
	return list_2[var62]
end

local function createBinding(p31, p32)
	local inputBinding = Instance.new("InputBinding")
	
	if p32.keyCode then
		inputBinding.KeyCode = p32.keyCode
	end
	if p32.up then
		inputBinding.Up = p32.up
	end
	if p32.down then
		inputBinding.Down = p32.down
	end
	if p32.left then
		inputBinding.Left = p32.left
	end
	if p32.right then
		inputBinding.Right = p32.right
	end
	if p32.scale then
		inputBinding.Scale = p32.scale
	end
	if p32.vector2Scale then
		inputBinding.Vector2Scale = p32.vector2Scale
	end
	if p32.responseCurve then
		inputBinding.ResponseCurve = p32.responseCurve
	end
	if p32.primaryModifier then
		inputBinding.PrimaryModifier = p32.primaryModifier
	end
	inputBinding.Parent = p31
	
	return inputBinding
end

local function createAction(p33, p34)
	-- upvalues: createBinding (ref)
	local inputAction = Instance.new("InputAction")
	inputAction.Name = p34.name
	inputAction.Type = p34.type
	inputAction.Parent = p33
	
	for i, v in ipairs(p34.bindings) do
		createBinding(inputAction, v)
	end
	return inputAction
end

local _ = function(p35, p36, p37)
	local var116 = nil
	local var117 = 0
	
	return function(p38)
		-- upvalues: var116 (write), p35 (ref), var117 (write), p36 (ref), p37 (ref)
		if math.abs(p38) > 0.01 then
			local processTime = os.clock()
			
			if var116 == nil or processTime - var116 > p35 then
				var116 = processTime
			elseif p36 <= processTime - var117 then
				p37()
				var117 = processTime
			end
			var116 = nil
			
			return
		end
	end, function()
		-- upvalues: var116 (write)
		var116 = nil
	end
end

;(function()
	-- upvalues: t (ref), var47 (write), createAction (ref), t_6 (ref), t_7 (ref), t_9 (write), vector3_1 (write), var55 (ref), var59 (write), status_3_1 (write), var61 (write), var65 (write), t_10 (write), nextEnabledIndex (write), list_2 (write), var62 (write), var64 (write), isDisabled (write)
	local actions = t.Actions
	local freecamToggleContext = Instance.new("InputContext")
	freecamToggleContext.Name = "FreecamToggleContext"
	freecamToggleContext.Priority = 3000
	freecamToggleContext.Sink = false
	freecamToggleContext.Enabled = true
	freecamToggleContext.Parent = script
	var47 = createAction(freecamToggleContext, actions.Toggle)
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
	local var121 = createAction(freecamInputContext, actions.Tilt)
	t_7.Tilt = var121
	local _ = nil
	local threshold = t.DoubleTap.Threshold
	local debounce = t.DoubleTap.Debounce
	
	local var122 = function()
		-- upvalues: vector3_1 (copy), var55 (copy), var59 (copy)
		vector3_1 = Vector3.new(vector3_1.x, vector3_1.y, 0)
		var55:Reset(0)
		var59 = true
	end
	
	local var123 = nil
	local var124 = 0
	
	t_9 = function()
		-- upvalues: var123 (write)
		var116 = nil
	end
	
	local function detect(p39)
		-- upvalues: var123 (write), threshold (ref), var124 (write), debounce (ref), var122 (ref)
		if math.abs(p39) > 0.01 then
			local processTime = os.clock()
			
			if var123 == nil or processTime - var123 > threshold then
				var123 = processTime
			elseif debounce <= processTime - var124 then
				var122()
				var124 = processTime
			end
			var123 = nil
			
			return
		end
	end
	
	var121.StateChanged:Connect(function(p40)
		-- upvalues: var59 (copy), detect (write)
		if not var59 then
			detect(p40)
			
			return
		elseif math.abs(p40) < 0.01 then
			var59 = false
		end
	end)
	createAction(freecamInputContext, actions.ModeToggle).StateChanged:Connect(function(p41)
		-- upvalues: status_3_1 (copy), var61 (copy), var65 (copy), t_10 (copy), nextEnabledIndex (copy), list_2 (copy), var62 (copy), var64 (copy)
		if not p41 then return end
		if status_3_1 then
			if not var61 then
				var61 = true
				
				return
			elseif var65 then
				var65 = false
				
				return
			elseif #t_10 > 0 then
				local var127 = t_10[#t_10]
				local var128 = nextEnabledIndex(var127.modes, var127.index, -1)
				
				if var128 < var127.index then
					var127.index = var128
					
					return
				end
				t_10[#t_10] = nil
				
				return
			else
				local var129 = nextEnabledIndex(list_2, var62, -1)
				
				if var129 < var62 then
					var62 = var129
					
					return
				end
				var61 = false
				
				return
			end
		elseif not var61 then
			var61 = true
			
			return
		elseif var64 then
			var64 = false
			
			return
		elseif #t_10 > 0 then
			t_10[#t_10] = nil
			
			return
		end
		var61 = false
	end)
	createAction(freecamInputContext, actions.ModeNext).StateChanged:Connect(function(p42)
		-- upvalues: status_3_1 (copy), var61 (copy), var65 (copy), t_10 (copy), nextEnabledIndex (copy), var62 (copy), list_2 (copy), var64 (copy)
		if not p42 then return end
		if status_3_1 then
			if not var61 then
				var61 = true
				
				return
			elseif var65 then
				var65 = false
				
				return
			elseif #t_10 > 0 then
				local var130 = t_10[#t_10]
				var130.index = nextEnabledIndex(var130.modes, var130.index, 1)
				
				return
			end
			var62 = nextEnabledIndex(list_2, var62, 1)
			
			return
		elseif not var61 then return end
		if var64 then return end
		if #t_10 > 0 then
			local var131 = t_10[#t_10]
			var131.index = var131.index % #var131.modes + 1
			
			return
		end
		local var132 = list_2[var62]
		
		if var132.type == "group" then
			table.insert(t_10, { index = 1, modes = var132.modes, groupName = var132.name })
			
			return
		elseif var132.type == "toggle" then
			var132.toggle()
			
			return
		elseif var132.type == "cycle" then
			local var133 = var132.items()
			
			if #var133 > 0 then
				var132.setIndex(var132.getIndex() % #var133 + 1)
				
				return
			end
		elseif var132.type == "action" then
			var132.action()
			
			return
		elseif var132.type == "axis" then
			var64 = true
		end
	end)
	local var126 = createAction(freecamInputContext, actions.ModeAxis)
	var126.StateChanged:Connect(function(p43)
		-- upvalues: var61 (copy), status_3_1 (copy), t_10 (copy), list_2 (copy), var62 (copy), var65 (copy), isDisabled (copy), var64 (copy)
		local index
		if not var61 or p43 == 0 then return end
		if status_3_1 then
			if #t_10 > 0 then
				local var134 = t_10[#t_10]
				index = var134.modes[var134.index]
			else
				index = list_2[var62]
			end
			if var65 then
				if index.type == "toggle" then
					index.toggle()
					
					return
				elseif index.type == "cycle" then
					local var135 = index.items()
					
					if #var135 <= 0 then return end
					if p43 > 0 then
						index.setIndex(index.getIndex() % #var135 + 1)
						
						return
					end
					index.setIndex((index.getIndex() - 2) % #var135 + 1)
					
					return
				elseif index.type == "action" then
					index.action()
					
					return
				elseif index.type == "axis" then
					return
				end
			elseif p43 > 0 then
				if isDisabled(index) then return end
				if index.type == "group" then
					table.insert(t_10, { index = 1, modes = index.modes, groupName = index.name })
					
					return
				elseif index.type == "action" then
					index.action()
					
					return
				end
				var65 = true
				
				return
			elseif p43 >= 0 then return end
			var65 = false
			
			if #t_10 > 0 then
				t_10[#t_10] = nil
				
				return
			end
			var61 = false
			
			return
		elseif var64 then return end
		if #t_10 > 0 then
			if #t_10 > 0 then
				local var136 = t_10[#t_10]
				index = var136.modes[var136.index]
			else
				index = list_2[var62]
			end
			if index.type == "group" then
				table.insert(t_10, { index = 1, modes = index.modes, groupName = index.name })
				
				return
			elseif index.type == "toggle" then
				index.toggle()
				
				return
			elseif index.type == "cycle" then
				local var137 = index.items()
				
				if #var137 == 0 then return end
				if p43 > 0 then
					index.setIndex(index.getIndex() % #var137 + 1)
					
					return
				elseif p43 < 0 then
					index.setIndex((index.getIndex() - 2) % #var137 + 1)
					
					return
				end
			elseif index.type == "action" then
				index.action()
				
				return
			end
		elseif p43 > 0 then
			var62 = var62 % #list_2 + 1
			
			return
		elseif p43 < 0 then
			var62 = (var62 - 2) % #list_2 + 1
		end
	end)
	t_7.ModeAxis = var126
end)()

function t_6.Movement()
	-- upvalues: t_7 (ref), t_8 (ref), t (ref)
	local state = t_7.MovementMove:GetState()
	
	return Vector3.new(state.X, t_7.MovementElevate:GetState(), state.Y) * (t_8.movement * (if t_7.Shift:GetState() then t.Movement.ShiftMul else 1))
end

function t_6.Pan()
	-- upvalues: t_7 (ref), t_8 (ref)
	local state = t_7.Pan:GetState()
	
	return Vector2.new(state.Y, -state.X) * t_8.pan
end

function t_6.Fov()
	-- upvalues: t_7 (ref), t_8 (ref)
	return t_7.Fov:GetState() * t_8.fov
end

function t_6.Roll()
	-- upvalues: var59 (write), t_7 (ref), t_8 (ref)
	return (if var59 then 0 else t_7.Tilt:GetState()) * t_8.roll
end

function t_6.ModeControl(p44)
	-- upvalues: var61 (write), status_3_1 (write), var65 (write), t_10 (write), var64 (write), list_2 (write), var62 (write), t_7 (ref), clamp (ref)
	local index
	if not var61 then return end
	if status_3_1 then
		if not var65 then return end
	elseif #t_10 == 0 and not var64 then return end
	if #t_10 > 0 then
		local var140 = t_10[#t_10]
		index = var140.modes[var140.index]
	else
		index = list_2[var62]
	end
	if index.type ~= "axis" then return end
	local var141 = t_7.ModeAxis:GetState() * index.adj * p44
	
	if var141 ~= 0 then
		index.set(clamp(index.get() + var141, index.min, index.max))
	end
end

function t_6.StartCapture()
	-- upvalues: t_6 (ref)
	t_6._sinkContext.Enabled = true
end

function t_6.StopCapture()
	-- upvalues: t_6 (ref), var59 (write), t_9 (write), var61 (write), status_3_1 (write), t_10 (write), var65 (write), var64 (write)
	t_6._sinkContext.Enabled = false
	var59 = false
	
	if t_9 then
		t_9()
	end
	var61 = false
	
	if status_3_1 then
		table.clear(t_10)
		var65 = false
	else
		t_10 = {}
	end
	var64 = false
end

function t_6.getModeActive()
	-- upvalues: var61 (write)
	return var61
end

function t_6.getModeName()
	-- upvalues: t_10 (write), list_2 (write), var62 (write)
	local index
	if #t_10 > 0 then
		local var142 = t_10[#t_10]
		index = var142.modes[var142.index]
	else
		index = list_2[var62]
	end
	return index.name
end

function t_6.getModeBreadcrumb()
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

function t_6.getModeDisplay()
	-- upvalues: t_10 (write), list_2 (write), var62 (write), status_5_1 (write)
	local index
	if #t_10 > 0 then
		local var144 = t_10[#t_10]
		index = var144.modes[var144.index]
	else
		index = list_2[var62]
	end
	if index.type == "group" then
		return ""
	elseif index.type == "axis" then
		return string.format(if status_5_1 then index.format else "%.2f", index.get())
	elseif index.type == "toggle" then
		return if index.isEnabled() then "ON" else "OFF"
	elseif index.type == "cycle" then
		local var145 = index.items()
		
		if #var145 == 0 then
			return "None"
		end
		local var146 = var145[index.getIndex()]
		
		return var146 and index.displayItem(var146) or "None"
	else
		return if index.type == "action" then "(fire)" else ""
	end
end

function t_6.getModeHint()
	-- upvalues: list_2 (write), var62 (write), t_10 (write), var64 (write)
	local var147 = list_2[var62]
	
	local function _(p45)
		return if p45 == "axis" then "Hold to adjust" elseif p45 == "toggle" then "Tap to flip" elseif p45 == "cycle" then "Tap to cycle" elseif p45 == "action" then "Tap to fire" elseif p45 == "group" then "Enter" else nil
	end
	
	if #t_10 > 0 then
		local index
		local var148 = t_10[#t_10]
		local text = "[\226\134\145] Back  [\226\134\147] " .. var148.modes[var148.index % #var148.modes + 1].name
		
		if #t_10 > 0 then
			local var150 = t_10[#t_10]
			index = var150.modes[var150.index]
		else
			index = list_2[var62]
		end
		index = index.type
		local var151 = if index == "axis" then "Hold to adjust" elseif index == "toggle" then "Tap to flip" elseif index == "cycle" then "Tap to cycle" elseif index == "action" then "Tap to fire" elseif index == "group" then "Enter" else nil
		
		return {
			nav = text,
			action = if var151 then "[\226\134\144][\226\134\146] " .. var151 else ""
		}
	elseif var64 then
		local type = var147.type
		local var152 = if type == "axis" then "Hold to adjust" elseif type == "toggle" then "Tap to flip" elseif type == "cycle" then "Tap to cycle" elseif type == "action" then "Tap to fire" elseif type == "group" then "Enter" else nil
		
		return {
			nav = "[\226\134\145] Back",
			action = if var152 then "[\226\134\144][\226\134\146] " .. var152 else ""
		}
	end
	local type = var147.type
	
	return {
		nav = "[\226\134\145] Close  [\226\134\147] " .. (if type == "group" then "Enter" elseif type == "toggle" then "Flip" elseif type == "cycle" then "Cycle" elseif type == "action" then "Fire" elseif type == "axis" then "Adjust" else "Select"),
		action = "[\226\134\144] " .. list_2[(var62 - 2) % #list_2 + 1].name .. "  [\226\134\146] " .. list_2[var62 % #list_2 + 1].name
	}
end

function t_6.getTintColorName()
	-- upvalues: var68 (write), list_1 (ref)
	return if var68 >= 1 and var68 <= #list_1 then list_1[var68].name else "Custom"
end

function t_6.getActiveGroupName()
	-- upvalues: var61 (write), t_10 (write)
	return if var61 and #t_10 ~= 0 then t_10[1].groupName else nil
end

if status_3_1 then
	t_6._navigationStack = t_10
	t_6._modes = list_2
	
	function t_6._getModeIndex()
		-- upvalues: var62 (write)
		return var62
	end
	
	function t_6._isMonitorItemSelected()
		-- upvalues: var65 (write)
		return var65
	end
end
local list_3 = {
	{
		key = "bloom",
		group = "Custom Post Processing",
		get = function()
			-- upvalues: var10 (write)
			return var10
		end,
		fmt = function(p46)
			return string.format("Intensity: %.2f  Size: %.1f\nThreshold: %.2f", p46.Intensity, p46.Size, p46.Threshold)
		end
	},
	{
		key = "blur",
		group = "Custom Post Processing",
		get = function()
			-- upvalues: var11 (write)
			return var11
		end,
		fmt = function(p47)
			return string.format("Size: %.1f", p47.Size)
		end
	},
	{
		key = "cc",
		group = "Custom Post Processing",
		get = function()
			-- upvalues: var12 (write)
			return var12
		end,
		fmt = function(p48)
			-- upvalues: t_6 (ref)
			return string.format("Brightness: %.2f  Contrast: %.2f\nSaturation: %.2f  Tint: %s", p48.Brightness, p48.Contrast, p48.Saturation, t_6.getTintColorName())
		end
	},
	{
		key = "sunrays",
		group = "Custom Post Processing",
		get = function()
			-- upvalues: var13 (write)
			return var13
		end,
		fmt = function(p49)
			return string.format("Intensity: %.2f  Spread: %.2f", p49.Intensity, p49.Spread)
		end
	},
	{
		key = "colorgrading",
		group = "Custom Post Processing",
		get = function()
			-- upvalues: var14 (write)
			return var14
		end,
		fmt = function(p50)
			return string.format("Color Grading: %s", p50.TonemapperPreset.Name)
		end
	},
	{
		key = "dof",
		group = "Custom Post Processing",
		get = function()
			-- upvalues: var9 (write)
			return var9
		end,
		fmt = function(p51)
			return string.format("Far: %.2f  Near: %.2f\nDistance: %.1f  Radius: %.1f", p51.FarIntensity, p51.NearIntensity, p51.FocusDistance, p51.InFocusRadius)
		end
	}
}

local _ = function(value, p52)
	value.bubble.Visible = p52 ~= ""
	
	if p52 ~= "" then
		value.label.Text = p52
	end
end

var59 = nil
t_9 = nil
var61 = nil
var62 = nil
t_10 = nil
var64 = nil
var65 = nil

if status_3_1 then
	t_9 = {}
	var61 = 12
	
	var62 = function(p53)
		-- upvalues: t_9 (write), var61 (write), var59 (write)
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
		
		for i = 1, var61 do
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
		hint.LayoutOrder = var61 + 1
		hint.Parent = freecamMonitorPanel
		freecamMonitorPanel.Parent = p53
		var59 = {
			panel = freecamMonitorPanel,
			breadcrumb = breadcrumb,
			hint = hint
		}
	end
	
	t_10 = function(p54)
		-- upvalues: status_5_1 (write)
		if p54.type == "group" then
			return "\226\128\186"
		elseif p54.type == "toggle" then
			return if p54.isEnabled() then "On" else "Off"
		elseif p54.type == "axis" then
			return string.format(if status_5_1 then p54.format else "%.2f", p54.get())
		elseif p54.type == "cycle" then
			local var164 = p54.items()
			
			if #var164 == 0 then
				return "--"
			end
			local var165 = var164[p54.getIndex()]
			
			return var165 and p54.displayItem(var165) or "--"
		else
			return if p54.type == "action" then "" else ""
		end
	end
	
	var64 = function(p55, p56, p57)
		return if p55.type == "toggle" then if p55.isEnabled() then Color3.fromRGB(0, 176, 111) else Color3.fromRGB(150, 150, 150) elseif p56 and p57 then Color3.new(1, 1, 1) else Color3.fromRGB(180, 180, 180)
	end
	
	var65 = function()
		-- upvalues: var59 (write), t_6 (ref), var61 (write), t_9 (write), t_10 (write), var64 (write), status_6_1 (write)
		if not var59 then return end
		local panel = var59.panel
		
		if not t_6.getModeActive() then
			panel.Visible = false
			
			return
		end
		local modes, index
		panel.Visible = true
		local _ = nil
		local _ = nil
		
		if #t_6._navigationStack > 0 then
			local var166 = t_6._navigationStack[#t_6._navigationStack]
			modes = var166.modes
			index = var166.index
		else
			modes = t_6._modes
			index = t_6._getModeIndex()
		end
		local var170
		local modeBreadcrumb = t_6.getModeBreadcrumb()
		var59.breadcrumb.Text = modeBreadcrumb
		var59.breadcrumb.Visible = modeBreadcrumb ~= ""
		local var168 = t_6._isMonitorItemSelected()
		local minValue = math.min(#modes, var61)
		
		for i = 1, var61 do
			var170 = t_9[i]
			
			if i > minValue then
				var170.frame.Visible = false
				continue
			end
			local var171 = modes[i]
			local var172 = i == index
			local var173 = var171.disabled and var171.disabled()
			var170.frame.Visible = true
			
			if var172 and not var173 then
				var170.nameLabel.Text = "> " .. var171.name
				var170.nameLabel.TextColor3 = Color3.new(1, 1, 1)
				var170.nameLabel.Font = Enum.Font.GothamMedium
				var170.frame.BackgroundTransparency = if var168 then 0.88 else 1
			elseif var173 then
				var170.nameLabel.Text = "  " .. var171.name
				var170.nameLabel.TextColor3 = Color3.fromRGB(80, 80, 80)
				var170.nameLabel.Font = Enum.Font.GothamMedium
				var170.frame.BackgroundTransparency = 1
			else
				var170.nameLabel.Text = "  " .. var171.name
				var170.nameLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
				var170.nameLabel.Font = Enum.Font.GothamMedium
				var170.frame.BackgroundTransparency = 1
			end
			var170.valueLabel.Text = t_10(var171)
			var170.valueLabel.TextColor3 = var173 and Color3.fromRGB(60, 60, 60) or var64(var171, var172, var168)
		end
		if not var168 then
			var59.hint.Text = "\226\134\145\226\134\147 Navigate   \226\134\146 Select   \226\134\144 Back"
			
			return
		elseif status_6_1 then
			var59.hint.Text = "\226\134\145\226\134\147 Exit selection   \226\134\144\226\134\146 Adjust"
			
			return
		end
		var59.hint.Text = "\226\134\144\226\134\146 Adjust   \226\134\145\226\134\147 Exit selection"
	end
end
local function StepFreecam(p58)
	-- upvalues: t_6 (ref), var52 (ref), var53 (ref), var54 (ref), var55 (ref), var51 (write), rad (ref), tan (ref), sqrt (ref), t (ref), clamp (ref), var44 (write), var45 (write), vector3_1 (write), vector3 (write), var38 (write), var41 (write), defaultZoom (write), defaultHeight (write), status_3_1 (write), var65 (write), var16 (write), var17 (write), var8 (write), t_3 (write), var40 (write), list_3 (ref), currentCamera (write)
	t_6.ModeControl(p58)
	local var174 = var52:Update(p58, t_6.Movement())
	local var175 = var53:Update(p58, t_6.Pan())
	local var176 = var54:Update(p58, t_6.Fov())
	local var177 = var55:Update(p58, t_6.Roll())
	local var178 = sqrt(0.70020753821 / tan(rad(var51 / 2)))
	var51 = clamp(var51 + var176 * t.Fov.Gain * (p58 / var178), 1, 120)
	
	if math.abs(var51 - var51) > 0.01 then
		var44 = os.clock()
	end
	if var174.Magnitude > 0.05 or var175.Magnitude > 0.0005 or (math.abs(var177) > 0.0005 or math.abs(var176) > 0.0005) then
		var45 = os.clock()
	end
	local var179 = var175 * t.Pan.Gain * (p58 / var178)
	vector3_1 += Vector3.new(var179.X, var179.Y, var177 * t.Roll.Gain * (p58 / var178))
	
	local function _(vectorA)
		vectorA %= 6.28318530718
		
		return if vectorA > 3.14159265359 then vectorA - 6.28318530718 else vectorA
	end
	
	local var180 = vector3_1.x % 6.28318530718
	local var181 = if var180 > 3.14159265359 then var180 - 6.28318530718 else var180
	local var182 = vector3_1.y % 6.28318530718
	local var183 = vector3_1.z % 6.28318530718
	vector3_1 = Vector3.new(var181, if var182 > 3.14159265359 then var182 - 6.28318530718 else var182, if var183 > 3.14159265359 then var183 - 6.28318530718 else var183)
	local var184 = CFrame.new(vector3) * CFrame.fromOrientation(vector3_1.x, vector3_1.y, vector3_1.z) * CFrame.new(Vector3.new(var174.X, var174.Y, -var174.Z) * t.Movement.Gain * p58)
	
	if var38 and var41 and var41.Parent then
		local playerLock = t.PlayerLock
		defaultZoom = clamp(defaultZoom + -var174.Z * t.Movement.Gain.Z * p58, playerLock.MinZoom, playerLock.MaxZoom)
		defaultHeight = clamp(defaultHeight + var174.Y * t.Movement.Gain.Y * p58, -playerLock.HeightRange, playerLock.HeightRange)
		var184 = CFrame.new(var41.Position + Vector3.new(0, defaultHeight, 0)) * CFrame.fromOrientation(vector3_1.x, vector3_1.y, vector3_1.z) * CFrame.new(0, 0, defaultZoom)
	end
	if status_3_1 then
		var65()
	elseif var16 and var16.Parent and (var17 and var8) and var8.Parent then
		local mode = var17.mode
		
		if t_6.getModeActive() then
			if os.clock() - var45 < 2 then
				local t_1 = {}
				t_1[#t_1 + 1] = string.format("X: %.0f  Y: %.0f  Z: %.0f", vector3.X, vector3.Y, vector3.Z)
				t_1[#t_1 + 1] = string.format("Pitch: %.1f\194\176  Yaw: %.1f\194\176  Roll: %.1f\194\176", math.deg(vector3_1.X), math.deg(vector3_1.Y), math.deg(vector3_1.Z))
				
				if os.clock() - var44 < 2 then
					t_1[#t_1 + 1] = string.format("Field of View: %.1f", var51)
				end
				if p58 > 0 then
					local var186 = (var184.p - vector3).Magnitude / p58
					
					if var186 > 0.5 then
						t_1[#t_1 + 1] = string.format("Speed: %.1f", var186)
					end
				end
				local status = var17.status
				local joined = table.concat(t_1, "\n")
				status.bubble.Visible = joined ~= ""
				
				if joined ~= "" then
					status.label.Text = joined
				end
			else
				var17.status.bubble.Visible = false
			end
			if var38 and #t_3 > 0 and t_6.getActiveGroupName() ~= "Player Lock" then
				local lock = var17.lock
				local formattedText = string.format("Lock: %s", t_3[var40].Name)
				lock.bubble.Visible = formattedText ~= ""
				
				if formattedText ~= "" then
					lock.label.Text = formattedText
				end
			else
				var17.lock.bubble.Visible = false
			end
			local activeGroupName = t_6.getActiveGroupName()
			
			for i, v in ipairs(list_3) do
				local var194 = v.get()
				
				if var194 and var194.Enabled and activeGroupName ~= v.group then
					local key = var17[v.key]
					local var195 = v.fmt(var194)
					key.bubble.Visible = var195 ~= ""
					
					if var195 ~= "" then
						key.label.Text = var195
					end
				else
					var17[v.key].bubble.Visible = false
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
			var16.Visible = true
		else
			var16.Visible = false
		end
	end
	vector3 = var184.p
	currentCamera.CFrame = var184
	currentCamera.Focus = var184
	currentCamera.FieldOfView = var51
end

t_2 = {}
local removePlayerFromList = nil
var68 = nil
color3 = nil
local StopFreecam = nil
local var85 = nil
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

function t_2.Push()
	-- upvalues: t_12 (ref), starterGuiService (ref), t_13 (ref), localPlayer (write), t_11 (write), var35 (write), var42 (write), ToggleFreecam (write), currentCamera (write), color3 (write), var85 (write), StopFreecam (write), var68 (write), userInputService (ref), removePlayerFromList (write)
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
		var35 = playerGui.ChildAdded:Connect(function(p59)
			-- upvalues: t_11 (copy), var42 (copy)
			if p59:IsA("ScreenGui") and p59.Enabled then
				t_11[#t_11 + 1] = p59
				p59.Enabled = var42
			end
		end)
	end
	ToggleFreecam = currentCamera.FieldOfView
	currentCamera.FieldOfView = 70
	color3 = currentCamera.CameraType
	currentCamera.CameraType = Enum.CameraType.Custom
	var85 = currentCamera.CFrame
	StopFreecam = currentCamera.Focus
	var68 = userInputService.MouseIconEnabled
	userInputService.MouseIconEnabled = false
	removePlayerFromList = Enum.MouseBehavior.Default
	userInputService.MouseBehavior = Enum.MouseBehavior.Default
end

function t_2.Pop()
	-- upvalues: t_12 (ref), starterGuiService (ref), t_13 (ref), t_11 (write), var8 (write), var35 (write), currentCamera (write), ToggleFreecam (write), color3 (write), var85 (write), StopFreecam (write), userInputService (ref), var68 (write), removePlayerFromList (write)
	for i, v in pairs(t_12) do
		starterGuiService:SetCoreGuiEnabled(Enum.CoreGuiType[i], v)
	end
	for i_1, v_1 in pairs(t_13) do
		starterGuiService:SetCore(i_1, v_1)
	end
	for i_2, v_2 in pairs(t_11) do
		if v_2.Parent and v_2 ~= var8 then
			v_2.Enabled = true
		end
	end
	if var35 then
		var35:Disconnect()
		var35 = nil
	end
	t_11 = {}
	currentCamera.FieldOfView = ToggleFreecam
	ToggleFreecam = nil
	currentCamera.CameraType = color3
	color3 = nil
	currentCamera.CFrame = var85
	var85 = nil
	currentCamera.Focus = StopFreecam
	StopFreecam = nil
	userInputService.MouseIconEnabled = var68
	var68 = nil
	userInputService.MouseBehavior = removePlayerFromList
	removePlayerFromList = nil
end

function t_2.getScreenGuis()
	-- upvalues: t_11 (write)
	return t_11
end

removePlayerFromList = function(p60)
	-- upvalues: t_3 (write), var40 (write), var38 (write)
	for i, v in ipairs(t_3) do
		if v == p60 then
			table.remove(t_3, i)
			
			if var40 == i and var38 then
				var38 = false
				var40 = 1
			end
			if i < var40 then
				var40 -= 1
			end
			if #t_3 >= var40 and var40 >= 1 then break end
			var40 = 1
			
			return
		end
	end
end

var68 = function()
	-- upvalues: t_3 (write), playersService (ref), localPlayer (write), var40 (write), var36 (write), var37 (write), removePlayerFromList (ref)
	t_3 = playersService:GetPlayers()
	
	for i, v in ipairs(t_3) do
		if v == localPlayer then
			var40 = i
			break
		end
	end
	var36 = playersService.PlayerAdded:Connect(function(p61)
		-- upvalues: t_3 (copy)
		table.insert(t_3, p61)
	end)
	var37 = playersService.PlayerRemoving:Connect(removePlayerFromList)
end

color3 = function()
	-- upvalues: var68 (ref), currentCamera (write), vector3_1 (write), vector3 (write), var51 (write), var52 (ref), var53 (ref), var54 (ref), var55 (ref), var8 (write), localPlayer (write), status_3_1 (write), var59 (write), var62 (write), var16 (write), var17 (write), t_2 (write), list (write), t_1 (ref), status_4_1 (write), runService (ref), StepFreecam (ref), t_6 (ref)
	var68()
	local cFrame = currentCamera.CFrame
	vector3_1 = Vector3.new(cFrame:toEulerAnglesYXZ())
	vector3 = cFrame.p
	var51 = currentCamera.FieldOfView
	var52:Reset(Vector3.new())
	var53:Reset(Vector2.new())
	var54:Reset(0)
	var55:Reset(0)
	var8 = localPlayer:WaitForChild("PlayerGui"):WaitForChild("Freecam")
	
	if status_3_1 then
		if not var59 then
			var62(var8)
		end
	elseif not var16 or not var16.Parent then
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
		
		local function makeBubble(p62, p63)
			-- upvalues: freecamCustomGui (ref)
			local frame = Instance.new("Frame")
			frame.Name = p62
			frame.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
			frame.BackgroundTransparency = 0.4
			frame.BorderSizePixel = 0
			frame.AutomaticSize = Enum.AutomaticSize.XY
			frame.Size = UDim2.new(0, 0, 0, 0)
			frame.LayoutOrder = p63
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
		
		local var200, var201 = makeBubble("BloomBubble", 1)
		local var202, var203 = makeBubble("BlurBubble", 2)
		local var204, var205 = makeBubble("CCBubble", 3)
		local var206, var207 = makeBubble("SunRaysBubble", 4)
		local var208, var209 = makeBubble("ColorGradingBubble", 5)
		local var210, var211 = makeBubble("DofBubble", 6)
		local var212, var213 = makeBubble("LockBubble", 7)
		local var214, var215 = makeBubble("StatusBubble", 8)
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
		
		local function makeModeLabel(p64, p65, p66, p67, p68)
			-- upvalues: modeBubble (ref)
			local textLabel = Instance.new("TextLabel")
			textLabel.Name = p64
			textLabel.BackgroundTransparency = 1
			textLabel.TextColor3 = p68
			textLabel.Font = p66
			textLabel.TextSize = p67
			textLabel.TextXAlignment = Enum.TextXAlignment.Left
			textLabel.AutomaticSize = Enum.AutomaticSize.XY
			textLabel.Size = UDim2.new(0, 0, 0, 0)
			textLabel.LayoutOrder = p65
			textLabel.Parent = modeBubble
			
			return textLabel
		end
		
		local var221 = makeModeLabel("Breadcrumb", 1, Enum.Font.Gotham, 11, Color3.fromRGB(100, 100, 100))
		local var222 = makeModeLabel("Title", 2, Enum.Font.GothamBold, 14, Color3.new(1, 1, 1))
		local var223 = makeModeLabel("NavHint", 3, Enum.Font.Gotham, 12, Color3.fromRGB(120, 120, 120))
		local var224 = makeModeLabel("ActionHint", 4, Enum.Font.GothamMedium, 12, Color3.fromRGB(200, 200, 200))
		modeBubble.Parent = freecamCustomGui
		var16 = freecamCustomGui
		var17 = {
			bloom = { bubble = var200, label = var201 },
			blur = { bubble = var202, label = var203 },
			cc = { bubble = var204, label = var205 },
			sunrays = { bubble = var206, label = var207 },
			colorgrading = { bubble = var208, label = var209 },
			dof = { bubble = var210, label = var211 },
			lock = { bubble = var212, label = var213 },
			status = { bubble = var214, label = var215 },
			mode = {
				bubble = modeBubble,
				breadcrumb = var221,
				title = var222,
				nav = var223,
				action = var224
			}
		}
		freecamCustomGui.Parent = var8
	end
	t_2.Push()
	var8.Enabled = true
	
	local function _(p69, p70)
		-- upvalues: currentCamera (copy)
		local var232 = Instance.new(p69)
		var232.Name = p70
		var232.Parent = currentCamera
		
		return var232
	end
	
	for i, v in ipairs(list) do
		local key = t_1[v.key]
		local var225 = Instance.new(v.class)
		var225.Name = "Freecam" .. v.key
		var225.Parent = currentCamera
		local var226 = var225
		
		if status_4_1 and v.parent then
			var226.Parent = v.parent
		end
		for i_1, v_1 in ipairs(v.props) do
			var226[v_1] = key[v_1]
		end
		var226.Enabled = key.Enabled
		v.set(var226)
	end
	runService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
	t_6.StartCapture()
end

StopFreecam = function()
	-- upvalues: var36 (write), var37 (write), var38 (write), var40 (write), t_3 (write), var26 (ref), var24 (write), list (write), t_1 (ref), status_3_1 (write), var59 (write), var8 (write), var42 (write), var43 (write), t_6 (ref), runService (ref), t_2 (write)
	if var36 then
		var36:Disconnect()
		var36 = nil
	end
	if var37 then
		var37:Disconnect()
		var37 = nil
	end
	var38 = false
	var40 = 1
	t_3 = {}
	var26()
	var24 = false
	
	for i, v in ipairs(list) do
		local var233 = v.get()
		
		if var233 then
			local key = t_1[v.key]
			key.Enabled = var233.Enabled
			
			for i_1, v_1 in ipairs(v.props) do
				key[v_1] = var233[v_1]
			end
			var233:Destroy()
			v.set(nil)
		end
	end
	if status_3_1 and var59 then
		var59.panel.Visible = false
	end
	if var8 and var8.Parent then
		var8.Enabled = false
	end
	var42 = false
	var43 = false
	t_6.StopCapture()
	runService:UnbindFromRenderStep("Freecam")
	t_2.Pop()
end

var85 = false

ToggleFreecam = function()
	-- upvalues: var85 (write), StopFreecam (ref), color3 (ref), status_2_1 (write), t (ref)
	if var85 then
		StopFreecam()
	else
		color3()
	end
	var85 = not var85
	
	if status_2_1 then
		script:SetAttribute(t.AttributeName, var85)
	end
end

var47.StateChanged:Connect(function(p71)
	-- upvalues: var85 (write), StopFreecam (ref), color3 (ref), status_2_1 (write), t (ref)
	if p71 then
		if var85 then
			StopFreecam()
		else
			color3()
		end
		var85 = not var85
		
		if status_2_1 then
			script:SetAttribute(t.AttributeName, var85)
		end
	end
end)

if status_2_1 then
	script:SetAttribute(t.AttributeName, var85)
	script:GetAttributeChangedSignal(t.AttributeName):Connect(function()
		-- upvalues: t (ref), var85 (write), color3 (ref), StopFreecam (ref)
		local attributeNameAttribute = script:GetAttribute(t.AttributeName)
		
		if typeof(attributeNameAttribute) ~= "boolean" then
			script:SetAttribute(t.AttributeName, var85)
			
			return
		elseif attributeNameAttribute ~= var85 then
			if attributeNameAttribute then
				color3()
				var85 = true
				
				return
			end
			StopFreecam()
			var85 = false
		end
	end)
end
return {}