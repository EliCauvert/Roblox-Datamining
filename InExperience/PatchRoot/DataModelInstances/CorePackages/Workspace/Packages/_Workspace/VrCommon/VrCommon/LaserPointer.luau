local VrCommon = script:FindFirstAncestor("VrCommon")
local CoreGui = game:GetService("CoreGui")
local ContextActionService = game:GetService("ContextActionService")
local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local VRService = game:GetService("VRService")
local CreateFunction = require(VrCommon.Parent.AppCommonLib).Create
local VRUtilModule = require(VrCommon.VRUtil)
require(VrCommon.Panel3D)
local EnableUserInputCFrameLogging = game:DefineFastFlag("EnableUserInputCFrameLogging", false)
local VRLaserPointerRaycastChange = game:DefineFastFlag("VRLaserPointerRaycastChange", false)
local RenderCaptureAlwaysOnTopGuiEngineFeature = game:GetEngineFeature("RenderCaptureAlwaysOnTopGui")
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
	Players.Changed:wait()
	LocalPlayer = Players.LocalPlayer
end
local function _(p1): Color3
	return Color3.new(p1.r ^ 2.2, p1.g ^ 2.2, p1.b ^ 2.2)
end

local function addPartsToGame(...)
	-- upvalues: GuiService (copy)
	local Parts = { ... }
	local CoreEffectFolder = GuiService.CoreEffectFolder
	
	if not CoreEffectFolder then
		coroutine.wrap(function()
			-- upvalues: GuiService (upval), Parts (copy), CoreEffectFolder (copy)
			while GuiService.Changed:wait() ~= "CoreEffectFolder" and GuiService.CoreEffectFolder == nil do
			end
			for _, part in pairs(Parts) do
				part.Parent = CoreEffectFolder
				part.CanTouch = false
				part.CanCollide = false
				part.CanQuery = false
			end
		end)()
		
		return
	end
	for _, part in pairs(Parts) do
		part.Parent = CoreEffectFolder
		part.CanTouch = false
		part.CanCollide = false
		part.CanQuery = false
	end
end

local function removePartsFromGame(...)
	for _, value in pairs({ ... }) do
		value.Parent = nil
	end
end

local function getLocalHumanoid()
	-- upvalues: LocalPlayer (ref)
	local Character = LocalPlayer.Character
	
	if not Character then return end
	for _, Humanoid in pairs(Character:GetChildren()) do
		if Humanoid:IsA("Humanoid") then
			return Humanoid
		end
	end
end

local _ = function(Value: number, p1: number): number
	local ValuePower = Value ^ p1
	
	if ValuePower ~= ValuePower then
		ValuePower = math.abs(Value) ^ p1
	end
	return ValuePower
end

local Mode = {
	Disabled = 0,
	Pointer = 1,
	Navigation = 2,
	Hidden = 3,
	DualPointer = 4
}
local _Color3 = Color3.fromRGB(0, 162, 255)
local _Color3_1 = Color3.new(_Color3.r ^ 2.2, _Color3.g ^ 2.2, _Color3.b ^ 2.2)
local _Color31 = Color3.fromRGB(253, 68, 72)
local config = {
	MODE_ENABLED = true,
	ARC_THICKNESS = 0.0125,
	PLOP_GOOD = "rbxasset://textures/ui/VR/VRPointerDiscBlue.png",
	PLOP_BAD = "rbxasset://textures/ui/VR/VRPointerDiscRed.png",
	PLOP_BALL_SIZE = 0.5,
	PLOP_SIZE = 2,
	PLOP_PULSE_MIN_SIZE = 0,
	PLOP_PULSE_MAX_SIZE = 2,
	MAX_VALID_DISTANCE = 100,
	BUTTON_DOWN_THRESHOLD = 0.95,
	BUTTON_UP_THRESHOLD = 0.5,
	MIN_VELOCITY = 10,
	RANGE_T_EXP = 2,
	G = 10,
	PULSE_DURATION = 0.8,
	PULSE_PERIOD = 1,
	PULSE_EXP = 2,
	PULSE_SIZE_0 = 0.25,
	PULSE_SIZE_1 = 2,
	BALL_WAVE_PERIOD = 2,
	BALL_WAVE_AMPLITUDE = 0.5,
	BALL_WAVE_START = 0.25,
	BALL_WAVE_EXP = 0.8,
	FLOOR_OFFSET = 4.5,
	FADE_OUT_DURATION = 0.125,
	FADE_IN_DURATION = 0.125,
	TRANSITION_DURATION = 0.25,
	ARC_COLOR_GOOD = _Color3_1,
	ARC_COLOR_BAD = Color3.new(_Color31.r ^ 2.2, _Color31.g ^ 2.2, _Color31.b ^ 2.2),
	PLOP_BALL_COLOR_GOOD = BrickColor.new("Bright green"),
	PLOP_BALL_COLOR_BAD = BrickColor.new("Bright red")
}
local _Color32 = Color3.fromRGB(0, 255, 162)
local config1 = {
	MODE_ENABLED = true,
	ARC_THICKNESS = 0.01,
	MAX_DISTANCE = 50,
	G = 0,
	SWITCH_AIM_THRESHOLD = 0.2617993877991494,
	TRANSITION_DURATION = 0.075,
	ARC_COLOR_GOOD = config.ARC_COLOR_GOOD,
	ARC_COLOR_BAD = config.ARC_COLOR_BAD,
	ARC_COLOR_HIT = Color3.new(_Color32.r ^ 2.2, _Color32.g ^ 2.2, _Color32.b ^ 2.2)
}
local _Vector2 = Vector2.new(0, 0)
local _Vector2_1 = Vector2.new(1, 1)
local LaserPointerModule = {}
LaserPointerModule.__index = LaserPointerModule
LaserPointerModule.Mode = Mode

function LaserPointerModule:new()
	-- upvalues: LaserPointerModule (copy), VRService (copy), CreateFunction (copy), CoreGui (copy), config (copy), _Vector2_1 (copy), _Vector2 (copy), RenderCaptureAlwaysOnTopGuiEngineFeature (copy), GuiService (copy)
	local self = setmetatable({}, LaserPointerModule)
	self.laserMaxDistance = VRService.LaserDistance
	self.laserHand = 0
	self.inputUserCFrame = Enum.UserCFrame.RightHand
	self.equippedTool = false
	self.lastLaserModeHit = tick()
	self.guiMenuIsOpen = false
	self.externalForcePointer = false
	self.forceDotActive = true
	self.navHitPoint = vector.create(0, 0, 0)
	self.navHitNormal = vector.create(0, 1, 0)
	self.navHitPart = nil
	self.navigationIsValid = false
	self.lastNavigationValidityChangeTime = tick()
	self.plopBallBounceStart = tick()
	self.buttonPressStart = 0
	self.showPlopBallOnPointer = false
	self.parabola = CreateFunction("ParabolaAdornment")({
		Name = "LaserPointerParabola",
		A = -1,
		B = 2,
		C = 0,
		Color3 = nil,
		Visible = false,
		Parent = CoreGui,
		Thickness = config.ARC_THICKNESS
	})
	self.originPart = CreateFunction("Part")({
		Name = "LaserPointerOrigin",
		Anchored = true,
		CanCollide = false,
		Size = vector.create(0.20000000298023224, 0.20000000298023224, 0.20000000298023224),
		Transparency = 1,
		TopSurface = Enum.SurfaceType.SmoothNoOutlines,
		BottomSurface = Enum.SurfaceType.SmoothNoOutlines,
		Material = Enum.Material.SmoothPlastic
	})
	self.parabola.Adornee = self.originPart
	self.parabolaOffhand = CreateFunction("ParabolaAdornment")({
		Name = "LaserPointerparabolaOffhand",
		A = 0,
		B = 0.000001,
		C = 0,
		Transparency = 0.5,
		Visible = false,
		Parent = CoreGui,
		Color3 = Color3.new(1, 1, 1),
		Thickness = config.ARC_THICKNESS
	})
	self.originPartOffhand = CreateFunction("Part")({
		Name = "LaserPointerOriginOffhand",
		Anchored = true,
		CanCollide = false,
		Size = vector.create(0.20000000298023224, 0.20000000298023224, 0.20000000298023224),
		Transparency = 1,
		TopSurface = Enum.SurfaceType.SmoothNoOutlines,
		BottomSurface = Enum.SurfaceType.SmoothNoOutlines,
		Material = Enum.Material.SmoothPlastic
	})
	self.parabolaOffhand.Adornee = self.originPartOffhand
	self.plopPart = CreateFunction("Part")({
		Name = "LaserPointerTeleportPlop",
		Anchored = true,
		CanCollide = false,
		Size = vector.create(0.20000000298023224, 0.20000000298023224, 0.20000000298023224),
		Transparency = 1
	})
	self.plopBall = CreateFunction("Part")({
		Name = "LaserPointerTeleportPlopBall",
		Anchored = true,
		CanCollide = false,
		TopSurface = Enum.SurfaceType.SmoothNoOutlines,
		BottomSurface = Enum.SurfaceType.SmoothNoOutlines,
		Material = Enum.Material.Neon,
		BrickColor = config.PLOP_BALL_COLOR_GOOD,
		Shape = Enum.PartType.Ball,
		Size = vector.create(1, 1, 1) * config.PLOP_BALL_SIZE
	})
	self.plopAdorn = CreateFunction("ImageHandleAdornment")({
		Name = "LaserPointerTeleportPlopAdorn",
		Parent = self.plopPart,
		Adornee = self.plopPart,
		Size = _Vector2_1 * config.PLOP_SIZE,
		Image = config.PLOP_GOOD
	})
	self.plopAdornPulse = CreateFunction("ImageHandleAdornment")({
		Name = "LaserPointerTeleportPlopAdornPulse",
		Transparency = 0.5,
		Parent = self.plopPart,
		Adornee = self.plopPart,
		Size = _Vector2,
		Image = config.PLOP_GOOD
	})
	self.cursorPart = CreateFunction("Part")({
		Name = "Cursor",
		CanCollide = false,
		CanQuery = false,
		CanTouch = false,
		Anchored = true,
		Transparency = 1
	})
	self.cursorSurfaceGui = CreateFunction("SurfaceGui")({
		Name = "CursorSurfaceGui",
		Active = false,
		AlwaysOnTop = true,
		Enabled = false,
		ZOffset = 10,
		Adornee = if RenderCaptureAlwaysOnTopGuiEngineFeature then self.cursorPart else nil,
		Parent = if RenderCaptureAlwaysOnTopGuiEngineFeature then CoreGui else self.cursorPart
	})
	self.cursorImage = CreateFunction("ImageLabel")({
		Image = "rbxasset://textures/Cursors/Gamepad/Pointer.png",
		BackgroundTransparency = 1,
		ImageColor3 = Color3.new(0, 1, 0),
		Parent = self.cursorSurfaceGui,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, 0, 1, 0)
	})
	self.connections = {}
	table.insert(self.connections, VRService:GetPropertyChangedSignal("LaserPointer"):Connect(function()
		-- upvalues: self (copy)
		self:onModeChanged()
	end))
	self:onModeChanged()
	GuiService.MenuOpened:connect(function()
		-- upvalues: self (copy)
		self.guiMenuIsOpen = true
	end)
	GuiService.MenuClosed:connect(function()
		-- upvalues: self (copy)
		self.guiMenuIsOpen = false
	end)
	self.inputUserCFrame = VRService.GuiInputUserCFrame
	VRService.Changed:connect(function(p1)
		-- upvalues: self (copy), VRService (upval)
		if p1 == "GuiInputUserCFrame" then
			self.inputUserCFrame = VRService.GuiInputUserCFrame
			
			return
		end
		if p1 == "PointerHitCFrame" or p1 == "DidPointerHit" then
			self:cursorInputsChanged()
			
			return
		end
		if p1 == "VRSessionState" and VRService.VRSessionState == Enum.VRSessionState.Focused then
			self:updateInputUserCFrame()
		end
	end)
	VRService.LaserPointerTriggered:connect(function(Input)
		-- upvalues: self (copy)
		if game:GetEngineFeature("ImprovedTriggerFire") and Input.UserInputState ~= Enum.UserInputState.End then return end
		if (Input.KeyCode == Enum.KeyCode.ButtonR1 or Input.KeyCode == Enum.KeyCode.ButtonR2 or Input.KeyCode == Enum.KeyCode.ButtonR3 or Input.KeyCode == Enum.KeyCode.ButtonA or Input.KeyCode == Enum.KeyCode.ButtonB) and self.laserHand ~= 0 then
			self.laserHand = 0
			self:updateInputUserCFrame()
			
			return
		end
		if (Input.KeyCode == Enum.KeyCode.ButtonL1 or Input.KeyCode == Enum.KeyCode.ButtonL2 or Input.KeyCode == Enum.KeyCode.ButtonL3 or Input.KeyCode == Enum.KeyCode.ButtonX or Input.KeyCode == Enum.KeyCode.ButtonY) and self.laserHand ~= 1 then
			self.laserHand = 1
			self:updateInputUserCFrame()
		end
	end)
	VRService.UserCFrameEnabled:Connect(function(_, _)
		-- upvalues: self (copy)
		self:updateInputUserCFrame()
	end)
	self:updateInputUserCFrame()
	
	return self
end

function LaserPointerModule.hasAnyHandController()
	-- upvalues: VRService (copy)
	return VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) or VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand)
end

function LaserPointerModule.getModeName(p1)
	-- upvalues: Mode (copy)
	for i, value in pairs(Mode) do
		if p1 == value then
			return i
		end
	end
	return "unknown"
end

function LaserPointerModule:updateInputUserCFrame()
	-- upvalues: EnableUserInputCFrameLogging (copy), VRService (copy)
	local GuiInputUserCFrame = if EnableUserInputCFrameLogging then VRService.GuiInputUserCFrame else nil
	
	if VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and self.laserHand == 0 then
		VRService.GuiInputUserCFrame = Enum.UserCFrame.RightHand
	elseif VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) and self.laserHand == 1 then
		VRService.GuiInputUserCFrame = Enum.UserCFrame.LeftHand
	elseif VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
		VRService.GuiInputUserCFrame = Enum.UserCFrame.RightHand
	elseif VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
		VRService.GuiInputUserCFrame = Enum.UserCFrame.LeftHand
	else
		VRService.GuiInputUserCFrame = Enum.UserCFrame.Head
	end
	if EnableUserInputCFrameLogging and GuiInputUserCFrame ~= VRService.GuiInputUserCFrame then
		print("Updated GuiInputUserCFrame is: " .. tostring(VRService.GuiInputUserCFrame))
	end
end

function LaserPointerModule:onModeChanged(_)
	-- upvalues: VRService (copy), addPartsToGame (copy), removePartsFromGame (copy)
	self:updateInputUserCFrame()
	
	if VRService.LaserPointer == Enum.VRLaserPointerMode.Disabled then
		addPartsToGame(self.originPart, self.cursorPart)
		removePartsFromGame(self.plopPart, self.plopBall, self.originPartOffhand)
		self.forceDotActive = true
		self.parabola.Visible = false
		self.parabolaOffhand.Visible = false
		self:setNavigationActionEnabled(false)
		
		return
	end
	if VRService.LaserPointer == Enum.VRLaserPointerMode.Pointer then
		addPartsToGame(self.originPart, self.cursorPart)
		removePartsFromGame(self.plopPart, self.plopBall, self.originPartOffhand)
		self.parabola.Visible = true
		self.parabolaOffhand.Visible = false
		self:setNavigationActionEnabled(false)
		self.forceDotActive = false
		
		return
	end
	if VRService.LaserPointer == Enum.VRLaserPointerMode.DualPointer then
		addPartsToGame(self.originPart, self.originPartOffhand, self.cursorPart)
		removePartsFromGame(self.plopPart, self.plopBall)
		self.parabola.Visible = true
		self.parabolaOffhand.Visible = true
		self:setNavigationActionEnabled(false)
		self.forceDotActive = false
	end
end

function LaserPointerModule:setMode(Pointer)
	-- upvalues: Mode (copy), VRService (copy)
	if Pointer == Mode.Disabled or Pointer == Mode.Hidden then
		VRService.LaserPointer = Enum.VRLaserPointerMode.Disabled
		
		return
	end
	if Pointer == Mode.Pointer or Pointer == Mode.Navigation then
		VRService.LaserPointer = Enum.VRLaserPointerMode.Pointer
		
		return
	end
	if Pointer == Mode.DualPointer then
		VRService.LaserPointer = Enum.VRLaserPointerMode.DualPointer
	end
end

function LaserPointerModule:setEnableAmbidexterousPointer(_) end

function LaserPointerModule:calculateLaunchVelocity(p2: number, p3: number, p4: number)
	return -(math.sqrt(p2 / 0.7071067811865476) * p3) / math.sqrt(2 * p4 * 0.7071067811865476 + 2 * p3 * 0.7071067811865475)
end

function LaserPointerModule:isHeadMounted(): boolean
	-- upvalues: VRService (copy)
	return VRService.GuiInputUserCFrame == Enum.UserCFrame.Head
end

function LaserPointerModule:shouldForcePointer()
	return self.externalForcePointer or self.guiMenuIsOpen
end

function LaserPointerModule:setForcePointer(ExternalForcePointer)
	self.externalForcePointer = ExternalForcePointer
end

function LaserPointerModule:getNavigationOrigin(): Vector3?
	-- upvalues: getLocalHumanoid (copy)
	local LocalHumanoid = getLocalHumanoid()
	
	if not LocalHumanoid then return end
	local Torso = LocalHumanoid.Torso
	
	if not Torso then return end
	return Torso.Position + Vector3.new(0, -(Torso.Size.Y / 2) - (if LocalHumanoid.RigType == Enum.HumanoidRigType.R6 then 2 else LocalHumanoid.HipHeight), 0)
end

function LaserPointerModule:horzDistanceFromCharacter(p2)
	-- upvalues: LocalPlayer (ref)
	local Character = LocalPlayer.Character
	
	if Character then
		local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
		
		return if HumanoidRootPart then ((HumanoidRootPart:GetRenderCFrame().p - p2) * vector.create(1, 0, 1)).magnitude else 1e999
	else
		return 1e999
	end
end

function LaserPointerModule:onNavigateAction(_, UserInputState, _)
	-- upvalues: VRService (copy)
	if UserInputState == Enum.UserInputState.Begin then
		VRService:RequestNavigation(CFrame.new(self.navHitPoint, self.navHitPoint + self.navHitNormal) * CFrame.Angles(1.5707963267948966, 0, 0), self.inputUserCFrame)
	end
end

function LaserPointerModule.setNavigationActionEnabled(p2, p3)
	-- upvalues: ContextActionService (copy)
	if p3 then
		ContextActionService:BindCoreAction("LaserPointerNavigate", function(...)
			-- upvalues: p2 (copy)
			p2:onNavigateAction(...)
		end, false, Enum.KeyCode.ButtonA)
		
		return
	else
		ContextActionService:UnbindCoreAction("LaserPointerNavigate")
	end
end

function LaserPointerModule:setArcLaunchParams(Angle: number, p2, p3: number, p4: number)
	local ScaledCosine = math.cos(Angle) * p2
	local ScaledSine = math.sin(Angle) * p2
	
	if ScaledCosine == 0 then
		ScaledCosine = 0.000001
	end
	self.parabola.A = -(0.5 * p3) * (1 / ScaledCosine ^ 2)
	self.parabola.B = ScaledSine / ScaledCosine
	self.parabola.C = 0
	self.parabola.Range = p4 * 1.5
end

function LaserPointerModule:renderAsParabola(X, p2)
	self.originPart.CFrame = CFrame.new(X, X + p2 * vector.create(1, 0, 1)) * CFrame.Angles(0, 1.5707963267948966, 0)
end

function LaserPointerModule:renderAsLaser(X, Y)
	self.originPart.CFrame = CFrame.new(X, Y) * CFrame.Angles(0, 1.5707963267948966, 0)
	self.parabola.A = 0
	self.parabola.B = 0.000001
	self.parabola.C = 0
	self.parabola.Range = (Y - X).magnitude
end

function LaserPointerModule:renderOffhandLaser(X, Y)
	self.originPartOffhand.CFrame = CFrame.new(X, Y) * CFrame.Angles(0, 1.5707963267948966, 0)
	self.parabolaOffhand.Range = (Y - X).magnitude
end

if not VRLaserPointerRaycastChange then
	function LaserPointerModule:getLaserHit(Origin, p2, IgnoreList)
		local Hit, HitPosition, HitNormal, _ = workspace:FindPartOnRayWithIgnoreList(Ray.new(Origin, p2 * self.laserMaxDistance), IgnoreList)
		
		return Hit, HitPosition, HitNormal, (HitPosition - Origin).magnitude / math.max(self.laserMaxDistance, 0.1)
	end
end
function LaserPointerModule:canNavigateTo(NavHitPart, _, NavHitNormal): boolean
	-- upvalues: LocalPlayer (ref)
	local Character = LocalPlayer.Character
	
	return if Character and (Character:FindFirstChild("HumanoidRootPart") and NavHitPart) then NavHitNormal.Y >= -0.000001 else false
end

function LaserPointerModule:checkHeadMountedMode(Object)
	-- upvalues: Mode (copy), GuiService (copy)
	if self:shouldForcePointer() then
		self:setMode(Mode.Pointer)
		
		return
	end
	local CoreGuiFolder = GuiService.CoreGuiFolder
	
	if Object and Object:IsDescendantOf(CoreGuiFolder) then
		self:setMode(Mode.Pointer)
		
		return
	else
		self:setMode(Mode.Navigation)
	end
end

function LaserPointerModule:setNavigationValidState(NavigationIsValid)
	-- upvalues: config (copy)
	if NavigationIsValid == self.navigationIsValid then return end
	self.navigationIsValid = NavigationIsValid
	self.lastNavigationValidityChangeTime = tick()
	
	if NavigationIsValid then
		self.plopBallBounceStart = tick()
		self.parabola.Color3 = config.ARC_COLOR_GOOD
		self.plopAdorn.Visible = true
		self.plopAdorn.Image = config.PLOP_GOOD
		self.plopAdornPulse.Visible = true
		self.plopAdornPulse.Image = config.PLOP_GOOD
		self.plopBall.BrickColor = config.PLOP_BALL_COLOR_GOOD
		
		return
	else
		self.parabola.Color3 = config.ARC_COLOR_BAD
		self.plopAdorn.Visible = false
		self.plopAdorn.Image = config.PLOP_BAD
		self.plopAdornPulse.Visible = false
		self.plopAdornPulse.Image = config.PLOP_BAD
		self.plopBall.BrickColor = config.PLOP_BALL_COLOR_BAD
	end
end

function LaserPointerModule:updateNavPlop(X, NavHitNormal)
	-- upvalues: config (copy), _Vector2_1 (copy), _Vector2 (copy)
	local Elapsed = tick() - self.plopBallBounceStart
	local _CFrame = CFrame.new(X, X + NavHitNormal)
	local NewBALLWAVESTART = 0
	
	if self.navigationIsValid then
		local Sine = math.sin(Elapsed * 2 * 3.141592653589793 / config.BALL_WAVE_PERIOD)
		local BALLWAVEEXP: number = config.BALL_WAVE_EXP
		local SinePower = Sine ^ BALLWAVEEXP
		
		if SinePower ~= SinePower then
			SinePower = math.abs(Sine) ^ BALLWAVEEXP
		end
		NewBALLWAVESTART = config.BALL_WAVE_START + SinePower * config.BALL_WAVE_AMPLITUDE
	end
	self.plopPart.CFrame = _CFrame
	self.plopBall.CFrame = _CFrame * CFrame.new(0, 0, -NewBALLWAVESTART)
	local ElapsedRemainder = Elapsed % config.PULSE_PERIOD
	
	if ElapsedRemainder > 0 then
		local Value = ElapsedRemainder / config.PULSE_DURATION
		
		if Value < 1 then
			self.plopAdornPulse.Visible = true
			local PlopAdornPulse = self.plopAdornPulse
			local PULSESIZE0 = config.PULSE_SIZE_0
			local PULSEEXP: number = config.PULSE_EXP
			local ValuePower = Value ^ PULSEEXP
			
			if ValuePower ~= ValuePower then
				ValuePower = math.abs(Value) ^ PULSEEXP
			end
			PlopAdornPulse.Size = _Vector2_1 * (PULSESIZE0 + ValuePower * (config.PULSE_SIZE_1 - config.PULSE_SIZE_0))
			self.plopAdornPulse.Transparency = 0.5 + Value * 0.5
			
			return
		else
			self.plopAdornPulse.Visible = false
			self.plopAdornPulse.Size = _Vector2
			self.pulseStartTime = tick() + config.PULSE_PERIOD
		end
	end
end

function LaserPointerModule:updateNavigationMode(NavHitPoint, NavHitNormal, NavHitPart)
	self.navHitPoint = NavHitPoint
	self.navHitNormal = NavHitNormal
	self.navHitPart = NavHitPart
	self:updateNavPlop(NavHitPoint, NavHitNormal)
	self:setNavigationValidState(self:canNavigateTo(self.navHitPart, self.navHitPoint, self.navHitNormal))
end

function LaserPointerModule:showHitBallOnLaserPointer(p2)
	-- upvalues: addPartsToGame (copy), removePartsFromGame (copy)
	if p2 then
		if not self.showPlopBallOnPointer then
			self.showPlopBallOnPointer = true
			addPartsToGame(self.plopBall)
			
			return
		end
	elseif self.showPlopBallOnPointer then
		removePartsFromGame(self.plopBall)
		self.showPlopBallOnPointer = false
	end
end

function LaserPointerModule:cursorInputsChanged()
	-- upvalues: VRService (copy), VRUtilModule (copy)
	local DidPointerHit = VRService.DidPointerHit
	self.cursorSurfaceGui.Enabled = DidPointerHit
	
	if DidPointerHit then
		local PointerHitCFrame = VRService.PointerHitCFrame
		local XScale = 1
		local X = (VRUtilModule.GetUserCFrameWorldSpace(Enum.UserCFrame.Head).Position - PointerHitCFrame.Position).magnitude * 0.01
		
		if X < 0.05 then
			XScale = X / 0.05
			X = 0.05
		end
		self.cursorPart.Size = Vector3.new(X, X, X)
		self.cursorPart.CFrame = PointerHitCFrame * CFrame.new(0, 0, X * 0.5)
		self.cursorImage.Size = UDim2.new(XScale, 0, XScale, 0)
	end
end

function LaserPointerModule:updateCursor_DEPRECATED()
	-- upvalues: VRService (copy), VRUtilModule (copy)
	if VRService.DidPointerHit then
		local PointerHitCFrame = VRService.PointerHitCFrame
		local UserCFrameWorldSpace = if self:isHeadMounted() then VRUtilModule.GetUserCFrameWorldSpace(Enum.UserCFrame.Head) else VRUtilModule.GetUserCFrameWorldSpace(self.inputUserCFrame)
		local P = UserCFrameWorldSpace.p
		local LookVector = UserCFrameWorldSpace.lookVector
		local Position = PointerHitCFrame.Position
		local LookVector1 = PointerHitCFrame.lookVector
		local DotProduct: number = LookVector1:Dot(LookVector)
		
		if math.abs(DotProduct) > 0.001 then
			PointerHitCFrame = PointerHitCFrame.Rotation + (P + (Position - P):Dot(LookVector1) / DotProduct * LookVector)
		end
		local XScale = 1
		local X = (workspace.CurrentCamera.CFrame.Position - PointerHitCFrame.Position).magnitude * 0.01
		
		if X < 0.05 then
			XScale = X / 0.05
			X = 0.05
		end
		self.cursorPart.Size = Vector3.new(X, X, X)
		self.cursorPart.CFrame = PointerHitCFrame * CFrame.new(0, 0, X * 0.5)
		self.cursorImage.Size = UDim2.new(XScale, 0, XScale, 0)
	end
	self.cursorSurfaceGui.Enabled = VRService.DidPointerHit
end

function LaserPointerModule:disableComponent()
	-- upvalues: removePartsFromGame (copy), RenderCaptureAlwaysOnTopGuiEngineFeature (copy)
	removePartsFromGame(self.parabola, self.parabolaOffhand, self.originPart, self.originPartOffhand, self.plopPart, self.plopBall, self.cursorPart)
	
	if RenderCaptureAlwaysOnTopGuiEngineFeature then
		removePartsFromGame(self.cursorSurfaceGui)
	end
	self:setNavigationActionEnabled(false)
	
	for _, connection in pairs(self.connections) do
		connection:Disconnect()
	end
	self.connections = {}
end

function LaserPointerModule:update(_)
	-- upvalues: VRService (copy), config1 (copy), LocalPlayer (ref), VRUtilModule (copy)
	if VRService.LaserPointer == Enum.VRLaserPointerMode.Disabled then return end
	self.parabola.Thickness = config1.ARC_THICKNESS * workspace.CurrentCamera.HeadScale
	self.parabolaOffhand.Thickness = config1.ARC_THICKNESS * workspace.CurrentCamera.HeadScale
	
	if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool") then
		self.parabola.Color3 = config1.ARC_COLOR_BAD
	else
		self.parabola.Color3 = VRService.DidPointerHit and config1.ARC_COLOR_HIT or config1.ARC_COLOR_GOOD
	end
	local UserCFrameWorldSpace = VRUtilModule.GetUserCFrameWorldSpace(self.inputUserCFrame)
	local P = UserCFrameWorldSpace.p
	local LookVector = UserCFrameWorldSpace.lookVector
	local NewP = if VRService.DidPointerHit then P + LookVector * (VRService.PointerHitCFrame.Position - P).magnitude else P + LookVector * self.laserMaxDistance
	
	if self:isHeadMounted() then
		self.parabola.Visible = false
	else
		self.parabola.Visible = true
		self:renderAsLaser(P, NewP)
	end
	if VRService.LaserPointer == Enum.VRLaserPointerMode.DualPointer then
		if self:isHeadMounted() then
			self.parabolaOffhand.Visible = false
			
			return
		end
		self.parabolaOffhand.Visible = true
		local UserCFrameWorldSpace1 = VRUtilModule.GetUserCFrameWorldSpace(if self.inputUserCFrame == Enum.UserCFrame.RightHand then Enum.UserCFrame.LeftHand else Enum.UserCFrame.RightHand)
		local P1 = UserCFrameWorldSpace1.p
		self:renderOffhandLaser(P1, P1 + UserCFrameWorldSpace1.lookVector * 3)
	end
end

return LaserPointerModule