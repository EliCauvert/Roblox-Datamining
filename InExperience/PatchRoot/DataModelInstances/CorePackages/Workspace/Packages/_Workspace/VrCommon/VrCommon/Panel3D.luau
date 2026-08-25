local vrCommon = script:FindFirstAncestor("VrCommon")
local parent = vrCommon.Parent
local VRService = game:GetService("VRService")
local runService = game:GetService("RunService")
local guiService = game:GetService("GuiService")
local coreGuiService = game:GetService("CoreGui")
local VRUtilModule = require(vrCommon.VRUtil)
local create = require(parent.AppCommonLib).Create
local text = "Panel3DRenderStep-" .. game:GetService("HttpService"):GenerateGUID()
local vector2 = Vector2.new(0, 0)
local cFrame = CFrame.new(0, -0.5, -5.5)
local cFrame_1 = CFrame.new(0, 0, -3)
local var10 = CFrame.new(0, 0, -0.1) * CFrame.Angles(0, 3.14159265359, 0)
local var11 = nil
local var12 = nil
local var13 = 1e999
local var14 = nil
local var15 = vector2
local t = {}
local var17 = create("ImageLabel")({
	Image = "rbxasset://textures/Cursors/Gamepad/Pointer.png",
	BackgroundTransparency = 1,
	ZIndex = 1000000000,
	ImageColor3 = Color3.new(0, 1, 0)
})
local var18 = create("Folder")({ Name = "VRCorePanelParts", Archivable = false })
local var19 = create("Folder")({ Name = "VRCoreEffectParts", Archivable = false })
pcall(function()
	-- upvalues: guiService (ref), var18 (ref), var19 (ref)
	guiService.CoreGuiFolder = var18
	guiService.CoreEffectFolder = var19
end)
local t_1 = {
	Type = {
		None = 0,
		Standard = 1,
		Fixed = 2,
		HorizontalFollow = 3,
		FixedToHead = 4,
		NewStandard = 5,
		WristView = 6,
		PositionLocked = 7,
		UIManagerManaged = 8
	},
	OnPanelClosed = create("BindableEvent")({ Name = "OnPanelClosed" }),
	GetHeadLookXZ = function(p0)
		-- upvalues: VRService (ref)
		local headUserCFrame = VRService:GetUserCFrame(Enum.UserCFrame.Head)
		local lookVector = headUserCFrame.lookVector
		local cframe = CFrame.Angles(0, math.atan2(-lookVector.Z, lookVector.X) - 1.570796326795, 0)
		
		if p0 then
			cframe += headUserCFrame.p
		end
		return cframe
	end,
	FindContainerOf = function(p1)
		-- upvalues: t (ref)
		for i, v in pairs(t) do
			if not v.gui or not v.gui:IsAncestorOf(p1) then
				for i_1, v_1 in pairs(v.subpanels) do
					if v_1.gui and v_1.gui:IsAncestorOf(p1) then
						return v
					end
				end
			end
			return v
		end
		return nil
	end,
	SetModalPanel = function(value)
		-- upvalues: var11 (write), var12 (write)
		if var11 == value then return end
		if var11 then
			var11:OnModalChanged(false)
		end
		if value then
			value:OnModalChanged(true)
		end
		var12 = var11
		var11 = value
	end,
	RaycastOntoPanel = function(p2, p3, p4, p5)
		-- upvalues: VRUtilModule (ref)
		local size = p2.Size
		local z = size.Z
		local x = size.X
		local y = size.Y
		local renderCFrame = p2:GetRenderCFrame()
		local lookVector = renderCFrame.lookVector
		local var37 = VRUtilModule.RayPlaneIntersection(p5, lookVector, renderCFrame.p + lookVector * z * 0.5)
		
		if not var37 then
			return nil, nil, nil, false
		end
		local var38 = renderCFrame:pointToObjectSpace(var37) * Vector3.new(-1, 1, 1) + Vector3.new(x / 2, -y / 2, 0)
		local vector2 = Vector2.new(var38.X / x * p3.AbsoluteSize.X, var38.Y / y * -p3.AbsoluteSize.Y)
		local x_1 = vector2.X
		local y_1 = vector2.Y
		local x_2 = p4.AbsolutePosition.X
		local y_2 = p4.AbsolutePosition.Y
		
		return var37, var38, vector2, if p3.Enabled and x_2 <= x_1 and (x_1 <= x_2 + p4.AbsoluteSize.X and y_2 <= y_1) and y_1 <= y_2 + p4.AbsoluteSize.Y then true else false
	end
}
local t_2 = {}
t_2.__index = t_2

function t_2.new(p6)
	-- upvalues: t_1 (ref), t (ref), t_2 (ref)
	local t_3 = {
		name = p6,
		part = false,
		gui = false,
		width = 1,
		height = 1,
		isVisible = false,
		isEnabled = false,
		panelType = t_1.Type.None,
		pixelScale = 1,
		showCursor = true,
		canFade = true,
		shouldFindLookAtGuiElement = false,
		ignoreModal = false,
		needsPositionUpdate = false,
		alwaysUpdatePosition = false,
		linkedTo = false,
		subpanels = {},
		transparency = 0,
		forceShowUntilLookedAt = false,
		forceShowUntilTick = 0,
		isLookedAt = false,
		isWristHeldUp = false,
		isOffscreen = true,
		lookAtPixel = Vector2.new(-1, -1),
		cursorPos = Vector2.new(-1, -1),
		lookAtDistance = 1e999,
		lookAtGuiElement = false,
		isClosest = true,
		localCF = CFrame.new(),
		originCF = CFrame.new(),
		angleFromHorizon = false,
		angleFromForward = false,
		distance = 0,
		lerpTime = 0,
		lerpInitialCF = nil,
		lerpScaleSize = Vector2.new(0, 0),
		lerpInitialSize = Vector2.new(0, 0),
		FollowView = true,
		LastFollowCF = nil,
		LastCameraPos = Vector3.new(0, 0, 0),
		wristTargetPosition = Vector3.new()
	}
	
	if t[p6] then
		error("A panel by the name of " .. p6 .. " already exists.")
	end
	t[p6] = t_3
	
	return setmetatable(t_3, t_2)
end

function t_2:GetPart()
	-- upvalues: create (ref), var18 (ref)
	if not self.part then
		self.part = create("Part")({
			Transparency = 1,
			CanCollide = false,
			CanTouch = false,
			Anchored = true,
			Size = Vector3.new(1, 1, 0.20000000298),
			Name = self.name,
			Parent = var18
		})
	end
	return self.part
end

function t_2:GetGUI()
	-- upvalues: create (ref), coreGuiService (ref)
	if not self.gui then
		self.gui = create("SurfaceGui")({
			Archivable = false,
			Active = true,
			ToolPunchThroughDistance = 1000,
			AlwaysOnTop = true,
			Parent = coreGuiService,
			Name = self.name,
			Adornee = self:GetPart(),
			CanvasSize = self.CanvasSize or Vector2.new(1000, 1000),
			Enabled = self.isEnabled
		})
	end
	return self.gui
end

function t_2:FindHoveredGuiElement(p7)
	local x = self.lookAtPixel.X
	local y = self.lookAtPixel.Y
	
	for i, v in pairs(p7) do
		local absolutePosition = v.AbsolutePosition
		local var41 = v.AbsolutePosition + v.AbsoluteSize
		
		if absolutePosition.X <= x and x <= var41.X and (absolutePosition.Y <= y and y <= var41.Y) then
			return v, i
		end
	end
end

function t_2:SetPartCFrame(p8)
	-- upvalues: var10 (ref)
	self:GetPart().CFrame = p8 * var10
end

function t_2:SetEnabled(p9)
	-- upvalues: var18 (ref)
	if self.isEnabled == p9 then return end
	self.isEnabled = p9
	
	if p9 then
		self:GetPart().Parent = var18
		self:GetGUI().Enabled = true
		
		for i, v in pairs(self.subpanels) do
			v:SetEnabled(v:GetEnabled())
		end
	else
		self:GetPart().Parent = nil
		self:GetGUI().Enabled = false
		
		for i, v in pairs(self.subpanels) do
			v:SetEnabled(v:GetEnabled())
		end
	end
	self:OnEnabled(p9)
end

function t_2:StartLerp(endValue)
	-- upvalues: t_1 (ref)
	if self.panelType == t_1.Type.UIManagerManaged then
		return
	end
	self.lerpInitialCF = self:GetPart().CFrame * CFrame.new(0, -1.5, 0)
	self.lerpTime = 1
	self.lerpInitialSize = Vector2.new(self.width, self.height)
	self.lerpScaleSize = endValue or Vector2.new(0, 0)
end

function t_2:EvaluatePositioning(p10, p11, p12, p13)
	-- upvalues: t_1 (ref), cFrame (ref), VRService (ref), cFrame_1 (ref), VRUtilModule (ref)
	if self.panelType == t_1.Type.UIManagerManaged then return end
	if self.panelType == t_1.Type.Fixed then
		self:SetPartCFrame(p10 * (self.localCF - self.localCF.p + self.localCF.p * workspace.CurrentCamera.HeadScale))
	elseif self.panelType == t_1.Type.HorizontalFollow then
		self:SetPartCFrame(p10 * (CFrame.new(p12.p, p12.p + p12.lookVector * Vector3.new(1, 0, 1)) * self.angleFromForward * self.angleFromHorizon * CFrame.new(0, 0, workspace.CurrentCamera.HeadScale * -self.distance)))
	elseif self.panelType == t_1.Type.FixedToHead then
		self:SetPartCFrame(p11 * (self.localCF - self.localCF.p + self.localCF.p * workspace.CurrentCamera.HeadScale))
	elseif self.panelType == t_1.Type.Standard then
		if self.needsPositionUpdate or self.alwaysUpdatePosition then
			self.needsPositionUpdate = false
			self.originCF = t_1.GetHeadLookXZ(true) * CFrame.new(cFrame.Position * workspace.CurrentCamera.HeadScale)
		end
		self:SetPartCFrame(p10 * self.originCF * self.localCF)
	elseif self.panelType == t_1.Type.NewStandard then
		if self.needsPositionUpdate or self.alwaysUpdatePosition then
			self.needsPositionUpdate = false
			self.originCF = VRService:GetUserCFrame(Enum.UserCFrame.Head) * CFrame.new(cFrame_1.Position * workspace.CurrentCamera.HeadScale)
		end
		self:SetPartCFrame(p10 * self.originCF * self.localCF)
	elseif self.panelType == t_1.Type.WristView then
		if VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
			if self.needsPositionUpdate or self.alwaysUpdatePosition then
				self.needsPositionUpdate = false
				self.originCF = CFrame.new(VRService:GetUserCFrame(Enum.UserCFrame.LeftHand).Position * workspace.CurrentCamera.HeadScale)
			end
			local var42 = p10 * VRService:GetUserCFrame(Enum.UserCFrame.Head)
			local position = (p10 * self.originCF).Position
			
			if self.distance > 0 then
				local vector3 = Vector3.new(position.x, var42.Position.y - 0.33, position.z)
				position = var42.Position + (vector3 - var42.Position).Unit * math.clamp((vector3 - var42.Position).Magnitude, self.distance - 0.5, self.distance + 0.5)
			end
			self:GetPart().CFrame = CFrame.new(position, Vector3.new(var42.Position.x, position.y, var42.Position.z))
		else
			self:SetPartCFrame(p10 * (self.localCF - self.localCF.p + self.localCF.p * workspace.CurrentCamera.HeadScale))
		end
	elseif self.panelType == t_1.Type.PositionLocked then
		local userCFrameWorldSpace = VRUtilModule.GetUserCFrameWorldSpace(Enum.UserCFrame.Head)
		
		if not self.LastFollowCF then
			self.LastFollowCF = userCFrameWorldSpace
		end
		if (self.LastCameraPos - p10.Position).Magnitude > 0.1 then
			self.LastFollowCF = userCFrameWorldSpace
		end
		self.LastCameraPos = p10.Position
		
		if self.LastFollowCF.LookVector:Dot(userCFrameWorldSpace.LookVector) < 0.85 then
			self.FollowView = true
		elseif self.LastFollowCF.LookVector:Dot(userCFrameWorldSpace.LookVector) > 0.99 then
			self.FollowView = false
		end
		if self.FollowView then
			self.LastFollowCF = self.LastFollowCF:Lerp(userCFrameWorldSpace, 0.1)
		end
		local var45 = userCFrameWorldSpace.Position + self.LastFollowCF.LookVector * (self.distance * workspace.CurrentCamera.HeadScale + 0.1)
		var45 = Vector3.new(var45.X, userCFrameWorldSpace.Position.Y - 0.5 * workspace.CurrentCamera.HeadScale, var45.Z)
		self:GetPart().CFrame = CFrame.new(var45, Vector3.new(userCFrameWorldSpace.Position.x, var45.y, userCFrameWorldSpace.Position.z))
	end
	if self.lerpInitialCF and self.lerpTime > 0 then
		local cFrame_2 = self:GetPart().CFrame
		self.lerpTime -= p13 * 4
		local clampedValue = math.clamp(1 - self.lerpTime, 0, 1)
		self:GetPart().CFrame = self.lerpInitialCF:Lerp(cFrame_2, clampedValue)
		
		if self.lerpScaleSize.x > 0 or self.lerpScaleSize.y > 0 then
			local lerpScaleSize = self.lerpInitialSize:Lerp(self.lerpScaleSize, clampedValue)
			self:ResizeStuds(lerpScaleSize.x, lerpScaleSize.y, self.pixelsPerStud)
		end
	end
end

function t_2:SetLookedAt(p14)
	if not self.isLookedAt and p14 then
		self.isLookedAt = true
		self:OnMouseEnter(self.lookAtPixel.X, self.lookAtPixel.Y)
		
		if self.forceShowUntilLookedAt then
			self.forceShowUntilLookedAt = false
			
			return
		end
	elseif self.isLookedAt and not p14 then
		self.isLookedAt = false
		self:OnMouseLeave(self.lookAtPixel.X, self.lookAtPixel.Y)
	end
end

function t_2:EvaluateGaze(p15, p16, _, _, p17)
	-- upvalues: vector2 (ref), t_1 (ref), var15 (write), var14 (write), VRService (ref), var13 (write)
	self.isClosest = false
	self.lookAtPixel = vector2
	self.lookAtDistance = 1e999
	local var48 = nil
	local var49 = 0
	
	for i, v in pairs(self.subpanels) do
		if v.part and v.guiElement then
			local var59, _, var60, var61 = t_1.RaycastOntoPanel(v.part, v.gui, v.guiElement, p17)
			
			if var59 then
				v.lookAtPixel = var60
				v.cursorPos = var60
				
				if var61 and var49 < v.depthOffset then
					var48 = v
					var49 = v.depthOffset
				end
			end
		end
	end
	if var48 and var48.depthOffset > 0 then
		var15 = var48.cursorPos
		var14 = var48
		
		for i_1, v_1 in pairs(self.subpanels) do
			if v_1 ~= var48 then
				v_1:SetLookedAt(false)
			end
		end
		var48:SetLookedAt(true)
	end
	if self.panelType == t_1.Type.WristView then
		self.isWristHeldUp = false
		local leftHandUserCFrame = VRService:GetUserCFrame(Enum.UserCFrame.LeftHand)
		local var51 = p15 * CFrame.new(leftHandUserCFrame.Position * workspace.CurrentCamera.HeadScale)
		
		if self.distance == 0 then
			local var52 = p15 * VRService:GetUserCFrame(Enum.UserCFrame.Head)
			local position = var51.Position
			local vector3 = Vector3.new(position.x, var52.Position.y - 0.33, position.z)
			self.isWristHeldUp = (var52.Position + (vector3 - var52.Position).Unit * math.clamp((vector3 - var52.Position).Magnitude, 0.5, 1) - var51.Position).Magnitude < 0.25
		else
			local rightHandUserCFrame = VRService:GetUserCFrame(Enum.UserCFrame.RightHand)
			
			if (leftHandUserCFrame.Position - (rightHandUserCFrame.Position + rightHandUserCFrame.LookVector * rightHandUserCFrame.LookVector:Dot(leftHandUserCFrame.Position - rightHandUserCFrame.Position))).Magnitude < 0.5 then
				self.isWristHeldUp = true
			end
		end
	end
	local GUI = self:GetGUI()
	local var56, _, var57, var58 = t_1.RaycastOntoPanel(self:GetPart(), GUI, GUI, p17)
	
	if var56 then
		self.isOffscreen = false
		self.lookAtPixel = var57
		self.cursorPos = var57
		self:SetLookedAt(var58)
		self.lookAtDistance = (var56 - p16.p).magnitude
		
		if self.isLookedAt and self.lookAtDistance < var13 and self.showCursor then
			var13 = self.lookAtDistance
			var14 = self
			
			if var48 then
				return
			else
				var15 = self.cursorPos
				
				return
			end
		end
	else
		self.isOffscreen = true
		
		if self.lookedAt then
			self.lookedAt = false
			self:OnMouseLeave(self.lookAtPixel.X, self.lookAtPixel.Y)
		end
	end
end

function t_2:EvaluateTransparency()
	-- upvalues: t_1 (ref)
	if self.panelType == t_1.Type.UIManagerManaged then
		self.transparency = 1
		
		return
	elseif self.forceShowUntilLookedAt or not self.canFade or tick() < self.forceShowUntilTick then
		self.transparency = 0
		
		return
	elseif self.isLookedAt then
		self.transparency = 0
		
		return
	elseif self.isOffscreen then
		self.transparency = 1
		
		return
	end
	self.transparency = self:CalculateTransparency()
end

function t_2:Update(p18, p19, p20, p21, p22, p23)
	-- upvalues: var11 (write)
	if (self.forceShowUntilLookedAt or tick() < self.forceShowUntilTick) and not self.part then
		self:GetPart()
		self:GetGUI()
	end
	if not self.part then return end
	local var62 = var11 == self
	
	if not var62 and self.linkedTo and self.linkedTo == var11 then
		var62 = true
	end
	if var11 and not var62 then
		self:SetEnabled(false)
		
		return
	end
	self:PreUpdate(p18, p19, p20, p21, p23)
	
	if self.isVisible then
		self:EvaluatePositioning(p18, p19, p20, p23)
		
		for i, v in pairs(self.subpanels) do
			v:Update()
		end
		self:EvaluateGaze(p18, p19, p20, p21, p22)
		self:EvaluateTransparency(p18, p19)
		
		return
	elseif self.alwaysUpdatePosition then
		self:EvaluatePositioning(p18, p19, p20, p23)
	end
end

function t_2.PreUpdate(_, _, _, _, _, _) end

function t_2.OnUpdate(_, _) end

function t_2.OnMouseEnter(_, _, _) end

function t_2.OnMouseLeave(_, _, _) end

function t_2.OnEnabled(_, _) end

function t_2.OnModalChanged(_, _) end

function t_2.OnVisibilityChanged(_, _) end

function t_2:CalculateTransparency()
	if not self.canFade then
		return 0
	end
	local x = self.gui.AbsoluteSize.X
	local y = self.gui.AbsoluteSize.Y
	local x_1 = self.lookAtPixel.X
	local y_1 = self.lookAtPixel.Y
	local var63 = if x_1 < 0 then -x_1 else x_1 - x
	local var64 = if y_1 < 0 then -y_1 else y_1 - y
	
	if x_1 > 0 and x_1 < x then
		var63 = 0
	end
	if y_1 > 0 and y_1 < y then
		var64 = 0
	end
	return math.max(0, math.min(1, (math.sqrt(var63 ^ 2 + var64 ^ 2) - 10) / 20))
end

function t_2:ResizeStuds(p24, p25, p26)
	-- upvalues: t_1 (ref)
	if self.panelType == t_1.Type.UIManagerManaged then return end
	p26 = p26 or 64
	self.width = p24
	self.height = p25
	self.pixelScale = p26 / 64
	local part = self:GetPart()
	part.Size = Vector3.new(self.width * workspace.CurrentCamera.HeadScale, self.height * workspace.CurrentCamera.HeadScale, 0.2)
	local GUI = self:GetGUI()
	GUI.CanvasSize = Vector2.new(p26 * self.width, p26 * self.height)
	
	for i, v in pairs(self.subpanels) do
		if v.part then
			v.part.Size = part.Size
		end
		if v.gui then
			v.gui.CanvasSize = GUI.CanvasSize
		end
	end
end

function t_2:ResizePixels(p27, p28, p29)
	p29 = p29 or 64
	self:ResizeStuds(p27 / p29, p28 / p29, p29)
end

function t_2:OnHeadScaleChanged()
	self:ResizeStuds(self.width, self.height, self.pixelScale * 64)
end

function t_2:SetType(p30, p31)
	-- upvalues: t_1 (ref)
	self.panelType = p30
	self.localCF = CFrame.new()
	self.angleFromHorizon = false
	self.angleFromForward = false
	self.distance = 0
	
	if not p31 then
		p31 = {}
	end
	if p30 == t_1.Type.None then return end
	if p30 == t_1.Type.Standard then
		self.localCF = p31.CFrame or CFrame.new()
		
		return
	elseif p30 == t_1.Type.Fixed then
		self.localCF = p31.CFrame or CFrame.new()
		
		return
	elseif p30 == t_1.Type.HorizontalFollow then
		self.angleFromHorizon = CFrame.Angles(p31.angleFromHorizon or 0, 0, 0)
		self.angleFromForward = CFrame.Angles(0, p31.angleFromForward or 0, 0)
		self.distance = p31.distance or 5
		
		return
	elseif p30 == t_1.Type.FixedToHead then
		self.localCF = p31.CFrame or CFrame.new()
		
		return
	elseif p30 == t_1.Type.NewStandard then
		self.localCF = p31.CFrame or CFrame.new()
		
		return
	elseif p30 == t_1.Type.WristView then
		self.localCF = p31.CFrame or CFrame.new()
		self.distance = 0
		
		return
	elseif p30 == t_1.Type.PositionLocked then
		self.localCF = p31.CFrame or CFrame.new()
		
		return
	elseif p30 == t_1.Type.UIManagerManaged then
		self.part = p31.uiManagerPanelPart
		
		return
	end
	error("Invalid Panel type")
end

function t_2:IsUIManagerManagedType()
	-- upvalues: t_1 (ref)
	return self.panelType == t_1.Type.UIManagerManaged
end

function t_2:IsPositionLockedType()
	-- upvalues: t_1 (ref)
	return self.panelType == t_1.Type.PositionLocked
end

function t_2:SetVisible(p32, p33)
	-- upvalues: t_1 (ref), VRService (ref), cFrame_1 (ref), var11 (write), var12 (write)
	if p32 ~= self.isVisible then
		self:OnVisibilityChanged(p32)
		
		if p32 then
			self.needsPositionUpdate = true
			
			if self.panelType == t_1.Type.WristView then
				self.originCF = VRService:GetUserCFrame(Enum.UserCFrame.Head) * cFrame_1
			end
		else
			t_1.OnPanelClosed:Fire(self.name)
		end
	end
	self.isVisible = p32
	self:SetEnabled(p32)
	
	if p32 and p33 then
		t_1.SetModalPanel(self)
	end
	if not p32 and var11 == self then
		if p33 then
			t_1.SetModalPanel(var12)
		else
			t_1.SetModalPanel(nil)
			
			if var12 == self then
				var12 = nil
			end
		end
	end
	if not p32 and self.forceShowUntilLookedAt then
		self.forceShowUntilLookedAt = false
	end
end

function t_2:IsVisible()
	return self.isVisible
end

function t_2:LinkTo(p34)
	-- upvalues: t_1 (ref)
	if type(p34) == "string" then
		self.linkedTo = t_1.Get(p34)
		
		return
	end
	self.linkedTo = p34
end

function t_2:ForceShowUntilLookedAt(p35)
	self:GetPart()
	self:GetGUI()
	self:SetVisible(true, p35)
	self:RequestPositionUpdate()
	self.forceShowUntilLookedAt = true
end

function t_2:ForceShowForSeconds(p36)
	self:GetPart()
	self:GetGUI()
	self:SetVisible(true)
	
	if self.forceShowUntilTick < tick() then
		self:RequestPositionUpdate()
	end
	self.forceShowUntilTick = tick() + p36
end

function t_2:SetCanFade(p37)
	self.canFade = p37
end

function t_2:RequestPositionUpdate()
	self.needsPositionUpdate = true
end

function t_2:ForcePositionUpdate(p38)
	self.alwaysUpdatePosition = p38
end

function t_2:GetGuiPositionInPanelSpace(p39)
	local absoluteSize = self.gui.AbsoluteSize
	local var67 = (p39 - absoluteSize / 2) / absoluteSize * Vector2.new(self.part.Size.X, self.part.Size.Y)
	
	return Vector3.new(var67.X, var67.Y, 0.1)
end

function t_2:GetCFrameInCameraSpace()
	-- upvalues: t_1 (ref)
	return if self.panelType == t_1.Type.Standard or self.panelType == t_1.Type.NewStandard then self.originCF * self.localCF else self.localCF or CFrame.new()
end

local t_3 = {}
t_3.__index = t_3

function t_3.new(p40, p41)
	-- upvalues: t_3 (ref)
	local t = {
		parentPanel = p40,
		guiElement = p41,
		lastParent = p41.Parent,
		ancestryConn = nil,
		changedConn = nil,
		lookAtPixel = Vector2.new(-1, -1),
		cursorPos = Vector2.new(-1, -1),
		lookedAt = false,
		isEnabled = true,
		part = nil,
		gui = nil,
		guiSurrogate = nil,
		depthOffset = 0
	}
	setmetatable(t, t_3)
	t:GetGUI()
	t:UpdateSurrogate()
	t:WatchParent(t.lastParent)
	p41.Parent = t.guiSurrogate
	
	local function ancestryCallback(_, p42)
		-- upvalues: t (ref), p41 (ref), ancestryCallback (ref)
		t:GetGUI().Enabled = t.parentPanel:GetGUI():IsAncestorOf(t.lastParent)
		
		if t:GetGUI().Enabled then
			t:GetPart().Parent = workspace.CurrentCamera
		else
			t:GetPart().Parent = nil
		end
		if p42 == p41 then
			t.ancestryConn:disconnect()
			t.lastParent = p41.Parent
			p41.Parent = t.guiSurrogate
			t:WatchParent(t.lastParent)
			t.ancestryConn = p41.AncestryChanged:connect(ancestryCallback)
		end
	end
	
	t.ancestryConn = p41.AncestryChanged:connect(ancestryCallback)
	
	return t
end

function t_3:Cleanup()
	self.guiElement.Parent = self.lastParent
	
	if self.part then
		self.part:Destroy()
		self.part = nil
	end
	spawn(function()
		-- upvalues: self (ref)
		wait()
		
		if self.gui then
			self.gui:Destroy()
			self.gui = nil
		end
	end)
	
	if self.ancestryConn then
		self.ancestryConn:disconnect()
		self.ancestryConn = nil
	end
	if self.changedConn then
		self.changedConn:disconnect()
		self.changedConn = nil
	end
	self.lastParent = nil
	self.parentPanel = nil
	self.guiElement = nil
	self.guiSurrogate = nil
end

function t_3.OnMouseEnter(_, _, _) end

function t_3.OnMouseLeave(_, _, _) end

function t_3:SetLookedAt(p43)
	if p43 and not self.lookedAt then
		self:OnMouseEnter(self.lookAtPixel.X, self.lookAtPixel.Y)
	elseif not p43 and self.lookedAt then
		self:OnMouseLeave(self.lookAtPixel.X, self.lookAtPixel.Y)
	end
	self.lookedAt = p43
end

function t_3:WatchParent(p44)
	if self.changedConn then
		self.changedConn:disconnect()
	end
	self.changedConn = p44.Changed:connect(function(p45)
		-- upvalues: self (ref)
		if p45 == "AbsolutePosition" or p45 == "AbsoluteSize" or p45 == "Parent" then
			self:UpdateSurrogate()
		end
	end)
end

function t_3:UpdateSurrogate()
	local lastParent = self.lastParent
	self.guiSurrogate.Position = UDim2.new(0, lastParent.AbsolutePosition.X, 0, lastParent.AbsolutePosition.Y)
	self.guiSurrogate.Size = UDim2.new(0, lastParent.AbsoluteSize.X, 0, lastParent.AbsoluteSize.Y)
end

function t_3:GetPart()
	-- upvalues: var18 (ref)
	if self.part then
		return self.part
	end
	self.part = self.parentPanel:GetPart():Clone()
	self.part.Parent = var18
	
	return self.part
end

function t_3:GetGUI()
	-- upvalues: create (ref), coreGuiService (ref)
	if self.gui then
		return self.gui
	end
	self.gui = create("SurfaceGui")({
		Active = true,
		ToolPunchThroughDistance = 1000,
		AlwaysOnTop = true,
		Parent = coreGuiService,
		Adornee = self:GetPart(),
		CanvasSize = self.parentPanel:GetGUI().CanvasSize,
		Enabled = self.parentPanel.isEnabled
	})
	self.guiSurrogate = create("Frame")({
		Active = false,
		BackgroundTransparency = 1,
		Parent = self.gui,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0)
	})
	
	return self.gui
end

function t_3:SetDepthOffset(p46)
	self.depthOffset = p46
end

function t_3:Update()
	local part = self:GetPart()
	local part_1 = self.parentPanel:GetPart()
	
	if part and part_1 then
		part.CFrame = part_1.CFrame * CFrame.new(0, 0, -self.depthOffset)
	end
end

function t_3:SetEnabled(p47)
	-- upvalues: var18 (ref)
	self.isEnabled = p47
	
	if p47 and self.parentPanel.isEnabled then
		self:GetPart().Parent = var18
		self:GetGUI().Enabled = true
		
		return
	end
	self:GetPart().Parent = nil
	self:GetGUI().Enabled = false
end

function t_3:GetEnabled()
	return self.isEnabled
end

function t_3:GetPixelScale()
	return self.parentPanel:GetPixelScale()
end

function t_2:GetPixelScale()
	return self.pixelScale
end

function t_2:AddSubpanel(p48)
	-- upvalues: t_3 (ref)
	local var72 = t_3.new(self, p48)
	self.subpanels[p48] = var72
	
	return var72
end

function t_2:RemoveSubpanel(p49)
	local var73 = self.subpanels[p49]
	
	if var73 then
		var73:Cleanup()
	end
	self.subpanels[p49] = nil
end

function t_2:SetSubpanelDepth(p50, p51)
	local var74 = self.subpanels[p50]
	
	if p51 ~= 0 then
		var74 = var74 or self:AddSubpanel(p50)
		var74:SetDepthOffset(p51)
		
		return var74
	elseif var74 then
		self:RemoveSubpanel(p50)
	end
	return nil
end

function t_1.Get(p52)
	-- upvalues: t (ref), t_2 (ref)
	local var75 = t[p52]
	
	if not t[p52] then
		t[p52] = t_2.new(p52)
		var75 = t[p52]
	end
	return var75
end

local currentTime = tick()

local function onRenderStep()
	-- upvalues: VRService (ref), currentTime (write), var14 (write), var13 (write), t (ref), var11 (write), var15 (write), var17 (ref)
	if not VRService.VREnabled then return end
	local currentTime_1 = tick()
	local var77 = currentTime_1 - currentTime
	currentTime = currentTime_1
	var14 = nil
	var13 = 1e999
	local currentCamera = workspace.CurrentCamera
	local cFrame = currentCamera.CFrame
	local renderCFrame = currentCamera:GetRenderCFrame()
	local headUserCFrame = VRService:GetUserCFrame(Enum.UserCFrame.Head)
	local ray = Ray.new(renderCFrame.p, renderCFrame.lookVector)
	local var81 = cFrame * VRService:GetUserCFrame(VRService.GuiInputUserCFrame)
	local ray_1 = Ray.new(var81.p, var81.lookVector)
	
	for i, v in pairs(t) do
		v:Update(cFrame, renderCFrame, headUserCFrame, ray, ray_1, var77)
	end
	local t_1 = {}
	
	for i_1, v_1 in pairs(t) do
		if not t_1[v_1] and v_1.linkedTo and (v_1.isVisible and v_1.linkedTo.isVisible) then
			t_1[v_1] = true
			t_1[v_1.linkedTo] = true
			local minValue = math.min(v_1.transparency, v_1.linkedTo.transparency)
			v_1.transparency = minValue
			v_1.linkedTo.transparency = minValue
		end
	end
	for i_2, v_2 in pairs(t) do
		if not v_2.part or not v_2.gui then
			v_2:OnUpdate(var77)
			continue
		end
		local var84 = var11 == v_2
		
		if not var84 and v_2.linkedTo and v_2.linkedTo == var11 then
			var84 = true
		end
		local var85 = if not (var84 or not var11) then false else v_2.isVisible
		
		if v_2.transparency >= 1 then
			var85 = false
		end
		if v_2.forceShowUntilLookedAt then
			var85 = true
		end
		if not v_2.canFade and v_2.isVisible then
			var85 = true
		end
		v_2:SetEnabled(var85)
	end
	var17.Parent = nil
end

local var25 = true

local function _(p53)
	-- upvalues: var18 (ref), var19 (ref)
	var18.Parent = p53
	var19.Parent = p53
end

local var26 = nil

local function onHeadScaleChanged()
	-- upvalues: t (ref)
	for i, v in pairs(t) do
		v:OnHeadScaleChanged()
	end
end

local var28 = nil

local function onCameraCFrameChanged()
	-- upvalues: VRService (ref), t (ref)
	local currentCamera = workspace.CurrentCamera
	local cFrame = currentCamera.CFrame
	local renderCFrame = currentCamera:GetRenderCFrame()
	local headUserCFrame = VRService:GetUserCFrame(Enum.UserCFrame.Head)
	local ray = Ray.new(renderCFrame.p, renderCFrame.lookVector)
	local var91 = cFrame * VRService:GetUserCFrame(VRService.GuiInputUserCFrame)
	local ray_1 = Ray.new(var91.p, var91.lookVector)
	
	for i, v in pairs(t) do
		v:Update(cFrame, renderCFrame, headUserCFrame, ray, ray_1, 0)
	end
end

local function onCurrentCameraChanged()
	-- upvalues: t (ref), var26 (write), onHeadScaleChanged (ref), var28 (write), onCameraCFrameChanged (ref), VRService (ref), var25 (write), var18 (ref), var19 (ref)
	for i, v in pairs(t) do
		v:OnHeadScaleChanged()
	end
	if var26 then
		var26:disconnect()
	end
	var26 = workspace.CurrentCamera:GetPropertyChangedSignal("HeadScale"):Connect(onHeadScaleChanged)
	
	if var28 then
		var28:disconnect()
	end
	var28 = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(onCameraCFrameChanged)
	
	if VRService.VREnabled and var25 then
		local currentCamera = workspace.CurrentCamera
		var18.Parent = currentCamera
		var19.Parent = currentCamera
	end
end

local var31 = nil
local var32 = false

local function onVREnabledChanged()
	-- upvalues: VRService (ref), var25 (write), onCurrentCameraChanged (ref), var31 (write), var18 (ref), var19 (ref), var32 (write), runService (ref), text (ref), onRenderStep (ref)
	if VRService.VREnabled then
		while not var25 do
			wait()
		end
		if workspace.CurrentCamera then
			onCurrentCameraChanged()
		end
		var31 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(onCurrentCameraChanged)
		local currentCamera = workspace.CurrentCamera
		var18.Parent = currentCamera
		var19.Parent = currentCamera
		
		if var32 then
			return
		else
			runService:BindToRenderStep(text, Enum.RenderPriority.Last.Value, onRenderStep)
			var32 = true
			
			return
		end
	elseif var31 then
		var31:disconnect()
		var31 = nil
	end
	var18.Parent = nil
	var19.Parent = nil
	
	if var32 then
		runService:UnbindFromRenderStep(text)
		var32 = false
	end
end

VRService:GetPropertyChangedSignal("VREnabled"):connect(onVREnabledChanged)
spawn(onVREnabledChanged)
coroutine.wrap(function()
	-- upvalues: var25 (write)
	while true do
		if not workspace.CurrentCamera then
			wait()
			continue
		end
		if workspace.CurrentCamera.CameraSubject ~= nil or workspace.CurrentCamera.CameraType == Enum.CameraType.Scriptable then break end
		workspace.CurrentCamera.Changed:Wait()
	end
	var25 = true
end)()

return t_1