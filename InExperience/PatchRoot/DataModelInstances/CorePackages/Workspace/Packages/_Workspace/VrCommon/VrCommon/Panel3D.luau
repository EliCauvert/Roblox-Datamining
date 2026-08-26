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
local var1 = CFrame.new(0, 0, -0.1) * CFrame.Angles(0, 3.14159265359, 0)
local var2 = nil
local var3 = nil
local var4 = 1e999
local var5 = nil
local var6 = vector2
local t = {}
local var7 = create("ImageLabel")({
	Image = "rbxasset://textures/Cursors/Gamepad/Pointer.png",
	BackgroundTransparency = 1,
	ZIndex = 1000000000,
	ImageColor3 = Color3.new(0, 1, 0)
})
local var8 = create("Folder")({ Name = "VRCorePanelParts", Archivable = false })
local var9 = create("Folder")({ Name = "VRCoreEffectParts", Archivable = false })
pcall(function()
	-- upvalues: guiService (ref), var8 (ref), var9 (ref)
	guiService.CoreGuiFolder = var8
	guiService.CoreEffectFolder = var9
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
	GetHeadLookXZ = function(p1)
		-- upvalues: VRService (ref)
		local headUserCFrame = VRService:GetUserCFrame(Enum.UserCFrame.Head)
		local lookVector = headUserCFrame.lookVector
		local cframe = CFrame.Angles(0, math.atan2(-lookVector.Z, lookVector.X) - 1.570796326795, 0)
		
		if p1 then
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
		-- upvalues: var2 (write), var3 (write)
		if var2 == value then return end
		if var2 then
			var2:OnModalChanged(false)
		end
		if value then
			value:OnModalChanged(true)
		end
		var3 = var2
		var2 = value
	end,
	RaycastOntoPanel = function(p2, p3, p4, p5)
		-- upvalues: VRUtilModule (ref)
		local size = p2.Size
		local z = size.Z
		local x = size.X
		local y = size.Y
		local renderCFrame = p2:GetRenderCFrame()
		local lookVector = renderCFrame.lookVector
		local var10 = VRUtilModule.RayPlaneIntersection(p5, lookVector, renderCFrame.p + lookVector * z * 0.5)
		
		if not var10 then
			return nil, nil, nil, false
		end
		local var11 = renderCFrame:pointToObjectSpace(var10) * Vector3.new(-1, 1, 1) + Vector3.new(x / 2, -y / 2, 0)
		local vector2 = Vector2.new(var11.X / x * p3.AbsoluteSize.X, var11.Y / y * -p3.AbsoluteSize.Y)
		local x_1 = vector2.X
		local y_1 = vector2.Y
		local x_2 = p4.AbsolutePosition.X
		local y_2 = p4.AbsolutePosition.Y
		
		return var10, var11, vector2, if p3.Enabled and x_2 <= x_1 and (x_1 <= x_2 + p4.AbsoluteSize.X and y_2 <= y_1) and y_1 <= y_2 + p4.AbsoluteSize.Y then true else false
	end
}
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_1 (ref), t (ref), t_2 (ref)
	local t_3 = {
		name = p2,
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
	
	if t[p2] then
		error("A panel by the name of " .. p6 .. " already exists.")
	end
	t[p2] = t_3
	
	return setmetatable(t_3, t_2)
end

function t_2:GetPart()
	-- upvalues: create (ref), var8 (ref)
	if not self.part then
		self.part = create("Part")({
			Transparency = 1,
			CanCollide = false,
			CanTouch = false,
			Anchored = true,
			Size = Vector3.new(1, 1, 0.20000000298),
			Name = self.name,
			Parent = var8
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

function t_2:FindHoveredGuiElement(p2)
	local x = self.lookAtPixel.X
	local y = self.lookAtPixel.Y
	
	for i, v in pairs(p2) do
		local absolutePosition = v.AbsolutePosition
		local var10 = v.AbsolutePosition + v.AbsoluteSize
		
		if absolutePosition.X <= x and x <= var10.X and (absolutePosition.Y <= y and y <= var10.Y) then
			return v, i
		end
	end
end

function t_2:SetPartCFrame(p3)
	-- upvalues: var1 (ref)
	self:GetPart().CFrame = p3 * var1
end

function t_2:SetEnabled(p3)
	-- upvalues: var8 (ref)
	if self.isEnabled == p3 then return end
	self.isEnabled = p3
	
	if p3 then
		self:GetPart().Parent = var8
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
	self:OnEnabled(p3)
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

function t_2:EvaluatePositioning(p4, p5, p6, p7)
	-- upvalues: t_1 (ref), cFrame (ref), VRService (ref), cFrame_1 (ref), VRUtilModule (ref)
	if self.panelType == t_1.Type.UIManagerManaged then return end
	if self.panelType == t_1.Type.Fixed then
		self:SetPartCFrame(p4 * (self.localCF - self.localCF.p + self.localCF.p * workspace.CurrentCamera.HeadScale))
	elseif self.panelType == t_1.Type.HorizontalFollow then
		self:SetPartCFrame(p4 * (CFrame.new(p6.p, p6.p + p6.lookVector * Vector3.new(1, 0, 1)) * self.angleFromForward * self.angleFromHorizon * CFrame.new(0, 0, workspace.CurrentCamera.HeadScale * -self.distance)))
	elseif self.panelType == t_1.Type.FixedToHead then
		self:SetPartCFrame(p5 * (self.localCF - self.localCF.p + self.localCF.p * workspace.CurrentCamera.HeadScale))
	elseif self.panelType == t_1.Type.Standard then
		if self.needsPositionUpdate or self.alwaysUpdatePosition then
			self.needsPositionUpdate = false
			self.originCF = t_1.GetHeadLookXZ(true) * CFrame.new(cFrame.Position * workspace.CurrentCamera.HeadScale)
		end
		self:SetPartCFrame(p4 * self.originCF * self.localCF)
	elseif self.panelType == t_1.Type.NewStandard then
		if self.needsPositionUpdate or self.alwaysUpdatePosition then
			self.needsPositionUpdate = false
			self.originCF = VRService:GetUserCFrame(Enum.UserCFrame.Head) * CFrame.new(cFrame_1.Position * workspace.CurrentCamera.HeadScale)
		end
		self:SetPartCFrame(p4 * self.originCF * self.localCF)
	elseif self.panelType == t_1.Type.WristView then
		if VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
			if self.needsPositionUpdate or self.alwaysUpdatePosition then
				self.needsPositionUpdate = false
				self.originCF = CFrame.new(VRService:GetUserCFrame(Enum.UserCFrame.LeftHand).Position * workspace.CurrentCamera.HeadScale)
			end
			local var11 = p4 * VRService:GetUserCFrame(Enum.UserCFrame.Head)
			local position = (p4 * self.originCF).Position
			
			if self.distance > 0 then
				local vector3 = Vector3.new(position.x, var11.Position.y - 0.33, position.z)
				position = var11.Position + (vector3 - var11.Position).Unit * math.clamp((vector3 - var11.Position).Magnitude, self.distance - 0.5, self.distance + 0.5)
			end
			self:GetPart().CFrame = CFrame.new(position, Vector3.new(var11.Position.x, position.y, var11.Position.z))
		else
			self:SetPartCFrame(p4 * (self.localCF - self.localCF.p + self.localCF.p * workspace.CurrentCamera.HeadScale))
		end
	elseif self.panelType == t_1.Type.PositionLocked then
		local userCFrameWorldSpace = VRUtilModule.GetUserCFrameWorldSpace(Enum.UserCFrame.Head)
		
		if not self.LastFollowCF then
			self.LastFollowCF = userCFrameWorldSpace
		end
		if (self.LastCameraPos - p4.Position).Magnitude > 0.1 then
			self.LastFollowCF = userCFrameWorldSpace
		end
		self.LastCameraPos = p4.Position
		
		if self.LastFollowCF.LookVector:Dot(userCFrameWorldSpace.LookVector) < 0.85 then
			self.FollowView = true
		elseif self.LastFollowCF.LookVector:Dot(userCFrameWorldSpace.LookVector) > 0.99 then
			self.FollowView = false
		end
		if self.FollowView then
			self.LastFollowCF = self.LastFollowCF:Lerp(userCFrameWorldSpace, 0.1)
		end
		local var12 = userCFrameWorldSpace.Position + self.LastFollowCF.LookVector * (self.distance * workspace.CurrentCamera.HeadScale + 0.1)
		var12 = Vector3.new(var12.X, userCFrameWorldSpace.Position.Y - 0.5 * workspace.CurrentCamera.HeadScale, var12.Z)
		self:GetPart().CFrame = CFrame.new(var12, Vector3.new(userCFrameWorldSpace.Position.x, var12.y, userCFrameWorldSpace.Position.z))
	end
	if self.lerpInitialCF and self.lerpTime > 0 then
		local cFrame_2 = self:GetPart().CFrame
		self.lerpTime -= p7 * 4
		local clampedValue = math.clamp(1 - self.lerpTime, 0, 1)
		self:GetPart().CFrame = self.lerpInitialCF:Lerp(cFrame_2, clampedValue)
		
		if self.lerpScaleSize.x > 0 or self.lerpScaleSize.y > 0 then
			local lerpScaleSize = self.lerpInitialSize:Lerp(self.lerpScaleSize, clampedValue)
			self:ResizeStuds(lerpScaleSize.x, lerpScaleSize.y, self.pixelsPerStud)
		end
	end
end

function t_2:SetLookedAt(p4)
	if not self.isLookedAt and p4 then
		self.isLookedAt = true
		self:OnMouseEnter(self.lookAtPixel.X, self.lookAtPixel.Y)
		
		if self.forceShowUntilLookedAt then
			self.forceShowUntilLookedAt = false
			
			return
		end
	elseif self.isLookedAt and not p4 then
		self.isLookedAt = false
		self:OnMouseLeave(self.lookAtPixel.X, self.lookAtPixel.Y)
	end
end

function t_2:EvaluateGaze(p4, p5, _, _, p6)
	-- upvalues: vector2 (ref), t_1 (ref), var6 (write), var5 (write), VRService (ref), var4 (write)
	self.isClosest = false
	self.lookAtPixel = vector2
	self.lookAtDistance = 1e999
	local var11 = nil
	local var12 = 0
	
	for i, v in pairs(self.subpanels) do
		if v.part and v.guiElement then
			local var13, _, var14, var15 = t_1.RaycastOntoPanel(v.part, v.gui, v.guiElement, p6)
			
			if var13 then
				v.lookAtPixel = var14
				v.cursorPos = var14
				
				if var15 and var12 < v.depthOffset then
					var11 = v
					var12 = v.depthOffset
				end
			end
		end
	end
	if var11 and var11.depthOffset > 0 then
		var6 = var11.cursorPos
		var5 = var11
		
		for i_1, v_1 in pairs(self.subpanels) do
			if v_1 ~= var11 then
				v_1:SetLookedAt(false)
			end
		end
		var11:SetLookedAt(true)
	end
	if self.panelType == t_1.Type.WristView then
		self.isWristHeldUp = false
		local leftHandUserCFrame = VRService:GetUserCFrame(Enum.UserCFrame.LeftHand)
		local var16 = p4 * CFrame.new(leftHandUserCFrame.Position * workspace.CurrentCamera.HeadScale)
		
		if self.distance == 0 then
			local var17 = p4 * VRService:GetUserCFrame(Enum.UserCFrame.Head)
			local position = var16.Position
			local vector3 = Vector3.new(position.x, var17.Position.y - 0.33, position.z)
			self.isWristHeldUp = (var17.Position + (vector3 - var17.Position).Unit * math.clamp((vector3 - var17.Position).Magnitude, 0.5, 1) - var16.Position).Magnitude < 0.25
		else
			local rightHandUserCFrame = VRService:GetUserCFrame(Enum.UserCFrame.RightHand)
			
			if (leftHandUserCFrame.Position - (rightHandUserCFrame.Position + rightHandUserCFrame.LookVector * rightHandUserCFrame.LookVector:Dot(leftHandUserCFrame.Position - rightHandUserCFrame.Position))).Magnitude < 0.5 then
				self.isWristHeldUp = true
			end
		end
	end
	local GUI = self:GetGUI()
	local var18, _, var19, var20 = t_1.RaycastOntoPanel(self:GetPart(), GUI, GUI, p6)
	
	if var18 then
		self.isOffscreen = false
		self.lookAtPixel = var19
		self.cursorPos = var19
		self:SetLookedAt(var20)
		self.lookAtDistance = (var18 - p5.p).magnitude
		
		if self.isLookedAt and self.lookAtDistance < var4 and self.showCursor then
			var4 = self.lookAtDistance
			var5 = self
			
			if var11 then
				return
			else
				var6 = self.cursorPos
				
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

function t_2:Update(p7, p8, p9, p10, p11, p12)
	-- upvalues: var2 (write)
	if (self.forceShowUntilLookedAt or tick() < self.forceShowUntilTick) and not self.part then
		self:GetPart()
		self:GetGUI()
	end
	if not self.part then return end
	local var21 = var2 == self
	
	if not var21 and self.linkedTo and self.linkedTo == var2 then
		var21 = true
	end
	if var2 and not var21 then
		self:SetEnabled(false)
		
		return
	end
	self:PreUpdate(p7, p8, p9, p10, p12)
	
	if self.isVisible then
		self:EvaluatePositioning(p7, p8, p9, p12)
		
		for i, v in pairs(self.subpanels) do
			v:Update()
		end
		self:EvaluateGaze(p7, p8, p9, p10, p11)
		self:EvaluateTransparency(p7, p8)
		
		return
	elseif self.alwaysUpdatePosition then
		self:EvaluatePositioning(p7, p8, p9, p12)
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
	local var22 = if x_1 < 0 then -x_1 else x_1 - x
	local var23 = if y_1 < 0 then -y_1 else y_1 - y
	
	if x_1 > 0 and x_1 < x then
		var22 = 0
	end
	if y_1 > 0 and y_1 < y then
		var23 = 0
	end
	return math.max(0, math.min(1, (math.sqrt(var22 ^ 2 + var23 ^ 2) - 10) / 20))
end

function t_2:ResizeStuds(p13, p14, p15)
	-- upvalues: t_1 (ref)
	if self.panelType == t_1.Type.UIManagerManaged then return end
	p15 = p15 or 64
	self.width = p13
	self.height = p14
	self.pixelScale = p15 / 64
	local part = self:GetPart()
	part.Size = Vector3.new(self.width * workspace.CurrentCamera.HeadScale, self.height * workspace.CurrentCamera.HeadScale, 0.2)
	local GUI = self:GetGUI()
	GUI.CanvasSize = Vector2.new(p15 * self.width, p15 * self.height)
	
	for i, v in pairs(self.subpanels) do
		if v.part then
			v.part.Size = part.Size
		end
		if v.gui then
			v.gui.CanvasSize = GUI.CanvasSize
		end
	end
end

function t_2:ResizePixels(p16, p17, p18)
	p18 = p18 or 64
	self:ResizeStuds(p16 / p18, p17 / p18, p18)
end

function t_2:OnHeadScaleChanged()
	self:ResizeStuds(self.width, self.height, self.pixelScale * 64)
end

function t_2:SetType(p16, p17)
	-- upvalues: t_1 (ref)
	self.panelType = p16
	self.localCF = CFrame.new()
	self.angleFromHorizon = false
	self.angleFromForward = false
	self.distance = 0
	
	if not p17 then
		p17 = {}
	end
	if p16 == t_1.Type.None then return end
	if p16 == t_1.Type.Standard then
		self.localCF = p17.CFrame or CFrame.new()
		
		return
	elseif p16 == t_1.Type.Fixed then
		self.localCF = p17.CFrame or CFrame.new()
		
		return
	elseif p16 == t_1.Type.HorizontalFollow then
		self.angleFromHorizon = CFrame.Angles(p17.angleFromHorizon or 0, 0, 0)
		self.angleFromForward = CFrame.Angles(0, p17.angleFromForward or 0, 0)
		self.distance = p17.distance or 5
		
		return
	elseif p16 == t_1.Type.FixedToHead then
		self.localCF = p17.CFrame or CFrame.new()
		
		return
	elseif p16 == t_1.Type.NewStandard then
		self.localCF = p17.CFrame or CFrame.new()
		
		return
	elseif p16 == t_1.Type.WristView then
		self.localCF = p17.CFrame or CFrame.new()
		self.distance = 0
		
		return
	elseif p16 == t_1.Type.PositionLocked then
		self.localCF = p17.CFrame or CFrame.new()
		
		return
	elseif p16 == t_1.Type.UIManagerManaged then
		self.part = p17.uiManagerPanelPart
		
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

function t_2:SetVisible(p16, p17)
	-- upvalues: t_1 (ref), VRService (ref), cFrame_1 (ref), var2 (write), var3 (write)
	if p16 ~= self.isVisible then
		self:OnVisibilityChanged(p16)
		
		if p16 then
			self.needsPositionUpdate = true
			
			if self.panelType == t_1.Type.WristView then
				self.originCF = VRService:GetUserCFrame(Enum.UserCFrame.Head) * cFrame_1
			end
		else
			t_1.OnPanelClosed:Fire(self.name)
		end
	end
	self.isVisible = p16
	self:SetEnabled(p16)
	
	if p16 and p17 then
		t_1.SetModalPanel(self)
	end
	if not p16 and var2 == self then
		if p17 then
			t_1.SetModalPanel(var3)
		else
			t_1.SetModalPanel(nil)
			
			if var3 == self then
				var3 = nil
			end
		end
	end
	if not p16 and self.forceShowUntilLookedAt then
		self.forceShowUntilLookedAt = false
	end
end

function t_2:IsVisible()
	return self.isVisible
end

function t_2:LinkTo(p16)
	-- upvalues: t_1 (ref)
	if type(p16) == "string" then
		self.linkedTo = t_1.Get(p16)
		
		return
	end
	self.linkedTo = p16
end

function t_2:ForceShowUntilLookedAt(p16)
	self:GetPart()
	self:GetGUI()
	self:SetVisible(true, p16)
	self:RequestPositionUpdate()
	self.forceShowUntilLookedAt = true
end

function t_2:ForceShowForSeconds(p16)
	self:GetPart()
	self:GetGUI()
	self:SetVisible(true)
	
	if self.forceShowUntilTick < tick() then
		self:RequestPositionUpdate()
	end
	self.forceShowUntilTick = tick() + p16
end

function t_2:SetCanFade(p16)
	self.canFade = p16
end

function t_2:RequestPositionUpdate()
	self.needsPositionUpdate = true
end

function t_2:ForcePositionUpdate(p16)
	self.alwaysUpdatePosition = p16
end

function t_2:GetGuiPositionInPanelSpace(p16)
	local absoluteSize = self.gui.AbsoluteSize
	local var22 = (p16 - absoluteSize / 2) / absoluteSize * Vector2.new(self.part.Size.X, self.part.Size.Y)
	
	return Vector3.new(var22.X, var22.Y, 0.1)
end

function t_2:GetCFrameInCameraSpace()
	-- upvalues: t_1 (ref)
	return if self.panelType == t_1.Type.Standard or self.panelType == t_1.Type.NewStandard then self.originCF * self.localCF else self.localCF or CFrame.new()
end

local t_3 = {}
t_3.__index = t_3

function t_3.new(p16, p17)
	-- upvalues: t_3 (ref)
	local t = {
		parentPanel = p16,
		guiElement = p17,
		lastParent = p17.Parent,
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
	p17.Parent = t.guiSurrogate
	
	local function ancestryCallback(_, p18)
		-- upvalues: t (ref), p17 (ref), ancestryCallback (ref)
		t:GetGUI().Enabled = t.parentPanel:GetGUI():IsAncestorOf(t.lastParent)
		
		if t:GetGUI().Enabled then
			t:GetPart().Parent = workspace.CurrentCamera
		else
			t:GetPart().Parent = nil
		end
		if p18 == p17 then
			t.ancestryConn:disconnect()
			t.lastParent = p17.Parent
			p17.Parent = t.guiSurrogate
			t:WatchParent(t.lastParent)
			t.ancestryConn = p17.AncestryChanged:connect(ancestryCallback)
		end
	end
	
	t.ancestryConn = p17.AncestryChanged:connect(ancestryCallback)
	
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

function t_3:SetLookedAt(p16)
	if p16 and not self.lookedAt then
		self:OnMouseEnter(self.lookAtPixel.X, self.lookAtPixel.Y)
	elseif not p16 and self.lookedAt then
		self:OnMouseLeave(self.lookAtPixel.X, self.lookAtPixel.Y)
	end
	self.lookedAt = p16
end

function t_3:WatchParent(p16)
	if self.changedConn then
		self.changedConn:disconnect()
	end
	self.changedConn = p16.Changed:connect(function(p17)
		-- upvalues: self (ref)
		if p17 == "AbsolutePosition" or p17 == "AbsoluteSize" or p17 == "Parent" then
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
	-- upvalues: var8 (ref)
	if self.part then
		return self.part
	end
	self.part = self.parentPanel:GetPart():Clone()
	self.part.Parent = var8
	
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

function t_3:SetDepthOffset(p16)
	self.depthOffset = p16
end

function t_3:Update()
	local part = self:GetPart()
	local part_1 = self.parentPanel:GetPart()
	
	if part and part_1 then
		part.CFrame = part_1.CFrame * CFrame.new(0, 0, -self.depthOffset)
	end
end

function t_3:SetEnabled(p16)
	-- upvalues: var8 (ref)
	self.isEnabled = p16
	
	if p16 and self.parentPanel.isEnabled then
		self:GetPart().Parent = var8
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

function t_2:AddSubpanel(p16)
	-- upvalues: t_3 (ref)
	local var22 = t_3.new(self, p16)
	self.subpanels[p16] = var22
	
	return var22
end

function t_2:RemoveSubpanel(p16)
	local var22 = self.subpanels[p16]
	
	if var22 then
		var22:Cleanup()
	end
	self.subpanels[p16] = nil
end

function t_2:SetSubpanelDepth(p16, p17)
	local var22 = self.subpanels[p16]
	
	if p17 ~= 0 then
		var22 = var22 or self:AddSubpanel(p16)
		var22:SetDepthOffset(p17)
		
		return var22
	elseif var22 then
		self:RemoveSubpanel(p16)
	end
	return nil
end

function t_1.Get(p16)
	-- upvalues: t (ref), t_2 (ref)
	local var22 = t[p16]
	
	if not t[p16] then
		t[p16] = t_2.new(p16)
		var22 = t[p16]
	end
	return var22
end

local currentTime = tick()

local function onRenderStep()
	-- upvalues: VRService (ref), currentTime (write), var5 (write), var4 (write), t (ref), var2 (write), var6 (write), var7 (ref)
	if not VRService.VREnabled then return end
	local currentTime_1 = tick()
	local var22 = currentTime_1 - currentTime
	currentTime = currentTime_1
	var5 = nil
	var4 = 1e999
	local currentCamera = workspace.CurrentCamera
	local cFrame = currentCamera.CFrame
	local renderCFrame = currentCamera:GetRenderCFrame()
	local headUserCFrame = VRService:GetUserCFrame(Enum.UserCFrame.Head)
	local ray = Ray.new(renderCFrame.p, renderCFrame.lookVector)
	local var23 = cFrame * VRService:GetUserCFrame(VRService.GuiInputUserCFrame)
	local ray_1 = Ray.new(var23.p, var23.lookVector)
	
	for i, v in pairs(t) do
		v:Update(cFrame, renderCFrame, headUserCFrame, ray, ray_1, var22)
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
			v_2:OnUpdate(var22)
			continue
		end
		local var24 = var2 == v_2
		
		if not var24 and v_2.linkedTo and v_2.linkedTo == var2 then
			var24 = true
		end
		local var25 = if not (var24 or not var2) then false else v_2.isVisible
		
		if v_2.transparency >= 1 then
			var25 = false
		end
		if v_2.forceShowUntilLookedAt then
			var25 = true
		end
		if not v_2.canFade and v_2.isVisible then
			var25 = true
		end
		v_2:SetEnabled(var25)
	end
	var7.Parent = nil
end

local var26 = true

local function _(p16)
	-- upvalues: var8 (ref), var9 (ref)
	var8.Parent = p16
	var9.Parent = p16
end

local var27 = nil

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
	local var29 = cFrame * VRService:GetUserCFrame(VRService.GuiInputUserCFrame)
	local ray_1 = Ray.new(var29.p, var29.lookVector)
	
	for i, v in pairs(t) do
		v:Update(cFrame, renderCFrame, headUserCFrame, ray, ray_1, 0)
	end
end

local function onCurrentCameraChanged()
	-- upvalues: t (ref), var27 (write), onHeadScaleChanged (ref), var28 (write), onCameraCFrameChanged (ref), VRService (ref), var26 (write), var8 (ref), var9 (ref)
	for i, v in pairs(t) do
		v:OnHeadScaleChanged()
	end
	if var27 then
		var27:disconnect()
	end
	var27 = workspace.CurrentCamera:GetPropertyChangedSignal("HeadScale"):Connect(onHeadScaleChanged)
	
	if var28 then
		var28:disconnect()
	end
	var28 = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(onCameraCFrameChanged)
	
	if VRService.VREnabled and var26 then
		local currentCamera = workspace.CurrentCamera
		var8.Parent = currentCamera
		var9.Parent = currentCamera
	end
end

local var30 = nil
local var31 = false

local function onVREnabledChanged()
	-- upvalues: VRService (ref), var26 (write), onCurrentCameraChanged (ref), var30 (write), var8 (ref), var9 (ref), var31 (write), runService (ref), text (ref), onRenderStep (ref)
	if VRService.VREnabled then
		while not var26 do
			wait()
		end
		if workspace.CurrentCamera then
			onCurrentCameraChanged()
		end
		var30 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(onCurrentCameraChanged)
		local currentCamera = workspace.CurrentCamera
		var8.Parent = currentCamera
		var9.Parent = currentCamera
		
		if var31 then
			return
		else
			runService:BindToRenderStep(text, Enum.RenderPriority.Last.Value, onRenderStep)
			var31 = true
			
			return
		end
	elseif var30 then
		var30:disconnect()
		var30 = nil
	end
	var8.Parent = nil
	var9.Parent = nil
	
	if var31 then
		runService:UnbindFromRenderStep(text)
		var31 = false
	end
end

VRService:GetPropertyChangedSignal("VREnabled"):connect(onVREnabledChanged)
spawn(onVREnabledChanged)
coroutine.wrap(function()
	-- upvalues: var26 (write)
	while true do
		if not workspace.CurrentCamera then
			wait()
			continue
		end
		if workspace.CurrentCamera.CameraSubject ~= nil or workspace.CurrentCamera.CameraType == Enum.CameraType.Scriptable then break end
		workspace.CurrentCamera.Changed:Wait()
	end
	var26 = true
end)()

return t_1