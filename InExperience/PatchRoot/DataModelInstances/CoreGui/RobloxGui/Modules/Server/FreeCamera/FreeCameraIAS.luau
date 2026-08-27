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
local var1 = nil
local currentCamera = workspaceService.CurrentCamera
workspaceService:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: workspaceService (ref), currentCamera (write)
	local currentCamera_1 = workspaceService.CurrentCamera
	
	if currentCamera_1 then
		currentCamera = currentCamera_1
	end
end)
local var2 = nil
local var3 = nil
local var4 = nil
local var5 = nil
local var6 = nil
local var7 = nil
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
local var8 = nil
local var9 = nil
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
local var10 = false
local var11, var12 = (function(p1, p2)
	-- upvalues: currentCamera (write), lightingService (ref)
	local t = {}
	local var13 = nil
	local var14 = nil
	
	local function _(p3)
		-- upvalues: p1 (ref), p2 (ref), t (write)
		if p3:IsA(p1) and p3.Enabled and (not p2 or not p2(p3)) then
			t[#t + 1] = p3
			p3.Enabled = false
		end
	end
	
	return function()
		-- upvalues: t (write), currentCamera (copy), p1 (ref), p2 (ref), lightingService (copy), var13 (write), var14 (write)
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
		var13 = currentCamera.ChildAdded:Connect(function(p3)
			-- upvalues: p1 (copy), p2 (copy), t (copy)
			if p3:IsA(p1) and p3.Enabled and (not p2 or not p2(p3)) then
				t[#t + 1] = p3
				p3.Enabled = false
			end
		end)
		var14 = lightingService.ChildAdded:Connect(function(p3)
			-- upvalues: p1 (copy), p2 (copy), t (copy)
			if p3:IsA(p1) and p3.Enabled and (not p2 or not p2(p3)) then
				t[#t + 1] = p3
				p3.Enabled = false
			end
		end)
	end, function()
		-- upvalues: t (write), var13 (write), var14 (write)
		for i, v in ipairs(t) do
			if v.Parent then
				v.Enabled = true
			end
		end
		if var13 then
			var13:Disconnect()
			var13 = nil
		end
		if var14 then
			var14:Disconnect()
			var14 = nil
		end
		t = {}
	end
end)("PostEffect", function(p3)
	return p3.Name:sub(1, 7) == "Freecam"
end)
local list = nil

local function doToggleMasterEffects()
	-- upvalues: var10 (write), var11 (ref), var12 (ref), list (write)
	var10 = not var10
	
	if var10 then
		var11()
		
		return
	end
	var12()
	
	for i, v in ipairs(list) do
		local var15 = v.get()
		
		if var15 then
			var15.Enabled = false
		end
	end
end

local function doToggleDoF()
	-- upvalues: status_3_1 (write), var10 (write), var2 (write)
	if status_3_1 and not var10 then return end
	if var2 then
		var2.Enabled = not var2.Enabled
	end
end

local function doToggleBloom()
	-- upvalues: status_3_1 (write), var10 (write), var3 (write)
	if status_3_1 and not var10 then return end
	if var3 then
		var3.Enabled = not var3.Enabled
	end
end

local function doToggleBlur()
	-- upvalues: status_3_1 (write), var10 (write), var4 (write)
	if status_3_1 and not var10 then return end
	if var4 then
		var4.Enabled = not var4.Enabled
	end
end

local function doToggleColorCorrection()
	-- upvalues: status_3_1 (write), var10 (write), var5 (write)
	if status_3_1 and not var10 then return end
	if var5 then
		var5.Enabled = not var5.Enabled
	end
end

local function doToggleSunRays()
	-- upvalues: status_3_1 (write), var10 (write), var6 (write)
	if status_3_1 and not var10 then return end
	if var6 then
		var6.Enabled = not var6.Enabled
	end
end

local function doToggleColorGrading()
	-- upvalues: status_3_1 (write), var10 (write), var7 (write)
	if status_3_1 and not var10 then return end
	if var7 then
		var7.Enabled = not var7.Enabled
	end
end

list = {
	{
		key = "DepthOfField",
		class = "DepthOfFieldEffect",
		get = function()
			-- upvalues: var2 (write)
			return var2
		end,
		set = function(value)
			-- upvalues: var2 (write)
			var2 = value
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
			-- upvalues: var3 (write)
			return var3
		end,
		set = function(value)
			-- upvalues: var3 (write)
			var3 = value
		end,
		props = { "Intensity", "Size", "Threshold" }
	},
	{
		key = "Blur",
		class = "BlurEffect",
		get = function()
			-- upvalues: var4 (write)
			return var4
		end,
		set = function(value)
			-- upvalues: var4 (write)
			var4 = value
		end,
		props = { "Size" }
	},
	{
		key = "ColorCorrection",
		class = "ColorCorrectionEffect",
		get = function()
			-- upvalues: var5 (write)
			return var5
		end,
		set = function(value)
			-- upvalues: var5 (write)
			var5 = value
		end,
		props = { "Brightness", "Contrast", "Saturation", "TintColor" }
	},
	{
		key = "SunRays",
		class = "SunRaysEffect",
		get = function()
			-- upvalues: var6 (write)
			return var6
		end,
		set = function(value)
			-- upvalues: var6 (write)
			var6 = value
		end,
		props = { "Intensity", "Spread" }
	},
	{
		key = "ColorGrading",
		class = "ColorGradingEffect",
		parent = if status_4_1 then lightingService else nil,
		get = function()
			-- upvalues: var7 (write)
			return var7
		end,
		set = function(value)
			-- upvalues: var7 (write)
			var7 = value
		end,
		props = { "TonemapperPreset" }
	}
}
local var16 = nil
local var17 = nil
local var18 = nil
local var19 = false
local defaultZoom = t.PlayerLock.DefaultZoom
local defaultHeight = t.PlayerLock.DefaultHeight
local t_3 = {}
local var20 = 1
local var21 = nil
local var22 = false
local var23 = false
local var24 = -1e999
local var25 = -1e999
local t_4 = {
	movement = t.Movement.Stiffness,
	pan = t.Pan.Stiffness,
	fov = t.Fov.Stiffness,
	roll = t.Roll.Stiffness
}
local var26 = nil
local t_5 = {}
t_5.__index = t_5

function t_5.new(p3, p4)
	-- upvalues: t_5 (ref)
	local tbl = setmetatable({}, t_5)
	tbl.f = p3
	tbl.p = p4
	tbl.v = p4 * 0
	
	return tbl
end

function t_5:Update(p3, p4)
	-- upvalues: exp (ref)
	local var27 = self.f * 2 * 3.14159265359
	local v = self.v
	local var28 = p4 - self.p
	local var29 = exp(-var27 * p3)
	local var30 = p4 + (v * p3 - var28 * (var27 * p3 + 1)) * var29
	local var31 = (var27 * p3 * (var28 * var27 - v) + v) * var29
	self.p = var30
	self.v = var31
	
	return var30
end

function t_5:SetFreq(p3)
	self.f = p3
end

function t_5:Reset(p3)
	self.p = p3
	self.v = p3 * 0
end

local vector3 = Vector3.new()
local vector3_1 = Vector3.new()
local var27 = 0
local var28 = t_5.new(t_4.movement, Vector3.new())
local var29 = t_5.new(t_4.pan, Vector2.new())
local var30 = t_5.new(t_4.fov, 0)
local var31 = t_5.new(t_4.roll, 0)
local t_6 = {}
local t_7 = {}
local t_8 = { movement = 1, pan = 1, fov = 1, roll = 1 }
local var32 = false
local t_9 = nil
local var33 = false
local var34 = 1
local t_10 = {}
local var35 = false
local var36 = false

local function findPlayerLockRootPart(p3)
	-- upvalues: t_3 (write), var20 (write), var19 (write)
	if not t_3 or #t_3 < 1 then
		return nil
	end
	for _ = 1, #t_3 do
		var20 = (var20 - 1 + p3) % #t_3 + 1
		local var37 = t_3[var20]
		local character = var37 and var37.Character
		
		if character then
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			
			if not humanoid or not humanoid.RootPart then
				if p3 == 0 then
					p3 = 1
				end
			end
			return humanoid.RootPart
		end
	end
	var19 = false
	
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
local var38 = 1
local color3 = Color3.new(1, 1, 1)

local function doTogglePlayerLock()
	-- upvalues: var19 (write), defaultZoom (write), t (ref), defaultHeight (write), var21 (write), findPlayerLockRootPart (ref)
	var19 = not var19
	
	if var19 then
		defaultZoom = t.PlayerLock.DefaultZoom
		defaultHeight = t.PlayerLock.DefaultHeight
		var21 = findPlayerLockRootPart(0)
	end
end

local function doToggleScreenGuis()
	-- upvalues: var22 (write), t_2 (write), var1 (write)
	var22 = not var22
	
	if t_2 then
		for i, v in pairs(t_2.getScreenGuis()) do
			if v.Parent and v ~= var1 then
				v.Enabled = var22
			end
		end
	end
end

local function doToggleLeaderboard()
	-- upvalues: var23 (write), starterGuiService (ref)
	var23 = not var23
	starterGuiService:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, var23)
end

local function makeEffectGroup(p4, p5, p6, p7, p8)
	local list = {
		{
			type = "toggle",
			name = "Enable",
			toggle = p5,
			isEnabled = function()
				-- upvalues: p6 (ref)
				local var39 = p6()
				
				return var39 and var39.Enabled
			end
		}
	}
	
	for i, v in ipairs(p7 or {}) do
		list[#list + 1] = {
			type = "axis",
			name = v.name,
			adj = v.adjCfg.Adj,
			min = v.adjCfg.Min,
			max = v.adjCfg.Max,
			get = function()
				-- upvalues: p6 (ref), v (ref)
				local var39 = p6()
				
				return if var39 then var39[v.prop] else 0
			end,
			set = function(value)
				-- upvalues: p6 (ref), v (ref)
				local var39 = p6()
				
				if var39 then
					var39[v.prop] = value
				end
			end
		}
	end
	for i, v_1 in ipairs(p8 or {}) do
		list[#list + 1] = v_1
	end
	return { type = "group", name = p4, modes = list }
end

local function makeTintChannel(p9)
	-- upvalues: status_5_1 (write), var5 (write), color3 (write), var38 (write)
	return if status_5_1 then {
		type = "axis",
		adj = 64,
		min = 0,
		max = 255,
		format = "%.0f",
		name = "Tint " .. p18,
		get = function()
			-- upvalues: var5 (copy), color3 (copy), p9 (ref)
			return (if var5 then var5.TintColor else color3)[p9] * 255
		end,
		set = function(value)
			-- upvalues: var5 (copy), color3 (copy), p9 (ref), var38 (copy)
			local var39 = if var5 then var5.TintColor else color3
			local r = var39.R
			local g = var39.G
			local b = var39.B
			
			if p9 == "R" then
				r = value / 255
			elseif p9 == "G" then
				g = value / 255
			else
				b = value / 255
			end
			color3 = Color3.new(r, g, b)
			var38 = 1
			
			if var5 then
				var5.TintColor = color3
			end
		end
	} else {
		type = "axis",
		adj = 0.02,
		min = 0,
		max = 1,
		name = "Tint " .. p18,
		get = function()
			-- upvalues: color3 (copy), p9 (ref)
			return color3[p9]
		end,
		set = function(value)
			-- upvalues: color3 (copy), p9 (ref), var38 (copy), var5 (copy)
			local r = color3.R
			local g = color3.G
			local b = color3.B
			
			if p9 == "R" then
				r = value
			elseif p9 == "G" then
				g = value
			else
				b = value
			end
			color3 = Color3.new(r, g, b)
			var38 = 1
			
			if var5 then
				var5.TintColor = color3
			end
		end
	}
end

local function makeSpeedStiffnessGroup(p9, p10, p11, p12, p13)
	-- upvalues: t_8 (ref), t_4 (ref)
	return {
		type = "group",
		name = p9,
		modes = {
			{
				type = "axis",
				name = "Speed",
				adj = p10.AdjSpeed,
				min = p10.MinSpeed,
				max = p10.MaxSpeed,
				get = function()
					-- upvalues: t_8 (copy), p11 (ref)
					return t_8[p11]
				end,
				set = function(value)
					-- upvalues: t_8 (copy), p11 (ref)
					t_8[p11] = value
				end
			},
			{
				type = "axis",
				name = "Stiffness",
				adj = p10.AdjStiffness,
				min = p10.MinStiffness,
				max = p10.MaxStiffness,
				get = function()
					-- upvalues: t_4 (copy), p12 (ref)
					return t_4[p12]
				end,
				set = function(value)
					-- upvalues: t_4 (copy), p12 (ref), p13 (ref)
					t_4[p12] = value
					p13:SetFreq(value)
				end
			}
		}
	}
end

local list_2 = {
	(function()
		-- upvalues: doToggleMasterEffects (ref), var10 (write), makeEffectGroup (ref), doToggleDoF (ref), var2 (write), t (ref), doToggleBloom (ref), var3 (write), doToggleBlur (ref), var4 (write), doToggleColorCorrection (ref), var5 (write), list_1 (ref), var38 (write), color3 (write), status_5_1 (write), makeTintChannel (ref), doToggleSunRays (ref), var6 (write), doToggleColorGrading (ref), var7 (write), status_3_1 (write)
		local t_1 = {
			type = "group",
			name = "Custom Post Processing",
			modes = {
				{
					type = "toggle",
					name = "Enable",
					toggle = doToggleMasterEffects,
					isEnabled = function()
						-- upvalues: var10 (copy)
						return var10
					end
				},
				makeEffectGroup("Depth of Field", doToggleDoF, function()
					-- upvalues: var2 (copy)
					return var2
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
					-- upvalues: var3 (copy)
					return var3
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
					-- upvalues: var4 (copy)
					return var4
				end, { { name = "Size", prop = "Size", adjCfg = t.Blur.Size } }),
				makeEffectGroup("Color Correction", doToggleColorCorrection, function()
					-- upvalues: var5 (copy)
					return var5
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
							-- upvalues: var38 (copy)
							return var38
						end,
						setIndex = function(value)
							-- upvalues: var38 (copy), var5 (copy), color3 (copy), list_1 (copy), status_5_1 (copy)
							var38 = value
							
							if var5 then
								if value == 1 then
									var5.TintColor = color3
									
									return
								end
								local color = list_1[value].color
								var5.TintColor = color
								
								if not status_5_1 then
									color3 = color
								end
							end
						end,
						displayItem = function(p9)
							return p9.name
						end
					},
					makeTintChannel("R"),
					makeTintChannel("G"),
					makeTintChannel("B")
				}),
				makeEffectGroup("Sun Rays", doToggleSunRays, function()
					-- upvalues: var6 (copy)
					return var6
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
					-- upvalues: var7 (copy)
					return var7
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
							-- upvalues: var7 (copy)
							return if var7 and var7.TonemapperPreset == Enum.TonemapperPreset.Retro then 2 else 1
						end,
						setIndex = function(value)
							-- upvalues: var7 (copy)
							if var7 then
								var7.TonemapperPreset = ({
									Enum.TonemapperPreset.Default,
									Enum.TonemapperPreset.Retro
								})[value]
							end
						end,
						displayItem = function(p9)
							return p9.Name
						end
					}
				})
			}
		}
		
		if status_3_1 then
			for i = 2, #t_1.modes do
				t_1.modes[i].disabled = function()
					-- upvalues: var10 (copy)
					return not var10
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
					-- upvalues: var19 (write)
					return var19
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
					-- upvalues: var20 (write)
					return var20
				end,
				setIndex = function(value)
					-- upvalues: var20 (write), t_3 (write), var21 (write)
					var20 = value
					local var39 = t_3[value]
					local character = var39 and var39.Character
					
					if character then
						local humanoid = character:FindFirstChildOfClass("Humanoid")
						var21 = if humanoid then humanoid.RootPart else nil
						
						return
					end
					var21 = nil
				end,
				displayItem = function(p9)
					return p9.Name
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
					-- upvalues: var22 (write)
					return var22
				end
			},
			{
				type = "toggle",
				name = "Leaderboard",
				toggle = doToggleLeaderboard,
				isEnabled = function()
					-- upvalues: var23 (write)
					return var23
				end
			}
		}
	},
	makeSpeedStiffnessGroup("Movement", t.Movement, "movement", "movement", var28),
	makeSpeedStiffnessGroup("Field of View", t.Fov, "fov", "fov", var30),
	makeSpeedStiffnessGroup(if status_6_1 then "Roll" else "Tilt", t.Roll, "roll", "roll", var31),
	makeSpeedStiffnessGroup(if status_6_1 then "Rotation" else "Pan", t.Pan, "pan", "pan", var29)
}

if status_6_1 then
	list_2 = {
		list_2[4], list_2[7], list_2[6], list_2[5], list_2[1], list_2[2], list_2[3]
	}
end
local isDisabled = nil
local nextEnabledIndex = nil

if status_3_1 then
	isDisabled = function(p9)
		return p9.disabled and p9.disabled()
	end
	
	nextEnabledIndex = function(p9, p10, p11)
		-- upvalues: isDisabled (write)
		local p28Count = #p9
		
		for _ = 1, p28Count do
			p10 = (p10 - 1 + p11) % p28Count + 1
			
			if isDisabled(p9[p10]) then
				continue
			end
			return p10
		end
		return p10
	end
end
local function _()
	-- upvalues: t_10 (write), list_2 (write), var34 (write)
	if #t_10 > 0 then
		local var39 = t_10[#t_10]
		
		return var39.modes[var39.index]
	end
	return list_2[var34]
end

local function createBinding(p9, p10)
	local inputBinding = Instance.new("InputBinding")
	
	if p10.keyCode then
		inputBinding.KeyCode = p10.keyCode
	end
	if p10.up then
		inputBinding.Up = p10.up
	end
	if p10.down then
		inputBinding.Down = p10.down
	end
	if p10.left then
		inputBinding.Left = p10.left
	end
	if p10.right then
		inputBinding.Right = p10.right
	end
	if p10.scale then
		inputBinding.Scale = p10.scale
	end
	if p10.vector2Scale then
		inputBinding.Vector2Scale = p10.vector2Scale
	end
	if p10.responseCurve then
		inputBinding.ResponseCurve = p10.responseCurve
	end
	if p10.primaryModifier then
		inputBinding.PrimaryModifier = p10.primaryModifier
	end
	inputBinding.Parent = p9
	
	return inputBinding
end

local function createAction(p9, p10)
	-- upvalues: createBinding (ref)
	local inputAction = Instance.new("InputAction")
	inputAction.Name = p10.name
	inputAction.Type = p10.type
	inputAction.Parent = p9
	
	for i, v in ipairs(p10.bindings) do
		createBinding(inputAction, v)
	end
	return inputAction
end

local _ = function(p11, p12, p13)
	local var39 = nil
	local var40 = 0
	
	return function(p14)
		-- upvalues: var39 (write), p11 (ref), var40 (write), p12 (ref), p13 (ref)
		if math.abs(p14) > 0.01 then
			local processTime = os.clock()
			
			if var39 == nil or processTime - var39 > p11 then
				var39 = processTime
			elseif p12 <= processTime - var40 then
				p13()
				var40 = processTime
			end
			var39 = nil
			
			return
		end
	end, function()
		-- upvalues: var39 (write)
		var39 = nil
	end
end

;(function()
	-- upvalues: t (ref), var26 (write), createAction (ref), t_6 (ref), t_7 (ref), t_9 (write), vector3_1 (write), var31 (ref), var32 (write), status_3_1 (write), var33 (write), var36 (write), t_10 (write), nextEnabledIndex (write), list_2 (write), var34 (write), var35 (write), isDisabled (write)
	local actions = t.Actions
	local freecamToggleContext = Instance.new("InputContext")
	freecamToggleContext.Name = "FreecamToggleContext"
	freecamToggleContext.Priority = 3000
	freecamToggleContext.Sink = false
	freecamToggleContext.Enabled = true
	freecamToggleContext.Parent = script
	var26 = createAction(freecamToggleContext, actions.Toggle)
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
	local var39 = createAction(freecamInputContext, actions.Tilt)
	t_7.Tilt = var39
	local _ = nil
	local threshold = t.DoubleTap.Threshold
	local debounce = t.DoubleTap.Debounce
	
	local var40 = function()
		-- upvalues: vector3_1 (copy), var31 (copy), var32 (copy)
		vector3_1 = Vector3.new(vector3_1.x, vector3_1.y, 0)
		var31:Reset(0)
		var32 = true
	end
	
	local var41 = nil
	local var42 = 0
	
	t_9 = function()
		-- upvalues: var41 (write)
		var116 = nil
	end
	
	local function detect(p11)
		-- upvalues: var41 (write), threshold (ref), var42 (write), debounce (ref), var40 (ref)
		if math.abs(p11) > 0.01 then
			local processTime = os.clock()
			
			if var41 == nil or processTime - var41 > threshold then
				var41 = processTime
			elseif debounce <= processTime - var42 then
				var40()
				var42 = processTime
			end
			var41 = nil
			
			return
		end
	end
	
	var39.StateChanged:Connect(function(p11)
		-- upvalues: var32 (copy), detect (write)
		if not var32 then
			detect(p11)
			
			return
		elseif math.abs(p11) < 0.01 then
			var32 = false
		end
	end)
	createAction(freecamInputContext, actions.ModeToggle).StateChanged:Connect(function(p11)
		-- upvalues: status_3_1 (copy), var33 (copy), var36 (copy), t_10 (copy), nextEnabledIndex (copy), list_2 (copy), var34 (copy), var35 (copy)
		if not p11 then return end
		if status_3_1 then
			if not var33 then
				var33 = true
				
				return
			elseif var36 then
				var36 = false
				
				return
			elseif #t_10 > 0 then
				local var43 = t_10[#t_10]
				local var44 = nextEnabledIndex(var43.modes, var43.index, -1)
				
				if var44 < var43.index then
					var43.index = var44
					
					return
				end
				t_10[#t_10] = nil
				
				return
			else
				local var45 = nextEnabledIndex(list_2, var34, -1)
				
				if var45 < var34 then
					var34 = var45
					
					return
				end
				var33 = false
				
				return
			end
		elseif not var33 then
			var33 = true
			
			return
		elseif var35 then
			var35 = false
			
			return
		elseif #t_10 > 0 then
			t_10[#t_10] = nil
			
			return
		end
		var33 = false
	end)
	createAction(freecamInputContext, actions.ModeNext).StateChanged:Connect(function(p11)
		-- upvalues: status_3_1 (copy), var33 (copy), var36 (copy), t_10 (copy), nextEnabledIndex (copy), var34 (copy), list_2 (copy), var35 (copy)
		if not p11 then return end
		if status_3_1 then
			if not var33 then
				var33 = true
				
				return
			elseif var36 then
				var36 = false
				
				return
			elseif #t_10 > 0 then
				local var43 = t_10[#t_10]
				var43.index = nextEnabledIndex(var43.modes, var43.index, 1)
				
				return
			end
			var34 = nextEnabledIndex(list_2, var34, 1)
			
			return
		elseif not var33 then return end
		if var35 then return end
		if #t_10 > 0 then
			local var44 = t_10[#t_10]
			var44.index = var44.index % #var44.modes + 1
			
			return
		end
		local var45 = list_2[var34]
		
		if var45.type == "group" then
			table.insert(t_10, { index = 1, modes = var45.modes, groupName = var45.name })
			
			return
		elseif var45.type == "toggle" then
			var45.toggle()
			
			return
		elseif var45.type == "cycle" then
			local var46 = var45.items()
			
			if #var46 > 0 then
				var45.setIndex(var45.getIndex() % #var46 + 1)
				
				return
			end
		elseif var45.type == "action" then
			var45.action()
			
			return
		elseif var45.type == "axis" then
			var35 = true
		end
	end)
	local var43 = createAction(freecamInputContext, actions.ModeAxis)
	var43.StateChanged:Connect(function(p11)
		-- upvalues: var33 (copy), status_3_1 (copy), t_10 (copy), list_2 (copy), var34 (copy), var36 (copy), isDisabled (copy), var35 (copy)
		local index
		if not var33 or p11 == 0 then return end
		if status_3_1 then
			if #t_10 > 0 then
				local var44 = t_10[#t_10]
				index = var44.modes[var44.index]
			else
				index = list_2[var34]
			end
			if var36 then
				if index.type == "toggle" then
					index.toggle()
					
					return
				elseif index.type == "cycle" then
					local var45 = index.items()
					
					if #var45 <= 0 then return end
					if p11 > 0 then
						index.setIndex(index.getIndex() % #var45 + 1)
						
						return
					end
					index.setIndex((index.getIndex() - 2) % #var45 + 1)
					
					return
				elseif index.type == "action" then
					index.action()
					
					return
				elseif index.type == "axis" then
					return
				end
			elseif p11 > 0 then
				if isDisabled(index) then return end
				if index.type == "group" then
					table.insert(t_10, { index = 1, modes = index.modes, groupName = index.name })
					
					return
				elseif index.type == "action" then
					index.action()
					
					return
				end
				var36 = true
				
				return
			elseif p11 >= 0 then return end
			var36 = false
			
			if #t_10 > 0 then
				t_10[#t_10] = nil
				
				return
			end
			var33 = false
			
			return
		elseif var35 then return end
		if #t_10 > 0 then
			if #t_10 > 0 then
				local var46 = t_10[#t_10]
				index = var46.modes[var46.index]
			else
				index = list_2[var34]
			end
			if index.type == "group" then
				table.insert(t_10, { index = 1, modes = index.modes, groupName = index.name })
				
				return
			elseif index.type == "toggle" then
				index.toggle()
				
				return
			elseif index.type == "cycle" then
				local var47 = index.items()
				
				if #var47 == 0 then return end
				if p11 > 0 then
					index.setIndex(index.getIndex() % #var47 + 1)
					
					return
				elseif p11 < 0 then
					index.setIndex((index.getIndex() - 2) % #var47 + 1)
					
					return
				end
			elseif index.type == "action" then
				index.action()
				
				return
			end
		elseif p11 > 0 then
			var34 = var34 % #list_2 + 1
			
			return
		elseif p11 < 0 then
			var34 = (var34 - 2) % #list_2 + 1
		end
	end)
	t_7.ModeAxis = var43
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
	-- upvalues: var32 (write), t_7 (ref), t_8 (ref)
	return (if var32 then 0 else t_7.Tilt:GetState()) * t_8.roll
end

function t_6.ModeControl(p11)
	-- upvalues: var33 (write), status_3_1 (write), var36 (write), t_10 (write), var35 (write), list_2 (write), var34 (write), t_7 (ref), clamp (ref)
	local index
	if not var33 then return end
	if status_3_1 then
		if not var36 then return end
	elseif #t_10 == 0 and not var35 then return end
	if #t_10 > 0 then
		local var39 = t_10[#t_10]
		index = var39.modes[var39.index]
	else
		index = list_2[var34]
	end
	if index.type ~= "axis" then return end
	local var40 = t_7.ModeAxis:GetState() * index.adj * p11
	
	if var40 ~= 0 then
		index.set(clamp(index.get() + var40, index.min, index.max))
	end
end

function t_6.StartCapture()
	-- upvalues: t_6 (ref)
	t_6._sinkContext.Enabled = true
end

function t_6.StopCapture()
	-- upvalues: t_6 (ref), var32 (write), t_9 (write), var33 (write), status_3_1 (write), t_10 (write), var36 (write), var35 (write)
	t_6._sinkContext.Enabled = false
	var32 = false
	
	if t_9 then
		t_9()
	end
	var33 = false
	
	if status_3_1 then
		table.clear(t_10)
		var36 = false
	else
		t_10 = {}
	end
	var35 = false
end

function t_6.getModeActive()
	-- upvalues: var33 (write)
	return var33
end

function t_6.getModeName()
	-- upvalues: t_10 (write), list_2 (write), var34 (write)
	local index
	if #t_10 > 0 then
		local var39 = t_10[#t_10]
		index = var39.modes[var39.index]
	else
		index = list_2[var34]
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
	-- upvalues: t_10 (write), list_2 (write), var34 (write), status_5_1 (write)
	local index
	if #t_10 > 0 then
		local var39 = t_10[#t_10]
		index = var39.modes[var39.index]
	else
		index = list_2[var34]
	end
	if index.type == "group" then
		return ""
	elseif index.type == "axis" then
		return string.format(if status_5_1 then index.format else "%.2f", index.get())
	elseif index.type == "toggle" then
		return if index.isEnabled() then "ON" else "OFF"
	elseif index.type == "cycle" then
		local var40 = index.items()
		
		if #var40 == 0 then
			return "None"
		end
		local var41 = var40[index.getIndex()]
		
		return var41 and index.displayItem(var41) or "None"
	else
		return if index.type == "action" then "(fire)" else ""
	end
end

function t_6.getModeHint()
	-- upvalues: list_2 (write), var34 (write), t_10 (write), var35 (write)
	local var39 = list_2[var34]
	
	local function _(p11)
		return if p11 == "axis" then "Hold to adjust" elseif p11 == "toggle" then "Tap to flip" elseif p11 == "cycle" then "Tap to cycle" elseif p11 == "action" then "Tap to fire" elseif p11 == "group" then "Enter" else nil
	end
	
	if #t_10 > 0 then
		local index
		local var40 = t_10[#t_10]
		local text = "[\226\134\145] Back  [\226\134\147] " .. var148.modes[var40.index % #var40.modes + 1].name
		
		if #t_10 > 0 then
			local var41 = t_10[#t_10]
			index = var41.modes[var41.index]
		else
			index = list_2[var34]
		end
		index = index.type
		local var42 = if index == "axis" then "Hold to adjust" elseif index == "toggle" then "Tap to flip" elseif index == "cycle" then "Tap to cycle" elseif index == "action" then "Tap to fire" elseif index == "group" then "Enter" else nil
		
		return {
			nav = text,
			action = if var42 then "[\226\134\144][\226\134\146] " .. var151 else ""
		}
	elseif var35 then
		local type = var39.type
		local var43 = if type == "axis" then "Hold to adjust" elseif type == "toggle" then "Tap to flip" elseif type == "cycle" then "Tap to cycle" elseif type == "action" then "Tap to fire" elseif type == "group" then "Enter" else nil
		
		return {
			nav = "[\226\134\145] Back",
			action = if var43 then "[\226\134\144][\226\134\146] " .. var152 else ""
		}
	end
	local type = var39.type
	
	return {
		nav = "[\226\134\145] Close  [\226\134\147] " .. (if type == "group" then "Enter" elseif type == "toggle" then "Flip" elseif type == "cycle" then "Cycle" elseif type == "action" then "Fire" elseif type == "axis" then "Adjust" else "Select"),
		action = "[\226\134\144] " .. list_2[(var34 - 2) % #list_2 + 1].name .. "  [\226\134\146] " .. list_2[var34 % #list_2 + 1].name
	}
end

function t_6.getTintColorName()
	-- upvalues: var38 (write), list_1 (ref)
	return if var38 >= 1 and var38 <= #list_1 then list_1[var38].name else "Custom"
end

function t_6.getActiveGroupName()
	-- upvalues: var33 (write), t_10 (write)
	return if var33 and #t_10 ~= 0 then t_10[1].groupName else nil
end

if status_3_1 then
	t_6._navigationStack = t_10
	t_6._modes = list_2
	
	function t_6._getModeIndex()
		-- upvalues: var34 (write)
		return var34
	end
	
	function t_6._isMonitorItemSelected()
		-- upvalues: var36 (write)
		return var36
	end
end
local list_3 = {
	{
		key = "bloom",
		group = "Custom Post Processing",
		get = function()
			-- upvalues: var3 (write)
			return var3
		end,
		fmt = function(p11)
			return string.format("Intensity: %.2f  Size: %.1f\nThreshold: %.2f", p11.Intensity, p11.Size, p11.Threshold)
		end
	},
	{
		key = "blur",
		group = "Custom Post Processing",
		get = function()
			-- upvalues: var4 (write)
			return var4
		end,
		fmt = function(p11)
			return string.format("Size: %.1f", p11.Size)
		end
	},
	{
		key = "cc",
		group = "Custom Post Processing",
		get = function()
			-- upvalues: var5 (write)
			return var5
		end,
		fmt = function(p11)
			-- upvalues: t_6 (ref)
			return string.format("Brightness: %.2f  Contrast: %.2f\nSaturation: %.2f  Tint: %s", p11.Brightness, p11.Contrast, p11.Saturation, t_6.getTintColorName())
		end
	},
	{
		key = "sunrays",
		group = "Custom Post Processing",
		get = function()
			-- upvalues: var6 (write)
			return var6
		end,
		fmt = function(p11)
			return string.format("Intensity: %.2f  Spread: %.2f", p11.Intensity, p11.Spread)
		end
	},
	{
		key = "colorgrading",
		group = "Custom Post Processing",
		get = function()
			-- upvalues: var7 (write)
			return var7
		end,
		fmt = function(p11)
			return string.format("Color Grading: %s", p11.TonemapperPreset.Name)
		end
	},
	{
		key = "dof",
		group = "Custom Post Processing",
		get = function()
			-- upvalues: var2 (write)
			return var2
		end,
		fmt = function(p11)
			return string.format("Far: %.2f  Near: %.2f\nDistance: %.1f  Radius: %.1f", p11.FarIntensity, p11.NearIntensity, p11.FocusDistance, p11.InFocusRadius)
		end
	}
}

local _ = function(value, p11)
	value.bubble.Visible = p11 ~= ""
	
	if p11 ~= "" then
		value.label.Text = p11
	end
end

var32 = nil
t_9 = nil
var33 = nil
var34 = nil
t_10 = nil
var35 = nil
var36 = nil

if status_3_1 then
	t_9 = {}
	var33 = 12
	
	var34 = function(p11)
		-- upvalues: t_9 (write), var33 (write), var32 (write)
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
		
		for i = 1, var33 do
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
		hint.LayoutOrder = var33 + 1
		hint.Parent = freecamMonitorPanel
		freecamMonitorPanel.Parent = p11
		var32 = {
			panel = freecamMonitorPanel,
			breadcrumb = breadcrumb,
			hint = hint
		}
	end
	
	t_10 = function(p12)
		-- upvalues: status_5_1 (write)
		if p12.type == "group" then
			return "\226\128\186"
		elseif p12.type == "toggle" then
			return if p12.isEnabled() then "On" else "Off"
		elseif p12.type == "axis" then
			return string.format(if status_5_1 then p12.format else "%.2f", p12.get())
		elseif p12.type == "cycle" then
			local var39 = p12.items()
			
			if #var39 == 0 then
				return "--"
			end
			local var40 = var39[p12.getIndex()]
			
			return var40 and p12.displayItem(var40) or "--"
		else
			return if p12.type == "action" then "" else ""
		end
	end
	
	var35 = function(p12, p13, p14)
		return if p12.type == "toggle" then if p12.isEnabled() then Color3.fromRGB(0, 176, 111) else Color3.fromRGB(150, 150, 150) elseif p13 and p14 then Color3.new(1, 1, 1) else Color3.fromRGB(180, 180, 180)
	end
	
	var36 = function()
		-- upvalues: var32 (write), t_6 (ref), var33 (write), t_9 (write), t_10 (write), var35 (write), status_6_1 (write)
		if not var32 then return end
		local panel = var32.panel
		
		if not t_6.getModeActive() then
			panel.Visible = false
			
			return
		end
		local modes, index
		panel.Visible = true
		local _ = nil
		local _ = nil
		
		if #t_6._navigationStack > 0 then
			local var39 = t_6._navigationStack[#t_6._navigationStack]
			modes = var39.modes
			index = var39.index
		else
			modes = t_6._modes
			index = t_6._getModeIndex()
		end
		local var40
		local modeBreadcrumb = t_6.getModeBreadcrumb()
		var32.breadcrumb.Text = modeBreadcrumb
		var32.breadcrumb.Visible = modeBreadcrumb ~= ""
		local var41 = t_6._isMonitorItemSelected()
		local minValue = math.min(#modes, var33)
		
		for i = 1, var33 do
			var40 = t_9[i]
			
			if i > minValue then
				var40.frame.Visible = false
				continue
			end
			local var42 = modes[i]
			local var43 = i == index
			local var44 = var42.disabled and var42.disabled()
			var40.frame.Visible = true
			
			if var43 and not var44 then
				var40.nameLabel.Text = "> " .. var171.name
				var40.nameLabel.TextColor3 = Color3.new(1, 1, 1)
				var40.nameLabel.Font = Enum.Font.GothamMedium
				var40.frame.BackgroundTransparency = if var41 then 0.88 else 1
			elseif var44 then
				var40.nameLabel.Text = "  " .. var171.name
				var40.nameLabel.TextColor3 = Color3.fromRGB(80, 80, 80)
				var40.nameLabel.Font = Enum.Font.GothamMedium
				var40.frame.BackgroundTransparency = 1
			else
				var40.nameLabel.Text = "  " .. var171.name
				var40.nameLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
				var40.nameLabel.Font = Enum.Font.GothamMedium
				var40.frame.BackgroundTransparency = 1
			end
			var40.valueLabel.Text = t_10(var42)
			var40.valueLabel.TextColor3 = var44 and Color3.fromRGB(60, 60, 60) or var35(var42, var43, var41)
		end
		if not var41 then
			var32.hint.Text = "\226\134\145\226\134\147 Navigate   \226\134\146 Select   \226\134\144 Back"
			
			return
		elseif status_6_1 then
			var32.hint.Text = "\226\134\145\226\134\147 Exit selection   \226\134\144\226\134\146 Adjust"
			
			return
		end
		var32.hint.Text = "\226\134\144\226\134\146 Adjust   \226\134\145\226\134\147 Exit selection"
	end
end
local function StepFreecam(p12)
	-- upvalues: t_6 (ref), var28 (ref), var29 (ref), var30 (ref), var31 (ref), var27 (write), rad (ref), tan (ref), sqrt (ref), t (ref), clamp (ref), var24 (write), var25 (write), vector3_1 (write), vector3 (write), var19 (write), var21 (write), defaultZoom (write), defaultHeight (write), status_3_1 (write), var36 (write), var8 (write), var9 (write), var1 (write), t_3 (write), var20 (write), list_3 (ref), currentCamera (write)
	t_6.ModeControl(p12)
	local var39 = var28:Update(p12, t_6.Movement())
	local var40 = var29:Update(p12, t_6.Pan())
	local var41 = var30:Update(p12, t_6.Fov())
	local var42 = var31:Update(p12, t_6.Roll())
	local var43 = sqrt(0.70020753821 / tan(rad(var27 / 2)))
	var27 = clamp(var27 + var41 * t.Fov.Gain * (p12 / var43), 1, 120)
	
	if math.abs(var27 - var27) > 0.01 then
		var24 = os.clock()
	end
	if var39.Magnitude > 0.05 or var40.Magnitude > 0.0005 or (math.abs(var42) > 0.0005 or math.abs(var41) > 0.0005) then
		var25 = os.clock()
	end
	local var44 = var40 * t.Pan.Gain * (p12 / var43)
	vector3_1 += Vector3.new(var44.X, var44.Y, var42 * t.Roll.Gain * (p12 / var43))
	
	local function _(vectorA)
		vectorA %= 6.28318530718
		
		return if vectorA > 3.14159265359 then vectorA - 6.28318530718 else vectorA
	end
	
	local var45 = vector3_1.x % 6.28318530718
	local var46 = if var45 > 3.14159265359 then var45 - 6.28318530718 else var45
	local var47 = vector3_1.y % 6.28318530718
	local var48 = vector3_1.z % 6.28318530718
	vector3_1 = Vector3.new(var46, if var47 > 3.14159265359 then var47 - 6.28318530718 else var47, if var48 > 3.14159265359 then var48 - 6.28318530718 else var48)
	local var49 = CFrame.new(vector3) * CFrame.fromOrientation(vector3_1.x, vector3_1.y, vector3_1.z) * CFrame.new(Vector3.new(var39.X, var39.Y, -var39.Z) * t.Movement.Gain * p12)
	
	if var19 and var21 and var21.Parent then
		local playerLock = t.PlayerLock
		defaultZoom = clamp(defaultZoom + -var39.Z * t.Movement.Gain.Z * p12, playerLock.MinZoom, playerLock.MaxZoom)
		defaultHeight = clamp(defaultHeight + var39.Y * t.Movement.Gain.Y * p12, -playerLock.HeightRange, playerLock.HeightRange)
		var49 = CFrame.new(var21.Position + Vector3.new(0, defaultHeight, 0)) * CFrame.fromOrientation(vector3_1.x, vector3_1.y, vector3_1.z) * CFrame.new(0, 0, defaultZoom)
	end
	if status_3_1 then
		var36()
	elseif var8 and var8.Parent and (var9 and var1) and var1.Parent then
		local mode = var9.mode
		
		if t_6.getModeActive() then
			if os.clock() - var25 < 2 then
				local t_1 = {}
				t_1[#t_1 + 1] = string.format("X: %.0f  Y: %.0f  Z: %.0f", vector3.X, vector3.Y, vector3.Z)
				t_1[#t_1 + 1] = string.format("Pitch: %.1f\194\176  Yaw: %.1f\194\176  Roll: %.1f\194\176", math.deg(vector3_1.X), math.deg(vector3_1.Y), math.deg(vector3_1.Z))
				
				if os.clock() - var24 < 2 then
					t_1[#t_1 + 1] = string.format("Field of View: %.1f", var27)
				end
				if p12 > 0 then
					local var50 = (var49.p - vector3).Magnitude / p12
					
					if var50 > 0.5 then
						t_1[#t_1 + 1] = string.format("Speed: %.1f", var50)
					end
				end
				local status = var9.status
				local joined = table.concat(t_1, "\n")
				status.bubble.Visible = joined ~= ""
				
				if joined ~= "" then
					status.label.Text = joined
				end
			else
				var9.status.bubble.Visible = false
			end
			if var19 and #t_3 > 0 and t_6.getActiveGroupName() ~= "Player Lock" then
				local lock = var9.lock
				local formattedText = string.format("Lock: %s", t_3[var20].Name)
				lock.bubble.Visible = formattedText ~= ""
				
				if formattedText ~= "" then
					lock.label.Text = formattedText
				end
			else
				var9.lock.bubble.Visible = false
			end
			local activeGroupName = t_6.getActiveGroupName()
			
			for i, v in ipairs(list_3) do
				local var51 = v.get()
				
				if var51 and var51.Enabled and activeGroupName ~= v.group then
					local key = var9[v.key]
					local var52 = v.fmt(var51)
					key.bubble.Visible = var52 ~= ""
					
					if var52 ~= "" then
						key.label.Text = var52
					end
				else
					var9[v.key].bubble.Visible = false
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
			var8.Visible = true
		else
			var8.Visible = false
		end
	end
	vector3 = var49.p
	currentCamera.CFrame = var49
	currentCamera.Focus = var49
	currentCamera.FieldOfView = var27
end

t_2 = {}
local removePlayerFromList = nil
var38 = nil
color3 = nil
local StopFreecam = nil
local var53 = nil
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
	-- upvalues: t_12 (ref), starterGuiService (ref), t_13 (ref), localPlayer (write), t_11 (write), var16 (write), var22 (write), ToggleFreecam (write), currentCamera (write), color3 (write), var53 (write), StopFreecam (write), var38 (write), userInputService (ref), removePlayerFromList (write)
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
		var16 = playerGui.ChildAdded:Connect(function(p13)
			-- upvalues: t_11 (copy), var22 (copy)
			if p13:IsA("ScreenGui") and p13.Enabled then
				t_11[#t_11 + 1] = p13
				p13.Enabled = var22
			end
		end)
	end
	ToggleFreecam = currentCamera.FieldOfView
	currentCamera.FieldOfView = 70
	color3 = currentCamera.CameraType
	currentCamera.CameraType = Enum.CameraType.Custom
	var53 = currentCamera.CFrame
	StopFreecam = currentCamera.Focus
	var38 = userInputService.MouseIconEnabled
	userInputService.MouseIconEnabled = false
	removePlayerFromList = Enum.MouseBehavior.Default
	userInputService.MouseBehavior = Enum.MouseBehavior.Default
end

function t_2.Pop()
	-- upvalues: t_12 (ref), starterGuiService (ref), t_13 (ref), t_11 (write), var1 (write), var16 (write), currentCamera (write), ToggleFreecam (write), color3 (write), var53 (write), StopFreecam (write), userInputService (ref), var38 (write), removePlayerFromList (write)
	for i, v in pairs(t_12) do
		starterGuiService:SetCoreGuiEnabled(Enum.CoreGuiType[i], v)
	end
	for i_1, v_1 in pairs(t_13) do
		starterGuiService:SetCore(i_1, v_1)
	end
	for i_2, v_2 in pairs(t_11) do
		if v_2.Parent and v_2 ~= var1 then
			v_2.Enabled = true
		end
	end
	if var16 then
		var16:Disconnect()
		var16 = nil
	end
	t_11 = {}
	currentCamera.FieldOfView = ToggleFreecam
	ToggleFreecam = nil
	currentCamera.CameraType = color3
	color3 = nil
	currentCamera.CFrame = var53
	var53 = nil
	currentCamera.Focus = StopFreecam
	StopFreecam = nil
	userInputService.MouseIconEnabled = var38
	var38 = nil
	userInputService.MouseBehavior = removePlayerFromList
	removePlayerFromList = nil
end

function t_2.getScreenGuis()
	-- upvalues: t_11 (write)
	return t_11
end

removePlayerFromList = function(p13)
	-- upvalues: t_3 (write), var20 (write), var19 (write)
	for i, v in ipairs(t_3) do
		if v == p13 then
			table.remove(t_3, i)
			
			if var20 == i and var19 then
				var19 = false
				var20 = 1
			end
			if i < var20 then
				var20 -= 1
			end
			if #t_3 >= var20 and var20 >= 1 then break end
			var20 = 1
			
			return
		end
	end
end

var38 = function()
	-- upvalues: t_3 (write), playersService (ref), localPlayer (write), var20 (write), var17 (write), var18 (write), removePlayerFromList (ref)
	t_3 = playersService:GetPlayers()
	
	for i, v in ipairs(t_3) do
		if v == localPlayer then
			var20 = i
			break
		end
	end
	var17 = playersService.PlayerAdded:Connect(function(p14)
		-- upvalues: t_3 (copy)
		table.insert(t_3, p14)
	end)
	var18 = playersService.PlayerRemoving:Connect(removePlayerFromList)
end

color3 = function()
	-- upvalues: var38 (ref), currentCamera (write), vector3_1 (write), vector3 (write), var27 (write), var28 (ref), var29 (ref), var30 (ref), var31 (ref), var1 (write), localPlayer (write), status_3_1 (write), var32 (write), var34 (write), var8 (write), var9 (write), t_2 (write), list (write), t_1 (ref), status_4_1 (write), runService (ref), StepFreecam (ref), t_6 (ref)
	var38()
	local cFrame = currentCamera.CFrame
	vector3_1 = Vector3.new(cFrame:toEulerAnglesYXZ())
	vector3 = cFrame.p
	var27 = currentCamera.FieldOfView
	var28:Reset(Vector3.new())
	var29:Reset(Vector2.new())
	var30:Reset(0)
	var31:Reset(0)
	var1 = localPlayer:WaitForChild("PlayerGui"):WaitForChild("Freecam")
	
	if status_3_1 then
		if not var32 then
			var34(var1)
		end
	elseif not var8 or not var8.Parent then
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
		
		local function makeBubble(p14, p15)
			-- upvalues: freecamCustomGui (ref)
			local frame = Instance.new("Frame")
			frame.Name = p14
			frame.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
			frame.BackgroundTransparency = 0.4
			frame.BorderSizePixel = 0
			frame.AutomaticSize = Enum.AutomaticSize.XY
			frame.Size = UDim2.new(0, 0, 0, 0)
			frame.LayoutOrder = p15
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
		
		local var54, var55 = makeBubble("BloomBubble", 1)
		local var56, var57 = makeBubble("BlurBubble", 2)
		local var58, var59 = makeBubble("CCBubble", 3)
		local var60, var61 = makeBubble("SunRaysBubble", 4)
		local var62, var63 = makeBubble("ColorGradingBubble", 5)
		local var64, var65 = makeBubble("DofBubble", 6)
		local var66, var67 = makeBubble("LockBubble", 7)
		local var68, var69 = makeBubble("StatusBubble", 8)
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
		
		local function makeModeLabel(p14, p15, p16, p17, p18)
			-- upvalues: modeBubble (ref)
			local textLabel = Instance.new("TextLabel")
			textLabel.Name = p14
			textLabel.BackgroundTransparency = 1
			textLabel.TextColor3 = p18
			textLabel.Font = p16
			textLabel.TextSize = p17
			textLabel.TextXAlignment = Enum.TextXAlignment.Left
			textLabel.AutomaticSize = Enum.AutomaticSize.XY
			textLabel.Size = UDim2.new(0, 0, 0, 0)
			textLabel.LayoutOrder = p15
			textLabel.Parent = modeBubble
			
			return textLabel
		end
		
		local var70 = makeModeLabel("Breadcrumb", 1, Enum.Font.Gotham, 11, Color3.fromRGB(100, 100, 100))
		local var71 = makeModeLabel("Title", 2, Enum.Font.GothamBold, 14, Color3.new(1, 1, 1))
		local var72 = makeModeLabel("NavHint", 3, Enum.Font.Gotham, 12, Color3.fromRGB(120, 120, 120))
		local var73 = makeModeLabel("ActionHint", 4, Enum.Font.GothamMedium, 12, Color3.fromRGB(200, 200, 200))
		modeBubble.Parent = freecamCustomGui
		var8 = freecamCustomGui
		var9 = {
			bloom = { bubble = var54, label = var55 },
			blur = { bubble = var56, label = var57 },
			cc = { bubble = var58, label = var59 },
			sunrays = { bubble = var60, label = var61 },
			colorgrading = { bubble = var62, label = var63 },
			dof = { bubble = var64, label = var65 },
			lock = { bubble = var66, label = var67 },
			status = { bubble = var68, label = var69 },
			mode = {
				bubble = modeBubble,
				breadcrumb = var70,
				title = var71,
				nav = var72,
				action = var73
			}
		}
		freecamCustomGui.Parent = var1
	end
	t_2.Push()
	var1.Enabled = true
	
	local function _(p14, p15)
		-- upvalues: currentCamera (copy)
		local var74 = Instance.new(p14)
		var74.Name = p15
		var74.Parent = currentCamera
		
		return var74
	end
	
	for i, v in ipairs(list) do
		local key = t_1[v.key]
		local var74 = Instance.new(v.class)
		var74.Name = "Freecam" .. v.key
		var74.Parent = currentCamera
		local var75 = var74
		
		if status_4_1 and v.parent then
			var75.Parent = v.parent
		end
		for i_1, v_1 in ipairs(v.props) do
			var75[v_1] = key[v_1]
		end
		var75.Enabled = key.Enabled
		v.set(var75)
	end
	runService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
	t_6.StartCapture()
end

StopFreecam = function()
	-- upvalues: var17 (write), var18 (write), var19 (write), var20 (write), t_3 (write), var12 (ref), var10 (write), list (write), t_1 (ref), status_3_1 (write), var32 (write), var1 (write), var22 (write), var23 (write), t_6 (ref), runService (ref), t_2 (write)
	if var17 then
		var17:Disconnect()
		var17 = nil
	end
	if var18 then
		var18:Disconnect()
		var18 = nil
	end
	var19 = false
	var20 = 1
	t_3 = {}
	var12()
	var10 = false
	
	for i, v in ipairs(list) do
		local var76 = v.get()
		
		if var76 then
			local key = t_1[v.key]
			key.Enabled = var76.Enabled
			
			for i_1, v_1 in ipairs(v.props) do
				key[v_1] = var76[v_1]
			end
			var76:Destroy()
			v.set(nil)
		end
	end
	if status_3_1 and var32 then
		var32.panel.Visible = false
	end
	if var1 and var1.Parent then
		var1.Enabled = false
	end
	var22 = false
	var23 = false
	t_6.StopCapture()
	runService:UnbindFromRenderStep("Freecam")
	t_2.Pop()
end

var53 = false

ToggleFreecam = function()
	-- upvalues: var53 (write), StopFreecam (ref), color3 (ref), status_2_1 (write), t (ref)
	if var53 then
		StopFreecam()
	else
		color3()
	end
	var53 = not var53
	
	if status_2_1 then
		script:SetAttribute(t.AttributeName, var53)
	end
end

var26.StateChanged:Connect(function(p14)
	-- upvalues: var53 (write), StopFreecam (ref), color3 (ref), status_2_1 (write), t (ref)
	if p14 then
		if var53 then
			StopFreecam()
		else
			color3()
		end
		var53 = not var53
		
		if status_2_1 then
			script:SetAttribute(t.AttributeName, var53)
		end
	end
end)

if status_2_1 then
	script:SetAttribute(t.AttributeName, var53)
	script:GetAttributeChangedSignal(t.AttributeName):Connect(function()
		-- upvalues: t (ref), var53 (write), color3 (ref), StopFreecam (ref)
		local attributeNameAttribute = script:GetAttribute(t.AttributeName)
		
		if typeof(attributeNameAttribute) ~= "boolean" then
			script:SetAttribute(t.AttributeName, var53)
			
			return
		elseif attributeNameAttribute ~= var53 then
			if attributeNameAttribute then
				color3()
				var53 = true
				
				return
			end
			StopFreecam()
			var53 = false
		end
	end)
end
return {}