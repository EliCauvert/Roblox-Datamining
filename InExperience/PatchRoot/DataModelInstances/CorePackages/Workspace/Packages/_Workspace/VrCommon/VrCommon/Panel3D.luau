local VrCommon = script:FindFirstAncestor("VrCommon")
local VRService = game:GetService("VRService")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local CoreGui = game:GetService("CoreGui")
local VRUtilModule = require(VrCommon.VRUtil)
local CreateFunction = require(VrCommon.Parent.AppCommonLib).Create
local Text = "Panel3DRenderStep-" .. game:GetService("HttpService"):GenerateGUID()
local _Vector2 = Vector2.new(0, 0)
local _CFrame = CFrame.new(0, -0.5, -5.5)
local _CFrame1 = CFrame.new(0, 0, -3)
local v1 = CFrame.new(0, 0, -0.1) * CFrame.Angles(0, 3.141592653589793, 0)
local ModalPanel = nil
local ModalPanel1 = nil
local LookAtDistance = 1e999
local v2 = nil
local CursorPos: Vector2 = _Vector2
local NewResults = {}
local Frame = CreateFunction("ImageLabel")({
	Image = "rbxasset://textures/Cursors/Gamepad/Pointer.png",
	BackgroundTransparency = 1,
	ZIndex = 1000000000,
	ImageColor3 = Color3.new(0, 1, 0)
})
local Parent = CreateFunction("Folder")({ Name = "VRCorePanelParts", Archivable = false })
local CoreEffectFolder = CreateFunction("Folder")({ Name = "VRCoreEffectParts", Archivable = false })
pcall(function()
	-- upvalues: GuiService (copy), Parent (copy), CoreEffectFolder (copy)
	GuiService.CoreGuiFolder = Parent
	GuiService.CoreEffectFolder = CoreEffectFolder
end)
local Panel3DModule = {
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
	OnPanelClosed = CreateFunction("BindableEvent")({ Name = "OnPanelClosed" }),
	GetHeadLookXZ = function(p1): CFrame
		-- upvalues: VRService (copy)
		local UserCFrame = VRService:GetUserCFrame(Enum.UserCFrame.Head)
		local LookVector = UserCFrame.lookVector
		local _CFrame = CFrame.Angles(0, math.atan2(-LookVector.Z, LookVector.X) - 1.5707963267948966, 0)
		
		if p1 then
			_CFrame += UserCFrame.p
		end
		return _CFrame
	end,
	FindContainerOf = function(Descendant)
		-- upvalues: NewResults (copy)
		for _, newResult in pairs(NewResults) do
			if newResult.gui and newResult.gui:IsAncestorOf(Descendant) then
				return newResult
			end
			for _, subpanel in pairs(newResult.subpanels) do
				if subpanel.gui and subpanel.gui:IsAncestorOf(Descendant) then
					return newResult
				end
			end
		end
		return nil
	end,
	SetModalPanel = function(ModalPanel2)
		-- upvalues: ModalPanel (ref), ModalPanel1 (ref)
		if ModalPanel == ModalPanel2 then return end
		if ModalPanel then
			ModalPanel:OnModalChanged(false)
		end
		if ModalPanel2 then
			ModalPanel2:OnModalChanged(true)
		end
		ModalPanel1 = ModalPanel
		ModalPanel = ModalPanel2
	end,
	RaycastOntoPanel = function(Part, Frame: Frame, Frame1: Frame, p1)
		-- upvalues: VRUtilModule (copy)
		local Size = Part.Size
		local X: number = Size.X
		local Y = Size.Y
		local RenderCFrame = Part:GetRenderCFrame()
		local LookVector = RenderCFrame.lookVector
		local RayPlaneIntersectionResult = VRUtilModule.RayPlaneIntersection(p1, LookVector, RenderCFrame.p + LookVector * Size.Z * 0.5)
		
		if RayPlaneIntersectionResult then
			local NewVector = RenderCFrame:pointToObjectSpace(RayPlaneIntersectionResult) * vector.create(-1, 1, 1) + Vector3.new(X / 2, -Y / 2, 0)
			local _Vector2 = Vector2.new(NewVector.X / X * Frame.AbsoluteSize.X, NewVector.Y / Y * -Frame.AbsoluteSize.Y)
			local X1 = _Vector2.X
			local Y1 = _Vector2.Y
			local X11 = Frame1.AbsolutePosition.X
			local Y11 = Frame1.AbsolutePosition.Y
			local X2 = Frame1.AbsoluteSize.X
			local Y2 = Frame1.AbsoluteSize.Y
			
			return RayPlaneIntersectionResult, NewVector, _Vector2, Frame.Enabled and X11 <= X1 and X1 <= X11 + X2 and Y11 <= Y1 and Y1 <= Y11 + Y2 or false
		else
			return nil, nil, nil, false
		end
	end
}
local Module = {}
Module.__index = Module

function Module.new(Name)
	-- upvalues: Panel3DModule (copy), NewResults (copy), Module (copy)
	local config = {
		name = Name,
		part = false,
		gui = false,
		width = 1,
		height = 1,
		isVisible = false,
		isEnabled = false,
		panelType = Panel3DModule.Type.None,
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
		LastCameraPos = vector.create(0, 0, 0),
		wristTargetPosition = Vector3.new()
	}
	
	if NewResults[Name] then
		error("A panel by the name of " .. Name .. " already exists.")
	end
	NewResults[Name] = config
	
	return (setmetatable(config, Module))
end

function Module:GetPart()
	-- upvalues: CreateFunction (copy), Parent (copy)
	if not self.part then
		self.part = CreateFunction("Part")({
			Transparency = 1,
			CanCollide = false,
			CanTouch = false,
			Anchored = true,
			Size = vector.create(1, 1, 0.20000000298023224),
			Name = self.name,
			Parent = Parent
		})
	end
	return self.part
end

function Module:GetGUI()
	-- upvalues: CreateFunction (copy), CoreGui (copy)
	if not self.gui then
		self.gui = CreateFunction("SurfaceGui")({
			Archivable = false,
			Active = true,
			ToolPunchThroughDistance = 1000,
			AlwaysOnTop = true,
			Parent = CoreGui,
			Name = self.name,
			Adornee = self:GetPart(),
			CanvasSize = self.CanvasSize or Vector2.new(1000, 1000),
			Enabled = self.isEnabled
		})
	end
	return self.gui
end

function Module:FindHoveredGuiElement(Frames)
	local X = self.lookAtPixel.X
	local Y = self.lookAtPixel.Y
	
	for i, frame in pairs(Frames) do
		local AbsolutePosition = frame.AbsolutePosition
		local NewAbsolutePosition = frame.AbsolutePosition + frame.AbsoluteSize
		
		if AbsolutePosition.X <= X and X <= NewAbsolutePosition.X and AbsolutePosition.Y <= Y and Y <= NewAbsolutePosition.Y then
			return frame, i
		end
	end
end

function Module:SetPartCFrame(ScaledLocalCF)
	-- upvalues: v1 (copy)
	self:GetPart().CFrame = ScaledLocalCF * v1
end

function Module:SetEnabled(IsEnabled)
	-- upvalues: Parent (copy)
	if self.isEnabled == IsEnabled then return end
	self.isEnabled = IsEnabled
	
	if IsEnabled then
		self:GetPart().Parent = Parent
		self:GetGUI().Enabled = true
		
		for _, subpanel in pairs(self.subpanels) do
			subpanel:SetEnabled(subpanel:GetEnabled())
		end
	else
		self:GetPart().Parent = nil
		self:GetGUI().Enabled = false
		
		for _, subpanel1 in pairs(self.subpanels) do
			subpanel1:SetEnabled(subpanel1:GetEnabled())
		end
	end
	self:OnEnabled(IsEnabled)
end

function Module:StartLerp(p1)
	-- upvalues: Panel3DModule (copy)
	if self.panelType ~= Panel3DModule.Type.UIManagerManaged then
		self.lerpInitialCF = self:GetPart().CFrame * CFrame.new(0, -1.5, 0)
		self.lerpTime = 1
		self.lerpInitialSize = Vector2.new(self.width, self.height)
		self.lerpScaleSize = p1 and p1 or Vector2.new(0, 0)
		
		return
	end
end

function Module:EvaluatePositioning(p1, p2, p3, p4: number)
	-- upvalues: Panel3DModule (copy), _CFrame (copy), VRService (copy), _CFrame1 (copy), VRUtilModule (copy)
	if self.panelType == Panel3DModule.Type.UIManagerManaged then return end
	if self.panelType == Panel3DModule.Type.Fixed then
		self:SetPartCFrame(p1 * (self.localCF - self.localCF.p + self.localCF.p * workspace.CurrentCamera.HeadScale))
	elseif self.panelType == Panel3DModule.Type.HorizontalFollow then
		self:SetPartCFrame(p1 * (CFrame.new(p3.p, p3.p + p3.lookVector * vector.create(1, 0, 1)) * self.angleFromForward * self.angleFromHorizon * CFrame.new(0, 0, workspace.CurrentCamera.HeadScale * -self.distance)))
	elseif self.panelType == Panel3DModule.Type.FixedToHead then
		self:SetPartCFrame(p2 * (self.localCF - self.localCF.p + self.localCF.p * workspace.CurrentCamera.HeadScale))
	elseif self.panelType == Panel3DModule.Type.Standard then
		if self.needsPositionUpdate or self.alwaysUpdatePosition then
			self.needsPositionUpdate = false
			self.originCF = Panel3DModule.GetHeadLookXZ(true) * CFrame.new(_CFrame.Position * workspace.CurrentCamera.HeadScale)
		end
		self:SetPartCFrame(p1 * self.originCF * self.localCF)
	elseif self.panelType == Panel3DModule.Type.NewStandard then
		if self.needsPositionUpdate or self.alwaysUpdatePosition then
			self.needsPositionUpdate = false
			self.originCF = VRService:GetUserCFrame(Enum.UserCFrame.Head) * CFrame.new(_CFrame1.Position * workspace.CurrentCamera.HeadScale)
		end
		self:SetPartCFrame(p1 * self.originCF * self.localCF)
	elseif self.panelType == Panel3DModule.Type.WristView then
		if VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
			if self.needsPositionUpdate or self.alwaysUpdatePosition then
				self.needsPositionUpdate = false
				self.originCF = CFrame.new(VRService:GetUserCFrame(Enum.UserCFrame.LeftHand).Position * workspace.CurrentCamera.HeadScale)
			end
			local ScaledUserCFrame = p1 * VRService:GetUserCFrame(Enum.UserCFrame.Head)
			local Position = (p1 * self.originCF).Position
			
			if self.distance > 0 then
				local _Vector3 = Vector3.new(Position.x, ScaledUserCFrame.Position.y - 0.33, Position.z)
				Position = ScaledUserCFrame.Position + (_Vector3 - ScaledUserCFrame.Position).Unit * math.clamp((_Vector3 - ScaledUserCFrame.Position).Magnitude, self.distance - 0.5, self.distance + 0.5)
			end
			self:GetPart().CFrame = CFrame.new(Position, (Vector3.new(ScaledUserCFrame.Position.x, Position.y, ScaledUserCFrame.Position.z)))
		else
			self:SetPartCFrame(p1 * (self.localCF - self.localCF.p + self.localCF.p * workspace.CurrentCamera.HeadScale))
		end
	elseif self.panelType == Panel3DModule.Type.PositionLocked then
		local UserCFrameWorldSpace = VRUtilModule.GetUserCFrameWorldSpace(Enum.UserCFrame.Head)
		
		if not self.LastFollowCF then
			self.LastFollowCF = UserCFrameWorldSpace
		end
		if (self.LastCameraPos - p1.Position).Magnitude > 0.1 then
			self.LastFollowCF = UserCFrameWorldSpace
		end
		self.LastCameraPos = p1.Position
		
		if self.LastFollowCF.LookVector:Dot(UserCFrameWorldSpace.LookVector) < 0.85 then
			self.FollowView = true
		elseif self.LastFollowCF.LookVector:Dot(UserCFrameWorldSpace.LookVector) > 0.99 then
			self.FollowView = false
		end
		if self.FollowView then
			self.LastFollowCF = self.LastFollowCF:Lerp(UserCFrameWorldSpace, 0.1)
		end
		local NewPosition = UserCFrameWorldSpace.Position + self.LastFollowCF.LookVector * (self.distance * workspace.CurrentCamera.HeadScale + 0.1)
		local _Vector3 = Vector3.new(NewPosition.X, UserCFrameWorldSpace.Position.Y - 0.5 * workspace.CurrentCamera.HeadScale, NewPosition.Z)
		self:GetPart().CFrame = CFrame.new(_Vector3, (Vector3.new(UserCFrameWorldSpace.Position.x, _Vector3.y, UserCFrameWorldSpace.Position.z)))
	end
	if self.lerpInitialCF and self.lerpTime > 0 then
		local _CFrame2 = self:GetPart().CFrame
		self.lerpTime -= p4 * 4
		local ClampedValue = math.clamp(1 - self.lerpTime, 0, 1)
		self:GetPart().CFrame = self.lerpInitialCF:Lerp(_CFrame2, ClampedValue)
		
		if self.lerpScaleSize.x > 0 or self.lerpScaleSize.y > 0 then
			local Interpolated = self.lerpInitialSize:Lerp(self.lerpScaleSize, ClampedValue)
			self:ResizeStuds(Interpolated.x, Interpolated.y, self.pixelsPerStud)
		end
	end
end

function Module:SetLookedAt(p1)
	if not self.isLookedAt and p1 then
		self.isLookedAt = true
		self:OnMouseEnter(self.lookAtPixel.X, self.lookAtPixel.Y)
		
		if self.forceShowUntilLookedAt then
			self.forceShowUntilLookedAt = false
			
			return
		end
	elseif self.isLookedAt and not p1 then
		self.isLookedAt = false
		self:OnMouseLeave(self.lookAtPixel.X, self.lookAtPixel.Y)
	end
end

function Module:EvaluateGaze(p1, p2, _, _, p3)
	-- upvalues: _Vector2 (copy), Panel3DModule (copy), CursorPos (ref), v2 (ref), VRService (copy), LookAtDistance (ref)
	self.isClosest = false
	self.lookAtPixel = _Vector2
	self.lookAtDistance = 1e999
	local v3 = nil
	local DepthOffset = 0
	
	for _, subpanel in pairs(self.subpanels) do
		if subpanel.part and subpanel.guiElement then
			local RaycastOntoPanelResult, _, RaycastOntoPanelResult3, RaycastOntoPanelResult4 = Panel3DModule.RaycastOntoPanel(subpanel.part, subpanel.gui, subpanel.guiElement, p3)
			
			if RaycastOntoPanelResult then
				subpanel.lookAtPixel = RaycastOntoPanelResult3
				subpanel.cursorPos = RaycastOntoPanelResult3
				
				if RaycastOntoPanelResult4 and DepthOffset < subpanel.depthOffset then
					v3 = subpanel
					DepthOffset = subpanel.depthOffset
				end
			end
		end
	end
	if v3 and v3.depthOffset > 0 then
		CursorPos = v3.cursorPos
		v2 = v3
		
		for _, subpanel1 in pairs(self.subpanels) do
			if subpanel1 ~= v3 then
				subpanel1:SetLookedAt(false)
			end
		end
		v3:SetLookedAt(true)
	end
	if self.panelType == Panel3DModule.Type.WristView then
		self.isWristHeldUp = false
		local UserCFrame = VRService:GetUserCFrame(Enum.UserCFrame.LeftHand)
		local v4 = p1 * CFrame.new(UserCFrame.Position * workspace.CurrentCamera.HeadScale)
		
		if self.distance == 0 then
			local ScaledUserCFrame = p1 * VRService:GetUserCFrame(Enum.UserCFrame.Head)
			local Position = v4.Position
			local _Vector3 = Vector3.new(Position.x, ScaledUserCFrame.Position.y - 0.33, Position.z)
			self.isWristHeldUp = (ScaledUserCFrame.Position + (_Vector3 - ScaledUserCFrame.Position).Unit * math.clamp((_Vector3 - ScaledUserCFrame.Position).Magnitude, 0.5, 1) - v4.Position).Magnitude < 0.25
		else
			local UserCFrame1 = VRService:GetUserCFrame(Enum.UserCFrame.RightHand)
			
			if (UserCFrame.Position - (UserCFrame1.Position + UserCFrame1.LookVector * UserCFrame1.LookVector:Dot(UserCFrame.Position - UserCFrame1.Position))).Magnitude < 0.5 then
				self.isWristHeldUp = true
			end
		end
	end
	local GUI = self:GetGUI()
	local RaycastOntoPanelResult1, _, RaycastOntoPanelResult3_1, RaycastOntoPanelResult4_1 = Panel3DModule.RaycastOntoPanel(self:GetPart(), GUI, GUI, p3)
	
	if RaycastOntoPanelResult1 then
		self.isOffscreen = false
		self.lookAtPixel = RaycastOntoPanelResult3_1
		self.cursorPos = RaycastOntoPanelResult3_1
		self:SetLookedAt(RaycastOntoPanelResult4_1)
		self.lookAtDistance = (RaycastOntoPanelResult1 - p2.p).magnitude
		
		if self.isLookedAt and self.lookAtDistance < LookAtDistance and self.showCursor then
			LookAtDistance = self.lookAtDistance
			v2 = self
			
			if not v3 then
				CursorPos = self.cursorPos
				
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

function Module:EvaluateTransparency()
	-- upvalues: Panel3DModule (copy)
	if self.panelType == Panel3DModule.Type.UIManagerManaged then
		self.transparency = 1
		
		return
	end
	if self.forceShowUntilLookedAt or not self.canFade or tick() < self.forceShowUntilTick then
		self.transparency = 0
		
		return
	end
	if self.isLookedAt then
		self.transparency = 0
		
		return
	end
	if self.isOffscreen then
		self.transparency = 1
		
		return
	else
		self.transparency = self:CalculateTransparency()
	end
end

function Module:Update(p4, p5, p6, p7, p8, p9)
	-- upvalues: ModalPanel (ref)
	if (self.forceShowUntilLookedAt or tick() < self.forceShowUntilTick) and not self.part then
		self:GetPart()
		self:GetGUI()
	end
	if not self.part then return end
	local IsModalPanelMatch = ModalPanel == self
	
	if not IsModalPanelMatch and self.linkedTo and self.linkedTo == ModalPanel then
		IsModalPanelMatch = true
	end
	if ModalPanel and not IsModalPanelMatch then
		self:SetEnabled(false)
		
		return
	end
	self:PreUpdate(p4, p5, p6, p7, p9)
	
	if self.isVisible then
		self:EvaluatePositioning(p4, p5, p6, p9)
		
		for _, subpanel in pairs(self.subpanels) do
			subpanel:Update()
		end
		self:EvaluateGaze(p4, p5, p6, p7, p8)
		self:EvaluateTransparency(p4, p5)
		
		return
	elseif self.alwaysUpdatePosition then
		self:EvaluatePositioning(p4, p5, p6, p9)
	end
end

function Module:PreUpdate(_, _, _, _, _) end

function Module:OnUpdate(_) end

function Module:OnMouseEnter(_, _) end

function Module:OnMouseLeave(_, _) end

function Module:OnEnabled(_) end

function Module:OnModalChanged(_) end

function Module:OnVisibilityChanged(_) end

function Module:CalculateTransparency(): number
	if not self.canFade then
		return 0
	end
	local X: number = self.gui.AbsoluteSize.X
	local Y: number = self.gui.AbsoluteSize.Y
	local X1: number = self.lookAtPixel.X
	local Y1: number = self.lookAtPixel.Y
	local Negated = X1 < 0 and -X1 or X1 - X
	local Negated1 = Y1 < 0 and -Y1 or Y1 - Y
	
	if X1 > 0 and X1 < X then
		Negated = 0
	end
	if Y1 > 0 and Y1 < Y then
		Negated1 = 0
	end
	return (math.max(0, (math.min(1, (math.sqrt(Negated ^ 2 + Negated1 ^ 2) - 10) / 20))))
end

function Module:ResizeStuds(Width, Height, PixelsPerStud)
	-- upvalues: Panel3DModule (copy)
	if self.panelType == Panel3DModule.Type.UIManagerManaged then return end
	local PixelsPerStud1 = PixelsPerStud or 64
	self.width = Width
	self.height = Height
	self.pixelScale = PixelsPerStud1 / 64
	local Part = self:GetPart()
	Part.Size = Vector3.new(self.width * workspace.CurrentCamera.HeadScale, self.height * workspace.CurrentCamera.HeadScale, 0.2)
	local GUI = self:GetGUI()
	GUI.CanvasSize = Vector2.new(PixelsPerStud1 * self.width, PixelsPerStud1 * self.height)
	
	for _, subpanel in pairs(self.subpanels) do
		if subpanel.part then
			subpanel.part.Size = Part.Size
		end
		if subpanel.gui then
			subpanel.gui.CanvasSize = GUI.CanvasSize
		end
	end
end

function Module:ResizePixels(p10, p11, p12)
	local P67 = p12 or 64
	self:ResizeStuds(p10 / P67, p11 / P67, P67)
end

function Module:OnHeadScaleChanged()
	self:ResizeStuds(self.width, self.height, self.pixelScale * 64)
end

function Module:SetType(PanelType, p10)
	-- upvalues: Panel3DModule (copy)
	self.panelType = PanelType
	self.localCF = CFrame.new()
	self.angleFromHorizon = false
	self.angleFromForward = false
	self.distance = 0
	
	if not p10 then
		p10 = {}
	end
	if PanelType == Panel3DModule.Type.None then return end
	if PanelType == Panel3DModule.Type.Standard then
		self.localCF = p10.CFrame or CFrame.new()
		
		return
	end
	if PanelType == Panel3DModule.Type.Fixed then
		self.localCF = p10.CFrame or CFrame.new()
		
		return
	end
	if PanelType == Panel3DModule.Type.HorizontalFollow then
		self.angleFromHorizon = CFrame.Angles(p10.angleFromHorizon or 0, 0, 0)
		self.angleFromForward = CFrame.Angles(0, p10.angleFromForward or 0, 0)
		self.distance = p10.distance or 5
		
		return
	end
	if PanelType == Panel3DModule.Type.FixedToHead then
		self.localCF = p10.CFrame or CFrame.new()
		
		return
	end
	if PanelType == Panel3DModule.Type.NewStandard then
		self.localCF = p10.CFrame or CFrame.new()
		
		return
	end
	if PanelType == Panel3DModule.Type.WristView then
		self.localCF = p10.CFrame or CFrame.new()
		self.distance = 0
		
		return
	end
	if PanelType == Panel3DModule.Type.PositionLocked then
		self.localCF = p10.CFrame or CFrame.new()
		
		return
	end
	if PanelType == Panel3DModule.Type.UIManagerManaged then
		self.part = p10.uiManagerPanelPart
		
		return
	else
		error("Invalid Panel type")
	end
end

function Module:IsUIManagerManagedType(): boolean
	-- upvalues: Panel3DModule (copy)
	return self.panelType == Panel3DModule.Type.UIManagerManaged
end

function Module:IsPositionLockedType(): boolean
	-- upvalues: Panel3DModule (copy)
	return self.panelType == Panel3DModule.Type.PositionLocked
end

function Module:SetVisible(IsVisible, p10)
	-- upvalues: Panel3DModule (copy), VRService (copy), _CFrame1 (copy), ModalPanel (ref), ModalPanel1 (ref)
	if IsVisible ~= self.isVisible then
		self:OnVisibilityChanged(IsVisible)
		
		if IsVisible then
			self.needsPositionUpdate = true
			
			if self.panelType == Panel3DModule.Type.WristView then
				self.originCF = VRService:GetUserCFrame(Enum.UserCFrame.Head) * _CFrame1
			end
		else
			Panel3DModule.OnPanelClosed:Fire(self.name)
		end
	end
	self.isVisible = IsVisible
	self:SetEnabled(IsVisible)
	
	if IsVisible and p10 then
		Panel3DModule.SetModalPanel(self)
	end
	if not IsVisible and ModalPanel == self then
		if p10 then
			Panel3DModule.SetModalPanel(ModalPanel1)
		else
			Panel3DModule.SetModalPanel(nil)
			
			if ModalPanel1 == self then
				ModalPanel1 = nil
			end
		end
	end
	if not IsVisible and self.forceShowUntilLookedAt then
		self.forceShowUntilLookedAt = false
	end
end

function Module:IsVisible()
	return self.isVisible
end

function Module:LinkTo(LinkedTo)
	-- upvalues: Panel3DModule (copy)
	if type(LinkedTo) == "string" then
		self.linkedTo = Panel3DModule.Get(LinkedTo)
		
		return
	else
		self.linkedTo = LinkedTo
	end
end

function Module:ForceShowUntilLookedAt(p10)
	self:GetPart()
	self:GetGUI()
	self:SetVisible(true, p10)
	self:RequestPositionUpdate()
	self.forceShowUntilLookedAt = true
end

function Module:ForceShowForSeconds(p10)
	self:GetPart()
	self:GetGUI()
	self:SetVisible(true)
	
	if self.forceShowUntilTick < tick() then
		self:RequestPositionUpdate()
	end
	self.forceShowUntilTick = tick() + p10
end

function Module:SetCanFade(CanFade)
	self.canFade = CanFade
end

function Module:RequestPositionUpdate()
	self.needsPositionUpdate = true
end

function Module:ForcePositionUpdate(AlwaysUpdatePosition)
	self.alwaysUpdatePosition = AlwaysUpdatePosition
end

function Module:GetGuiPositionInPanelSpace(p10): Vector3
	local AbsoluteSize: number = self.gui.AbsoluteSize
	local ScaledAbsoluteSize = (p10 - AbsoluteSize / 2) / AbsoluteSize * Vector2.new(self.part.Size.X, self.part.Size.Y)
	
	return (Vector3.new(ScaledAbsoluteSize.X, ScaledAbsoluteSize.Y, 0.1))
end

function Module.GetCFrameInCameraSpace(p10)
	-- upvalues: Panel3DModule (copy)
	return if p10.panelType == Panel3DModule.Type.Standard or p10.panelType == Panel3DModule.Type.NewStandard then p10.originCF * p10.localCF else p10.localCF or CFrame.new()
end

local Module1 = {}
Module1.__index = Module1

function Module1.new(ParentPanel, GuiElement)
	-- upvalues: Module1 (copy)
	local config = {
		parentPanel = ParentPanel,
		guiElement = GuiElement,
		lastParent = GuiElement.Parent,
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
	setmetatable(config, Module1)
	config:GetGUI()
	config:UpdateSurrogate()
	config:WatchParent(config.lastParent)
	GuiElement.Parent = config.guiSurrogate
	
	local function ancestryCallback(_, NewParent)
		-- upvalues: config (copy), GuiElement (copy), ancestryCallback (copy)
		config:GetGUI().Enabled = config.parentPanel:GetGUI():IsAncestorOf(config.lastParent)
		
		if config:GetGUI().Enabled then
			config:GetPart().Parent = workspace.CurrentCamera
		else
			config:GetPart().Parent = nil
		end
		if NewParent == GuiElement then
			config.ancestryConn:disconnect()
			config.lastParent = GuiElement.Parent
			GuiElement.Parent = config.guiSurrogate
			config:WatchParent(config.lastParent)
			config.ancestryConn = GuiElement.AncestryChanged:connect(ancestryCallback)
		end
	end
	
	config.ancestryConn = GuiElement.AncestryChanged:connect(ancestryCallback)
	
	return config
end

function Module1:Cleanup()
	self.guiElement.Parent = self.lastParent
	
	if self.part then
		self.part:Destroy()
		self.part = nil
	end
	spawn(function()
		-- upvalues: self (copy)
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

function Module1:OnMouseEnter(_, _) end

function Module1:OnMouseLeave(_, _) end

function Module1:SetLookedAt(LookedAt)
	if LookedAt and not self.lookedAt then
		self:OnMouseEnter(self.lookAtPixel.X, self.lookAtPixel.Y)
	elseif not LookedAt and self.lookedAt then
		self:OnMouseLeave(self.lookAtPixel.X, self.lookAtPixel.Y)
	end
	self.lookedAt = LookedAt
end

function Module1:WatchParent(LastParent)
	if self.changedConn then
		self.changedConn:disconnect()
	end
	self.changedConn = LastParent.Changed:connect(function(p10)
		-- upvalues: self (copy)
		if p10 == "AbsolutePosition" or p10 == "AbsoluteSize" or p10 == "Parent" then
			self:UpdateSurrogate()
		end
	end)
end

function Module1:UpdateSurrogate()
	local LastParent = self.lastParent
	self.guiSurrogate.Position = UDim2.new(0, LastParent.AbsolutePosition.X, 0, LastParent.AbsolutePosition.Y)
	self.guiSurrogate.Size = UDim2.new(0, LastParent.AbsoluteSize.X, 0, LastParent.AbsoluteSize.Y)
end

function Module1:GetPart()
	-- upvalues: Parent (copy)
	if self.part then
		return self.part
	else
		self.part = self.parentPanel:GetPart():Clone()
		self.part.Parent = Parent
		
		return self.part
	end
end

function Module1:GetGUI()
	-- upvalues: CreateFunction (copy), CoreGui (copy)
	if self.gui then
		return self.gui
	else
		self.gui = CreateFunction("SurfaceGui")({
			Active = true,
			ToolPunchThroughDistance = 1000,
			AlwaysOnTop = true,
			Parent = CoreGui,
			Adornee = self:GetPart(),
			CanvasSize = self.parentPanel:GetGUI().CanvasSize,
			Enabled = self.parentPanel.isEnabled
		})
		self.guiSurrogate = CreateFunction("Frame")({
			Active = false,
			BackgroundTransparency = 1,
			Parent = self.gui,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0)
		})
		
		return self.gui
	end
end

function Module1:SetDepthOffset(DepthOffset)
	self.depthOffset = DepthOffset
end

function Module1:Update()
	local Part = self:GetPart()
	local Part1 = self.parentPanel:GetPart()
	
	if Part and Part1 then
		Part.CFrame = Part1.CFrame * CFrame.new(0, 0, -self.depthOffset)
	end
end

function Module1:SetEnabled(IsEnabled)
	-- upvalues: Parent (copy)
	self.isEnabled = IsEnabled
	
	if IsEnabled and self.parentPanel.isEnabled then
		self:GetPart().Parent = Parent
		self:GetGUI().Enabled = true
		
		return
	else
		self:GetPart().Parent = nil
		self:GetGUI().Enabled = false
	end
end

function Module1:GetEnabled()
	return self.isEnabled
end

function Module1:GetPixelScale()
	return self.parentPanel:GetPixelScale()
end

function Module:GetPixelScale()
	return self.pixelScale
end

function Module:AddSubpanel(GuiElement)
	-- upvalues: Module1 (copy)
	local NewModule = Module1.new(self, GuiElement)
	self.subpanels[GuiElement] = NewModule
	
	return NewModule
end

function Module:RemoveSubpanel(p10)
	local Subpanel = self.subpanels[p10]
	
	if Subpanel then
		Subpanel:Cleanup()
	end
	self.subpanels[p10] = nil
end

function Module:SetSubpanelDepth(p10, DepthOffset)
	local Subpanel = self.subpanels[p10]
	
	if DepthOffset == 0 then
		if Subpanel then
			self:RemoveSubpanel(p10)
		end
		return nil
	else
		if not Subpanel then
			Subpanel = self:AddSubpanel(p10)
		end
		Subpanel:SetDepthOffset(DepthOffset)
		
		return Subpanel
	end
end

function Panel3DModule.Get(LinkedTo)
	-- upvalues: NewResults (copy), Module (copy)
	local NewResult = NewResults[LinkedTo]
	
	if not NewResults[LinkedTo] then
		NewResults[LinkedTo] = Module.new(LinkedTo)
		NewResult = NewResults[LinkedTo]
	end
	return NewResult
end

local CurrentTime = tick()

local function onRenderStep()
	-- upvalues: VRService (copy), CurrentTime (ref), v2 (ref), LookAtDistance (ref), NewResults (copy), ModalPanel (ref), CursorPos (ref), Frame (copy)
	if not VRService.VREnabled then return end
	local CurrentTime1 = tick()
	local CurrentTimeDelta = CurrentTime1 - CurrentTime
	CurrentTime = CurrentTime1
	v2 = nil
	LookAtDistance = 1e999
	local CurrentCamera = workspace.CurrentCamera
	local CurrentCameraCFrame = CurrentCamera.CFrame
	local RenderCFrame = CurrentCamera:GetRenderCFrame()
	local UserCFrame = VRService:GetUserCFrame(Enum.UserCFrame.Head)
	local _Ray = Ray.new(RenderCFrame.p, RenderCFrame.lookVector)
	local ScaledCurrentCameraCFrame = CurrentCameraCFrame * VRService:GetUserCFrame(VRService.GuiInputUserCFrame)
	local _Ray1 = Ray.new(ScaledCurrentCameraCFrame.p, ScaledCurrentCameraCFrame.lookVector)
	
	for _, newResult in pairs(NewResults) do
		newResult:Update(CurrentCameraCFrame, RenderCFrame, UserCFrame, _Ray, _Ray1, CurrentTimeDelta)
	end
	local t = {}
	
	for _, newResult1 in pairs(NewResults) do
		if not t[newResult1] and newResult1.linkedTo and newResult1.isVisible and newResult1.linkedTo.isVisible then
			t[newResult1] = true
			t[newResult1.linkedTo] = true
			local Smallest = math.min(newResult1.transparency, newResult1.linkedTo.transparency)
			newResult1.transparency = Smallest
			newResult1.linkedTo.transparency = Smallest
		end
	end
	for _, newResult2 in pairs(NewResults) do
		if newResult2.part and newResult2.gui then
			local IsModalPanelMatch = ModalPanel == newResult2
			
			if not IsModalPanelMatch and newResult2.linkedTo and newResult2.linkedTo == ModalPanel then
				IsModalPanelMatch = true
			end
			newResult2:SetEnabled(if IsModalPanelMatch or not ModalPanel then if newResult2.transparency >= 1 then if newResult2.forceShowUntilLookedAt then not newResult2.canFade and newResult2.isVisible or true else not newResult2.canFade and newResult2.isVisible elseif newResult2.forceShowUntilLookedAt then not newResult2.canFade and newResult2.isVisible or true else not newResult2.canFade and newResult2.isVisible or newResult2.isVisible elseif newResult2.transparency >= 1 then if newResult2.forceShowUntilLookedAt then not newResult2.canFade and newResult2.isVisible or true else not newResult2.canFade and newResult2.isVisible elseif newResult2.forceShowUntilLookedAt then not newResult2.canFade and newResult2.isVisible or true else not newResult2.canFade and newResult2.isVisible)
		end
		newResult2:OnUpdate(CurrentTimeDelta)
	end
	if v2 then
		local X = CursorPos.X
		local Y = CursorPos.Y
		local PixelScale: number = v2:GetPixelScale()
		Frame.Size = UDim2.new(0, 3 * PixelScale, 0, 3 * PixelScale)
		Frame.Position = UDim2.new(0, X - Frame.AbsoluteSize.x * 0.5, 0, Y - Frame.AbsoluteSize.y * 0.5)
		
		return
	else
		Frame.Parent = nil
	end
end

local Flag = true

local function _(Parent1)
	-- upvalues: Parent (copy), CoreEffectFolder (copy)
	Parent.Parent = Parent1
	CoreEffectFolder.Parent = Parent1
end

local Connection = nil

local function onHeadScaleChanged()
	-- upvalues: NewResults (copy)
	for _, newResult in pairs(NewResults) do
		newResult:OnHeadScaleChanged()
	end
end

local Connection1 = nil

local function onCameraCFrameChanged()
	-- upvalues: VRService (copy), NewResults (copy)
	local CurrentCamera = workspace.CurrentCamera
	local CurrentCameraCFrame = CurrentCamera.CFrame
	local RenderCFrame = CurrentCamera:GetRenderCFrame()
	local UserCFrame = VRService:GetUserCFrame(Enum.UserCFrame.Head)
	local _Ray = Ray.new(RenderCFrame.p, RenderCFrame.lookVector)
	local ScaledCurrentCameraCFrame = CurrentCameraCFrame * VRService:GetUserCFrame(VRService.GuiInputUserCFrame)
	local _Ray1 = Ray.new(ScaledCurrentCameraCFrame.p, ScaledCurrentCameraCFrame.lookVector)
	
	for _, newResult in pairs(NewResults) do
		newResult:Update(CurrentCameraCFrame, RenderCFrame, UserCFrame, _Ray, _Ray1, 0)
	end
end

local function onCurrentCameraChanged()
	-- upvalues: NewResults (copy), Connection (ref), onHeadScaleChanged (copy), Connection1 (ref), onCameraCFrameChanged (copy), VRService (copy), Flag (ref), Parent (copy), CoreEffectFolder (copy)
	for _, newResult in pairs(NewResults) do
		newResult:OnHeadScaleChanged()
	end
	if Connection then
		Connection:disconnect()
	end
	Connection = workspace.CurrentCamera:GetPropertyChangedSignal("HeadScale"):Connect(onHeadScaleChanged)
	
	if Connection1 then
		Connection1:disconnect()
	end
	Connection1 = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(onCameraCFrameChanged)
	
	if VRService.VREnabled and Flag then
		local CurrentCamera = workspace.CurrentCamera
		Parent.Parent = CurrentCamera
		CoreEffectFolder.Parent = CurrentCamera
	end
end

local Connection2 = nil
local Flag1 = false

local function onVREnabledChanged()
	-- upvalues: VRService (copy), Flag (ref), onCurrentCameraChanged (copy), Connection2 (ref), Parent (copy), CoreEffectFolder (copy), Flag1 (ref), RunService (copy), Text (copy), onRenderStep (copy)
	if VRService.VREnabled then
		while not Flag do
			wait()
		end
		if workspace.CurrentCamera then
			onCurrentCameraChanged()
		end
		Connection2 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(onCurrentCameraChanged)
		local CurrentCamera = workspace.CurrentCamera
		Parent.Parent = CurrentCamera
		CoreEffectFolder.Parent = CurrentCamera
		
		if not Flag1 then
			RunService:BindToRenderStep(Text, Enum.RenderPriority.Last.Value, onRenderStep)
			Flag1 = true
			
			return
		end
	else
		if Connection2 then
			Connection2:disconnect()
			Connection2 = nil
		end
		Parent.Parent = nil
		CoreEffectFolder.Parent = nil
		
		if Flag1 then
			RunService:UnbindFromRenderStep(Text)
			Flag1 = false
		end
	end
end

VRService:GetPropertyChangedSignal("VREnabled"):connect(onVREnabledChanged)
spawn(onVREnabledChanged)
coroutine.wrap(function()
	-- upvalues: Flag (ref)
	while true do
		if not workspace.CurrentCamera then
			wait()
			continue
		end
		if workspace.CurrentCamera.CameraSubject ~= nil or workspace.CurrentCamera.CameraType == Enum.CameraType.Scriptable then break end
		workspace.CurrentCamera.Changed:Wait()
	end
	Flag = true
end)()

return Panel3DModule