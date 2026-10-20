local VRService = game:GetService("VRService")
local RunService = game:GetService("RunService")
local VRHub = require(game:GetService("CorePackages").Workspace.Packages.VrCommon).VRHub
local Parent = script.Parent
local ConstantsModule = require(Parent.Constants)
local UtilsModule = require(Parent.Utils)
local PanelType = ConstantsModule.PanelType
local SpatialUIType = ConstantsModule.SpatialUIType
local CreateCompatPanelModule = require(script.Parent.createCompatPanel)
local CreateUIGroupDragBarModule = require(script.Parent.createUIGroupDragBar)
local _ = require(Parent.DragBar)
local Players = game:GetService("Players")
local FIntUIResetDelayInSec = game:DefineFastInt("FIntUIResetDelayInSec", 3)
local _Vector2 = Vector2.new(2.666666666666667, 1.866666666666667)
local DefaultGroupHeadRotation = CFrame.new(-0.46666666666666673, -0.8, -2.1333333333333333) * CFrame.Angles(-0.3141592653589793, 0.17453292519943295, 0)

local function _(CF): CFrame
	local Rx, Ry, _ = CF:ToOrientation()
	
	return CFrame.new(CF.Position) * CFrame.fromOrientation(Rx, Ry, 0)
end

local _ = function(p1)
	-- upvalues: VRService (copy)
	local CurrentCameraCFrame = workspace.CurrentCamera.CFrame
	local WorldPoint = (CurrentCameraCFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(p1)
	local Rx, Ry, _ = WorldPoint:ToOrientation()
	
	return CurrentCameraCFrame:ToObjectSpace(CFrame.new(WorldPoint.Position) * CFrame.fromOrientation(Rx, Ry, 0))
end

local _ = function(p1)
	-- upvalues: SpatialUIType (copy)
	return if p1.uiType == SpatialUIType.SpatialUI or p1.uiType == SpatialUIType.SpatialUIRoact then p1.panelObject.Adornee elseif p1.uiType == SpatialUIType.SpatialUIPartOnly then p1.panelObject else nil
end

local _ = function(p1): boolean
	-- upvalues: SpatialUIType (copy)
	return p1 ~= nil and (p1.panelObject ~= nil and p1.uiType ~= SpatialUIType.ScreenUI)
end

local UIManager = {}
local NewResult = nil
UIManager.__index = UIManager

function UIManager:removeRoactPanel(p1)
	self.uiElements[p1] = nil
end

function UIManager:registerRoactPanel(p1, p2)
	self.uiElements[p1] = p2
	self:rescaleUIForCurrentHeadScale()
	self:updateUIGroupsForCurHeadCFrame()
end

function UIManager:createUI(p1)
	-- upvalues: CreateCompatPanelModule (copy)
	local CompatPanelModule = CreateCompatPanelModule(p1)
	
	if CompatPanelModule == nil then
		return nil
	else
		self.uiElements[p1.panelType] = CompatPanelModule
		self:updatePanelForCurHeadCFrame(p1.panelType)
		
		return {
			type = CompatPanelModule.uiType,
			panelObject = CompatPanelModule.panelObject
		}
	end
end

function UIManager:updateUIGroupForCurHeadCFrame(p1, p2)
	-- upvalues: VRService (copy)
	local UiGroup = self.uiGroups[p1]
	local CurrentCameraCFrame = workspace.CurrentCamera.CFrame
	local WorldPoint = (CurrentCameraCFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(UiGroup.positionProps.uiGroupHeadRotation)
	local Rx, Ry, _ = WorldPoint:ToOrientation()
	local ObjectSpace = CurrentCameraCFrame:ToObjectSpace(CFrame.new(WorldPoint.Position) * CFrame.fromOrientation(Rx, Ry, 0))
	UiGroup.positionProps.uiGroupCameraOffSet = ObjectSpace
	local P13 = p2 or false
	
	if UiGroup.draggable and UiGroup.dragBar and not P13 then
		UiGroup.dragBar:setCFrame(workspace.CurrentCamera.CFrame * ObjectSpace:ToWorldSpace(UiGroup.dragBarOffset))
	end
	self:updatePanelsInUIGroupForCurHeadCFrame(p1)
end

function UIManager:updateUIGroupsForCurHeadCFrame()
	for i, _ in pairs(self.uiGroups) do
		self:updateUIGroupForCurHeadCFrame(i)
	end
end

function UIManager:updatePanelForCurHeadCFrame(PanelType)
	-- upvalues: SpatialUIType (copy), VRService (copy)
	local UiElement = self.uiElements[PanelType]
	
	if UiElement ~= nil and (UiElement.panelObject ~= nil and UiElement.uiType ~= SpatialUIType.ScreenUI) and UiElement.panelPositionProps and UiElement.panelPositionProps.cameraFixedPanelProp then
		local PanelPositionProps = UiElement.panelPositionProps
		local CameraFixedPanelProp = PanelPositionProps.cameraFixedPanelProp
		local CurrentCameraCFrame = workspace.CurrentCamera.CFrame
		local WorldPoint = (CurrentCameraCFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(self.uiGroups[PanelPositionProps.uiGroup].positionProps.uiGroupHeadRotation)
		local Rx, Ry, _ = WorldPoint:ToOrientation()
		local ObjectSpace = CurrentCameraCFrame:ToObjectSpace(CFrame.new(WorldPoint.Position) * CFrame.fromOrientation(Rx, Ry, 0))
		local Adornee = if UiElement.uiType == SpatialUIType.SpatialUI or UiElement.uiType == SpatialUIType.SpatialUIRoact then UiElement.panelObject.Adornee elseif UiElement.uiType == SpatialUIType.SpatialUIPartOnly then UiElement.panelObject else nil
		
		if Adornee == nil then return end
		Adornee.CFrame = workspace.CurrentCamera.CFrame * ObjectSpace
		Adornee.CFrame = Adornee.CFrame:ToWorldSpace(CameraFixedPanelProp.uiGroupElementOffset)
	end
end

function UIManager:updatePanelsInUIGroupForCurHeadCFrame(UiGroup)
	for i, uiElement in pairs(self.uiElements) do
		if uiElement.panelPositionProps and uiElement.panelPositionProps.uiGroup == UiGroup then
			self:updatePanelForCurHeadCFrame(i)
		end
	end
end

function UIManager:updatePanelsForCurHeadCFrame()
	for i, _ in pairs(self.uiElements) do
		self:updatePanelForCurHeadCFrame(i)
	end
end

function UIManager:dragUiGroupStart(MainUIGroup)
	if self.uiGroups[MainUIGroup].draggable ~= false then
		local DragBar = self.uiGroups[MainUIGroup].dragBar
		DragBar:startDrag((DragBar:getCFrame():ToObjectSpace((workspace.CurrentCamera.CFrame:ToWorldSpace(self.uiGroups[MainUIGroup].positionProps.uiGroupCameraOffSet)))))
		
		return
	end
end

function UIManager:dragUiGroupEnd(MainUIGroup)
	if self.uiGroups[MainUIGroup].draggable ~= false then
		self.uiGroups[MainUIGroup].dragBar:dragEnd()
		
		return
	end
end

function UIManager:dragUiGroupStep(MainUIGroup)
	-- upvalues: VRService (copy)
	if self.uiGroups[MainUIGroup].draggable ~= false then
		local DragBar = self.uiGroups[MainUIGroup].dragBar
		local ScaledUserCFrame = workspace.CurrentCamera.CFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)
		local _CFrame = DragBar:getCFrame()
		local Rx, Ry, _ = (CFrame.lookAt(_CFrame.Position, (Vector3.new(ScaledUserCFrame.Position.X, ScaledUserCFrame.Position.Y - 0.6666666666666667, ScaledUserCFrame.Position.Z))) * CFrame.Angles(0, 3.141592653589793, 0)):ToEulerAnglesXYZ()
		local _, _, Rz = _CFrame:ToEulerAnglesXYZ()
		local CF = CFrame.new(_CFrame.Position) * CFrame.Angles(Rx, Ry, Rz)
		local Rx1, Ry1, _ = CF:ToOrientation()
		DragBar:setCFrame(CFrame.new(CF.Position) * CFrame.fromOrientation(Rx1, Ry1, 0))
		self.uiGroups[MainUIGroup].positionProps.uiGroupHeadRotation = ScaledUserCFrame:ToObjectSpace((DragBar:getCFrame():ToWorldSpace(DragBar.uiGroupOffSet)))
		self:updateUIGroupForCurHeadCFrame(MainUIGroup, true)
		
		return
	end
end

function UIManager:setUpUiGroups()
	-- upvalues: CreateUIGroupDragBarModule (copy), ConstantsModule (copy), DefaultGroupHeadRotation (copy), VRService (copy), _Vector2 (copy), PanelType (copy)
	local MainUIGroup = CreateUIGroupDragBarModule({
		name = "MainUIGroup",
		dragFunction = function(_, _, _, _, _)
			-- upvalues: self (copy), ConstantsModule (upval)
			self:dragUiGroupStep(ConstantsModule.SpatialUIGroupType.MainUIGroup)
		end,
		dragStartFunction = function(_, _, _, _, _, _, _)
			-- upvalues: self (copy), ConstantsModule (upval)
			self:dragUiGroupStart(ConstantsModule.SpatialUIGroupType.MainUIGroup)
		end,
		dragEndFunction = function(_)
			-- upvalues: self (copy), ConstantsModule (upval)
			self:dragUiGroupEnd(ConstantsModule.SpatialUIGroupType.MainUIGroup)
		end
	})
	local CurrentCameraCFrame = workspace.CurrentCamera.CFrame
	local WorldPoint = (CurrentCameraCFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(DefaultGroupHeadRotation)
	local Rx, Ry, _ = WorldPoint:ToOrientation()
	self.uiGroups[ConstantsModule.SpatialUIGroupType.MainUIGroup] = {
		draggable = true,
		headScale = 1,
		positionProps = {
			uiGroupHeadRotation = DefaultGroupHeadRotation,
			uiGroupCameraOffSet = CurrentCameraCFrame:ToObjectSpace(CFrame.new(WorldPoint.Position) * CFrame.fromOrientation(Rx, Ry, 0)),
			defaultGroupHeadRotation = DefaultGroupHeadRotation
		},
		uiContainerSize = _Vector2,
		dragBar = MainUIGroup,
		dragBarOffset = CFrame.new(0, ConstantsModule.ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP[PanelType.BottomBar].Y - 0.075 - 0.06666666666666667, 0)
	}
end

function UIManager:step()
	-- upvalues: VRService (copy), SpatialUIType (copy), PanelType (copy), FIntUIResetDelayInSec (copy)
	if not VRService.VREnabled then return end
	for i, uiElement in pairs(self.uiElements) do
		if uiElement ~= nil and (uiElement.panelObject ~= nil and uiElement.uiType ~= SpatialUIType.ScreenUI) and i == PanelType.RobloxGui then
			local Rx, Ry, _ = (if uiElement.uiType == SpatialUIType.SpatialUI then uiElement.panelObject.Adornee else uiElement.panelObject).CFrame:ToOrientation()
			local Rx1, Ry1, _ = (workspace.CurrentCamera.CFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToOrientation()
			
			if math.abs(Ry - Ry1) <= 1.7453292519943295 and math.abs(Rx - Rx1) <= 1.7453292519943295 then
				self.uiGroupsOutOfViewTimeStamp = nil
			elseif not self.uiGroupsOutOfViewTimeStamp then
				self.uiGroupsOutOfViewTimeStamp = os.clock()
			elseif FIntUIResetDelayInSec <= os.clock() - self.uiGroupsOutOfViewTimeStamp then
				self:updateUIGroupsForCurHeadCFrame()
				self.uiGroupsOutOfViewTimeStamp = nil
			end
		end
	end
end

function UIManager.onShowTopBarChanged(p1)
	-- upvalues: VRService (copy), VRHub (copy), SpatialUIType (copy)
	if not VRService.VREnabled then return end
	if VRHub.ShowTopBar then
		for _, uiGroup in pairs(p1.uiGroups) do
			if uiGroup.draggable and uiGroup.dragBar then
				uiGroup.dragBar:show()
			end
		end
		for _, uiElement in pairs(p1.uiElements) do
			if uiElement.uiType == SpatialUIType.SpatialUI or uiElement.uiType == SpatialUIType.SpatialUIRoact then
				local PanelObject = uiElement.panelObject
				PanelObject.Enabled = true
				PanelObject.Adornee.Parent = workspace
			elseif uiElement.uiType == SpatialUIType.SpatialUIPartOnly then
				uiElement.panelObject.Parent = workspace
			end
		end
		return
	else
		for _, uiGroup1 in pairs(p1.uiGroups) do
			if uiGroup1.draggable and uiGroup1.dragBar then
				uiGroup1.dragBar:hide()
			end
		end
		for _, uiElement1 in pairs(p1.uiElements) do
			if uiElement1.uiType == SpatialUIType.SpatialUI or uiElement1.uiType == SpatialUIType.SpatialUIRoact then
				local PanelObject = uiElement1.panelObject
				PanelObject.Enabled = false
				PanelObject.Adornee.Parent = nil
			elseif uiElement1.uiType == SpatialUIType.SpatialUIPartOnly then
				uiElement1.panelObject.Parent = nil
			end
		end
	end
end

function UIManager:updateUIGroupsForCurCamera()
	-- upvalues: VRService (copy), SpatialUIType (copy)
	if not VRService.VREnabled then return end
	for _, uiGroup in pairs(self.uiGroups) do
		if uiGroup.draggable then
			uiGroup.dragBar:setCFrame(workspace.CurrentCamera.CFrame * uiGroup.positionProps.uiGroupCameraOffSet:ToWorldSpace(uiGroup.dragBarOffset))
		end
	end
	for _, uiElement in pairs(self.uiElements) do
		if uiElement ~= nil and (uiElement.panelObject ~= nil and uiElement.uiType ~= SpatialUIType.ScreenUI) and uiElement.panelPositionProps and uiElement.panelPositionProps.cameraFixedPanelProp then
			local PanelPositionProps = uiElement.panelPositionProps
			local CameraFixedPanelProp = PanelPositionProps.cameraFixedPanelProp
			local Adornee = if uiElement.uiType == SpatialUIType.SpatialUI or uiElement.uiType == SpatialUIType.SpatialUIRoact then uiElement.panelObject.Adornee elseif uiElement.uiType == SpatialUIType.SpatialUIPartOnly then uiElement.panelObject else nil
			
			if Adornee == nil then break end
			Adornee.CFrame = workspace.CurrentCamera.CFrame * self.uiGroups[PanelPositionProps.uiGroup].positionProps.uiGroupCameraOffSet:ToWorldSpace(CameraFixedPanelProp.uiGroupElementOffset)
		end
	end
end

function UIManager.onMouseTargetChanged(p2, Part)
	for _, uiGroup in pairs(p2.uiGroups) do
		if uiGroup.draggable then
			if uiGroup.dragBar and uiGroup.dragBar.part == Part then
				uiGroup.dragBar:startHover()
			elseif uiGroup.dragBar and uiGroup.dragBar.part ~= Part then
				uiGroup.dragBar:hoverEnd()
			end
		end
	end
end

function UIManager.rescaleUIForCurrentHeadScale(p3)
	-- upvalues: UtilsModule (copy), SpatialUIType (copy)
	local HeadScale = workspace.CurrentCamera.HeadScale
	
	for _, uiGroup in pairs(p3.uiGroups) do
		local HeadScaleRatio = HeadScale / uiGroup.headScale
		uiGroup.positionProps.uiGroupHeadRotation = UtilsModule.rescaleCFramePosition(uiGroup.positionProps.uiGroupHeadRotation, HeadScaleRatio)
		uiGroup.positionProps.uiGroupCameraOffSet = UtilsModule.rescaleCFramePosition(uiGroup.positionProps.uiGroupCameraOffSet, HeadScaleRatio)
		uiGroup.positionProps.defaultGroupHeadRotation = UtilsModule.rescaleCFramePosition(uiGroup.positionProps.defaultGroupHeadRotation, HeadScaleRatio)
		
		if uiGroup.draggable then
			uiGroup.dragBarOffset = UtilsModule.rescaleCFramePosition(uiGroup.dragBarOffset, HeadScaleRatio)
			uiGroup.dragBar:rescale(HeadScaleRatio)
		end
		uiGroup.headScale = HeadScale
	end
	for _, uiElement in pairs(p3.uiElements) do
		local HeadScaleRatio = HeadScale / uiElement.headScale
		local IsUiTypeMatch = uiElement.uiType == SpatialUIType.SpatialUIRoact
		local Adornee = nil
		
		if not IsUiTypeMatch then
			Adornee = if uiElement.uiType == SpatialUIType.SpatialUI or uiElement.uiType == SpatialUIType.SpatialUIRoact then uiElement.panelObject.Adornee elseif uiElement.uiType == SpatialUIType.SpatialUIPartOnly then uiElement.panelObject else nil
			IsUiTypeMatch = Adornee == nil
		end
		if not IsUiTypeMatch then
			Adornee.Size *= HeadScaleRatio
		end
		local PanelPositionProps = uiElement.panelPositionProps
		
		if PanelPositionProps and PanelPositionProps.cameraFixedPanelProp then
			PanelPositionProps.cameraFixedPanelProp.uiGroupElementOffset = UtilsModule.rescaleCFramePosition(PanelPositionProps.cameraFixedPanelProp.uiGroupElementOffset, HeadScaleRatio)
		end
		uiElement.headScale = HeadScale
	end
end

function UIManager.new()
	-- upvalues: UIManager (copy), RunService (copy), VRHub (copy), Players (copy)
	local config = {
		currentMouseTarget = nil,
		uiGroupsOutOfViewTimeStamp = nil,
		uiElements = {},
		uiGroups = {}
	}
	setmetatable(config, UIManager)
	config:setUpUiGroups()
	config:rescaleUIForCurrentHeadScale()
	config:updateUIGroupsForCurCamera()
	RunService:BindToRenderStep("UIManagerRenderStep", Enum.RenderPriority.Last.Value, function()
		-- upvalues: config (copy)
		config:step()
	end)
	VRHub.ShowTopBarChanged.Event:connect(function()
		-- upvalues: config (copy)
		config:onShowTopBarChanged()
	end)
	local CurrentCamera = workspace.CurrentCamera
	CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function()
		-- upvalues: config (copy)
		config:updateUIGroupsForCurCamera()
	end)
	CurrentCamera:GetPropertyChangedSignal("HeadScale"):Connect(function()
		-- upvalues: config (copy)
		config:rescaleUIForCurrentHeadScale()
		config:updateUIGroupsForCurHeadCFrame()
	end)
	local Mouse = Players.LocalPlayer:GetMouse()
	
	if Mouse then
		Mouse.Move:Connect(function()
			-- upvalues: Players (upval), config (copy)
			local Mouse = Players.LocalPlayer:GetMouse()
			
			if Mouse.Target ~= config.currentMouseTarget then
				config:onMouseTargetChanged(Mouse.Target)
				config.currentMouseTarget = Mouse.Target
			end
		end)
	end
	return config
end

function UIManager.getInstance()
	-- upvalues: NewResult (ref), UIManager (copy)
	if NewResult == nil then
		NewResult = UIManager.new()
	end
	return NewResult
end

return UIManager