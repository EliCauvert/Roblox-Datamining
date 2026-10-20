local VrSpatialUi = script:FindFirstAncestor("VrSpatialUi")
local Parent = VrSpatialUi.Parent
local ObservableModule = require(Parent.Observable)
local VRService = game:GetService("VRService")
local RunService = game:GetService("RunService")
local IsInExperienceUIVREnabled = require(Parent.SharedExperimentDefinition).isInExperienceUIVREnabled
local InExperienceUIVRIXP = require(Parent.SharedExperimentDefinition).InExperienceUIVRIXP
local VRHub = if IsInExperienceUIVREnabled then nil else require(Parent.VrCommon).VRHub
local ConstantsModule = require(VrSpatialUi.Constants)
local UtilsModule = require(VrSpatialUi.Utils)
local PanelType = ConstantsModule.PanelType
local SpatialUIType = ConstantsModule.SpatialUIType
local CreateCompatPanelModule = require(script.Parent.createCompatPanel)
local CreateUIGroupDragBarModule = require(script.Parent.createUIGroupDragBar)
local _ = require(VrSpatialUi.DragBar)
local UIGroupHelperModule = nil
local StableCameraCacheModule = nil

if IsInExperienceUIVREnabled then
	UIGroupHelperModule = require(VrSpatialUi.UIGroupHelper)
	StableCameraCacheModule = require(VrSpatialUi.StableCameraCache)
end
local Players = game:GetService("Players")
local FIntUIResetDelayInSec = game:DefineFastInt("FIntUIResetDelayInSec", 3)
local SpatialUIPanelDistance: number = game:DefineFastInt("SpatialUIPanelDistance", 64)
local SpatialUIEnablePanelsRefocusing = game:DefineFastFlag("SpatialUIEnablePanelsRefocusing", false)
local SpatialUIDisableBottomBarFading = game:DefineFastFlag("SpatialUIDisableBottomBarFading", false)
local SpatialUIDisableBottomBarInteractionOnAnimating = game:DefineFastFlag("SpatialUIDisableBottomBarInteractionOnAnimating", false)
local VRSpatialUIGuardNilHeadScale = game:DefineFastFlag("VRSpatialUIGuardNilHeadScale", false)
local _Vector2 = Vector2.new(2.666666666666667, 1.866666666666667)
local DefaultGroupHeadRotation = (if IsInExperienceUIVREnabled then CFrame.new(0, 0, math.min(math.max(SpatialUIPanelDistance, 0), 500) / 100 * -1 * 3.3333333333333335) else CFrame.new(-0.46666666666666673, -0.8, -2.1333333333333333)) * (if IsInExperienceUIVREnabled then CFrame.Angles(0, 0, 0) else CFrame.Angles(-0.3141592653589793, 0.17453292519943295, 0))

local function _(CF): CFrame
	local Rx, Ry, _ = CF:ToOrientation()
	
	return CFrame.new(CF.Position) * CFrame.fromOrientation(Rx, Ry, 0)
end

local _ = function(p1, p2)
	-- upvalues: VRService (copy)
	local P2 = p2 or workspace.CurrentCamera.CFrame
	local WorldPoint = (P2 * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(p1)
	local Rx, Ry, _ = WorldPoint:ToOrientation()
	
	return P2:ToObjectSpace(CFrame.new(WorldPoint.Position) * CFrame.fromOrientation(Rx, Ry, 0))
end

local _ = function(p1)
	-- upvalues: SpatialUIType (copy)
	return if p1.uiType == SpatialUIType.SpatialUI or p1.uiType == SpatialUIType.SpatialUIRoact then p1.panelObject.Adornee elseif p1.uiType == SpatialUIType.SpatialUIPartOnly then p1.panelObject else nil
end

local _ = function(p1): boolean
	-- upvalues: SpatialUIType (copy)
	return p1 ~= nil and (p1.panelObject ~= nil and p1.uiType ~= SpatialUIType.ScreenUI)
end

function createUIGroup(p1, p2, p3)
	-- upvalues: _Vector2 (copy), DefaultGroupHeadRotation (copy), VRService (copy)
	local UiGroupHelper = p1.uiGroupHelper
	local CurrentCameraCFrame = workspace.CurrentCamera.CFrame
	local WorldPoint = (CurrentCameraCFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(DefaultGroupHeadRotation)
	local Rx, Ry, _ = WorldPoint:ToOrientation()
	p1.uiGroups[p2] = UiGroupHelper:createUIGroup(p1, p2, _Vector2, {
		uiGroupHeadRotation = DefaultGroupHeadRotation,
		uiGroupCameraOffSet = CurrentCameraCFrame:ToObjectSpace(CFrame.new(WorldPoint.Position) * CFrame.fromOrientation(Rx, Ry, 0)),
		defaultGroupHeadRotation = DefaultGroupHeadRotation
	}, p1.uiElements, p3)
end

local UIManager = {}
local NewResult = nil
UIManager.__index = UIManager

function UIManager:removeRoactPanel(p1)
	-- upvalues: IsInExperienceUIVREnabled (copy)
	if IsInExperienceUIVREnabled then
		self:disconnectPanelVisibility(p1)
	end
	self.uiElements[p1] = nil
end

function UIManager:registerRoactPanel(p1, p2, p3)
	-- upvalues: IsInExperienceUIVREnabled (copy), InExperienceUIVRIXP (copy), ObservableModule (copy)
	self.uiElements[p1] = p2
	
	if IsInExperienceUIVREnabled then
		local CheckAndGetUIGroupTypeForTempPanelResult = self.uiGroupHelper:checkAndGetUIGroupTypeForTempPanel(p1, self.uiElements)
		
		if CheckAndGetUIGroupTypeForTempPanelResult == nil then
			self:rescaleUIForCurrentHeadScale()
			self:updateUIGroupsForCurHeadCFrame()
		else
			self:rescaleUIForCurrentHeadScale(CheckAndGetUIGroupTypeForTempPanelResult, p1)
			
			if InExperienceUIVRIXP:isSpatialUICameraTypeFixEnabled() then
				self:updateUIGroupsForCurCamera(p1, (self.stableCameraCache:getCurrentStableCameraCFrame()))
			else
				self:updateUIGroupsForCurCamera(p1)
			end
		end
	else
		self:rescaleUIForCurrentHeadScale()
		self:updateUIGroupsForCurHeadCFrame()
	end
	if IsInExperienceUIVREnabled then
		self:connectPanelVisibility(p1, if p3 then p3 else ObservableModule.ObservableValue.new(true))
		
		if p2.keepVisibleWhenTopBarHidden ~= nil then
			self.uiGroupHelper:updateAllElements(self.uiElements, self.uiGroups)
		end
	end
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

function UIManager:getPanelObject(p1)
	local UiElement = self.uiElements[p1]
	
	return if UiElement then UiElement.panelObject else nil
end

function UIManager:getPanelSizeInPixel(p1)
	-- upvalues: ConstantsModule (copy)
	return self:getScaledPartSizeInPixel(p1) * ConstantsModule.VR_PANEL_RESOLUTION_MULTIPLIER
end

function UIManager:getScaledPartSizeInPixel(BottomBar)
	-- upvalues: PanelType (copy), ConstantsModule (copy)
	if BottomBar == PanelType.BottomBar then
		return ConstantsModule.BOTTOM_BAR_SIZE
	end
	local SpatialPanelProps = ConstantsModule.COMPAT_PANEL_PROPS_MAP[BottomBar].spatialPanelProps
	
	if SpatialPanelProps then
		local PartSize = SpatialPanelProps.partSize
		
		return Vector2.new(PartSize.X, PartSize.Y)
	else
		return Vector2.new(0, 0)
	end
end

function UIManager:connectTopBarVisibility(p1)
	self.uiGroupHelper:setTopBarVisible(p1, function()
		-- upvalues: self (copy)
		self.uiGroupHelper:updateAllElements(self.uiElements, self.uiGroups)
	end)
end

function UIManager:connectPanelVisibility(p1, NewResult)
	self.uiGroupHelper:connectPanelVisibility(p1, NewResult, self.uiElements, self.uiGroups)
end

function UIManager:disconnectPanelVisibility(p1)
	self.uiGroupHelper:disconnectPanelVisibility(p1, self.uiElements, self.uiGroups)
end

function UIManager:updateUIGroupForCurHeadCFrame(p1, p2)
	-- upvalues: VRService (copy)
	local UiGroup = self.uiGroups[p1]
	local CurrentCameraCFrame = workspace.CurrentCamera.CFrame
	local WorldPoint = (CurrentCameraCFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(UiGroup.positionProps.uiGroupHeadRotation)
	local Rx, Ry, _ = WorldPoint:ToOrientation()
	local ObjectSpace = CurrentCameraCFrame:ToObjectSpace(CFrame.new(WorldPoint.Position) * CFrame.fromOrientation(Rx, Ry, 0))
	UiGroup.positionProps.uiGroupCameraOffSet = ObjectSpace
	local P31 = p2 or false
	
	if UiGroup.draggable and UiGroup.dragBar and not P31 then
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

function UIManager:setUpUiGroups(p1)
	-- upvalues: IsInExperienceUIVREnabled (copy), ConstantsModule (copy), CreateUIGroupDragBarModule (copy), DefaultGroupHeadRotation (copy), VRService (copy), _Vector2 (copy), PanelType (copy)
	if IsInExperienceUIVREnabled then
		createUIGroup(self, ConstantsModule.SpatialUIGroupType.MainUIGroup, p1)
		createUIGroup(self, ConstantsModule.SpatialUIGroupType.MenuUIGroup, p1)
		createUIGroup(self, ConstantsModule.SpatialUIGroupType.ChatUIGroup, p1)
		createUIGroup(self, ConstantsModule.SpatialUIGroupType.ChromeSubMenuUIGroup, p1)
		self.uiGroupHelper:updateAllDragBar(self.uiElements, self.uiGroups)
		
		return
	else
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
end

function UIManager:step()
	-- upvalues: VRService (copy), SpatialUIType (copy), PanelType (copy), IsInExperienceUIVREnabled (copy), SpatialUIDisableBottomBarFading (copy), SpatialUIEnablePanelsRefocusing (copy), FIntUIResetDelayInSec (copy)
	if not VRService.VREnabled then return end
	for i, uiElement in pairs(self.uiElements) do
		if uiElement ~= nil and (uiElement.panelObject ~= nil and uiElement.uiType ~= SpatialUIType.ScreenUI) and i == PanelType.RobloxGui then
			local Rx, Ry, _ = (if uiElement.uiType == SpatialUIType.SpatialUI then uiElement.panelObject.Adornee else uiElement.panelObject).CFrame:ToOrientation()
			local Rx1, Ry1, _ = (workspace.CurrentCamera.CFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToOrientation()
			
			if IsInExperienceUIVREnabled and not SpatialUIDisableBottomBarFading and self.uiGroupHelper then
				self.uiGroupHelper:animateBottomBarOnHeadMoveIfNeeded(self.uiElements, Vector2.new(Rx, Ry), Vector2.new(Rx1, Ry1))
			end
			if not IsInExperienceUIVREnabled or not SpatialUIEnablePanelsRefocusing or math.abs(Ry - Ry1) <= 1.7453292519943295 and math.abs(Rx - Rx1) <= 1.7453292519943295 then
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

function UIManager:prepareGuiToggleAnimationState()
	if self.uiGroupHelper:isTopBarVisible() then
		self.uiGroupHelper:prepareGuiToggleAnimationState(self.uiElements)
	end
end

function UIManager.onShowTopBarChanged(p1)
	-- upvalues: IsInExperienceUIVREnabled (copy), VRService (copy), VRHub (ref), SpatialUIType (copy)
	if IsInExperienceUIVREnabled then return end
	if not VRService.VREnabled then return end
	if VRHub and VRHub.ShowTopBar then
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

function UIManager:updateUIGroupsForCurCamera(p2, CurrentStableCameraCFrame)
	-- upvalues: VRService (copy), SpatialUIType (copy), IsInExperienceUIVREnabled (copy), InExperienceUIVRIXP (copy)
	if not VRService.VREnabled then return end
	for i, uiGroup in pairs(self.uiGroups) do
		if p2 == nil and uiGroup.draggable then
			uiGroup.dragBar:setCFrame((CurrentStableCameraCFrame or workspace.CurrentCamera.CFrame) * uiGroup.positionProps.uiGroupCameraOffSet:ToWorldSpace(uiGroup.dragBarOffset))
		end
	end
	for i, uiElement in pairs(self.uiElements) do
		if (p2 == nil or p2 == i) and (uiElement ~= nil and (uiElement.panelObject ~= nil and uiElement.uiType ~= SpatialUIType.ScreenUI) and uiElement.panelPositionProps and uiElement.panelPositionProps.cameraFixedPanelProp) then
			local PanelPositionProps = uiElement.panelPositionProps
			local CameraFixedPanelProp = PanelPositionProps.cameraFixedPanelProp
			local Adornee = if uiElement.uiType == SpatialUIType.SpatialUI or uiElement.uiType == SpatialUIType.SpatialUIRoact then uiElement.panelObject.Adornee elseif uiElement.uiType == SpatialUIType.SpatialUIPartOnly then uiElement.panelObject else nil
			
			if Adornee == nil then break end
			Adornee.CFrame = (if CurrentStableCameraCFrame then if IsInExperienceUIVREnabled and not InExperienceUIVRIXP:isSpatialUICameraTypeFixEnabled() then self.uiGroupHelper:getGroupCameraCFrameIfPossible(i, self.uiElements) else CurrentStableCameraCFrame elseif IsInExperienceUIVREnabled and not InExperienceUIVRIXP:isSpatialUICameraTypeFixEnabled() then self.uiGroupHelper:getGroupCameraCFrameIfPossible(i, self.uiElements) else workspace.CurrentCamera.CFrame) * self.uiGroups[PanelPositionProps.uiGroup].positionProps.uiGroupCameraOffSet:ToWorldSpace(CameraFixedPanelProp.uiGroupElementOffset)
		end
	end
end

function UIManager.onMouseTargetChanged(p3, Part)
	for _, uiGroup in pairs(p3.uiGroups) do
		if uiGroup.draggable then
			if uiGroup.dragBar and uiGroup.dragBar.part == Part then
				uiGroup.dragBar:startHover()
			elseif uiGroup.dragBar and uiGroup.dragBar.part ~= Part then
				uiGroup.dragBar:hoverEnd()
			end
		end
	end
end

function UIManager:resetDragAndDrop()
	for _, uiGroup in pairs(self.uiGroups) do
		if uiGroup.draggable and uiGroup.dragBar then
			uiGroup.dragBar:hide()
		end
	end
	self:setUpUiGroups(true)
	self:rescaleUIForCurrentHeadScale()
	self:updateUIGroupsForCurCamera()
end

function UIManager:getAdditionalCameraScaleIfNeeded()
	-- upvalues: VRService (copy)
	return if VRService.VREnabled then workspace.CurrentCamera.HeadScale else 1
end

function UIManager.rescaleUIForCurrentHeadScale(p4, CheckAndGetUIGroupTypeForTempPanelResult, p5)
	-- upvalues: IsInExperienceUIVREnabled (copy), VRSpatialUIGuardNilHeadScale (copy), UtilsModule (copy), SpatialUIType (copy)
	local AdditionalCameraScaleIfNeeded = if IsInExperienceUIVREnabled then p4:getAdditionalCameraScaleIfNeeded() else workspace.CurrentCamera.HeadScale
	for _, uiGroup in pairs(p4.uiGroups) do
		if CheckAndGetUIGroupTypeForTempPanelResult == nil then
			local AdditionalCameraScaleIfNeededRatio = AdditionalCameraScaleIfNeeded / (if VRSpatialUIGuardNilHeadScale then uiGroup.headScale or AdditionalCameraScaleIfNeeded else uiGroup.headScale)
			uiGroup.positionProps.uiGroupHeadRotation = UtilsModule.rescaleCFramePosition(uiGroup.positionProps.uiGroupHeadRotation, AdditionalCameraScaleIfNeededRatio)
			uiGroup.positionProps.uiGroupCameraOffSet = UtilsModule.rescaleCFramePosition(uiGroup.positionProps.uiGroupCameraOffSet, AdditionalCameraScaleIfNeededRatio)
			uiGroup.positionProps.defaultGroupHeadRotation = UtilsModule.rescaleCFramePosition(uiGroup.positionProps.defaultGroupHeadRotation, AdditionalCameraScaleIfNeededRatio)
			
			if uiGroup.draggable then
				uiGroup.dragBarOffset = UtilsModule.rescaleCFramePosition(uiGroup.dragBarOffset, AdditionalCameraScaleIfNeededRatio)
				uiGroup.dragBar:rescale(AdditionalCameraScaleIfNeededRatio)
			end
			uiGroup.headScale = AdditionalCameraScaleIfNeeded
			
			if IsInExperienceUIVREnabled then
				uiGroup.lastCameraCFrame = workspace.CurrentCamera.CFrame
			end
		end
	end
	for i, uiElement in pairs(p4.uiElements) do
		if p5 == nil or p5 == i then
			local AdditionalCameraScaleIfNeededRatio = AdditionalCameraScaleIfNeeded / (if VRSpatialUIGuardNilHeadScale then uiElement.headScale or AdditionalCameraScaleIfNeeded else uiElement.headScale)
			local IsUiTypeMatch = uiElement.uiType == SpatialUIType.SpatialUIRoact
			local Adornee = nil
			
			if not IsUiTypeMatch then
				Adornee = if uiElement.uiType == SpatialUIType.SpatialUI or uiElement.uiType == SpatialUIType.SpatialUIRoact then uiElement.panelObject.Adornee elseif uiElement.uiType == SpatialUIType.SpatialUIPartOnly then uiElement.panelObject else nil
				IsUiTypeMatch = Adornee == nil
			end
			if not IsUiTypeMatch then
				Adornee.Size *= AdditionalCameraScaleIfNeededRatio
			end
			local PanelPositionProps = uiElement.panelPositionProps
			
			if PanelPositionProps and PanelPositionProps.cameraFixedPanelProp then
				PanelPositionProps.cameraFixedPanelProp.uiGroupElementOffset = UtilsModule.rescaleCFramePosition(PanelPositionProps.cameraFixedPanelProp.uiGroupElementOffset, AdditionalCameraScaleIfNeededRatio)
			end
			uiElement.headScale = AdditionalCameraScaleIfNeeded
		end
	end
end

function UIManager.new()
	-- upvalues: IsInExperienceUIVREnabled (copy), UIGroupHelperModule (ref), StableCameraCacheModule (ref), UIManager (copy), RunService (copy), VRHub (ref), InExperienceUIVRIXP (copy), Players (copy)
	local config = {
		currentMouseTarget = nil,
		uiGroupsOutOfViewTimeStamp = nil,
		uiElements = {},
		uiGroups = {},
		uiGroupHelper = {},
		stableCameraCache = {}
	}
	
	if IsInExperienceUIVREnabled then
		config.uiGroupHelper = UIGroupHelperModule.new(false)
		config.stableCameraCache = StableCameraCacheModule.new()
	end
	setmetatable(config, UIManager)
	config:setUpUiGroups()
	config:rescaleUIForCurrentHeadScale()
	config:updateUIGroupsForCurCamera()
	RunService:BindToRenderStep("UIManagerRenderStep", Enum.RenderPriority.Last.Value, function()
		-- upvalues: config (copy)
		config:step()
	end)
	
	if not IsInExperienceUIVREnabled and VRHub then
		VRHub.ShowTopBarChanged.Event:connect(function()
			-- upvalues: config (copy)
			config:onShowTopBarChanged()
		end)
	end
	local CurrentCamera = workspace.CurrentCamera
	CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function()
		-- upvalues: IsInExperienceUIVREnabled (upval), InExperienceUIVRIXP (upval), config (copy)
		if not IsInExperienceUIVREnabled or not InExperienceUIVRIXP:isSpatialUICameraTypeFixEnabled() then
			config:updateUIGroupsForCurCamera()
		elseif config.stableCameraCache:updateAndCheckCameraMoved() then
			config:updateUIGroupsForCurCamera(nil, (config.stableCameraCache:getCurrentStableCameraCFrame()))
			
			return
		end
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

function UIManager.getBottomBarVisibility(p6)
	-- upvalues: SpatialUIDisableBottomBarInteractionOnAnimating (copy)
	return if SpatialUIDisableBottomBarInteractionOnAnimating then nil else p6.uiGroupHelper:getBottomBarVisibility()
end

function UIManager:isBottomBarInteractionOnAnimationSupported()
	-- upvalues: SpatialUIDisableBottomBarInteractionOnAnimating (copy)
	return not SpatialUIDisableBottomBarInteractionOnAnimating and self.uiGroupHelper:getBottomBarVisibility():get()
end

function UIManager.getInstance()
	-- upvalues: NewResult (ref), UIManager (copy)
	if NewResult == nil then
		NewResult = UIManager.new()
	end
	return NewResult
end

return UIManager