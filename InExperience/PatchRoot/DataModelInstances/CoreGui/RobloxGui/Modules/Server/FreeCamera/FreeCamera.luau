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
local var1 = nil
local var2 = nil
local currentCamera = workspaceService.CurrentCamera
workspaceService:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: workspaceService (ref), currentCamera (write)
	local currentCamera_1 = workspaceService.CurrentCamera
	
	if currentCamera_1 then
		currentCamera = currentCamera_1
	end
end)
local var3 = nil
local var4 = nil
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
local var5 = Vector2.new(0.75, 1) * 8
local var6 = 1.5
local var7 = 1
local var8 = 4
local var9 = 1
local t_9 = {}
local var10 = 0
local t_10 = {}
local var11 = nil
local var12 = nil
local var13 = nil
local var14 = nil
local var15 = nil
local var16 = false
local var17 = 20
local var18 = 0
local t_11 = {}
local var19 = 1
local var20 = nil
local var21 = false
local var22 = false
local t_12 = {}
t_12.__index = t_12

function t_12.new(p1, p2)
	-- upvalues: t_12 (ref)
	local tbl = setmetatable({}, t_12)
	tbl.f = p1
	tbl.p = p2
	tbl.v = p2 * 0
	
	return tbl
end

function t_12:Update(p1, p2)
	-- upvalues: exp (ref)
	local var23 = self.f * 2 * 3.14159265359
	local v = self.v
	local var24 = p2 - self.p
	local var25 = exp(-var23 * p1)
	local var26 = p2 + (v * p1 - var24 * (var23 * p1 + 1)) * var25
	local var27 = (var23 * p1 * (var24 * var23 - v) + v) * var25
	self.p = var26
	self.v = var27
	
	return var26
end

function t_12:SetFreq(p1)
	self.f = p1
end

function t_12:Reset(p1)
	self.p = p1
	self.v = p1 * 0
end

local vector3 = Vector3.new()
local var23 = if status_6_1 then Vector3.new() else Vector2.new()
local var24 = 0
local var25 = t_12.new(var6, Vector3.new())
local var26 = t_12.new(var7, Vector2.new())
local var27 = t_12.new(var8, 0)
local var28 = t_12.new(var9, 0)
local t_13 = {}
local _ = nil

local function _(p1)
	-- upvalues: exp (ref)
	return (exp(2 * p1) - 1) / 6.389056098931
end

local _ = function(p1)
	-- upvalues: exp (ref)
	return (exp(2 * ((p1 - 0.15) / 0.85)) - 1) / 6.389056098931
end

local function thumbstickCurve(p1)
	-- upvalues: sign (ref), abs (ref), exp (ref), clamp (ref)
	return sign(p1) * clamp((exp(2 * ((abs(p1) - 0.15) / 0.85)) - 1) / 6.389056098931, 0, 1)
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
local var29 = Vector2.new(1, 1) * 0.049087385212
local var30 = var29 / 60
local var31 = Vector2.new(1, 1) * 0.392699081699
local t_17 = {
	FarIntensity = { ADJ = 0.1, MIN = 0, MAX = 1 },
	NearIntensity = { ADJ = 0.1, MIN = 0, MAX = 1 },
	FocusDistance = { ADJ = 20, MIN = 0, MAX = 200 },
	FocusRadius = { ADJ = 5, MIN = 0, MAX = 50 }
}
local var32 = 1
local var33 = 1
local var34 = 1

function t_13.Vel(p1)
	-- upvalues: status_5_1 (write), var32 (write), t_15 (ref), t_14 (ref), clamp (ref), thumbstickCurve (write), userInputService (ref)
	var32 = if status_5_1 then clamp(var32 + p1 * (t_15.Up - t_15.Down + t_14.DPadUp - t_14.DPadDown) * 0.75, 0.01, 4) else clamp(var32 + p1 * (t_15.Up - t_15.Down) * 0.75, 0.01, 4)
	
	return (Vector3.new(thumbstickCurve(t_14.Thumbstick1.X), thumbstickCurve(t_14.ButtonR2) - thumbstickCurve(t_14.ButtonL2), thumbstickCurve(-t_14.Thumbstick1.Y)) * Vector3.new(1, 1, 1) + Vector3.new(t_15.D - t_15.A + t_15.K - t_15.H, t_15.E - t_15.Q + t_15.I - t_15.Y, t_15.S - t_15.W + t_15.J - t_15.U) * Vector3.new(1, 1, 1)) * (var32 * (if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) or userInputService:IsKeyDown(Enum.KeyCode.RightShift) then 0.25 else 1))
end

function t_13.Pan(p1)
	-- upvalues: thumbstickCurve (write), t_14 (ref), var31 (ref), t_16 (ref), var29 (ref), status_3_1 (write), var30 (ref)
	local var35 = Vector2.new(thumbstickCurve(t_14.Thumbstick2.Y), thumbstickCurve(-t_14.Thumbstick2.X)) * var31
	local var36 = if status_3_1 and p1 > 0 then t_16.Delta / p1 * var30 else t_16.Delta * var29
	t_16.Delta = Vector2.new()
	
	return var35 + var36
end

function t_13.Fov(p1)
	-- upvalues: status_5_1 (write), var34 (write), t_15 (ref), t_14 (ref), clamp (ref), t_16 (ref), status_3_1 (write)
	if status_5_1 then
		var34 = clamp(var34 + p1 * (t_15.Right - t_15.Left + t_14.DPadRight - t_14.DPadLeft) * 0.75, 0.01, 4)
	end
	local var35 = (t_14.ButtonX - t_14.ButtonY) * 0.25
	local var36 = if status_3_1 and p1 > 0 then t_16.MouseWheel / p1 * 0.016666666667 else t_16.MouseWheel * 1
	t_16.MouseWheel = 0
	
	return if status_5_1 then (var35 + var36) * var34 else var35 + var36
end

function t_13.Roll(p1)
	-- upvalues: var33 (write), t_15 (ref), clamp (ref), t_14 (ref)
	var33 = clamp(var33 + p1 * (t_15.Period - t_15.Comma) * 0.75, 0.01, 4)
	
	return ((t_14.ButtonR1 - t_14.ButtonL1) * 1 + (t_15.C - t_15.Z) * 1) * var33
end

function t_13.SpringControl(p1)
	-- upvalues: status_9_1 (write), userInputService (ref), var6 (write), t_15 (ref), clamp (ref), var25 (ref), var7 (write), var26 (ref), var8 (write), var27 (ref), var9 (write), var28 (ref)
	if status_9_1 then
		if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) or userInputService:IsKeyDown(Enum.KeyCode.RightShift) or (userInputService:IsKeyDown(Enum.KeyCode.LeftControl) or userInputService:IsKeyDown(Enum.KeyCode.RightControl)) then
			return
		end
	end
	var6 = clamp(var6 + p1 * (t_15.RightBracket - t_15.LeftBracket) * 0.75, 0.01, 10)
	var25:SetFreq(var6)
	var7 = clamp(var7 + p1 * (t_15.Quote - t_15.Semicolon) * 0.75, 0.01, 10)
	var26:SetFreq(var7)
	var8 = clamp(var8 + p1 * (t_15.B - t_15.V) * 0.75, 0.01, 10)
	var27:SetFreq(var8)
	var9 = clamp(var9 + p1 * (t_15.M - t_15.N) * 0.75, 0.01, 10)
	var28:SetFreq(var9)
end

function t_13.DoF(p1)
	-- upvalues: userInputService (ref), var3 (write), t_15 (ref), t_17 (ref), clamp (ref)
	local leftControl = userInputService:IsKeyDown(Enum.KeyCode.LeftControl) or userInputService:IsKeyDown(Enum.KeyCode.RightControl)
	
	if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) or userInputService:IsKeyDown(Enum.KeyCode.RightShift) then
		var3.FarIntensity = clamp(var3.FarIntensity + p1 * (t_15.RightBracket - t_15.LeftBracket) * t_17.FarIntensity.ADJ, t_17.FarIntensity.MIN, t_17.FarIntensity.MAX)
		var3.InFocusRadius = clamp(var3.InFocusRadius + p1 * (t_15.Equals - t_15.Minus) * t_17.FocusRadius.ADJ, t_17.FocusRadius.MIN, t_17.FocusRadius.MAX)
		
		return
	elseif leftControl then
		var3.NearIntensity = clamp(var3.NearIntensity + p1 * (t_15.RightBracket - t_15.LeftBracket) * t_17.NearIntensity.ADJ, t_17.NearIntensity.MIN, t_17.NearIntensity.MAX)
		
		return
	end
	var3.FocusDistance = clamp(var3.FocusDistance + p1 * (t_15.Equals - t_15.Minus) * t_17.FocusDistance.ADJ, t_17.FocusDistance.MIN, t_17.FocusDistance.MAX)
end

local _ = function(value, p1)
	for i, v in pairs(value) do
		if p1[i.Name] then
			p1[i.Name] = 0
		end
	end
end

local function handleDoubleTapReset(value)
	-- upvalues: t_9 (ref), var10 (write), var23 (write), var28 (ref), status_9_1 (write), t_2 (ref), t_14 (ref), t_1 (ref), t_15 (ref)
	local processTime = os.clock()
	local var35 = t_9[value]
	
	if var35 and (if var35 then processTime - var35 else -1) <= 0.25 and processTime - var10 >= 0.1 then
		var23 = Vector3.new(var23.x, var23.y, 0)
		var28:Reset(0)
		
		if status_9_1 then
			for i, v in pairs(t_2) do
				if t_14[i.Name] then
					t_14[i.Name] = 0
				end
			end
			local var36 = t_15
			
			for i_1, v in pairs(t_1) do
				if var36[i_1.Name] then
					var36[i_1.Name] = 0
				end
			end
		else
			t_14.ButtonL1 = 0
			t_14.ButtonR1 = 0
			t_15.C = 0
			t_15.Z = 0
		end
		var10 = processTime
	end
	t_9[value] = processTime
end

local function findPlayerLockRootPart(p2)
	-- upvalues: t_11 (write), var19 (write), var16 (write)
	if not t_11 or #t_11 < 1 then
		return nil
	end
	for _ = 1, #t_11 do
		var19 = (var19 - 1 + p2) % #t_11 + 1
		local var37 = t_11[var19]
		local character = var37 and var37.Character
		
		if character then
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			
			if not humanoid or not humanoid.RootPart then
				if p2 == 0 then
					p2 = 1
				end
			end
			return humanoid.RootPart
		end
	end
	var16 = false
	
	return nil
end

local function Keypress(_, p3, p4)
	-- upvalues: t_15 (ref), status_6_1 (write), t_1 (ref), handleDoubleTapReset (ref), status_9_1 (write), t_3 (ref), var3 (write), t_10 (write), currentCamera (write), lightingService (ref), var12 (write), var13 (write), status_10_1 (write), t_4 (ref), var16 (write), var17 (write), status_11_1 (write), var18 (write), var20 (write), findPlayerLockRootPart (ref), t_5 (ref), t_11 (write), status_12_1 (write), t_6 (ref), var2 (write), t_7 (ref), var21 (write), t (write), t_8 (ref), var22 (write), starterGuiService (ref)
	t_15[p4.KeyCode.Name] = if p3 == Enum.UserInputState.Begin then 1 else 0
	
	if status_6_1 and t_1[p4.KeyCode] and p4.UserInputState == Enum.UserInputState.Begin then
		handleDoubleTapReset(p4.KeyCode)
	end
	if status_9_1 and t_3[p4.KeyCode] and p4.UserInputState == Enum.UserInputState.Begin then
		if var3.Enabled then
			for i, v in ipairs(t_10) do
				if v.Parent then
					v.Enabled = true
				end
			end
			if var12 then
				var12:Disconnect()
				var12 = nil
			end
			if var13 then
				var13:Disconnect()
				var13 = nil
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
			var12 = currentCamera.ChildAdded:Connect(function(p5)
				-- upvalues: t_10 (copy)
				if p5:IsA("DepthOfFieldEffect") and p5.Enabled then
					t_10[#t_10 + 1] = p5
					p5.Enabled = false
				end
			end)
			var13 = lightingService.ChildAdded:Connect(function(p5)
				-- upvalues: t_10 (copy)
				if p5:IsA("DepthOfFieldEffect") and p5.Enabled then
					t_10[#t_10 + 1] = p5
					p5.Enabled = false
				end
			end)
		end
		var3.Enabled = not var3.Enabled
		local var38 = t_15
		
		for i_2, v in pairs(t_3) do
			if var38[i_2.Name] then
				var38[i_2.Name] = 0
			end
		end
	end
	if status_10_1 then
		if t_4[p4.KeyCode] and p4.UserInputState == Enum.UserInputState.Begin then
			var16 = not var16
			
			if var16 then
				var17 = 20
				
				if status_11_1 then
					var18 = 0
				end
				var20 = findPlayerLockRootPart(0)
			end
			local var39 = t_15
			
			for i_2, v in pairs(t_4) do
				if var39[i_2.Name] then
					var39[i_2.Name] = 0
				end
			end
		end
		if t_5[p4.KeyCode] and p4.UserInputState == Enum.UserInputState.Begin then
			if var16 and #t_11 > 0 then
				var20 = findPlayerLockRootPart(t_15.T - t_15.R)
			end
			local var40 = t_15
			
			for i_2, v in pairs(t_5) do
				if var40[i_2.Name] then
					var40[i_2.Name] = 0
				end
			end
		end
	end
	if status_12_1 then
		if t_6[p4.keyCode] and p4.UserInputState == Enum.UserInputState.Begin then
			if var2 and var2.Parent then
				var2.Enabled = not var2.Enabled
			end
			local var41 = t_15
			
			for i_2, v in pairs(t_6) do
				if var41[i_2.Name] then
					var41[i_2.Name] = 0
				end
			end
		end
		if t_7[p4.keyCode] and p4.UserInputState == Enum.UserInputState.Begin then
			var21 = not var21
			
			if t then
				for i_2, v_3 in pairs(t.getScreenGuis()) do
					if v_3.Parent and v_3 ~= var2 then
						v_3.Enabled = var21
					end
				end
			end
			local var42 = t_15
			
			for i_2, v in pairs(t_7) do
				if var42[i_2.Name] then
					var42[i_2.Name] = 0
				end
			end
		end
		if t_8[p4.keyCode] and p4.UserInputState == Enum.UserInputState.Begin then
			var22 = not var22
			starterGuiService:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, var22)
			local var43 = t_15
			
			for i_2, v in pairs(t_8) do
				if var43[i_2.Name] then
					var43[i_2.Name] = 0
				end
			end
		end
	end
	return Enum.ContextActionResult.Sink
end

local function GpButton(_, p5, p6)
	-- upvalues: t_14 (ref), status_6_1 (write), t_2 (ref), handleDoubleTapReset (ref)
	t_14[p6.KeyCode.Name] = if p5 == Enum.UserInputState.Begin then 1 else 0
	
	if status_6_1 and t_2[p6.KeyCode] and p6.UserInputState == Enum.UserInputState.Begin then
		handleDoubleTapReset(p6.KeyCode)
	end
	return Enum.ContextActionResult.Sink
end

local function MousePan(_, _, p5)
	-- upvalues: t_16 (ref)
	local delta = p5.Delta
	t_16.Delta = Vector2.new(-delta.y, -delta.x)
	
	return Enum.ContextActionResult.Sink
end

local function Thumb(_, _, p5)
	-- upvalues: t_14 (ref)
	t_14[p5.KeyCode.Name] = p5.Position
	
	return Enum.ContextActionResult.Sink
end

local function Trigger(_, _, p5)
	-- upvalues: t_14 (ref)
	t_14[p5.KeyCode.Name] = p5.Position.z
	
	return Enum.ContextActionResult.Sink
end

local function MouseWheel(_, _, p5)
	-- upvalues: t_16 (ref)
	t_16[p5.UserInputType.Name] = -p5.Position.z
	
	return Enum.ContextActionResult.Sink
end

local _ = function(p5)
	for i, v in pairs(p5) do
		p5[i] = v * 0
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
	-- upvalues: status_12_1 (write), var32 (write), status_5_1 (write), var34 (write), status_6_1 (write), var33 (write), t_14 (ref), t_15 (ref), t_16 (ref), contextActionService (ref), status_7_1 (write), status_9_1 (write), status_10_1 (write)
	if not status_12_1 then
		var32 = 1
		
		if status_5_1 then
			var34 = 1
		end
		if status_6_1 then
			var33 = 1
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
	-- upvalues: var32 (write)
	return var32
end

function t_13.getFovSpeed()
	-- upvalues: var34 (write)
	return var34
end

function t_13.getRollSpeed()
	-- upvalues: var33 (write)
	return var33
end

thumbstickCurve = function(p6)
	-- upvalues: status_7_1 (write), t_13 (ref), status_9_1 (write), var3 (write), var25 (ref), var26 (ref), var27 (ref), status_6_1 (write), var28 (ref), var24 (write), rad (ref), tan (ref), sqrt (ref), clamp (ref), var5 (ref), var23 (write), vector3 (write), status_10_1 (write), var16 (write), var20 (write), var17 (write), var18 (write), status_12_1 (write), var4 (write), var2 (write), var6 (write), var7 (write), var8 (write), var9 (write), status_5_1 (write), t_11 (write), var19 (write), currentCamera (write)
	if status_7_1 then
		t_13.SpringControl(p6)
	end
	if status_9_1 and var3 and var3.Parent then
		t_13.DoF(p6)
	end
	local var44
	local var45 = var25:Update(p6, t_13.Vel(p6))
	local var46 = var26:Update(p6, t_13.Pan(p6))
	local var47 = var27:Update(p6, t_13.Fov(p6))
	local var48 = if status_6_1 then var28:Update(p6, t_13.Roll(p6)) else nil
	local var49 = sqrt(0.70020753821 / tan(rad(var24 / 2)))
	var24 = clamp(var24 + var47 * 300 * (p6 / var49), 1, 120)
	local _ = nil
	
	if status_6_1 then
		local var50 = var46 * var5 * (p6 / var49)
		var23 += Vector3.new(var50.X, var50.Y, var48 * -1.570796326795 * (p6 / var49))
		var23 = if status_7_1 then Vector3.new(var23.x % 6.28318530718, var23.y % 6.28318530718, var23.z % 6.28318530718) else Vector3.new(clamp(var23.x, -1.570796326795, 1.570796326795), var23.y % 6.28318530718, var23.z)
		var44 = CFrame.new(vector3) * CFrame.fromOrientation(var23.x, var23.y, var23.z) * CFrame.new(var45 * Vector3.new(64, 64, 64) * p6)
	else
		var23 += var46 * var5 * (p6 / var49)
		var23 = Vector2.new(clamp(var23.x, -1.570796326795, 1.570796326795), var23.y % 6.28318530718)
		var44 = CFrame.new(vector3) * CFrame.fromOrientation(var23.x, var23.y, 0) * CFrame.new(var45 * Vector3.new(64, 64, 64) * p6)
	end
	if status_10_1 and var16 and var20 then
		var17 = clamp(var17 + var45.Z * 64 * p6, 5, 50)
		var18 = clamp(var18 + var45.Y * 64 * p6, -10, 10)
		var44 = CFrame.new(var20.Position + Vector3.new(0, var18, 0)) * (if status_6_1 then CFrame.fromOrientation(var23.x, var23.y, var23.z) else CFrame.fromOrientation(var23.x, var23.y, 0)) * CFrame.new(0, 0, var17)
	end
	if status_12_1 and var4 and (var4.Parent and var2) and (var2.Parent and var2.Enabled) then
		local var51 = ""
		
		if p6 > 0 then
			local var52 = (var44.p - vector3) / p6
			var51 ..= string.format("Velocity: (%.1f, %.1f, %.1f)\n", var52.X, var52.Y, var52.Z)
		end
		var51 ..= string.format("FOV: %.1f\n", var24)
		
		if status_6_1 then
			var51 ..= string.format("Tilt: %.1f\194\176\n", math.deg(var23.z))
		end
		if status_7_1 then
			var51 = (((var51 .. string.format("Stiffness (Vel): %.1f\n", var6)) .. string.format("Stiffness (Pan): %.1f\n", var7)) .. string.format("Stiffness (FOV): %.1f\n", var8)) .. string.format("Stiffness (Roll): %.1f\n", var9)
		end
		if status_5_1 then
			var51 = ((var51 .. string.format("Movement Speed: %.1f\n", t_13.getNavSpeed())) .. string.format("Zoom Speed: %.1f\n", t_13.getFovSpeed())) .. string.format("Tilt Speed: %.1f\n", t_13.getRollSpeed())
		end
		if status_9_1 then
			var51 = if var3 and var3.Parent and var3.Enabled then ((((var51 .. string.format("Custom Depth Of Field: On\n")) .. string.format("Custom Depth Of Field Near Intensity: %.1f\n", var3.NearIntensity)) .. string.format("Custom Depth Of Field Far Intensity: %.1f\n", var3.FarIntensity)) .. string.format("Custom Depth Of Field Focus Distance: %.1f\n", var3.FocusDistance)) .. string.format("Custom Depth Of Field Focus Radius: %.1f\n", var3.InFocusRadius) else var51 .. string.format("Custom Depth Of Field: Off\n")
		end
		if status_10_1 then
			var51 = if var16 and #t_11 > 0 then var51 .. string.format("Player Lock: %s\n", t_11[var19].Name) else var51 .. string.format("Player Lock: Off\n")
		end
		var4.Text = var51
	end
	vector3 = var44.p
	currentCamera.CFrame = var44
	currentCamera.Focus = var44
	currentCamera.FieldOfView = var24
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
local var44 = nil
local ToggleFreecam = nil
var32 = {}
var33 = {
	Backpack = true,
	Chat = true,
	Health = true,
	PlayerList = true
}
var34 = {
	BadgesNotificationsActive = true,
	PointsNotificationsActive = true
}

function t.Push()
	-- upvalues: var33 (ref), starterGuiService (ref), var34 (ref), localPlayer (write), var32 (write), status_4_1 (write), var11 (write), status_12_1 (write), var21 (write), ToggleFreecam (write), currentCamera (write), StartFreecam (write), var44 (write), StopFreecam (write), initializePlayerList (write), userInputService (ref), status_1 (write), playersService (ref), gameSettings (ref), removePlayerFromList (write)
	for i in pairs(var33) do
		var33[i] = starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType[i])
		starterGuiService:SetCoreGuiEnabled(Enum.CoreGuiType[i], false)
	end
	for i_1 in pairs(var34) do
		var34[i_1] = starterGuiService:GetCore(i_1)
		starterGuiService:SetCore(i_1, false)
	end
	local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
	
	if playerGui then
		for i_2, v in pairs(playerGui:GetChildren()) do
			if v:IsA("ScreenGui") and v.Enabled then
				var32[#var32 + 1] = v
				v.Enabled = false
			end
		end
		if status_4_1 then
			var11 = playerGui.ChildAdded:Connect(function(p6)
				-- upvalues: var32 (copy), status_12_1 (copy), var21 (copy)
				if p6:IsA("ScreenGui") and p6.Enabled then
					var32[#var32 + 1] = p6
					
					if status_12_1 then
						p6.Enabled = var21
						
						return
					end
					p6.Enabled = false
				end
			end)
		end
	end
	ToggleFreecam = currentCamera.FieldOfView
	currentCamera.FieldOfView = 70
	StartFreecam = currentCamera.CameraType
	currentCamera.CameraType = Enum.CameraType.Custom
	var44 = currentCamera.CFrame
	StopFreecam = currentCamera.Focus
	initializePlayerList = userInputService.MouseIconEnabled
	userInputService.MouseIconEnabled = false
	removePlayerFromList = if status_1 and (playersService.LocalPlayer.DevEnableMouseLock and (gameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch and (not (gameSettings.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove) and not (playersService.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable)))) then Enum.MouseBehavior.Default else userInputService.MouseBehavior
	userInputService.MouseBehavior = Enum.MouseBehavior.Default
end

function t.Pop()
	-- upvalues: var33 (ref), starterGuiService (ref), var34 (ref), var32 (write), status_12_1 (write), var2 (write), status_4_1 (write), var11 (write), currentCamera (write), ToggleFreecam (write), StartFreecam (write), var44 (write), StopFreecam (write), userInputService (ref), initializePlayerList (write), removePlayerFromList (write)
	for i, v in pairs(var33) do
		starterGuiService:SetCoreGuiEnabled(Enum.CoreGuiType[i], v)
	end
	for i_1, v_1 in pairs(var34) do
		starterGuiService:SetCore(i_1, v_1)
	end
	for i_2, v_2 in pairs(var32) do
		if status_12_1 then
			if v_2.Parent and v_2 ~= var2 then
				v_2.Enabled = true
			end
		elseif v_2.Parent then
			v_2.Enabled = true
		end
	end
	if status_4_1 then
		if var11 then
			var11:Disconnect()
			var11 = nil
		end
		var32 = {}
	end
	currentCamera.FieldOfView = ToggleFreecam
	ToggleFreecam = nil
	currentCamera.CameraType = StartFreecam
	StartFreecam = nil
	currentCamera.CFrame = var44
	var44 = nil
	currentCamera.Focus = StopFreecam
	StopFreecam = nil
	userInputService.MouseIconEnabled = initializePlayerList
	initializePlayerList = nil
	userInputService.MouseBehavior = removePlayerFromList
	removePlayerFromList = nil
end

function t.getScreenGuis()
	-- upvalues: var32 (write)
	return var32
end

removePlayerFromList = function(p6)
	-- upvalues: t_11 (write), var19 (write), var16 (write)
	for i, v in ipairs(t_11) do
		if v == p6 then
			table.remove(t_11, i)
			
			if var19 == i and var16 then
				var16 = false
				var19 = 1
			end
			if i < var19 then
				var19 -= 1
			end
			if #t_11 >= var19 and var19 >= 1 then break end
			var19 = 1
			
			return
		end
	end
end

initializePlayerList = function()
	-- upvalues: t_11 (write), playersService (ref), localPlayer (write), var19 (write), var14 (write), var15 (write), removePlayerFromList (ref)
	t_11 = playersService:GetPlayers()
	
	for i, v in ipairs(t_11) do
		if v == localPlayer then
			var19 = i
			break
		end
	end
	var14 = playersService.PlayerAdded:Connect(function(p7)
		-- upvalues: t_11 (copy)
		table.insert(t_11, p7)
	end)
	var15 = playersService.PlayerRemoving:Connect(removePlayerFromList)
end

StartFreecam = function()
	-- upvalues: status_10_1 (write), initializePlayerList (ref), status_8_1 (write), status_2_1 (write), currentCamera (write), status_6_1 (write), var23 (write), vector3 (write), var24 (write), var25 (ref), var26 (ref), var27 (ref), var28 (ref), status_12_1 (write), status_7_1 (write), var6 (write), var7 (write), var8 (write), var9 (write), var1 (write), localPlayer (write), var2 (write), var4 (write), t (write), status_9_1 (write), var3 (write), runService (ref), thumbstickCurve (ref), t_13 (ref)
	if status_10_1 then
		initializePlayerList()
	end
	if not status_8_1 and status_2_1 then
		script:SetAttribute("FreecamEnabled", true)
	end
	local cFrame = currentCamera.CFrame
	var23 = if status_6_1 then Vector3.new(cFrame:toEulerAnglesYXZ()) else Vector2.new(cFrame:toEulerAnglesYXZ())
	vector3 = cFrame.p
	var24 = currentCamera.FieldOfView
	var25:Reset(Vector3.new())
	var26:Reset(Vector2.new())
	var27:Reset(0)
	
	if status_6_1 then
		var28:Reset(0)
	end
	if not status_12_1 and status_7_1 then
		var6 = 1.5
		var7 = 1
		var8 = 4
		var9 = 1
	end
	if status_12_1 then
		var1 = localPlayer:WaitForChild("PlayerGui")
		var2 = var1:WaitForChild("Freecam")
		
		if not var4 or not var4.Parent then
			var4 = Instance.new("TextLabel")
			var4.Name = "FreecamCustomGui"
			var4.TextColor3 = Color3.new(1, 1, 1)
			var4.Font = Enum.Font.SourceSansBold
			var4.TextSize = 20
			var4.TextStrokeTransparency = 0
			var4.BackgroundTransparency = 1
			var4.TextWrapped = true
			var4.TextXAlignment = Enum.TextXAlignment.Right
			var4.AutomaticSize = Enum.AutomaticSize.Y
			var4.AnchorPoint = Vector2.new(1, 1)
			var4.Position = UDim2.new(1, -10, 1, -10)
			var4.Size = UDim2.new(0, 400, 0, 0)
			var4.Parent = var2
		end
	end
	t.Push()
	
	if status_9_1 and (not var3 or not var3.Parent) then
		var3 = Instance.new("DepthOfFieldEffect")
		var3.Enabled = false
		var3.Name = "FreecamDepthOfField"
		var3.Parent = currentCamera
	end
	runService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, thumbstickCurve)
	t_13.StartCapture()
end

StopFreecam = function()
	-- upvalues: status_8_1 (write), status_2_1 (write), status_10_1 (write), var14 (write), var15 (write), var16 (write), var19 (write), t_11 (write), status_9_1 (write), var3 (write), t_10 (write), var12 (write), var13 (write), status_12_1 (write), var2 (write), var21 (write), var22 (write), t_13 (ref), runService (ref), t (write)
	if not status_8_1 and status_2_1 then
		script:SetAttribute("FreecamEnabled", false)
	end
	if status_10_1 then
		if var14 then
			var14:Disconnect()
			var14 = nil
		end
		if var15 then
			var15:Disconnect()
			var15 = nil
		end
		var16 = false
		var19 = 1
		t_11 = {}
	end
	if status_9_1 and var3 and var3.Parent then
		if var3.Enabled then
			for i, v in ipairs(t_10) do
				if v.Parent then
					v.Enabled = true
				end
			end
			if var12 then
				var12:Disconnect()
				var12 = nil
			end
			if var13 then
				var13:Disconnect()
				var13 = nil
			end
			t_10 = {}
		end
		var3.Enabled = false
	end
	if status_12_1 then
		if var2 and var2.Parent then
			var2.Enabled = false
		end
		var21 = false
		var22 = false
	end
	t_13.StopCapture()
	runService:UnbindFromRenderStep("Freecam")
	t.Pop()
end

var44 = false

ToggleFreecam = function()
	-- upvalues: var44 (write), StopFreecam (ref), StartFreecam (ref), status_8_1 (write)
	if var44 then
		StopFreecam()
	else
		StartFreecam()
	end
	var44 = not var44
	
	if status_8_1 then
		script:SetAttribute("FreecamEnabled", var44)
	end
end

var32 = function(p7)
	-- upvalues: userInputService (ref), var44 (write), StopFreecam (ref), StartFreecam (ref), status_8_1 (write)
	for i = 1, #p7 - 1 do
		if userInputService:IsKeyDown(p7[i]) then
			continue
		end
		return
	end
	if var44 then
		StopFreecam()
	else
		StartFreecam()
	end
	var44 = not var44
	
	if status_8_1 then
		script:SetAttribute("FreecamEnabled", var44)
	end
end

contextActionService:BindActionAtPriority("FreecamToggle", function(_, p8, p9)
	-- upvalues: list (ref), var32 (ref)
	if p8 == Enum.UserInputState.Begin and p9.KeyCode == list[#list] then
		var32(list)
	end
	return Enum.ContextActionResult.Pass
end, false, value, list[#list])

if status_8_1 or status_2_1 then
	script:SetAttribute("FreecamEnabled", var44)
	script:GetAttributeChangedSignal("FreecamEnabled"):Connect(function()
		-- upvalues: var44 (write), StartFreecam (ref), StopFreecam (ref)
		local freecamEnabledAttribute = script:GetAttribute("FreecamEnabled")
		
		if typeof(freecamEnabledAttribute) ~= "boolean" then
			script:SetAttribute("FreecamEnabled", var44)
			
			return
		elseif freecamEnabledAttribute ~= var44 then
			if freecamEnabledAttribute then
				StartFreecam()
				var44 = true
				
				return
			end
			StopFreecam()
			var44 = false
		end
	end)
end
return {}