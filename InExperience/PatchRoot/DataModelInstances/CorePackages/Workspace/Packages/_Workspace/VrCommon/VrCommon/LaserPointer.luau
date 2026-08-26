local vrCommon = script:FindFirstAncestor("VrCommon")
local parent = vrCommon.Parent
local coreGuiService = game:GetService("CoreGui")
local contextActionService = game:GetService("ContextActionService")
local playersService = game:GetService("Players")
local guiService = game:GetService("GuiService")
local VRService = game:GetService("VRService")
local create = require(parent.AppCommonLib).Create
local VRUtilModule = require(vrCommon.VRUtil)
require(vrCommon.Panel3D)
local enableUserInputCFrameLogging = game:DefineFastFlag("EnableUserInputCFrameLogging", false)
local VRLaserPointerRaycastChange = game:DefineFastFlag("VRLaserPointerRaycastChange", false)
local localPlayer = playersService.LocalPlayer
while not localPlayer do
	playersService.Changed:wait()
	localPlayer = playersService.LocalPlayer
end
local function _(p1)
	return Color3.new(p1.r ^ 2.2, p1.g ^ 2.2, p1.b ^ 2.2)
end

local function addPartsToGame(...)
	-- upvalues: guiService (ref)
	local list = { ... }
	local coreEffectFolder = guiService.CoreEffectFolder
	
	if not coreEffectFolder then
		coroutine.wrap(function()
			-- upvalues: guiService (copy), list (ref), coreEffectFolder (ref)
			repeat
			until guiService.Changed:wait() == "CoreEffectFolder" or guiService.CoreEffectFolder ~= nil
			for i, v in pairs(list) do
				v.Parent = coreEffectFolder
				v.CanTouch = false
				v.CanCollide = false
				v.CanQuery = false
			end
		end)()
		
		return
	end
	for i, v in pairs(list) do
		v.Parent = coreEffectFolder
		v.CanTouch = false
		v.CanCollide = false
		v.CanQuery = false
	end
end

local function removePartsFromGame(...)
	for i, v in pairs({ ... }) do
		v.Parent = nil
	end
end

local function getLocalHumanoid()
	-- upvalues: localPlayer (write)
	local character = localPlayer.Character
	
	if not character then return end
	for i, v in pairs(character:GetChildren()) do
		if v:IsA("Humanoid") then
			return v
		end
	end
end

local _ = function(p1, p2)
	local var1 = p1 ^ p2
	
	if var1 ~= var1 then
		var1 = math.abs(p1) ^ p2
	end
	return var1
end

local t = {
	Disabled = 0,
	Pointer = 1,
	Navigation = 2,
	Hidden = 3,
	DualPointer = 4
}
local _ = { Right = 0, Left = 1 }
local t_1 = {
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
	TRANSITION_DURATION = 0.25
}
local color = Color3.fromRGB(0, 162, 255)
t_1.ARC_COLOR_GOOD = Color3.new(color.r ^ 2.2, color.g ^ 2.2, color.b ^ 2.2)
local color_1 = Color3.fromRGB(253, 68, 72)
t_1.ARC_COLOR_BAD = Color3.new(color_1.r ^ 2.2, color_1.g ^ 2.2, color_1.b ^ 2.2)
t_1.PLOP_BALL_COLOR_GOOD = BrickColor.new("Bright green")
t_1.PLOP_BALL_COLOR_BAD = BrickColor.new("Bright red")
local t_2 = {
	MODE_ENABLED = true,
	ARC_THICKNESS = 0.01,
	MAX_DISTANCE = 50,
	G = 0,
	SWITCH_AIM_THRESHOLD = 0.261799387799,
	TRANSITION_DURATION = 0.075,
	ARC_COLOR_GOOD = t_1.ARC_COLOR_GOOD,
	ARC_COLOR_BAD = t_1.ARC_COLOR_BAD
}
local color_2 = Color3.fromRGB(0, 255, 162)
t_2.ARC_COLOR_HIT = Color3.new(color_2.r ^ 2.2, color_2.g ^ 2.2, color_2.b ^ 2.2)
local vector2 = Vector2.new(0, 0)
local vector2_1 = Vector2.new(1, 1)
local t_3 = {}
t_3.__index = t_3
t_3.Mode = t

function t_3.new(_)
	-- upvalues: t_3 (ref), VRService (ref), create (ref), coreGuiService (ref), t_1 (ref), vector2_1 (ref), vector2 (ref), guiService (ref)
	local tbl = setmetatable({}, t_3)
	tbl.laserMaxDistance = VRService.LaserDistance
	tbl.laserHand = 0
	tbl.inputUserCFrame = Enum.UserCFrame.RightHand
	tbl.equippedTool = false
	tbl.lastLaserModeHit = tick()
	tbl.guiMenuIsOpen = false
	tbl.externalForcePointer = false
	tbl.forceDotActive = true
	tbl.navHitPoint = Vector3.new(0, 0, 0)
	tbl.navHitNormal = Vector3.new(0, 1, 0)
	tbl.navHitPart = nil
	tbl.navigationIsValid = false
	tbl.lastNavigationValidityChangeTime = tick()
	tbl.plopBallBounceStart = tick()
	tbl.buttonPressStart = 0
	tbl.showPlopBallOnPointer = false
	tbl.parabola = create("ParabolaAdornment")({
		Name = "LaserPointerParabola",
		A = -1,
		B = 2,
		C = 0,
		Color3 = nil,
		Visible = false,
		Parent = coreGuiService,
		Thickness = t_1.ARC_THICKNESS
	})
	tbl.originPart = create("Part")({
		Name = "LaserPointerOrigin",
		Anchored = true,
		CanCollide = false,
		Size = Vector3.new(0.20000000298, 0.20000000298, 0.20000000298),
		Transparency = 1,
		TopSurface = Enum.SurfaceType.SmoothNoOutlines,
		BottomSurface = Enum.SurfaceType.SmoothNoOutlines,
		Material = Enum.Material.SmoothPlastic
	})
	tbl.parabola.Adornee = tbl.originPart
	tbl.parabolaOffhand = create("ParabolaAdornment")({
		Name = "LaserPointerparabolaOffhand",
		A = 0,
		B = 0.000001,
		C = 0,
		Transparency = 0.5,
		Visible = false,
		Parent = coreGuiService,
		Color3 = Color3.new(1, 1, 1),
		Thickness = t_1.ARC_THICKNESS
	})
	tbl.originPartOffhand = create("Part")({
		Name = "LaserPointerOriginOffhand",
		Anchored = true,
		CanCollide = false,
		Size = Vector3.new(0.20000000298, 0.20000000298, 0.20000000298),
		Transparency = 1,
		TopSurface = Enum.SurfaceType.SmoothNoOutlines,
		BottomSurface = Enum.SurfaceType.SmoothNoOutlines,
		Material = Enum.Material.SmoothPlastic
	})
	tbl.parabolaOffhand.Adornee = tbl.originPartOffhand
	tbl.plopPart = create("Part")({
		Name = "LaserPointerTeleportPlop",
		Anchored = true,
		CanCollide = false,
		Size = Vector3.new(0.20000000298, 0.20000000298, 0.20000000298),
		Transparency = 1
	})
	tbl.plopBall = create("Part")({
		Name = "LaserPointerTeleportPlopBall",
		Anchored = true,
		CanCollide = false,
		TopSurface = Enum.SurfaceType.SmoothNoOutlines,
		BottomSurface = Enum.SurfaceType.SmoothNoOutlines,
		Material = Enum.Material.Neon,
		BrickColor = t_1.PLOP_BALL_COLOR_GOOD,
		Shape = Enum.PartType.Ball,
		Size = Vector3.new(1, 1, 1) * t_1.PLOP_BALL_SIZE
	})
	tbl.plopAdorn = create("ImageHandleAdornment")({
		Name = "LaserPointerTeleportPlopAdorn",
		Parent = tbl.plopPart,
		Adornee = tbl.plopPart,
		Size = vector2_1 * t_1.PLOP_SIZE,
		Image = t_1.PLOP_GOOD
	})
	tbl.plopAdornPulse = create("ImageHandleAdornment")({
		Name = "LaserPointerTeleportPlopAdornPulse",
		Transparency = 0.5,
		Parent = tbl.plopPart,
		Adornee = tbl.plopPart,
		Size = vector2,
		Image = t_1.PLOP_GOOD
	})
	tbl.cursorPart = create("Part")({
		Name = "Cursor",
		CanCollide = false,
		CanQuery = false,
		CanTouch = false,
		Anchored = true,
		Transparency = 1
	})
	tbl.cursorSurfaceGui = create("SurfaceGui")({
		Name = "CursorSurfaceGui",
		Active = false,
		AlwaysOnTop = true,
		Enabled = false,
		ZOffset = 10,
		Parent = tbl.cursorPart
	})
	tbl.cursorImage = create("ImageLabel")({
		Image = "rbxasset://textures/Cursors/Gamepad/Pointer.png",
		BackgroundTransparency = 1,
		ImageColor3 = Color3.new(0, 1, 0),
		Parent = tbl.cursorSurfaceGui,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, 0, 1, 0)
	})
	tbl.connections = {}
	table.insert(tbl.connections, VRService:GetPropertyChangedSignal("LaserPointer"):Connect(function()
		-- upvalues: tbl (ref)
		tbl:onModeChanged()
	end))
	tbl:onModeChanged()
	guiService.MenuOpened:connect(function()
		-- upvalues: tbl (ref)
		tbl.guiMenuIsOpen = true
	end)
	guiService.MenuClosed:connect(function()
		-- upvalues: tbl (ref)
		tbl.guiMenuIsOpen = false
	end)
	tbl.inputUserCFrame = VRService.GuiInputUserCFrame
	VRService.Changed:connect(function(p1)
		-- upvalues: tbl (ref), VRService (copy)
		if p1 == "GuiInputUserCFrame" then
			tbl.inputUserCFrame = VRService.GuiInputUserCFrame
			
			return
		elseif p1 == "PointerHitCFrame" or p1 == "DidPointerHit" then
			tbl:cursorInputsChanged()
			
			return
		elseif p1 == "VRSessionState" and VRService.VRSessionState == Enum.VRSessionState.Focused then
			tbl:updateInputUserCFrame()
		end
	end)
	VRService.LaserPointerTriggered:connect(function(p1)
		-- upvalues: tbl (ref)
		if game:GetEngineFeature("ImprovedTriggerFire") and p1.UserInputState ~= Enum.UserInputState.End then return end
		if (p1.KeyCode == Enum.KeyCode.ButtonR1 or p1.KeyCode == Enum.KeyCode.ButtonR2 or (p1.KeyCode == Enum.KeyCode.ButtonR3 or p1.KeyCode == Enum.KeyCode.ButtonA) or p1.KeyCode == Enum.KeyCode.ButtonB) and tbl.laserHand ~= 0 then
			tbl.laserHand = 0
			tbl:updateInputUserCFrame()
			
			return
		elseif (p1.KeyCode == Enum.KeyCode.ButtonL1 or p1.KeyCode == Enum.KeyCode.ButtonL2 or (p1.KeyCode == Enum.KeyCode.ButtonL3 or p1.KeyCode == Enum.KeyCode.ButtonX) or p1.KeyCode == Enum.KeyCode.ButtonY) and tbl.laserHand ~= 1 then
			tbl.laserHand = 1
			tbl:updateInputUserCFrame()
		end
	end)
	VRService.UserCFrameEnabled:Connect(function(_, _)
		-- upvalues: tbl (ref)
		tbl:updateInputUserCFrame()
	end)
	tbl:updateInputUserCFrame()
	
	return tbl
end

function t_3.hasAnyHandController()
	-- upvalues: VRService (ref)
	return VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) or VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand)
end

function t_3.getModeName(p1)
	-- upvalues: t (ref)
	for i, v in pairs(t) do
		if p1 == v then
			return i
		end
	end
	return "unknown"
end

function t_3:updateInputUserCFrame()
	-- upvalues: enableUserInputCFrameLogging (ref), VRService (ref)
	local var1 = if enableUserInputCFrameLogging then VRService.GuiInputUserCFrame else nil
	
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
	if enableUserInputCFrameLogging and var1 ~= VRService.GuiInputUserCFrame then
		print("Updated GuiInputUserCFrame is: " .. tostring(VRService.GuiInputUserCFrame))
	end
end

function t_3:onModeChanged(_)
	-- upvalues: VRService (ref), addPartsToGame (ref), removePartsFromGame (ref)
	self:updateInputUserCFrame()
	
	if VRService.LaserPointer == Enum.VRLaserPointerMode.Disabled then
		addPartsToGame(self.originPart, self.cursorPart)
		removePartsFromGame(self.plopPart, self.plopBall, self.originPartOffhand)
		self.forceDotActive = true
		self.parabola.Visible = false
		self.parabolaOffhand.Visible = false
		self:setNavigationActionEnabled(false)
		
		return
	elseif VRService.LaserPointer == Enum.VRLaserPointerMode.Pointer then
		addPartsToGame(self.originPart, self.cursorPart)
		removePartsFromGame(self.plopPart, self.plopBall, self.originPartOffhand)
		self.parabola.Visible = true
		self.parabolaOffhand.Visible = false
		self:setNavigationActionEnabled(false)
		self.forceDotActive = false
		
		return
	elseif VRService.LaserPointer == Enum.VRLaserPointerMode.DualPointer then
		addPartsToGame(self.originPart, self.originPartOffhand, self.cursorPart)
		removePartsFromGame(self.plopPart, self.plopBall)
		self.parabola.Visible = true
		self.parabolaOffhand.Visible = true
		self:setNavigationActionEnabled(false)
		self.forceDotActive = false
	end
end

function t_3.setMode(_, p2)
	-- upvalues: t (ref), VRService (ref)
	if p2 == t.Disabled or p2 == t.Hidden then
		VRService.LaserPointer = Enum.VRLaserPointerMode.Disabled
		
		return
	elseif p2 == t.Pointer or p2 == t.Navigation then
		VRService.LaserPointer = Enum.VRLaserPointerMode.Pointer
		
		return
	elseif p2 == t.DualPointer then
		VRService.LaserPointer = Enum.VRLaserPointerMode.DualPointer
	end
end

function t_3.setEnableAmbidexterousPointer(_, _) end

function t_3.calculateLaunchVelocity(_, p2, p3, p4)
	return -(math.sqrt(p2 / 0.707106781187) * p3) / math.sqrt(2 * p4 * 0.707106781187 + 2 * p3 * 0.707106781187)
end

function t_3.isHeadMounted(_)
	-- upvalues: VRService (ref)
	return VRService.GuiInputUserCFrame == Enum.UserCFrame.Head
end

function t_3:shouldForcePointer()
	return self.externalForcePointer or self.guiMenuIsOpen
end

function t_3:setForcePointer(p2)
	self.externalForcePointer = p2
end

function t_3.getNavigationOrigin(_)
	-- upvalues: getLocalHumanoid (ref)
	local var1 = getLocalHumanoid()
	
	if not var1 then return end
	local torso = var1.Torso
	
	if torso then
		return torso.Position + Vector3.new(0, (-(torso.Size.Y / 2)) - (if var1.RigType == Enum.HumanoidRigType.R6 then 2 else var1.HipHeight), 0)
	end
end

function t_3.horzDistanceFromCharacter(_, p2)
	-- upvalues: localPlayer (write)
	local character = localPlayer.Character
	
	if not character then
		return 1e999
	end
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	
	return if humanoidRootPart then ((humanoidRootPart:GetRenderCFrame().p - p2) * Vector3.new(1, 0, 1)).magnitude else 1e999
end

function t_3:onNavigateAction(_, p2, _)
	-- upvalues: VRService (ref)
	if p2 == Enum.UserInputState.Begin then
		VRService:RequestNavigation(CFrame.new(self.navHitPoint, self.navHitPoint + self.navHitNormal) * CFrame.Angles(1.570796326795, 0, 0), self.inputUserCFrame)
	end
end

function t_3.setNavigationActionEnabled(value, p2)
	-- upvalues: contextActionService (ref)
	if p2 then
		contextActionService:BindCoreAction("LaserPointerNavigate", function(...)
			-- upvalues: value (ref)
			value:onNavigateAction(...)
		end, false, Enum.KeyCode.ButtonA)
		
		return
	end
	contextActionService:UnbindCoreAction("LaserPointerNavigate")
end

function t_3:setArcLaunchParams(p2, p3, p4, p5)
	local var1 = math.cos(p2) * p3
	local var2 = math.sin(p2) * p3
	
	if var1 == 0 then
		var1 = 0.000001
	end
	self.parabola.A = -(0.5 * p4) * (1 / var1 ^ 2)
	self.parabola.B = var2 / var1
	self.parabola.C = 0
	self.parabola.Range = p5 * 1.5
end

function t_3:renderAsParabola(p2, p3)
	self.originPart.CFrame = CFrame.new(p2, p2 + p3 * Vector3.new(1, 0, 1)) * CFrame.Angles(0, 1.570796326795, 0)
end

function t_3:renderAsLaser(p2, p3)
	self.originPart.CFrame = CFrame.new(p2, p3) * CFrame.Angles(0, 1.570796326795, 0)
	self.parabola.A = 0
	self.parabola.B = 0.000001
	self.parabola.C = 0
	self.parabola.Range = (p3 - p2).magnitude
end

function t_3:renderOffhandLaser(p2, p3)
	self.originPartOffhand.CFrame = CFrame.new(p2, p3) * CFrame.Angles(0, 1.570796326795, 0)
	self.parabolaOffhand.Range = (p3 - p2).magnitude
end

if not VRLaserPointerRaycastChange then
	function t_3:getLaserHit(p2, p3, p4)
		local var1, var2, var3, _ = workspace:FindPartOnRayWithIgnoreList(Ray.new(p2, p3 * self.laserMaxDistance), p4)
		
		return var1, var2, var3, (var2 - p2).magnitude / math.max(self.laserMaxDistance, 0.1)
	end
end
function t_3.canNavigateTo(_, p2, _, p3)
	-- upvalues: localPlayer (write)
	local character = localPlayer.Character
	
	return if character then if character:FindFirstChild("HumanoidRootPart") then if p2 then p3.Y >= -0.000001 else false else false else false
end

function t_3:checkHeadMountedMode(p2)
	-- upvalues: t (ref), guiService (ref)
	if self:shouldForcePointer() then
		self:setMode(t.Pointer)
		
		return
	elseif p2 and p2:IsDescendantOf(guiService.CoreGuiFolder) then
		self:setMode(t.Pointer)
		
		return
	end
	self:setMode(t.Navigation)
end

function t_3:setNavigationValidState(p2)
	-- upvalues: t_1 (ref)
	if p2 == self.navigationIsValid then return end
	self.navigationIsValid = p2
	self.lastNavigationValidityChangeTime = tick()
	
	if p2 then
		self.plopBallBounceStart = tick()
		self.parabola.Color3 = t_1.ARC_COLOR_GOOD
		self.plopAdorn.Visible = true
		self.plopAdorn.Image = t_1.PLOP_GOOD
		self.plopAdornPulse.Visible = true
		self.plopAdornPulse.Image = t_1.PLOP_GOOD
		self.plopBall.BrickColor = t_1.PLOP_BALL_COLOR_GOOD
		
		return
	end
	self.parabola.Color3 = t_1.ARC_COLOR_BAD
	self.plopAdorn.Visible = false
	self.plopAdorn.Image = t_1.PLOP_BAD
	self.plopAdornPulse.Visible = false
	self.plopAdornPulse.Image = t_1.PLOP_BAD
	self.plopBall.BrickColor = t_1.PLOP_BALL_COLOR_BAD
end

function t_3:updateNavPlop(p2, p3)
	-- upvalues: t_1 (ref), vector2_1 (ref), vector2 (ref)
	local var1 = tick() - self.plopBallBounceStart
	local cFrame = CFrame.new(p2, p2 + p3)
	local var2 = 0
	
	if self.navigationIsValid then
		local var3 = math.sin(var1 * 2 * 3.14159265359 / t_1.BALL_WAVE_PERIOD)
		local BALL_WAVE_EXP = t_1.BALL_WAVE_EXP
		local var4 = var3 ^ BALL_WAVE_EXP
		
		if var4 ~= var4 then
			var4 = math.abs(var3) ^ BALL_WAVE_EXP
		end
		var2 = t_1.BALL_WAVE_START + var4 * t_1.BALL_WAVE_AMPLITUDE
	end
	self.plopPart.CFrame = cFrame
	self.plopBall.CFrame = cFrame * CFrame.new(0, 0, -var2)
	local var5 = var1 % t_1.PULSE_PERIOD
	
	if var5 > 0 then
		local var6 = var5 / t_1.PULSE_DURATION
		
		if var6 < 1 then
			self.plopAdornPulse.Visible = true
			local plopAdornPulse = self.plopAdornPulse
			local PULSE_SIZE_0 = t_1.PULSE_SIZE_0
			local PULSE_EXP = t_1.PULSE_EXP
			local var7 = var6 ^ PULSE_EXP
			
			if var7 ~= var7 then
				var7 = math.abs(var6) ^ PULSE_EXP
			end
			plopAdornPulse.Size = vector2_1 * (PULSE_SIZE_0 + var7 * (t_1.PULSE_SIZE_1 - t_1.PULSE_SIZE_0))
			self.plopAdornPulse.Transparency = 0.5 + var6 * 0.5
			
			return
		else
			self.plopAdornPulse.Visible = false
			self.plopAdornPulse.Size = vector2
			self.pulseStartTime = tick() + t_1.PULSE_PERIOD
		end
	end
end

function t_3:updateNavigationMode(p2, p3, p4)
	self.navHitPoint = p2
	self.navHitNormal = p3
	self.navHitPart = p4
	self:updateNavPlop(p2, p3)
	self:setNavigationValidState(self:canNavigateTo(self.navHitPart, self.navHitPoint, self.navHitNormal))
end

function t_3:showHitBallOnLaserPointer(p2)
	-- upvalues: addPartsToGame (ref), removePartsFromGame (ref)
	if p2 then
		if self.showPlopBallOnPointer then
			return
		else
			self.showPlopBallOnPointer = true
			addPartsToGame(self.plopBall)
			
			return
		end
	elseif self.showPlopBallOnPointer then
		removePartsFromGame(self.plopBall)
		self.showPlopBallOnPointer = false
	end
end

function t_3:cursorInputsChanged()
	-- upvalues: VRService (ref), VRUtilModule (ref)
	local didPointerHit = VRService.DidPointerHit
	self.cursorSurfaceGui.Enabled = didPointerHit
	
	if didPointerHit then
		local pointerHitCFrame = VRService.PointerHitCFrame
		local var1 = 1
		local var2 = (VRUtilModule.GetUserCFrameWorldSpace(Enum.UserCFrame.Head).Position - pointerHitCFrame.Position).magnitude * 0.01
		
		if var2 < 0.05 then
			var1 = var2 / 0.05
			var2 = 0.05
		end
		self.cursorPart.Size = Vector3.new(var2, var2, var2)
		self.cursorPart.CFrame = pointerHitCFrame * CFrame.new(0, 0, var2 * 0.5)
		self.cursorImage.Size = UDim2.new(var1, 0, var1, 0)
	end
end

function t_3:updateCursor_DEPRECATED()
	-- upvalues: VRService (ref), VRUtilModule (ref)
	if VRService.DidPointerHit then
		local pointerHitCFrame = VRService.PointerHitCFrame
		local var1 = if self:isHeadMounted() then VRUtilModule.GetUserCFrameWorldSpace(Enum.UserCFrame.Head) else VRUtilModule.GetUserCFrameWorldSpace(self.inputUserCFrame)
		local p = var1.p
		local lookVector = var1.lookVector
		local position = pointerHitCFrame.Position
		local lookVector_1 = pointerHitCFrame.lookVector
		local var2 = lookVector_1:Dot(lookVector)
		
		if math.abs(var2) > 0.001 then
			pointerHitCFrame = pointerHitCFrame.Rotation + (p + (position - p):Dot(lookVector_1) / var2 * lookVector)
		end
		local var3 = 1
		local var4 = (workspace.CurrentCamera.CFrame.Position - pointerHitCFrame.Position).magnitude * 0.01
		
		if var4 < 0.05 then
			var3 = var4 / 0.05
			var4 = 0.05
		end
		self.cursorPart.Size = Vector3.new(var4, var4, var4)
		self.cursorPart.CFrame = pointerHitCFrame * CFrame.new(0, 0, var4 * 0.5)
		self.cursorImage.Size = UDim2.new(var3, 0, var3, 0)
	end
	self.cursorSurfaceGui.Enabled = VRService.DidPointerHit
end

function t_3:disableComponent()
	-- upvalues: removePartsFromGame (ref)
	removePartsFromGame(self.parabola, self.parabolaOffhand, self.originPart, self.originPartOffhand, self.plopPart, self.plopBall, self.cursorPart)
	self:setNavigationActionEnabled(false)
	
	for i, v in pairs(self.connections) do
		v:Disconnect()
	end
	self.connections = {}
end

function t_3:update(_)
	-- upvalues: VRService (ref), t_2 (ref), localPlayer (write), VRUtilModule (ref)
	if VRService.LaserPointer == Enum.VRLaserPointerMode.Disabled then return end
	self.parabola.Thickness = t_2.ARC_THICKNESS * workspace.CurrentCamera.HeadScale
	self.parabolaOffhand.Thickness = t_2.ARC_THICKNESS * workspace.CurrentCamera.HeadScale
	
	if localPlayer and localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Tool") then
		self.parabola.Color3 = t_2.ARC_COLOR_BAD
	else
		self.parabola.Color3 = if VRService.DidPointerHit then t_2.ARC_COLOR_HIT else t_2.ARC_COLOR_GOOD
	end
	local userCFrameWorldSpace = VRUtilModule.GetUserCFrameWorldSpace(self.inputUserCFrame)
	local p = userCFrameWorldSpace.p
	local lookVector = userCFrameWorldSpace.lookVector
	local var1 = if VRService.DidPointerHit then p + lookVector * (VRService.PointerHitCFrame.Position - p).magnitude else p + lookVector * self.laserMaxDistance
	
	if self:isHeadMounted() then
		self.parabola.Visible = false
	else
		self.parabola.Visible = true
		self:renderAsLaser(p, var1)
	end
	if VRService.LaserPointer == Enum.VRLaserPointerMode.DualPointer then
		if self:isHeadMounted() then
			self.parabolaOffhand.Visible = false
			
			return
		end
		self.parabolaOffhand.Visible = true
		local userCFrameWorldSpace_1 = VRUtilModule.GetUserCFrameWorldSpace(if self.inputUserCFrame == Enum.UserCFrame.RightHand then Enum.UserCFrame.LeftHand else Enum.UserCFrame.RightHand)
		local p_1 = userCFrameWorldSpace_1.p
		self:renderOffhandLaser(p_1, p_1 + userCFrameWorldSpace_1.lookVector * 3)
	end
end

return t_3