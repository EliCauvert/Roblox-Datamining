local AbsFunction = math.abs
local ClampFunction = math.clamp
local ExpFunction = math.exp
local RadFunction = math.rad
local SignFunction = math.sign
local SqrtFunction = math.sqrt
local TanFunction = math.tan
local ContextActionService = game:GetService("ContextActionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local GameSettings = UserSettings().GameSettings
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer

if not LocalPlayer then
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	LocalPlayer = Players.LocalPlayer
end
local PlayerGui = nil
local Freecam = nil
local CurrentCamera = Workspace.CurrentCamera
Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 67 ]]
	-- upvalues: Workspace (copy), CurrentCamera (ref)
	local CurrentCamera1 = Workspace.CurrentCamera
	
	if CurrentCamera1 then
		CurrentCamera = CurrentCamera1
	end
end)
local DepthOfField = nil
local Label = nil
local v1 = nil
local Result1 = nil
local Success, Result = pcall(function() --[[ Line: 80 ]]
	return UserSettings():IsUserFeatureEnabled("UserExitFreecamBreaksWithShiftlock")
end)
Result1 = Success and Result
local Result2_1 = nil
local Success1, Result2 = pcall(function() --[[ Line: 88 ]]
	return UserSettings():IsUserFeatureEnabled("UserShowGuiHideToggles")
end)
Result2_1 = Success1 and Result2
local Result3_1 = nil
local Success2, Result3 = pcall(function() --[[ Line: 96 ]]
	return UserSettings():IsUserFeatureEnabled("UserFixFreecamDeltaTimeCalculation")
end)
Result3_1 = Success2 and Result3
local Result4_1 = nil
local Success3, Result4 = pcall(function() --[[ Line: 104 ]]
	return UserSettings():IsUserFeatureEnabled("UserFixFreecamGuiChangeVisibility2")
end)
Result4_1 = Success3 and Result4
local Result5_1 = nil
local Success4, Result5 = pcall(function() --[[ Line: 112 ]]
	return UserSettings():IsUserFeatureEnabled("UserFreecamControlSpeed")
end)
Result5_1 = Success4 and Result5
local Result6_1 = nil
local Success5, Result6 = pcall(function() --[[ Line: 120 ]]
	return UserSettings():IsUserFeatureEnabled("UserFreecamTiltControl")
end)
Result6_1 = Success5 and Result6
local Result7_1 = nil
local Success6, Result7 = pcall(function() --[[ Line: 128 ]]
	return UserSettings():IsUserFeatureEnabled("UserFreecamSmoothnessControl")
end)
Result7_1 = Success6 and Result7
local Result8_1 = nil
local Success7, Result8 = pcall(function() --[[ Line: 136 ]]
	return UserSettings():IsUserFeatureEnabled("UserFreecamGuiDestabilization")
end)
Result8_1 = Success7 and Result8
local Result9_1 = nil
local Success8, Result9 = pcall(function() --[[ Line: 144 ]]
	return UserSettings():IsUserFeatureEnabled("UserFreecamDepthOfFieldEffect3")
end)
Result9_1 = Success8 and Result9
local Result10_1 = nil
local Success9, Result10 = pcall(function() --[[ Line: 152 ]]
	return UserSettings():IsUserFeatureEnabled("UserFreecamPlayerLock2")
end)
Result10_1 = Success9 and Result10
local Result11_1 = nil
local Success10, Result11 = pcall(function() --[[ Line: 160 ]]
	return UserSettings():IsUserFeatureEnabled("UserFreecamPlayerLockResetHeight")
end)
Result11_1 = Success10 and Result11
local Result12_1 = nil
local Success11, Result12 = pcall(function() --[[ Line: 168 ]]
	return UserSettings():IsUserFeatureEnabled("UserFreecamCustomGui")
end)
Result12_1 = Success11 and Result12
local Value = Enum.ContextActionPriority.Low.Value
local Value1 = Enum.ContextActionPriority.High.Value
local list = { Enum.KeyCode.LeftShift, Enum.KeyCode.P }
local config = { [Enum.KeyCode.Z] = true, [Enum.KeyCode.C] = true }
local config1 = {
	[Enum.KeyCode.ButtonL1] = true,
	[Enum.KeyCode.ButtonR1] = true
}
local config2 = { [Enum.KeyCode.BackSlash] = true }
local config3 = { [Enum.KeyCode.Slash] = true }
local config4 = { [Enum.KeyCode.R] = true, [Enum.KeyCode.T] = true }
local config5 = { [Enum.KeyCode.G] = true }
local config6 = { [Enum.KeyCode.X] = true }
local config7 = { [Enum.KeyCode.L] = true }
local ScaledVector = Vector2.new(0.75, 1) * 8
local v2 = 1.5
local v3 = 1
local v4 = 4
local v5 = 1
local ClockTimes = {}
local v6 = 0
local DepthOfFieldEffects = {}
local ChildAddedConnection = nil
local ChildAddedConnection1 = nil
local ChildAddedConnection2 = nil
local PlayerAddedConnection = nil
local PlayerRemovingConnection = nil
local Inverted = false
local Z = 20
local Y = 0
local List = {}
local Count = 1
local v7 = nil
local Inverted1 = false
local Inverted2 = false
local Module = {}
Module.__index = Module

function Module.new(p1, Vector: number) --[[ Line: 267 ]]
	-- upvalues: Module (copy)
	local self = setmetatable({}, Module)
	self.f = p1
	self.p = Vector
	self.v = Vector * 0
	
	return self
end

function Module:Update(p1, FovResult) --[[ Line: 275 ]]
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

function Module:SetFreq(p1) --[[ Line: 292 ]]
	self.f = p1
end

function Module:Reset(Vector: number) --[[ Line: 296 ]]
	self.p = Vector
	self.v = Vector * 0
end

local _Vector3 = Vector3.new()
local _Vector3_1 = nil
_Vector3_1 = if Result6_1 then Vector3.new() else Vector2.new()
local FieldOfView = 0
local NewModule = Module.new(v2, (Vector3.new()))
local NewModule1 = Module.new(v3, Vector2.new())
local NewModule2 = Module.new(v4, 0)
local NewModule3 = Module.new(v5, 0)
local thumbstickCurve = nil

local function _(p1: number): number --[[ Line: 325 | Named "fCurve" ]]
	-- upvalues: ExpFunction (copy)
	return (ExpFunction(2 * p1) - 1) / 6.38905609893065
end

local _ = function(p1: number): number --[[ Line: 329 | Named "fDeadzone" ]]
	-- upvalues: ExpFunction (copy)
	return (ExpFunction(2 * ((p1 - 0.15) / 0.85)) - 1) / 6.38905609893065
end

thumbstickCurve = function(ButtonL) --[[ Line: 333 | Named "thumbstickCurve" ]]
	-- upvalues: SignFunction (copy), AbsFunction (copy), ExpFunction (copy), ClampFunction (copy)
	return SignFunction(ButtonL) * ClampFunction((ExpFunction(2 * ((AbsFunction(ButtonL) - 0.15) / 0.85)) - 1) / 6.38905609893065, 0, 1)
end

local config8 = {
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
local config9 = {
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
local config10 = { MouseWheel = 0, Delta = Vector2.new() }
local ScaledVector1 = Vector2.new(1, 1) * 0.04908738521234052
local ScaledVectorRatio = ScaledVector1 / 60
local ScaledVector2 = Vector2.new(1, 1) * 0.39269908169872414
local config11 = {
	FarIntensity = { ADJ = 0.1, MIN = 0, MAX = 1 },
	NearIntensity = { ADJ = 0.1, MIN = 0, MAX = 1 },
	FocusDistance = { ADJ = 20, MIN = 0, MAX = 200 },
	FocusRadius = { ADJ = 5, MIN = 0, MAX = 50 }
}
local v8 = 1
local v9 = 1
local v10 = 1

local _ = function(List, p1) --[[ Line: 568 | Named "resetKeys" ]]
	for i, _ in pairs(List) do
		if p1[i.Name] then
			p1[i.Name] = 0
		end
	end
end

local function handleDoubleTapReset(KeyCode) --[[ Line: 576 ]]
	-- upvalues: ClockTimes (copy), v6 (ref), _Vector3_1 (ref), NewModule3 (copy), Result9_1 (ref), config1 (copy), config8 (copy), config (copy), config9 (copy)
	local ClockTime = os.clock()
	local ClockTime1: number = ClockTimes[KeyCode]
	
	if ClockTime1 and (ClockTime1 and ClockTime - ClockTime1 or -1) <= 0.25 and ClockTime - v6 >= 0.1 then
		_Vector3_1 = Vector3.new(_Vector3_1.x, _Vector3_1.y, 0)
		NewModule3:Reset(0)
		
		if Result9_1 then
			for i, _ in pairs(config1) do
				if config8[i.Name] then
					config8[i.Name] = 0
				end
			end
			for i1, _ in pairs(config) do
				if config9[i1.Name] then
					config9[i1.Name] = 0
				end
			end
		else
			config8.ButtonL1 = 0
			config8.ButtonR1 = 0
			config9.C = 0
			config9.Z = 0
		end
		v6 = ClockTime
	end
	ClockTimes[KeyCode] = ClockTime
end

local function findPlayerLockRootPart(TDelta: number) --[[ Line: 601 ]]
	-- upvalues: List (ref), Count (ref), Inverted (ref)
	if not List or #List < 1 then
		return nil
	end
	local Humanoid = nil
	for _ = 1, #List do
		Count = (Count - 1 + TDelta) % #List + 1
		local Entry = List[Count]
		local Character = Entry and Entry.Character
		
		if Character then
			Humanoid = Character:FindFirstChildOfClass("Humanoid")
			
			if Humanoid and Humanoid.RootPart then
				return Humanoid.RootPart
			end
		end
		if TDelta == 0 then
			TDelta = 1
		end
	end
	Inverted = false
	
	return nil
end

local function Keypress(_, UserInputState, Input) --[[ Line: 628 ]]
	-- upvalues: config9 (copy), Result6_1 (ref), config (copy), handleDoubleTapReset (copy), Result9_1 (ref), config2 (copy), DepthOfField (ref), DepthOfFieldEffects (ref), CurrentCamera (ref), Lighting (copy), ChildAddedConnection1 (ref), ChildAddedConnection2 (ref), Result10_1 (ref), config3 (copy), Inverted (ref), Z (ref), Result11_1 (ref), Y (ref), v7 (ref), findPlayerLockRootPart (copy), config4 (copy), List (ref), Result12_1 (ref), config5 (copy), Freecam (ref), config6 (copy), Inverted1 (ref), v1 (ref), config7 (copy), Inverted2 (ref), StarterGui (copy)
	config9[Input.KeyCode.Name] = if UserInputState == Enum.UserInputState.Begin then 1 else 0
	
	if Result6_1 and config[Input.KeyCode] and Input.UserInputState == Enum.UserInputState.Begin then
		handleDoubleTapReset(Input.KeyCode)
	end
	if Result9_1 and config2[Input.KeyCode] and Input.UserInputState == Enum.UserInputState.Begin then
		if DepthOfField.Enabled then
			for _, depthOfFieldEffect in ipairs(DepthOfFieldEffects) do
				if depthOfFieldEffect.Parent then
					depthOfFieldEffect.Enabled = true
				end
			end
			if ChildAddedConnection1 then
				ChildAddedConnection1:Disconnect()
				ChildAddedConnection1 = nil
			end
			if ChildAddedConnection2 then
				ChildAddedConnection2:Disconnect()
				ChildAddedConnection2 = nil
			end
			DepthOfFieldEffects = {}
		else
			DepthOfFieldEffects = {}
			
			for _, DepthOfFieldEffect in ipairs(CurrentCamera:GetChildren()) do
				if DepthOfFieldEffect:IsA("DepthOfFieldEffect") and DepthOfFieldEffect.Enabled then
					DepthOfFieldEffects[#DepthOfFieldEffects + 1] = DepthOfFieldEffect
					DepthOfFieldEffect.Enabled = false
				end
			end
			for _, DepthOfFieldEffect1 in ipairs(Lighting:GetChildren()) do
				if DepthOfFieldEffect1:IsA("DepthOfFieldEffect") and DepthOfFieldEffect1.Enabled then
					DepthOfFieldEffects[#DepthOfFieldEffects + 1] = DepthOfFieldEffect1
					DepthOfFieldEffect1.Enabled = false
				end
			end
			ChildAddedConnection1 = CurrentCamera.ChildAdded:Connect(function(Child) --[[ Line: 654 ]]
				-- upvalues: DepthOfFieldEffects (upval)
				if Child:IsA("DepthOfFieldEffect") and Child.Enabled then
					DepthOfFieldEffects[#DepthOfFieldEffects + 1] = Child
					Child.Enabled = false
				end
			end)
			ChildAddedConnection2 = Lighting.ChildAdded:Connect(function(Child) --[[ Line: 660 ]]
				-- upvalues: DepthOfFieldEffects (upval)
				if Child:IsA("DepthOfFieldEffect") and Child.Enabled then
					DepthOfFieldEffects[#DepthOfFieldEffects + 1] = Child
					Child.Enabled = false
				end
			end)
		end
		DepthOfField.Enabled = not DepthOfField.Enabled
		
		for i1, _ in pairs(config2) do
			if config9[i1.Name] then
				config9[i1.Name] = 0
			end
		end
	end
	if Result10_1 then
		if config3[Input.KeyCode] and Input.UserInputState == Enum.UserInputState.Begin then
			Inverted = not Inverted
			
			if Inverted then
				Z = 20
				
				if Result11_1 then
					Y = 0
				end
				v7 = findPlayerLockRootPart(0)
			end
			for i3, _ in pairs(config3) do
				if config9[i3.Name] then
					config9[i3.Name] = 0
				end
			end
		end
		if config4[Input.KeyCode] and Input.UserInputState == Enum.UserInputState.Begin then
			if Inverted and #List > 0 then
				v7 = findPlayerLockRootPart(config9.T - config9.R)
			end
			for i4, _ in pairs(config4) do
				if config9[i4.Name] then
					config9[i4.Name] = 0
				end
			end
		end
	end
	if Result12_1 then
		if config5[Input.keyCode] and Input.UserInputState == Enum.UserInputState.Begin then
			if Freecam and Freecam.Parent then
				Freecam.Enabled = not Freecam.Enabled
			end
			for i2, _ in pairs(config5) do
				if config9[i2.Name] then
					config9[i2.Name] = 0
				end
			end
		end
		if config6[Input.keyCode] and Input.UserInputState == Enum.UserInputState.Begin then
			Inverted1 = not Inverted1
			
			if v1 then
				for _, value in pairs((v1.getScreenGuis())) do
					if value.Parent and value ~= Freecam then
						value.Enabled = Inverted1
					end
				end
			end
			for i5, _ in pairs(config6) do
				if config9[i5.Name] then
					config9[i5.Name] = 0
				end
			end
		end
		if config7[Input.keyCode] and Input.UserInputState == Enum.UserInputState.Begin then
			Inverted2 = not Inverted2
			StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, Inverted2)
			
			for i, _ in pairs(config7) do
				if config9[i.Name] then
					config9[i.Name] = 0
				end
			end
		end
	end
	return Enum.ContextActionResult.Sink
end

local function GpButton(_, UserInputState, Input) --[[ Line: 741 ]]
	-- upvalues: config8 (copy), Result6_1 (ref), config1 (copy), handleDoubleTapReset (copy)
	config8[Input.KeyCode.Name] = if UserInputState == Enum.UserInputState.Begin then 1 else 0
	
	if Result6_1 and config1[Input.KeyCode] and Input.UserInputState == Enum.UserInputState.Begin then
		handleDoubleTapReset(Input.KeyCode)
	end
	return Enum.ContextActionResult.Sink
end

local function MousePan(_, _, p2) --[[ Line: 753 ]]
	-- upvalues: config10 (copy)
	local Delta = p2.Delta
	config10.Delta = Vector2.new(-Delta.y, -Delta.x)
	
	return Enum.ContextActionResult.Sink
end

local function Thumb(_, _, Input) --[[ Line: 759 ]]
	-- upvalues: config8 (copy)
	config8[Input.KeyCode.Name] = Input.Position
	
	return Enum.ContextActionResult.Sink
end

local function Trigger(_, _, Input) --[[ Line: 764 ]]
	-- upvalues: config8 (copy)
	config8[Input.KeyCode.Name] = Input.Position.z
	
	return Enum.ContextActionResult.Sink
end

local function MouseWheel(_, _, Input) --[[ Line: 769 ]]
	-- upvalues: config10 (copy)
	config10[Input.UserInputType.Name] = -Input.Position.z
	
	return Enum.ContextActionResult.Sink
end

local _ = function(List) --[[ Line: 774 | Named "Zero" ]]
	for i, value in pairs(List) do
		List[i] = value * 0
	end
end

local config12 = {
	Vel = function(p2): Vector3 --[[ Line: 448 ]]
		-- upvalues: Result5_1 (ref), v8 (ref), config9 (copy), config8 (copy), ClampFunction (copy), thumbstickCurve (ref), UserInputService (copy)
		if Result5_1 then
			v8 = ClampFunction(v8 + p2 * (config9.Up - config9.Down + config8.DPadUp - config8.DPadDown) * 0.75, 0.01, 4)
		else
			v8 = ClampFunction(v8 + p2 * (config9.Up - config9.Down) * 0.75, 0.01, 4)
		end
		local IsKeyDown = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift)
		
		return (Vector3.new(thumbstickCurve(config8.Thumbstick1.X), thumbstickCurve(config8.ButtonR2) - thumbstickCurve(config8.ButtonL2), thumbstickCurve(-config8.Thumbstick1.Y)) * vector.create(1, 1, 1) + Vector3.new(config9.D - config9.A + config9.K - config9.H, config9.E - config9.Q + config9.I - config9.Y, config9.S - config9.W + config9.J - config9.U) * vector.create(1, 1, 1)) * (v8 * (if IsKeyDown then 0.25 else 1))
	end,
	Pan = function(p2: number) --[[ Line: 471 ]]
		-- upvalues: thumbstickCurve (ref), config8 (copy), ScaledVector2 (copy), config10 (copy), ScaledVector1 (copy), Result3_1 (ref), ScaledVectorRatio (copy)
		local ScaledVector = Vector2.new(thumbstickCurve(config8.Thumbstick2.Y), thumbstickCurve(-config8.Thumbstick2.X)) * ScaledVector2
		local ScaledDelta = if Result3_1 and p2 > 0 then config10.Delta / p2 * ScaledVectorRatio else config10.Delta * ScaledVector1
		config10.Delta = Vector2.new()
		
		return ScaledVector + ScaledDelta
	end,
	Fov = function(p2: number) --[[ Line: 486 ]]
		-- upvalues: Result5_1 (ref), v10 (ref), config9 (copy), config8 (copy), ClampFunction (copy), config10 (copy), Result3_1 (ref)
		if Result5_1 then
			v10 = ClampFunction(v10 + p2 * (config9.Right - config9.Left + config8.DPadRight - config8.DPadLeft) * 0.75, 0.01, 4)
		end
		local ScaledButtonX = (config8.ButtonX - config8.ButtonY) * 0.25
		local ScaledMouseWheel = if Result3_1 and p2 > 0 then config10.MouseWheel / p2 * 0.016666666666666666 else config10.MouseWheel * 1
		config10.MouseWheel = 0
		
		return if Result5_1 then (ScaledButtonX + ScaledMouseWheel) * v10 else ScaledButtonX + ScaledMouseWheel
	end,
	Roll = function(p2) --[[ Line: 505 ]]
		-- upvalues: v9 (ref), config9 (copy), ClampFunction (copy), config8 (copy)
		v9 = ClampFunction(v9 + p2 * (config9.Period - config9.Comma) * 0.75, 0.01, 4)
		
		return ((config8.ButtonR1 - config8.ButtonL1) * 1 + (config9.C - config9.Z) * 1) * v9
	end,
	SpringControl = function(p2) --[[ Line: 514 ]]
		-- upvalues: Result9_1 (ref), UserInputService (copy), v2 (ref), config9 (copy), ClampFunction (copy), NewModule (copy), v3 (ref), NewModule1 (copy), v4 (ref), NewModule2 (copy), v5 (ref), NewModule3 (copy)
		if Result9_1 then
			local IsKeyDown = UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService:IsKeyDown(Enum.KeyCode.RightControl)
			
			if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift) or IsKeyDown then return end
		end
		v2 = ClampFunction(v2 + p2 * (config9.RightBracket - config9.LeftBracket) * 0.75, 0.01, 10)
		NewModule:SetFreq(v2)
		v3 = ClampFunction(v3 + p2 * (config9.Quote - config9.Semicolon) * 0.75, 0.01, 10)
		NewModule1:SetFreq(v3)
		v4 = ClampFunction(v4 + p2 * (config9.B - config9.V) * 0.75, 0.01, 10)
		NewModule2:SetFreq(v4)
		v5 = ClampFunction(v5 + p2 * (config9.M - config9.N) * 0.75, 0.01, 10)
		NewModule3:SetFreq(v5)
	end,
	DoF = function(p2) --[[ Line: 537 ]]
		-- upvalues: UserInputService (copy), DepthOfField (ref), config9 (copy), config11 (copy), ClampFunction (copy)
		local IsKeyDown = UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService:IsKeyDown(Enum.KeyCode.RightControl)
		
		if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then
			DepthOfField.FarIntensity = ClampFunction(DepthOfField.FarIntensity + p2 * (config9.RightBracket - config9.LeftBracket) * config11.FarIntensity.ADJ, config11.FarIntensity.MIN, config11.FarIntensity.MAX)
			DepthOfField.InFocusRadius = ClampFunction(DepthOfField.InFocusRadius + p2 * (config9.Equals - config9.Minus) * config11.FocusRadius.ADJ, config11.FocusRadius.MIN, config11.FocusRadius.MAX)
			
			return
		end
		if IsKeyDown then
			DepthOfField.NearIntensity = ClampFunction(DepthOfField.NearIntensity + p2 * (config9.RightBracket - config9.LeftBracket) * config11.NearIntensity.ADJ, config11.NearIntensity.MIN, config11.NearIntensity.MAX)
			
			return
		else
			DepthOfField.FocusDistance = ClampFunction(DepthOfField.FocusDistance + p2 * (config9.Equals - config9.Minus) * config11.FocusDistance.ADJ, config11.FocusDistance.MIN, config11.FocusDistance.MAX)
		end
	end,
	StartCapture = function() --[[ Line: 780 ]]
		-- upvalues: Result5_1 (ref), ContextActionService (copy), Keypress (copy), Value1 (copy), GpButton (copy), Result6_1 (ref), Result7_1 (ref), Result9_1 (ref), Result10_1 (ref), Result12_1 (ref), MousePan (copy), MouseWheel (copy), Trigger (copy), Thumb (copy)
		if Result5_1 then
			ContextActionService:BindActionAtPriority("FreecamKeyboard", Keypress, false, Value1, Enum.KeyCode.W, Enum.KeyCode.U, Enum.KeyCode.A, Enum.KeyCode.H, Enum.KeyCode.S, Enum.KeyCode.J, Enum.KeyCode.D, Enum.KeyCode.K, Enum.KeyCode.E, Enum.KeyCode.I, Enum.KeyCode.Q, Enum.KeyCode.Y)
			ContextActionService:BindActionAtPriority("FreecamKeyboardControlSpeed", Keypress, false, Value1, Enum.KeyCode.Up, Enum.KeyCode.Down, Enum.KeyCode.Left, Enum.KeyCode.Right)
			ContextActionService:BindActionAtPriority("FreecamGamepadControlSpeed", GpButton, false, Value1, Enum.KeyCode.DPadUp, Enum.KeyCode.DPadDown, Enum.KeyCode.DPadLeft, Enum.KeyCode.DPadRight)
		else
			ContextActionService:BindActionAtPriority("FreecamKeyboard", Keypress, false, Value1, Enum.KeyCode.W, Enum.KeyCode.U, Enum.KeyCode.A, Enum.KeyCode.H, Enum.KeyCode.S, Enum.KeyCode.J, Enum.KeyCode.D, Enum.KeyCode.K, Enum.KeyCode.E, Enum.KeyCode.I, Enum.KeyCode.Q, Enum.KeyCode.Y, Enum.KeyCode.Up, Enum.KeyCode.Down)
		end
		if Result6_1 then
			ContextActionService:BindActionAtPriority("FreecamKeyboardTiltControl", Keypress, false, Value1, Enum.KeyCode.Z, Enum.KeyCode.C)
			ContextActionService:BindActionAtPriority("FreecamGamepadTiltControl", GpButton, false, Value1, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
			ContextActionService:BindActionAtPriority("FreecamKeyboardTiltControlSpeed", Keypress, false, Value1, Enum.KeyCode.Comma, Enum.KeyCode.Period)
			
			if Result7_1 then
				ContextActionService:BindActionAtPriority("FreecamKeyboardSmoothnessControl", Keypress, false, Value1, Enum.KeyCode.LeftBracket, Enum.KeyCode.RightBracket, Enum.KeyCode.Semicolon, Enum.KeyCode.Quote, Enum.KeyCode.V, Enum.KeyCode.B, Enum.KeyCode.N, Enum.KeyCode.M)
			end
		end
		if Result9_1 then
			ContextActionService:BindActionAtPriority("FreecamKeyboardDoFToggle", Keypress, false, Value1, Enum.KeyCode.BackSlash)
			ContextActionService:BindActionAtPriority("FreecamKeyboardDoFControls", Keypress, false, Value1, Enum.KeyCode.Minus, Enum.KeyCode.Equals)
		end
		if Result10_1 then
			ContextActionService:BindActionAtPriority("FreecamKeyboardPlayerLockToggle", Keypress, false, Value1, Enum.KeyCode.Slash)
			ContextActionService:BindActionAtPriority("FreecamKeyboardPlayerLockSwitch", Keypress, false, Value1, Enum.KeyCode.R, Enum.KeyCode.T)
		end
		if Result12_1 then
			ContextActionService:BindActionAtPriority("FreecamKeyboardCustomGuiToggle", Keypress, false, Value1, Enum.KeyCode.G)
			ContextActionService:BindActionAtPriority("FreecamKeyboardPlayerGuiToggle", Keypress, false, Value1, Enum.KeyCode.X)
			ContextActionService:BindActionAtPriority("FreecamKeyboardLeaderboardToggle", Keypress, false, Value1, Enum.KeyCode.L)
		end
		ContextActionService:BindActionAtPriority("FreecamMousePan", MousePan, false, Value1, Enum.UserInputType.MouseMovement)
		ContextActionService:BindActionAtPriority("FreecamMouseWheel", MouseWheel, false, Value1, Enum.UserInputType.MouseWheel)
		ContextActionService:BindActionAtPriority("FreecamGamepadButton", GpButton, false, Value1, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY)
		ContextActionService:BindActionAtPriority("FreecamGamepadTrigger", Trigger, false, Value1, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2)
		ContextActionService:BindActionAtPriority("FreecamGamepadThumbstick", Thumb, false, Value1, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2)
	end,
	StopCapture = function() --[[ Line: 860 ]]
		-- upvalues: Result12_1 (ref), v8 (ref), Result5_1 (ref), v10 (ref), Result6_1 (ref), v9 (ref), config8 (copy), config9 (copy), config10 (copy), ContextActionService (copy), Result7_1 (ref), Result9_1 (ref), Result10_1 (ref)
		if not Result12_1 then
			v8 = 1
			
			if Result5_1 then
				v10 = 1
			end
			if Result6_1 then
				v9 = 1
			end
		end
		for i, value in pairs(config8) do
			config8[i] = value * 0
		end
		for i1, value1 in pairs(config9) do
			config9[i1] = value1 * 0
		end
		for i2, value2 in pairs(config10) do
			config10[i2] = value2 * 0
		end
		ContextActionService:UnbindAction("FreecamKeyboard")
		
		if Result5_1 then
			ContextActionService:UnbindAction("FreecamKeyboardControlSpeed")
			ContextActionService:UnbindAction("FreecamGamepadControlSpeed")
		end
		if Result6_1 then
			ContextActionService:UnbindAction("FreecamKeyboardTiltControl")
			ContextActionService:UnbindAction("FreecamGamepadTiltControl")
			ContextActionService:UnbindAction("FreecamKeyboardTiltControlSpeed")
			
			if Result7_1 then
				ContextActionService:UnbindAction("FreecamKeyboardSmoothnessControl")
			end
		end
		if Result9_1 then
			ContextActionService:UnbindAction("FreecamKeyboardDoFToggle")
			ContextActionService:UnbindAction("FreecamKeyboardDoFControls")
		end
		if Result10_1 then
			ContextActionService:UnbindAction("FreecamKeyboardPlayerLockToggle")
			ContextActionService:UnbindAction("FreecamKeyboardPlayerLockSwitch")
		end
		if Result12_1 then
			ContextActionService:UnbindAction("FreecamKeyboardCustomGuiToggle")
			ContextActionService:UnbindAction("FreecamKeyboardPlayerGuiToggle")
			ContextActionService:UnbindAction("FreecamKeyboardLeaderboardToggle")
		end
		ContextActionService:UnbindAction("FreecamMousePan")
		ContextActionService:UnbindAction("FreecamMouseWheel")
		ContextActionService:UnbindAction("FreecamGamepadButton")
		ContextActionService:UnbindAction("FreecamGamepadTrigger")
		ContextActionService:UnbindAction("FreecamGamepadThumbstick")
	end,
	getNavSpeed = function() --[[ Line: 906 ]]
		-- upvalues: v8 (ref)
		return v8
	end,
	getFovSpeed = function() --[[ Line: 910 ]]
		-- upvalues: v10 (ref)
		return v10
	end,
	getRollSpeed = function() --[[ Line: 914 ]]
		-- upvalues: v9 (ref)
		return v9
	end
}

local function StepFreecam(DeltaTime: number) --[[ Line: 922 ]]
	-- upvalues: Result7_1 (ref), config12 (copy), Result9_1 (ref), DepthOfField (ref), NewModule (copy), NewModule1 (copy), NewModule2 (copy), Result6_1 (ref), NewModule3 (copy), FieldOfView (ref), RadFunction (copy), TanFunction (copy), SqrtFunction (copy), ClampFunction (copy), ScaledVector (copy), _Vector3_1 (ref), _Vector3 (ref), Result10_1 (ref), Inverted (ref), v7 (ref), Z (ref), Y (ref), Result12_1 (ref), Label (ref), Freecam (ref), v2 (ref), v3 (ref), v4 (ref), v5 (ref), Result5_1 (ref), List (ref), Count (ref), CurrentCamera (ref)
	if Result7_1 then
		config12.SpringControl(DeltaTime)
	end
	if Result9_1 and DepthOfField and DepthOfField.Parent then
		config12.DoF(DeltaTime)
	end
	local UpdateResult = NewModule:Update(DeltaTime, config12.Vel(DeltaTime))
	local UpdateResult1 = NewModule1:Update(DeltaTime, config12.Pan(DeltaTime))
	local UpdateResult2: number = NewModule2:Update(DeltaTime, config12.Fov(DeltaTime))
	local UpdateResult3 = if Result6_1 then NewModule3:Update(DeltaTime, config12.Roll(DeltaTime)) else nil
	local SqrtResult = SqrtFunction(0.7002075382097097 / TanFunction((RadFunction(FieldOfView / 2))))
	FieldOfView = ClampFunction(FieldOfView + UpdateResult2 * 300 * (DeltaTime / SqrtResult), 1, 120)
	local Focus = nil
	
	if Result6_1 then
		local ScaledUpdateResult = UpdateResult1 * ScaledVector * (DeltaTime / SqrtResult)
		_Vector3_1 += Vector3.new(ScaledUpdateResult.X, ScaledUpdateResult.Y, UpdateResult3 * -1.5707963267948966 * (DeltaTime / SqrtResult))
		
		if Result7_1 then
			_Vector3_1 = Vector3.new(_Vector3_1.x % 6.283185307179586, _Vector3_1.y % 6.283185307179586, _Vector3_1.z % 6.283185307179586)
		else
			_Vector3_1 = Vector3.new(ClampFunction(_Vector3_1.x, -1.5707963267948966, 1.5707963267948966), _Vector3_1.y % 6.283185307179586, _Vector3_1.z)
		end
		Focus = CFrame.new(_Vector3) * CFrame.fromOrientation(_Vector3_1.x, _Vector3_1.y, _Vector3_1.z) * CFrame.new(UpdateResult * vector.create(64, 64, 64) * DeltaTime)
	else
		_Vector3_1 += UpdateResult1 * ScaledVector * (DeltaTime / SqrtResult)
		_Vector3_1 = Vector2.new(ClampFunction(_Vector3_1.x, -1.5707963267948966, 1.5707963267948966), _Vector3_1.y % 6.283185307179586)
		Focus = CFrame.new(_Vector3) * CFrame.fromOrientation(_Vector3_1.x, _Vector3_1.y, 0) * CFrame.new(UpdateResult * vector.create(64, 64, 64) * DeltaTime)
	end
	if Result10_1 and Inverted and v7 then
		local ScaledY = UpdateResult.Y * 64 * DeltaTime
		Z = ClampFunction(Z + UpdateResult.Z * 64 * DeltaTime, 5, 50)
		Y = ClampFunction(Y + ScaledY, -10, 10)
		Focus = CFrame.new(v7.Position + Vector3.new(0, Y, 0)) * (if Result6_1 then CFrame.fromOrientation(_Vector3_1.x, _Vector3_1.y, _Vector3_1.z) else CFrame.fromOrientation(_Vector3_1.x, _Vector3_1.y, 0)) * CFrame.new(0, 0, Z)
	end
	if Result12_1 and Label and Label.Parent and Freecam and Freecam.Parent and Freecam.Enabled then
		local Text = ""
		
		if DeltaTime > 0 then
			local PRatio = (Focus.p - _Vector3) / DeltaTime
			Text ..= string.format("Velocity: (%.1f, %.1f, %.1f)\n", PRatio.X, PRatio.Y, PRatio.Z)
		end
		local Text1 = Text .. string.format("FOV: %.1f\n", FieldOfView)
		
		if Result6_1 then
			Text1 ..= string.format("Tilt: %.1f°\n", (math.deg(_Vector3_1.z)))
		end
		if Result7_1 then
			Text1 = (((Text1 .. string.format("Stiffness (Vel): %.1f\n", v2)) .. string.format("Stiffness (Pan): %.1f\n", v3)) .. string.format("Stiffness (FOV): %.1f\n", v4)) .. string.format("Stiffness (Roll): %.1f\n", v5)
		end
		if Result5_1 then
			Text1 = ((Text1 .. string.format("Movement Speed: %.1f\n", config12.getNavSpeed())) .. string.format("Zoom Speed: %.1f\n", config12.getFovSpeed())) .. string.format("Tilt Speed: %.1f\n", config12.getRollSpeed())
		end
		if Result9_1 then
			if DepthOfField and DepthOfField.Parent and DepthOfField.Enabled then
				Text1 = ((((Text1 .. string.format("Custom Depth Of Field: On\n")) .. string.format("Custom Depth Of Field Near Intensity: %.1f\n", DepthOfField.NearIntensity)) .. string.format("Custom Depth Of Field Far Intensity: %.1f\n", DepthOfField.FarIntensity)) .. string.format("Custom Depth Of Field Focus Distance: %.1f\n", DepthOfField.FocusDistance)) .. string.format("Custom Depth Of Field Focus Radius: %.1f\n", DepthOfField.InFocusRadius)
			else
				Text1 ..= string.format("Custom Depth Of Field: Off\n")
			end
		end
		if Result10_1 then
			if Inverted and #List > 0 then
				Text1 ..= string.format("Player Lock: %s\n", List[Count].Name)
			else
				Text1 ..= string.format("Player Lock: Off\n")
			end
		end
		Label.Text = Text1
	end
	_Vector3 = Focus.p
	CurrentCamera.CFrame = Focus
	CurrentCamera.Focus = Focus
	CurrentCamera.FieldOfView = FieldOfView
end

local _ = function(): boolean --[[ Line: 1038 | Named "CheckMouseLockAvailability" ]]
	-- upvalues: Players (copy), GameSettings (copy)
	local IsDevComputerMovementModeMatch = Players.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable
	local IsControlModeMatch = GameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch
	local IsComputerMovementModeMatch = GameSettings.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove
	
	return Players.LocalPlayer.DevEnableMouseLock and (IsControlModeMatch and (not IsComputerMovementModeMatch and not IsDevComputerMovementModeMatch))
end

local Default = nil
local MouseIconEnabled = nil
local CameraType = nil
local Focus = nil
local _CFrame = nil
local FieldOfView1 = nil
local ScreenGuis = {}
local config13 = {
	Backpack = true,
	Chat = true,
	Health = true,
	PlayerList = true
}
local config14 = {
	BadgesNotificationsActive = true,
	PointsNotificationsActive = true
}
v1 = {
	Push = function() --[[ Line: 1071 ]]
		-- upvalues: config13 (copy), StarterGui (copy), config14 (copy), LocalPlayer (ref), ScreenGuis (ref), Result4_1 (ref), ChildAddedConnection (ref), Result12_1 (ref), Inverted1 (ref), FieldOfView1 (ref), CurrentCamera (ref), CameraType (ref), _CFrame (ref), Focus (ref), MouseIconEnabled (ref), UserInputService (copy), Result1 (ref), Players (copy), GameSettings (copy), Default (ref)
		for i in pairs(config13) do
			config13[i] = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[i])
			StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[i], false)
		end
		for CoreName in pairs(config14) do
			config14[CoreName] = StarterGui:GetCore(CoreName)
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
			if Result4_1 then
				ChildAddedConnection = PlayerGui.ChildAdded:Connect(function(Child) --[[ Line: 1089 ]]
					-- upvalues: ScreenGuis (upval), Result12_1 (upval), Inverted1 (upval)
					if Child:IsA("ScreenGui") and Child.Enabled then
						ScreenGuis[#ScreenGuis + 1] = Child
						
						if Result12_1 then
							Child.Enabled = Inverted1
							
							return
						end
						Child.Enabled = false
					end
				end)
			end
		end
		FieldOfView1 = CurrentCamera.FieldOfView
		CurrentCamera.FieldOfView = 70
		CameraType = CurrentCamera.CameraType
		CurrentCamera.CameraType = Enum.CameraType.Custom
		_CFrame = CurrentCamera.CFrame
		Focus = CurrentCamera.Focus
		MouseIconEnabled = UserInputService.MouseIconEnabled
		UserInputService.MouseIconEnabled = false
		repeat
			if Result1 then
				local IsDevComputerMovementModeMatch = Players.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable
				local IsControlModeMatch = GameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch
				local IsComputerMovementModeMatch = GameSettings.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove
				
				if Players.LocalPlayer.DevEnableMouseLock and (IsControlModeMatch and (not IsComputerMovementModeMatch and not IsDevComputerMovementModeMatch)) then
					Default = Enum.MouseBehavior.Default
					break
				end
			end
			Default = UserInputService.MouseBehavior
		until true
		UserInputService.MouseBehavior = Enum.MouseBehavior.Default
	end,
	Pop = function() --[[ Line: 1123 ]]
		-- upvalues: config13 (copy), StarterGui (copy), config14 (copy), ScreenGuis (ref), Result12_1 (ref), Freecam (ref), Result4_1 (ref), ChildAddedConnection (ref), CurrentCamera (ref), FieldOfView1 (ref), CameraType (ref), _CFrame (ref), Focus (ref), UserInputService (copy), MouseIconEnabled (ref), Default (ref)
		for i, value in pairs(config13) do
			StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[i], value)
		end
		for CoreName, value1 in pairs(config14) do
			StarterGui:SetCore(CoreName, value1)
		end
		for _, screenGui in pairs(ScreenGuis) do
			if Result12_1 then
				if screenGui.Parent and screenGui ~= Freecam then
					screenGui.Enabled = true
				end
			elseif screenGui.Parent then
				screenGui.Enabled = true
			end
		end
		if Result4_1 then
			if ChildAddedConnection then
				ChildAddedConnection:Disconnect()
				ChildAddedConnection = nil
			end
			ScreenGuis = {}
		end
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
	getScreenGuis = function() --[[ Line: 1169 ]]
		-- upvalues: ScreenGuis (ref)
		return ScreenGuis
	end
}

local function removePlayerFromList(Player) --[[ Line: 1174 ]]
	-- upvalues: List (ref), Count (ref), Inverted (ref)
	for i, value in ipairs(List) do
		if value == Player then
			table.remove(List, i)
			
			if Count == i and Inverted then
				Inverted = false
				Count = 1
			end
			if i < Count then
				Count -= 1
			end
			if #List >= Count and Count >= 1 then break end
			Count = 1
			break
		else
			continue
		end
	end
end

local function initializePlayerList() --[[ Line: 1198 ]]
	-- upvalues: List (ref), Players (copy), LocalPlayer (ref), Count (ref), PlayerAddedConnection (ref), PlayerRemovingConnection (ref), removePlayerFromList (copy)
	List = Players:GetPlayers()
	
	for i, value in ipairs(List) do
		if value == LocalPlayer then
			Count = i
			break
		end
	end
	PlayerAddedConnection = Players.PlayerAdded:Connect(function(Player) --[[ Line: 1208 ]]
		-- upvalues: List (upval)
		table.insert(List, Player)
	end)
	PlayerRemovingConnection = Players.PlayerRemoving:Connect(removePlayerFromList)
end

local function StartFreecam() --[[ Line: 1215 ]]
	-- upvalues: Result10_1 (ref), initializePlayerList (copy), Result8_1 (ref), Result2_1 (ref), CurrentCamera (ref), Result6_1 (ref), _Vector3_1 (ref), _Vector3 (ref), FieldOfView (ref), NewModule (copy), NewModule1 (copy), NewModule2 (copy), NewModule3 (copy), Result12_1 (ref), Result7_1 (ref), v2 (ref), v3 (ref), v4 (ref), v5 (ref), PlayerGui (ref), LocalPlayer (ref), Freecam (ref), Label (ref), v1 (ref), Result9_1 (ref), DepthOfField (ref), RunService (copy), StepFreecam (copy), config12 (copy)
	if Result10_1 then
		initializePlayerList()
	end
	if not Result8_1 and Result2_1 then
		script:SetAttribute("FreecamEnabled", true)
	end
	local CurrentCameraCFrame = CurrentCamera.CFrame
	_Vector3_1 = if Result6_1 then Vector3.new(CurrentCameraCFrame:toEulerAnglesYXZ()) else Vector2.new(CurrentCameraCFrame:toEulerAnglesYXZ())
	_Vector3 = CurrentCameraCFrame.p
	FieldOfView = CurrentCamera.FieldOfView
	NewModule:Reset((Vector3.new()))
	NewModule1:Reset(Vector2.new())
	NewModule2:Reset(0)
	
	if Result6_1 then
		NewModule3:Reset(0)
	end
	if not Result12_1 and Result7_1 then
		v2 = 1.5
		v3 = 1
		v4 = 4
		v5 = 1
	end
	if Result12_1 then
		PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
		Freecam = PlayerGui:WaitForChild("Freecam")
		
		if not Label or not Label.Parent then
			Label = Instance.new("TextLabel")
			Label.Name = "FreecamCustomGui"
			Label.TextColor3 = Color3.new(1, 1, 1)
			Label.Font = Enum.Font.SourceSansBold
			Label.TextSize = 20
			Label.TextStrokeTransparency = 0
			Label.BackgroundTransparency = 1
			Label.TextWrapped = true
			Label.TextXAlignment = Enum.TextXAlignment.Right
			Label.AutomaticSize = Enum.AutomaticSize.Y
			Label.AnchorPoint = Vector2.new(1, 1)
			Label.Position = UDim2.new(1, -10, 1, -10)
			Label.Size = UDim2.new(0, 400, 0, 0)
			Label.Parent = Freecam
		end
	end
	v1.Push()
	
	if Result9_1 and (not DepthOfField or not DepthOfField.Parent) then
		DepthOfField = Instance.new("DepthOfFieldEffect")
		DepthOfField.Enabled = false
		DepthOfField.Name = "FreecamDepthOfField"
		DepthOfField.Parent = CurrentCamera
	end
	RunService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
	config12.StartCapture()
end

local function StopFreecam() --[[ Line: 1287 ]]
	-- upvalues: Result8_1 (ref), Result2_1 (ref), Result10_1 (ref), PlayerAddedConnection (ref), PlayerRemovingConnection (ref), Inverted (ref), Count (ref), List (ref), Result9_1 (ref), DepthOfField (ref), DepthOfFieldEffects (ref), ChildAddedConnection1 (ref), ChildAddedConnection2 (ref), Result12_1 (ref), Freecam (ref), Inverted1 (ref), Inverted2 (ref), config12 (copy), RunService (copy), v1 (ref)
	if not Result8_1 and Result2_1 then
		script:SetAttribute("FreecamEnabled", false)
	end
	if Result10_1 then
		if PlayerAddedConnection then
			PlayerAddedConnection:Disconnect()
			PlayerAddedConnection = nil
		end
		if PlayerRemovingConnection then
			PlayerRemovingConnection:Disconnect()
			PlayerRemovingConnection = nil
		end
		Inverted = false
		Count = 1
		List = {}
	end
	if Result9_1 and DepthOfField and DepthOfField.Parent then
		if DepthOfField.Enabled then
			for _, depthOfFieldEffect in ipairs(DepthOfFieldEffects) do
				if depthOfFieldEffect.Parent then
					depthOfFieldEffect.Enabled = true
				end
			end
			if ChildAddedConnection1 then
				ChildAddedConnection1:Disconnect()
				ChildAddedConnection1 = nil
			end
			if ChildAddedConnection2 then
				ChildAddedConnection2:Disconnect()
				ChildAddedConnection2 = nil
			end
			DepthOfFieldEffects = {}
		end
		DepthOfField.Enabled = false
	end
	if Result12_1 then
		if Freecam and Freecam.Parent then
			Freecam.Enabled = false
		end
		Inverted1 = false
		Inverted2 = false
	end
	config12.StopCapture()
	RunService:UnbindFromRenderStep("Freecam")
	v1.Pop()
end

local Inverted3 = false

local _ = function() --[[ Line: 1348 | Named "ToggleFreecam" ]]
	-- upvalues: Inverted3 (ref), StopFreecam (copy), StartFreecam (copy), Result8_1 (ref)
	if Inverted3 then
		StopFreecam()
	else
		StartFreecam()
	end
	Inverted3 = not Inverted3
	
	if Result8_1 then
		script:SetAttribute("FreecamEnabled", Inverted3)
	end
end

local function CheckMacro(p2) --[[ Line: 1360 ]]
	-- upvalues: UserInputService (copy), Inverted3 (ref), StopFreecam (copy), StartFreecam (copy), Result8_1 (ref)
	for i = 1, #p2 - 1 do
		if not UserInputService:IsKeyDown(p2[i]) then return end
	end
	if Inverted3 then
		StopFreecam()
	else
		StartFreecam()
	end
	Inverted3 = not Inverted3
	
	if Result8_1 then
		script:SetAttribute("FreecamEnabled", Inverted3)
	end
end

ContextActionService:BindActionAtPriority("FreecamToggle", function(_, UserInputState, Input) --[[ Line: 1369 | Named "HandleActivationInput" ]]
	-- upvalues: list (copy), CheckMacro (copy)
	if UserInputState == Enum.UserInputState.Begin and Input.KeyCode == list[#list] then
		CheckMacro(list)
	end
	return Enum.ContextActionResult.Pass
end, false, Value, list[#list])

if Result8_1 or Result2_1 then
	script:SetAttribute("FreecamEnabled", Inverted3)
	script:GetAttributeChangedSignal("FreecamEnabled"):Connect(function() --[[ Line: 1382 ]]
		-- upvalues: Inverted3 (ref), StartFreecam (copy), StopFreecam (copy)
		local FreecamEnabledAttribute = script:GetAttribute("FreecamEnabled")
		
		if typeof(FreecamEnabledAttribute) ~= "boolean" then
			script:SetAttribute("FreecamEnabled", Inverted3)
			
			return
		end
		if FreecamEnabledAttribute ~= Inverted3 then
			if FreecamEnabledAttribute then
				StartFreecam()
				Inverted3 = true
				
				return
			end
			StopFreecam()
			Inverted3 = false
		end
	end)
end
return {}