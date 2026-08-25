local abs = math.abs
local clamp = math.clamp
local exp = math.exp
local rad = math.rad
local sign = math.sign
local sqrt = math.sqrt
local tan = math.tan
local contextActionService = game:GetService("ContextActionService")
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local starterGuiService = game:GetService("StarterGui")
local userInputService = game:GetService("UserInputService")
local workspaceService = game:GetService("Workspace")
local gameSettings = UserSettings().GameSettings
local lightingService = game:GetService("Lighting")
local localPlayer = playersService.LocalPlayer

if not localPlayer then
	playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
	localPlayer = playersService.LocalPlayer
end
local var7 = nil
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
local t = nil
local _ = nil
local ok, status = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserExitFreecamBreaksWithShiftlock")
end)
local status_1 = ok and status
local _ = nil
local ok_1, status_2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserShowGuiHideToggles")
end)
local status_2_1 = ok_1 and status_2
local _ = nil
local ok_2, status_3 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFixFreecamDeltaTimeCalculation")
end)
local status_3_1 = ok_2 and status_3
local _ = nil
local ok_3, status_4 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFixFreecamGuiChangeVisibility2")
end)
local status_4_1 = ok_3 and status_4
local _ = nil
local ok_4, status_5 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamControlSpeed")
end)
local status_5_1 = ok_4 and status_5
local _ = nil
local ok_5, status_6 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamTiltControl")
end)
local status_6_1 = ok_5 and status_6
local _ = nil
local ok_6, status_7 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamSmoothnessControl")
end)
local status_7_1 = ok_6 and status_7
local _ = nil
local ok_7, status_8 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamGuiDestabilization")
end)
local status_8_1 = ok_7 and status_8
local _ = nil
local ok_8, status_9 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamDepthOfFieldEffect3")
end)
local status_9_1 = ok_8 and status_9
local _ = nil
local ok_9, status_10 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamPlayerLock2")
end)
local status_10_1 = ok_9 and status_10
local _ = nil
local ok_10, status_11 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamPlayerLockResetHeight")
end)
local status_11_1 = ok_10 and status_11
local _ = nil
local ok_11, status_12 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamCustomGui")
end)
local status_12_1 = ok_11 and status_12
local value = Enum.ContextActionPriority.Low.Value
local value_1 = Enum.ContextActionPriority.High.Value
local list = { Enum.KeyCode.LeftShift, Enum.KeyCode.P }
local t_1 = { [Enum.KeyCode.Z] = true, [Enum.KeyCode.C] = true }
local t_2 = {
	[Enum.KeyCode.ButtonL1] = true,
	[Enum.KeyCode.ButtonR1] = true
}
local t_3 = { [Enum.KeyCode.BackSlash] = true }
local t_4 = { [Enum.KeyCode.Slash] = true }
local t_5 = { [Enum.KeyCode.R] = true, [Enum.KeyCode.T] = true }
local t_6 = { [Enum.KeyCode.G] = true }
local t_7 = { [Enum.KeyCode.X] = true }
local t_8 = { [Enum.KeyCode.L] = true }
local var33 = Vector2.new(0.75, 1) * 8
local var34 = 1.5
local var35 = 1
local var36 = 4
local var37 = 1
local t_9 = {}
local var39 = 0
local t_10 = {}
local var41 = nil
local var42 = nil
local var43 = nil
local var44 = nil
local var45 = nil
local var46 = false
local var47 = 20
local var48 = 0
local t_11 = {}
local var50 = 1
local var51 = nil
local var52 = false
local var53 = false
local t_12 = {}
t_12.__index = t_12

function t_12.new(p0, p1)
	-- upvalues: t_12 (ref)
	local tbl = setmetatable({}, t_12)
	tbl.f = p0
	tbl.p = p1
	tbl.v = p1 * 0
	
	return tbl
end

function t_12:Update(p2, p3)
	-- upvalues: exp (ref)
	local var89 = self.f * 2 * 3.14159265359
	local v = self.v
	local var90 = p3 - self.p
	local var91 = exp(-var89 * p2)
	local var92 = p3 + (v * p2 - var90 * (var89 * p2 + 1)) * var91
	local var93 = (var89 * p2 * (var90 * var89 - v) + v) * var91
	self.p = var92
	self.v = var93
	
	return var92
end

function t_12:SetFreq(p4)
	self.f = p4
end

function t_12:Reset(p5)
	self.p = p5
	self.v = p5 * 0
end

local vector3 = Vector3.new()
local var56 = if status_6_1 then Vector3.new() else Vector2.new()
local var57 = 0
local var58 = t_12.new(var34, Vector3.new())
local var59 = t_12.new(var35, Vector2.new())
local var60 = t_12.new(var36, 0)
local var61 = t_12.new(var37, 0)
local t_13 = {}
local _ = nil

local function _(p6)
	-- upvalues: exp (ref)
	return (exp(2 * p6) - 1) / 6.389056098931
end

local _ = function(p7)
	-- upvalues: exp (ref)
	return (exp(2 * ((p7 - 0.15) / 0.85)) - 1) / 6.389056098931
end

local function thumbstickCurve(p8)
	-- upvalues: sign (ref), abs (ref), exp (ref), clamp (ref)
	return sign(p8) * clamp((exp(2 * ((abs(p8) - 0.15) / 0.85)) - 1) / 6.389056098931, 0, 1)
end

local t_14 = {
	ButtonX = 0,
	ButtonY = 0,
	DPadDown = 0,
	DPadUp = 0,
	DPadLeft = 0,
	DPadRight = 0,
	ButtonL2 = 0,
	ButtonR2 = 0,
	ButtonL1 = 0,
	ButtonR1 = 0,
	Thumbstick1 = Vector2.new(),
	Thumbstick2 = Vector2.new()
}
local t_15 = {
	W = 0,
	A = 0,
	S = 0,
	D = 0,
	E = 0,
	Q = 0,
	U = 0,
	H = 0,
	J = 0,
	K = 0,
	I = 0,
	Y = 0,
	Up = 0,
	Down = 0,
	Left = 0,
	Right = 0,
	LeftShift = 0,
	RightShift = 0,
	Z = 0,
	C = 0,
	Comma = 0,
	Period = 0,
	LeftBracket = 0,
	RightBracket = 0,
	Semicolon = 0,
	Quote = 0,
	V = 0,
	B = 0,
	N = 0,
	M = 0,
	BackSlash = 0,
	Minus = 0,
	Equals = 0,
	Slash = 0,
	R = 0,
	T = 0,
	G = 0,
	X = 0,
	L = 0
}
local t_16 = { MouseWheel = 0, Delta = Vector2.new() }
local var67 = Vector2.new(1, 1) * 0.049087385212
local var68 = var67 / 60
local var69 = Vector2.new(1, 1) * 0.392699081699
local t_17 = {
	FarIntensity = { ADJ = 0.1, MIN = 0, MAX = 1 },
	NearIntensity = { ADJ = 0.1, MIN = 0, MAX = 1 },
	FocusDistance = { ADJ = 20, MIN = 0, MAX = 200 },
	FocusRadius = { ADJ = 5, MIN = 0, MAX = 50 }
}
local var71 = 1
local var72 = 1
local var73 = 1

function t_13.Vel(p9)
	-- upvalues: status_5_1 (write), var71 (write), t_15 (ref), t_14 (ref), clamp (ref), thumbstickCurve (write), userInputService (ref)
	var71 = if status_5_1 then clamp(var71 + p9 * (t_15.Up - t_15.Down + t_14.DPadUp - t_14.DPadDown) * 0.75, 0.01, 4) else clamp(var71 + p9 * (t_15.Up - t_15.Down) * 0.75, 0.01, 4)
	
	return (Vector3.new(thumbstickCurve(t_14.Thumbstick1.X), thumbstickCurve(t_14.ButtonR2) - thumbstickCurve(t_14.ButtonL2), thumbstickCurve(-t_14.Thumbstick1.Y)) * Vector3.new(1, 1, 1) + Vector3.new(t_15.D - t_15.A + t_15.K - t_15.H, t_15.E - t_15.Q + t_15.I - t_15.Y, t_15.S - t_15.W + t_15.J - t_15.U) * Vector3.new(1, 1, 1)) * (var71 * (if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) or userInputService:IsKeyDown(Enum.KeyCode.RightShift) then 0.25 else 1))
end

function t_13.Pan(p10)
	-- upvalues: thumbstickCurve (write), t_14 (ref), var69 (ref), t_16 (ref), var67 (ref), status_3_1 (write), var68 (ref)
	local var94 = Vector2.new(thumbstickCurve(t_14.Thumbstick2.Y), thumbstickCurve(-t_14.Thumbstick2.X)) * var69
	local var95 = if status_3_1 and p10 > 0 then t_16.Delta / p10 * var68 else t_16.Delta * var67
	t_16.Delta = Vector2.new()
	
	return var94 + var95
end

function t_13.Fov(p11)
	-- upvalues: status_5_1 (write), var73 (write), t_15 (ref), t_14 (ref), clamp (ref), t_16 (ref), status_3_1 (write)
	if status_5_1 then
		var73 = clamp(var73 + p11 * (t_15.Right - t_15.Left + t_14.DPadRight - t_14.DPadLeft) * 0.75, 0.01, 4)
	end
	local var96 = (t_14.ButtonX - t_14.ButtonY) * 0.25
	local var97 = if status_3_1 and p11 > 0 then t_16.MouseWheel / p11 * 0.016666666667 else t_16.MouseWheel * 1
	t_16.MouseWheel = 0
	
	return if status_5_1 then (var96 + var97) * var73 else var96 + var97
end

function t_13.Roll(p12)
	-- upvalues: var72 (write), t_15 (ref), clamp (ref), t_14 (ref)
	var72 = clamp(var72 + p12 * (t_15.Period - t_15.Comma) * 0.75, 0.01, 4)
	
	return ((t_14.ButtonR1 - t_14.ButtonL1) * 1 + (t_15.C - t_15.Z) * 1) * var72
end

function t_13.SpringControl(p13)
	-- upvalues: status_9_1 (write), userInputService (ref), var34 (write), t_15 (ref), clamp (ref), var58 (ref), var35 (write), var59 (ref), var36 (write), var60 (ref), var37 (write), var61 (ref)
	if status_9_1 then
		if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) or userInputService:IsKeyDown(Enum.KeyCode.RightShift) or (userInputService:IsKeyDown(Enum.KeyCode.LeftControl) or userInputService:IsKeyDown(Enum.KeyCode.RightControl)) then
			return
		end
	end
	var34 = clamp(var34 + p13 * (t_15.RightBracket - t_15.LeftBracket) * 0.75, 0.01, 10)
	var58:SetFreq(var34)
	var35 = clamp(var35 + p13 * (t_15.Quote - t_15.Semicolon) * 0.75, 0.01, 10)
	var59:SetFreq(var35)
	var36 = clamp(var36 + p13 * (t_15.B - t_15.V) * 0.75, 0.01, 10)
	var60:SetFreq(var36)
	var37 = clamp(var37 + p13 * (t_15.M - t_15.N) * 0.75, 0.01, 10)
	var61:SetFreq(var37)
end

function t_13.DoF(p14)
	-- upvalues: userInputService (ref), var9 (write), t_15 (ref), t_17 (ref), clamp (ref)
	local leftControl = userInputService:IsKeyDown(Enum.KeyCode.LeftControl) or userInputService:IsKeyDown(Enum.KeyCode.RightControl)
	
	if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) or userInputService:IsKeyDown(Enum.KeyCode.RightShift) then
		var9.FarIntensity = clamp(var9.FarIntensity + p14 * (t_15.RightBracket - t_15.LeftBracket) * t_17.FarIntensity.ADJ, t_17.FarIntensity.MIN, t_17.FarIntensity.MAX)
		var9.InFocusRadius = clamp(var9.InFocusRadius + p14 * (t_15.Equals - t_15.Minus) * t_17.FocusRadius.ADJ, t_17.FocusRadius.MIN, t_17.FocusRadius.MAX)
		
		return
	elseif leftControl then
		var9.NearIntensity = clamp(var9.NearIntensity + p14 * (t_15.RightBracket - t_15.LeftBracket) * t_17.NearIntensity.ADJ, t_17.NearIntensity.MIN, t_17.NearIntensity.MAX)
		
		return
	end
	var9.FocusDistance = clamp(var9.FocusDistance + p14 * (t_15.Equals - t_15.Minus) * t_17.FocusDistance.ADJ, t_17.FocusDistance.MIN, t_17.FocusDistance.MAX)
end

local _ = function(value, p15)
	for i, v in pairs(value) do
		if p15[i.Name] then
			p15[i.Name] = 0
		end
	end
end

local function handleDoubleTapReset(value)
	-- upvalues: t_9 (ref), var39 (write), var56 (write), var61 (ref), status_9_1 (write), t_2 (ref), t_14 (ref), t_1 (ref), t_15 (ref)
	local processTime = os.clock()
	local var100 = t_9[value]
	
	if var100 and (if var100 then processTime - var100 else -1) <= 0.25 and processTime - var39 >= 0.1 then
		var56 = Vector3.new(var56.x, var56.y, 0)
		var61:Reset(0)
		
		if status_9_1 then
			for i, v in pairs(t_2) do
				if t_14[i.Name] then
					t_14[i.Name] = 0
				end
			end
			local var101 = t_15
			
			for i_1, v in pairs(t_1) do
				if var101[i_1.Name] then
					var101[i_1.Name] = 0
				end
			end
		else
			t_14.ButtonL1 = 0
			t_14.ButtonR1 = 0
			t_15.C = 0
			t_15.Z = 0
		end
		var39 = processTime
	end
	t_9[value] = processTime
end

local function findPlayerLockRootPart(p16)
	-- upvalues: t_11 (write), var50 (write), var46 (write)
	if not t_11 or #t_11 < 1 then
		return nil
	end
	for _ = 1, #t_11 do
		var50 = (var50 - 1 + p16) % #t_11 + 1
		local var102 = t_11[var50]
		local character = var102 and var102.Character
		
		if character then
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			
			if not humanoid or not humanoid.RootPart then
				if p16 == 0 then
					p16 = 1
				end
			end
			return humanoid.RootPart
		end
	end
	var46 = false
	
	return nil
end

local function Keypress(_, p17, p18)
	-- upvalues: t_15 (ref), status_6_1 (write), t_1 (ref), handleDoubleTapReset (ref), status_9_1 (write), t_3 (ref), var9 (write), t_10 (write), currentCamera (write), lightingService (ref), var42 (write), var43 (write), status_10_1 (write), t_4 (ref), var46 (write), var47 (write), status_11_1 (write), var48 (write), var51 (write), findPlayerLockRootPart (ref), t_5 (ref), t_11 (write), status_12_1 (write), t_6 (ref), var8 (write), t_7 (ref), var52 (write), t (write), t_8 (ref), var53 (write), starterGuiService (ref)
	t_15[p18.KeyCode.Name] = if p17 == Enum.UserInputState.Begin then 1 else 0
	
	if status_6_1 and t_1[p18.KeyCode] and p18.UserInputState == Enum.UserInputState.Begin then
		handleDoubleTapReset(p18.KeyCode)
	end
	if status_9_1 and t_3[p18.KeyCode] and p18.UserInputState == Enum.UserInputState.Begin then
		if var9.Enabled then
			for i, v in ipairs(t_10) do
				if v.Parent then
					v.Enabled = true
				end
			end
			if var42 then
				var42:Disconnect()
				var42 = nil
			end
			if var43 then
				var43:Disconnect()
				var43 = nil
			end
			t_10 = {}
		else
			t_10 = {}
			
			for i, v in ipairs(currentCamera:GetChildren()) do
				if v:IsA("DepthOfFieldEffect") and v.Enabled then
					t_10[#t_10 + 1] = v
					v.Enabled = false
				end
			end
			for i, v_1 in ipairs(lightingService:GetChildren()) do
				if v_1:IsA("DepthOfFieldEffect") and v_1.Enabled then
					t_10[#t_10 + 1] = v_1
					v_1.Enabled = false
				end
			end
			var42 = currentCamera.ChildAdded:Connect(function(p19)
				-- upvalues: t_10 (copy)
				if p19:IsA("DepthOfFieldEffect") and p19.Enabled then
					t_10[#t_10 + 1] = p19
					p19.Enabled = false
				end
			end)
			var43 = lightingService.ChildAdded:Connect(function(p20)
				-- upvalues: t_10 (copy)
				if p20:IsA("DepthOfFieldEffect") and p20.Enabled then
					t_10[#t_10 + 1] = p20
					p20.Enabled = false
				end
			end)
		end
		var9.Enabled = not var9.Enabled
		local var105 = t_15
		
		for i_2, v in pairs(t_3) do
			if var105[i_2.Name] then
				var105[i_2.Name] = 0
			end
		end
	end
	if status_10_1 then
		if t_4[p18.KeyCode] and p18.UserInputState == Enum.UserInputState.Begin then
			var46 = not var46
			
			if var46 then
				var47 = 20
				
				if status_11_1 then
					var48 = 0
				end
				var51 = findPlayerLockRootPart(0)
			end
			local var106 = t_15
			
			for i_2, v in pairs(t_4) do
				if var106[i_2.Name] then
					var106[i_2.Name] = 0
				end
			end
		end
		if t_5[p18.KeyCode] and p18.UserInputState == Enum.UserInputState.Begin then
			if var46 and #t_11 > 0 then
				var51 = findPlayerLockRootPart(t_15.T - t_15.R)
			end
			local var107 = t_15
			
			for i_2, v in pairs(t_5) do
				if var107[i_2.Name] then
					var107[i_2.Name] = 0
				end
			end
		end
	end
	if status_12_1 then
		if t_6[p18.keyCode] and p18.UserInputState == Enum.UserInputState.Begin then
			if var8 and var8.Parent then
				var8.Enabled = not var8.Enabled
			end
			local var108 = t_15
			
			for i_2, v in pairs(t_6) do
				if var108[i_2.Name] then
					var108[i_2.Name] = 0
				end
			end
		end
		if t_7[p18.keyCode] and p18.UserInputState == Enum.UserInputState.Begin then
			var52 = not var52
			
			if t then
				for i_2, v_3 in pairs(t.getScreenGuis()) do
					if v_3.Parent and v_3 ~= var8 then
						v_3.Enabled = var52
					end
				end
			end
			local var109 = t_15
			
			for i_2, v in pairs(t_7) do
				if var109[i_2.Name] then
					var109[i_2.Name] = 0
				end
			end
		end
		if t_8[p18.keyCode] and p18.UserInputState == Enum.UserInputState.Begin then
			var53 = not var53
			starterGuiService:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, var53)
			local var110 = t_15
			
			for i_2, v in pairs(t_8) do
				if var110[i_2.Name] then
					var110[i_2.Name] = 0
				end
			end
		end
	end
	return Enum.ContextActionResult.Sink
end

local function GpButton(_, p21, p22)
	-- upvalues: t_14 (ref), status_6_1 (write), t_2 (ref), handleDoubleTapReset (ref)
	t_14[p22.KeyCode.Name] = if p21 == Enum.UserInputState.Begin then 1 else 0
	
	if status_6_1 and t_2[p22.KeyCode] and p22.UserInputState == Enum.UserInputState.Begin then
		handleDoubleTapReset(p22.KeyCode)
	end
	return Enum.ContextActionResult.Sink
end

local function MousePan(_, _, p23)
	-- upvalues: t_16 (ref)
	local delta = p23.Delta
	t_16.Delta = Vector2.new(-delta.y, -delta.x)
	
	return Enum.ContextActionResult.Sink
end

local function Thumb(_, _, p24)
	-- upvalues: t_14 (ref)
	t_14[p24.KeyCode.Name] = p24.Position
	
	return Enum.ContextActionResult.Sink
end

local function Trigger(_, _, p25)
	-- upvalues: t_14 (ref)
	t_14[p25.KeyCode.Name] = p25.Position.z
	
	return Enum.ContextActionResult.Sink
end

local function MouseWheel(_, _, p26)
	-- upvalues: t_16 (ref)
	t_16[p26.UserInputType.Name] = -p26.Position.z
	
	return Enum.ContextActionResult.Sink
end

local _ = function(p27)
	for i, v in pairs(p27) do
		p27[i] = v * 0
	end
end

function t_13.StartCapture()
	-- upvalues: status_5_1 (write), contextActionService (ref), Keypress (ref), value_1 (ref), GpButton (ref), status_6_1 (write), status_7_1 (write), status_9_1 (write), status_10_1 (write), status_12_1 (write), MousePan (ref), MouseWheel (ref), Trigger (ref), Thumb (ref)
	if status_5_1 then
		contextActionService:BindActionAtPriority("FreecamKeyboard", Keypress, false, value_1, Enum.KeyCode.W, Enum.KeyCode.U, Enum.KeyCode.A, Enum.KeyCode.H, Enum.KeyCode.S, Enum.KeyCode.J, Enum.KeyCode.D, Enum.KeyCode.K, Enum.KeyCode.E, Enum.KeyCode.I, Enum.KeyCode.Q, Enum.KeyCode.Y)
		contextActionService:BindActionAtPriority("FreecamKeyboardControlSpeed", Keypress, false, value_1, Enum.KeyCode.Up, Enum.KeyCode.Down, Enum.KeyCode.Left, Enum.KeyCode.Right)
		contextActionService:BindActionAtPriority("FreecamGamepadControlSpeed", GpButton, false, value_1, Enum.KeyCode.DPadUp, Enum.KeyCode.DPadDown, Enum.KeyCode.DPadLeft, Enum.KeyCode.DPadRight)
	else
		contextActionService:BindActionAtPriority("FreecamKeyboard", Keypress, false, value_1, Enum.KeyCode.W, Enum.KeyCode.U, Enum.KeyCode.A, Enum.KeyCode.H, Enum.KeyCode.S, Enum.KeyCode.J, Enum.KeyCode.D, Enum.KeyCode.K, Enum.KeyCode.E, Enum.KeyCode.I, Enum.KeyCode.Q, Enum.KeyCode.Y, Enum.KeyCode.Up, Enum.KeyCode.Down)
	end
	if status_6_1 then
		contextActionService:BindActionAtPriority("FreecamKeyboardTiltControl", Keypress, false, value_1, Enum.KeyCode.Z, Enum.KeyCode.C)
		contextActionService:BindActionAtPriority("FreecamGamepadTiltControl", GpButton, false, value_1, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
		contextActionService:BindActionAtPriority("FreecamKeyboardTiltControlSpeed", Keypress, false, value_1, Enum.KeyCode.Comma, Enum.KeyCode.Period)
		
		if status_7_1 then
			contextActionService:BindActionAtPriority("FreecamKeyboardSmoothnessControl", Keypress, false, value_1, Enum.KeyCode.LeftBracket, Enum.KeyCode.RightBracket, Enum.KeyCode.Semicolon, Enum.KeyCode.Quote, Enum.KeyCode.V, Enum.KeyCode.B, Enum.KeyCode.N, Enum.KeyCode.M)
		end
	end
	if status_9_1 then
		contextActionService:BindActionAtPriority("FreecamKeyboardDoFToggle", Keypress, false, value_1, Enum.KeyCode.BackSlash)
		contextActionService:BindActionAtPriority("FreecamKeyboardDoFControls", Keypress, false, value_1, Enum.KeyCode.Minus, Enum.KeyCode.Equals)
	end
	if status_10_1 then
		contextActionService:BindActionAtPriority("FreecamKeyboardPlayerLockToggle", Keypress, false, value_1, Enum.KeyCode.Slash)
		contextActionService:BindActionAtPriority("FreecamKeyboardPlayerLockSwitch", Keypress, false, value_1, Enum.KeyCode.R, Enum.KeyCode.T)
	end
	if status_12_1 then
		contextActionService:BindActionAtPriority("FreecamKeyboardCustomGuiToggle", Keypress, false, value_1, Enum.KeyCode.G)
		contextActionService:BindActionAtPriority("FreecamKeyboardPlayerGuiToggle", Keypress, false, value_1, Enum.KeyCode.X)
		contextActionService:BindActionAtPriority("FreecamKeyboardLeaderboardToggle", Keypress, false, value_1, Enum.KeyCode.L)
	end
	contextActionService:BindActionAtPriority("FreecamMousePan", MousePan, false, value_1, Enum.UserInputType.MouseMovement)
	contextActionService:BindActionAtPriority("FreecamMouseWheel", MouseWheel, false, value_1, Enum.UserInputType.MouseWheel)
	contextActionService:BindActionAtPriority("FreecamGamepadButton", GpButton, false, value_1, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY)
	contextActionService:BindActionAtPriority("FreecamGamepadTrigger", Trigger, false, value_1, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2)
	contextActionService:BindActionAtPriority("FreecamGamepadThumbstick", Thumb, false, value_1, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2)
end

function t_13.StopCapture()
	-- upvalues: status_12_1 (write), var71 (write), status_5_1 (write), var73 (write), status_6_1 (write), var72 (write), t_14 (ref), t_15 (ref), t_16 (ref), contextActionService (ref), status_7_1 (write), status_9_1 (write), status_10_1 (write)
	if not status_12_1 then
		var71 = 1
		
		if status_5_1 then
			var73 = 1
		end
		if status_6_1 then
			var72 = 1
		end
	end
	for i, v in pairs(t_14) do
		t_14[i] = v * 0
	end
	for i_1, v_1 in pairs(t_15) do
		t_15[i_1] = v_1 * 0
	end
	for i_2, v_2 in pairs(t_16) do
		t_16[i_2] = v_2 * 0
	end
	contextActionService:UnbindAction("FreecamKeyboard")
	
	if status_5_1 then
		contextActionService:UnbindAction("FreecamKeyboardControlSpeed")
		contextActionService:UnbindAction("FreecamGamepadControlSpeed")
	end
	if status_6_1 then
		contextActionService:UnbindAction("FreecamKeyboardTiltControl")
		contextActionService:UnbindAction("FreecamGamepadTiltControl")
		contextActionService:UnbindAction("FreecamKeyboardTiltControlSpeed")
		
		if status_7_1 then
			contextActionService:UnbindAction("FreecamKeyboardSmoothnessControl")
		end
	end
	if status_9_1 then
		contextActionService:UnbindAction("FreecamKeyboardDoFToggle")
		contextActionService:UnbindAction("FreecamKeyboardDoFControls")
	end
	if status_10_1 then
		contextActionService:UnbindAction("FreecamKeyboardPlayerLockToggle")
		contextActionService:UnbindAction("FreecamKeyboardPlayerLockSwitch")
	end
	if status_12_1 then
		contextActionService:UnbindAction("FreecamKeyboardCustomGuiToggle")
		contextActionService:UnbindAction("FreecamKeyboardPlayerGuiToggle")
		contextActionService:UnbindAction("FreecamKeyboardLeaderboardToggle")
	end
	contextActionService:UnbindAction("FreecamMousePan")
	contextActionService:UnbindAction("FreecamMouseWheel")
	contextActionService:UnbindAction("FreecamGamepadButton")
	contextActionService:UnbindAction("FreecamGamepadTrigger")
	contextActionService:UnbindAction("FreecamGamepadThumbstick")
end

function t_13.getNavSpeed()
	-- upvalues: var71 (write)
	return var71
end

function t_13.getFovSpeed()
	-- upvalues: var73 (write)
	return var73
end

function t_13.getRollSpeed()
	-- upvalues: var72 (write)
	return var72
end

thumbstickCurve = function(p28)
	-- upvalues: status_7_1 (write), t_13 (ref), status_9_1 (write), var9 (write), var58 (ref), var59 (ref), var60 (ref), status_6_1 (write), var61 (ref), var57 (write), rad (ref), tan (ref), sqrt (ref), clamp (ref), var33 (ref), var56 (write), vector3 (write), status_10_1 (write), var46 (write), var51 (write), var47 (write), var48 (write), status_12_1 (write), var10 (write), var8 (write), var34 (write), var35 (write), var36 (write), var37 (write), status_5_1 (write), t_11 (write), var50 (write), currentCamera (write)
	if status_7_1 then
		t_13.SpringControl(p28)
	end
	if status_9_1 and var9 and var9.Parent then
		t_13.DoF(p28)
	end
	local var116
	local var111 = var58:Update(p28, t_13.Vel(p28))
	local var112 = var59:Update(p28, t_13.Pan(p28))
	local var113 = var60:Update(p28, t_13.Fov(p28))
	local var114 = if status_6_1 then var61:Update(p28, t_13.Roll(p28)) else nil
	local var115 = sqrt(0.70020753821 / tan(rad(var57 / 2)))
	var57 = clamp(var57 + var113 * 300 * (p28 / var115), 1, 120)
	local _ = nil
	
	if status_6_1 then
		local var117 = var112 * var33 * (p28 / var115)
		var56 += Vector3.new(var117.X, var117.Y, var114 * -1.570796326795 * (p28 / var115))
		var56 = if status_7_1 then Vector3.new(var56.x % 6.28318530718, var56.y % 6.28318530718, var56.z % 6.28318530718) else Vector3.new(clamp(var56.x, -1.570796326795, 1.570796326795), var56.y % 6.28318530718, var56.z)
		var116 = CFrame.new(vector3) * CFrame.fromOrientation(var56.x, var56.y, var56.z) * CFrame.new(var111 * Vector3.new(64, 64, 64) * p28)
	else
		var56 += var112 * var33 * (p28 / var115)
		var56 = Vector2.new(clamp(var56.x, -1.570796326795, 1.570796326795), var56.y % 6.28318530718)
		var116 = CFrame.new(vector3) * CFrame.fromOrientation(var56.x, var56.y, 0) * CFrame.new(var111 * Vector3.new(64, 64, 64) * p28)
	end
	if status_10_1 and var46 and var51 then
		var47 = clamp(var47 + var111.Z * 64 * p28, 5, 50)
		var48 = clamp(var48 + var111.Y * 64 * p28, -10, 10)
		var116 = CFrame.new(var51.Position + Vector3.new(0, var48, 0)) * (if status_6_1 then CFrame.fromOrientation(var56.x, var56.y, var56.z) else CFrame.fromOrientation(var56.x, var56.y, 0)) * CFrame.new(0, 0, var47)
	end
	if status_12_1 and var10 and (var10.Parent and var8) and (var8.Parent and var8.Enabled) then
		local var118 = ""
		
		if p28 > 0 then
			local var119 = (var116.p - vector3) / p28
			var118 ..= string.format("Velocity: (%.1f, %.1f, %.1f)\n", var119.X, var119.Y, var119.Z)
		end
		var118 ..= string.format("FOV: %.1f\n", var57)
		
		if status_6_1 then
			var118 ..= string.format("Tilt: %.1f\194\176\n", math.deg(var56.z))
		end
		if status_7_1 then
			var118 = (((var118 .. string.format("Stiffness (Vel): %.1f\n", var34)) .. string.format("Stiffness (Pan): %.1f\n", var35)) .. string.format("Stiffness (FOV): %.1f\n", var36)) .. string.format("Stiffness (Roll): %.1f\n", var37)
		end
		if status_5_1 then
			var118 = ((var118 .. string.format("Movement Speed: %.1f\n", t_13.getNavSpeed())) .. string.format("Zoom Speed: %.1f\n", t_13.getFovSpeed())) .. string.format("Tilt Speed: %.1f\n", t_13.getRollSpeed())
		end
		if status_9_1 then
			var118 = if var9 and var9.Parent and var9.Enabled then ((((var118 .. string.format("Custom Depth Of Field: On\n")) .. string.format("Custom Depth Of Field Near Intensity: %.1f\n", var9.NearIntensity)) .. string.format("Custom Depth Of Field Far Intensity: %.1f\n", var9.FarIntensity)) .. string.format("Custom Depth Of Field Focus Distance: %.1f\n", var9.FocusDistance)) .. string.format("Custom Depth Of Field Focus Radius: %.1f\n", var9.InFocusRadius) else var118 .. string.format("Custom Depth Of Field: Off\n")
		end
		if status_10_1 then
			var118 = if var46 and #t_11 > 0 then var118 .. string.format("Player Lock: %s\n", t_11[var50].Name) else var118 .. string.format("Player Lock: Off\n")
		end
		var10.Text = var118
	end
	vector3 = var116.p
	currentCamera.CFrame = var116
	currentCamera.Focus = var116
	currentCamera.FieldOfView = var57
end

local _ = function()
	-- upvalues: playersService (ref), gameSettings (ref)
	return playersService.LocalPlayer.DevEnableMouseLock and (gameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch and (not (gameSettings.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove) and not (playersService.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable)))
end

t = {}
local removePlayerFromList = nil
local initializePlayerList = nil
local StartFreecam = nil
local StopFreecam = nil
local var86 = nil
local ToggleFreecam = nil
var71 = {}
var72 = {
	Backpack = true,
	Chat = true,
	Health = true,
	PlayerList = true
}
var73 = {
	BadgesNotificationsActive = true,
	PointsNotificationsActive = true
}

function t.Push()
	-- upvalues: var72 (ref), starterGuiService (ref), var73 (ref), localPlayer (write), var71 (write), status_4_1 (write), var41 (write), status_12_1 (write), var52 (write), ToggleFreecam (write), currentCamera (write), StartFreecam (write), var86 (write), StopFreecam (write), initializePlayerList (write), userInputService (ref), status_1 (write), playersService (ref), gameSettings (ref), removePlayerFromList (write)
	for i in pairs(var72) do
		var72[i] = starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType[i])
		starterGuiService:SetCoreGuiEnabled(Enum.CoreGuiType[i], false)
	end
	for i_1 in pairs(var73) do
		var73[i_1] = starterGuiService:GetCore(i_1)
		starterGuiService:SetCore(i_1, false)
	end
	local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
	
	if playerGui then
		for i_2, v in pairs(playerGui:GetChildren()) do
			if v:IsA("ScreenGui") and v.Enabled then
				var71[#var71 + 1] = v
				v.Enabled = false
			end
		end
		if status_4_1 then
			var41 = playerGui.ChildAdded:Connect(function(p29)
				-- upvalues: var71 (copy), status_12_1 (copy), var52 (copy)
				if p29:IsA("ScreenGui") and p29.Enabled then
					var71[#var71 + 1] = p29
					
					if status_12_1 then
						p29.Enabled = var52
						
						return
					end
					p29.Enabled = false
				end
			end)
		end
	end
	ToggleFreecam = currentCamera.FieldOfView
	currentCamera.FieldOfView = 70
	StartFreecam = currentCamera.CameraType
	currentCamera.CameraType = Enum.CameraType.Custom
	var86 = currentCamera.CFrame
	StopFreecam = currentCamera.Focus
	initializePlayerList = userInputService.MouseIconEnabled
	userInputService.MouseIconEnabled = false
	removePlayerFromList = if status_1 and (playersService.LocalPlayer.DevEnableMouseLock and (gameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch and (not (gameSettings.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove) and not (playersService.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable)))) then Enum.MouseBehavior.Default else userInputService.MouseBehavior
	userInputService.MouseBehavior = Enum.MouseBehavior.Default
end

function t.Pop()
	-- upvalues: var72 (ref), starterGuiService (ref), var73 (ref), var71 (write), status_12_1 (write), var8 (write), status_4_1 (write), var41 (write), currentCamera (write), ToggleFreecam (write), StartFreecam (write), var86 (write), StopFreecam (write), userInputService (ref), initializePlayerList (write), removePlayerFromList (write)
	for i, v in pairs(var72) do
		starterGuiService:SetCoreGuiEnabled(Enum.CoreGuiType[i], v)
	end
	for i_1, v_1 in pairs(var73) do
		starterGuiService:SetCore(i_1, v_1)
	end
	for i_2, v_2 in pairs(var71) do
		if status_12_1 then
			if v_2.Parent and v_2 ~= var8 then
				v_2.Enabled = true
			end
		elseif v_2.Parent then
			v_2.Enabled = true
		end
	end
	if status_4_1 then
		if var41 then
			var41:Disconnect()
			var41 = nil
		end
		var71 = {}
	end
	currentCamera.FieldOfView = ToggleFreecam
	ToggleFreecam = nil
	currentCamera.CameraType = StartFreecam
	StartFreecam = nil
	currentCamera.CFrame = var86
	var86 = nil
	currentCamera.Focus = StopFreecam
	StopFreecam = nil
	userInputService.MouseIconEnabled = initializePlayerList
	initializePlayerList = nil
	userInputService.MouseBehavior = removePlayerFromList
	removePlayerFromList = nil
end

function t.getScreenGuis()
	-- upvalues: var71 (write)
	return var71
end

removePlayerFromList = function(p30)
	-- upvalues: t_11 (write), var50 (write), var46 (write)
	for i, v in ipairs(t_11) do
		if v == p30 then
			table.remove(t_11, i)
			
			if var50 == i and var46 then
				var46 = false
				var50 = 1
			end
			if i < var50 then
				var50 -= 1
			end
			if #t_11 >= var50 and var50 >= 1 then break end
			var50 = 1
			
			return
		end
	end
end

initializePlayerList = function()
	-- upvalues: t_11 (write), playersService (ref), localPlayer (write), var50 (write), var44 (write), var45 (write), removePlayerFromList (ref)
	t_11 = playersService:GetPlayers()
	
	for i, v in ipairs(t_11) do
		if v == localPlayer then
			var50 = i
			break
		end
	end
	var44 = playersService.PlayerAdded:Connect(function(p31)
		-- upvalues: t_11 (copy)
		table.insert(t_11, p31)
	end)
	var45 = playersService.PlayerRemoving:Connect(removePlayerFromList)
end

StartFreecam = function()
	-- upvalues: status_10_1 (write), initializePlayerList (ref), status_8_1 (write), status_2_1 (write), currentCamera (write), status_6_1 (write), var56 (write), vector3 (write), var57 (write), var58 (ref), var59 (ref), var60 (ref), var61 (ref), status_12_1 (write), status_7_1 (write), var34 (write), var35 (write), var36 (write), var37 (write), var7 (write), localPlayer (write), var8 (write), var10 (write), t (write), status_9_1 (write), var9 (write), runService (ref), thumbstickCurve (ref), t_13 (ref)
	if status_10_1 then
		initializePlayerList()
	end
	if not status_8_1 and status_2_1 then
		script:SetAttribute("FreecamEnabled", true)
	end
	local cFrame = currentCamera.CFrame
	var56 = if status_6_1 then Vector3.new(cFrame:toEulerAnglesYXZ()) else Vector2.new(cFrame:toEulerAnglesYXZ())
	vector3 = cFrame.p
	var57 = currentCamera.FieldOfView
	var58:Reset(Vector3.new())
	var59:Reset(Vector2.new())
	var60:Reset(0)
	
	if status_6_1 then
		var61:Reset(0)
	end
	if not status_12_1 and status_7_1 then
		var34 = 1.5
		var35 = 1
		var36 = 4
		var37 = 1
	end
	if status_12_1 then
		var7 = localPlayer:WaitForChild("PlayerGui")
		var8 = var7:WaitForChild("Freecam")
		
		if not var10 or not var10.Parent then
			var10 = Instance.new("TextLabel")
			var10.Name = "FreecamCustomGui"
			var10.TextColor3 = Color3.new(1, 1, 1)
			var10.Font = Enum.Font.SourceSansBold
			var10.TextSize = 20
			var10.TextStrokeTransparency = 0
			var10.BackgroundTransparency = 1
			var10.TextWrapped = true
			var10.TextXAlignment = Enum.TextXAlignment.Right
			var10.AutomaticSize = Enum.AutomaticSize.Y
			var10.AnchorPoint = Vector2.new(1, 1)
			var10.Position = UDim2.new(1, -10, 1, -10)
			var10.Size = UDim2.new(0, 400, 0, 0)
			var10.Parent = var8
		end
	end
	t.Push()
	
	if status_9_1 and (not var9 or not var9.Parent) then
		var9 = Instance.new("DepthOfFieldEffect")
		var9.Enabled = false
		var9.Name = "FreecamDepthOfField"
		var9.Parent = currentCamera
	end
	runService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, thumbstickCurve)
	t_13.StartCapture()
end

StopFreecam = function()
	-- upvalues: status_8_1 (write), status_2_1 (write), status_10_1 (write), var44 (write), var45 (write), var46 (write), var50 (write), t_11 (write), status_9_1 (write), var9 (write), t_10 (write), var42 (write), var43 (write), status_12_1 (write), var8 (write), var52 (write), var53 (write), t_13 (ref), runService (ref), t (write)
	if not status_8_1 and status_2_1 then
		script:SetAttribute("FreecamEnabled", false)
	end
	if status_10_1 then
		if var44 then
			var44:Disconnect()
			var44 = nil
		end
		if var45 then
			var45:Disconnect()
			var45 = nil
		end
		var46 = false
		var50 = 1
		t_11 = {}
	end
	if status_9_1 and var9 and var9.Parent then
		if var9.Enabled then
			for i, v in ipairs(t_10) do
				if v.Parent then
					v.Enabled = true
				end
			end
			if var42 then
				var42:Disconnect()
				var42 = nil
			end
			if var43 then
				var43:Disconnect()
				var43 = nil
			end
			t_10 = {}
		end
		var9.Enabled = false
	end
	if status_12_1 then
		if var8 and var8.Parent then
			var8.Enabled = false
		end
		var52 = false
		var53 = false
	end
	t_13.StopCapture()
	runService:UnbindFromRenderStep("Freecam")
	t.Pop()
end

var86 = false

ToggleFreecam = function()
	-- upvalues: var86 (write), StopFreecam (ref), StartFreecam (ref), status_8_1 (write)
	if var86 then
		StopFreecam()
	else
		StartFreecam()
	end
	var86 = not var86
	
	if status_8_1 then
		script:SetAttribute("FreecamEnabled", var86)
	end
end

var71 = function(p32)
	-- upvalues: userInputService (ref), var86 (write), StopFreecam (ref), StartFreecam (ref), status_8_1 (write)
	for i = 1, #p32 - 1 do
		if userInputService:IsKeyDown(p32[i]) then
			continue
		end
		return
	end
	if var86 then
		StopFreecam()
	else
		StartFreecam()
	end
	var86 = not var86
	
	if status_8_1 then
		script:SetAttribute("FreecamEnabled", var86)
	end
end

contextActionService:BindActionAtPriority("FreecamToggle", function(_, p33, p34)
	-- upvalues: list (ref), var71 (ref)
	if p33 == Enum.UserInputState.Begin and p34.KeyCode == list[#list] then
		var71(list)
	end
	return Enum.ContextActionResult.Pass
end, false, value, list[#list])

if status_8_1 or status_2_1 then
	script:SetAttribute("FreecamEnabled", var86)
	script:GetAttributeChangedSignal("FreecamEnabled"):Connect(function()
		-- upvalues: var86 (write), StartFreecam (ref), StopFreecam (ref)
		local freecamEnabledAttribute = script:GetAttribute("FreecamEnabled")
		
		if typeof(freecamEnabledAttribute) ~= "boolean" then
			script:SetAttribute("FreecamEnabled", var86)
			
			return
		elseif freecamEnabledAttribute ~= var86 then
			if freecamEnabledAttribute then
				StartFreecam()
				var86 = true
				
				return
			end
			StopFreecam()
			var86 = false
		end
	end)
end
return {}