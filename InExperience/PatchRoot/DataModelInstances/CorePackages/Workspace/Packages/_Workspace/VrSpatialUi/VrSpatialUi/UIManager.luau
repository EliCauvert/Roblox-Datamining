local vrSpatialUi = script:FindFirstAncestor("VrSpatialUi")
local parent = vrSpatialUi.Parent
local observableModule = require(parent.Observable)
local VRService = game:GetService("VRService")
local runService = game:GetService("RunService")
local isInExperienceUIVREnabled = require(parent.SharedExperimentDefinition).isInExperienceUIVREnabled
local inExperienceUIVRIXP = require(parent.SharedExperimentDefinition).InExperienceUIVRIXP
local var1 = if not isInExperienceUIVREnabled then require(parent.VrCommon).VRHub else nil
local constantsModule = require(vrSpatialUi.Constants)
local utilsModule = require(vrSpatialUi.Utils)
local panelType = constantsModule.PanelType
local spatialUIType = constantsModule.SpatialUIType
local createCompatPanelModule = require(script.Parent.createCompatPanel)
local createUIGroupDragBarModule = require(script.Parent.createUIGroupDragBar)
local _ = require(vrSpatialUi.DragBar)
local UIGroupHelperModule = nil
local stableCameraCacheModule = nil

if isInExperienceUIVREnabled then
	UIGroupHelperModule = require(vrSpatialUi.UIGroupHelper)
	stableCameraCacheModule = require(vrSpatialUi.StableCameraCache)
end
local playersService = game:GetService("Players")
local fIntUIResetDelayInSec = game:DefineFastInt("FIntUIResetDelayInSec", 3)
local spatialUIPanelDistance = game:DefineFastInt("SpatialUIPanelDistance", 64)
local spatialUIEnablePanelsRefocusing = game:DefineFastFlag("SpatialUIEnablePanelsRefocusing", false)
local spatialUIDisableBottomBarFading = game:DefineFastFlag("SpatialUIDisableBottomBarFading", false)
local spatialUIDisableBottomBarInteractionOnAnimating = game:DefineFastFlag("SpatialUIDisableBottomBarInteractionOnAnimating", false)
local VRSpatialUIGuardNilHeadScale = game:DefineFastFlag("VRSpatialUIGuardNilHeadScale", false)
local vector2 = Vector2.new(2.666666666667, 1.866666666667)
local var2 = (if isInExperienceUIVREnabled then CFrame.new(0, 0, math.min(math.max(spatialUIPanelDistance, 0), 500) / 100 * -1 * 3.333333333333) else CFrame.new(-0.466666666667, -0.8, -2.133333333333)) * (if isInExperienceUIVREnabled then CFrame.Angles(0, 0, 0) else CFrame.Angles(-0.314159265359, 0.174532925199, 0))

local function _(p1)
	local var3, var4, _ = p1:ToOrientation()
	
	return CFrame.new(p1.Position) * CFrame.fromOrientation(var3, var4, 0)
end

local _ = function(value, p1)
	-- upvalues: VRService (ref)
	p1 = p1 or workspace.CurrentCamera.CFrame
	local var3 = (p1 * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(value)
	local var4, var5, _ = var3:ToOrientation()
	
	return p1:ToObjectSpace(CFrame.new(var3.Position) * CFrame.fromOrientation(var4, var5, 0))
end

local _ = function(p1)
	-- upvalues: spatialUIType (ref)
	return if p1.uiType == spatialUIType.SpatialUI or p1.uiType == spatialUIType.SpatialUIRoact then p1.panelObject.Adornee elseif p1.uiType == spatialUIType.SpatialUIPartOnly then p1.panelObject else nil
end

local _ = function(p1)
	-- upvalues: spatialUIType (ref)
	return p1 ~= nil and (p1.panelObject ~= nil and p1.uiType ~= spatialUIType.ScreenUI)
end

function createUIGroup(p1, p2, p3)
	-- upvalues: vector2 (ref), var2 (ref), VRService (ref)
	local uiGroupHelper = p1.uiGroupHelper
	local t = { uiGroupHeadRotation = var2 }
	local cFrame = workspace.CurrentCamera.CFrame
	local var3 = (cFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(var2)
	local var4, var5, _ = var3:ToOrientation()
	t.uiGroupCameraOffSet = cFrame:ToObjectSpace(CFrame.new(var3.Position) * CFrame.fromOrientation(var4, var5, 0))
	t.defaultGroupHeadRotation = var2
	p1.uiGroups[p2] = uiGroupHelper:createUIGroup(p1, p2, vector2, t, p1.uiElements, p3)
end

local t = {}
local var3 = nil
t.__index = t

function t:removeRoactPanel(p1)
	-- upvalues: isInExperienceUIVREnabled (ref)
	if isInExperienceUIVREnabled then
		self:disconnectPanelVisibility(p1)
	end
	self.uiElements[p1] = nil
end

function t:registerRoactPanel(p1, p2, p3)
	-- upvalues: isInExperienceUIVREnabled (ref), inExperienceUIVRIXP (ref), observableModule (ref)
	self.uiElements[p1] = p2
	
	if isInExperienceUIVREnabled then
		local var4 = self.uiGroupHelper:checkAndGetUIGroupTypeForTempPanel(p1, self.uiElements)
		
		if var4 == nil then
			self:rescaleUIForCurrentHeadScale()
			self:updateUIGroupsForCurHeadCFrame()
		else
			self:rescaleUIForCurrentHeadScale(var4, p1)
			
			if inExperienceUIVRIXP:isSpatialUICameraTypeFixEnabled() then
				self:updateUIGroupsForCurCamera(p1, self.stableCameraCache:getCurrentStableCameraCFrame())
			else
				self:updateUIGroupsForCurCamera(p1)
			end
		end
	else
		self:rescaleUIForCurrentHeadScale()
		self:updateUIGroupsForCurHeadCFrame()
	end
	if isInExperienceUIVREnabled then
		self:connectPanelVisibility(p1, p3 or observableModule.ObservableValue.new(true))
	end
end

function t:createUI(p1)
	-- upvalues: createCompatPanelModule (ref)
	local var4 = createCompatPanelModule(p1)
	
	if var4 == nil then
		return nil
	end
	self.uiElements[p1.panelType] = var4
	self:updatePanelForCurHeadCFrame(p1.panelType)
	
	return { type = var4.uiType, panelObject = var4.panelObject }
end

function t:getPanelObject(p1)
	local var4 = self.uiElements[p1]
	
	return if var4 then var4.panelObject else nil
end

function t:getPanelSizeInPixel(p1)
	-- upvalues: constantsModule (ref)
	return self:getScaledPartSizeInPixel(p1) * constantsModule.VR_PANEL_RESOLUTION_MULTIPLIER
end

function t.getScaledPartSizeInPixel(_, p1)
	-- upvalues: panelType (ref), constantsModule (ref)
	if p1 == panelType.BottomBar then
		return constantsModule.BOTTOM_BAR_SIZE
	end
	local spatialPanelProps = constantsModule.COMPAT_PANEL_PROPS_MAP[p1].spatialPanelProps
	
	if spatialPanelProps then
		local partSize = spatialPanelProps.partSize
		
		return Vector2.new(partSize.X, partSize.Y)
	end
	return Vector2.new(0, 0)
end

function t:connectTopBarVisibility(p1)
	self.uiGroupHelper:setTopBarVisible(p1, function()
		-- upvalues: self (ref)
		self.uiGroupHelper:updateAllElements(self.uiElements, self.uiGroups)
	end)
end

function t:connectPanelVisibility(p1, p2)
	self.uiGroupHelper:connectPanelVisibility(p1, p2, self.uiElements, self.uiGroups)
end

function t:disconnectPanelVisibility(p1)
	self.uiGroupHelper:disconnectPanelVisibility(p1, self.uiElements, self.uiGroups)
end

function t:updateUIGroupForCurHeadCFrame(p1, p2)
	-- upvalues: VRService (ref)
	local var4 = self.uiGroups[p1]
	local cFrame = workspace.CurrentCamera.CFrame
	local uiGroupHeadRotation = (cFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(var4.positionProps.uiGroupHeadRotation)
	local var5, var6, _ = uiGroupHeadRotation:ToOrientation()
	local var7 = cFrame:ToObjectSpace(CFrame.new(uiGroupHeadRotation.Position) * CFrame.fromOrientation(var5, var6, 0))
	var4.positionProps.uiGroupCameraOffSet = var7
	
	if var4.draggable and var4.dragBar and not (p2 or false) then
		var4.dragBar:setCFrame(workspace.CurrentCamera.CFrame * var7:ToWorldSpace(var4.dragBarOffset))
	end
	self:updatePanelsInUIGroupForCurHeadCFrame(p1)
end

function t:updateUIGroupsForCurHeadCFrame()
	for i, v in pairs(self.uiGroups) do
		self:updateUIGroupForCurHeadCFrame(i)
	end
end

function t:updatePanelForCurHeadCFrame(p1)
	-- upvalues: spatialUIType (ref), VRService (ref)
	local var4 = self.uiElements[p1]
	local var5 = var4 ~= nil and (var4.panelObject ~= nil and var4.uiType ~= spatialUIType.ScreenUI)
	
	if var5 and var4.panelPositionProps and var4.panelPositionProps.cameraFixedPanelProp then
		var5 = var4.panelPositionProps
		local cameraFixedPanelProp = var5.cameraFixedPanelProp
		local cFrame = workspace.CurrentCamera.CFrame
		local uiGroupHeadRotation = (cFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(self.uiGroups[var5.uiGroup].positionProps.uiGroupHeadRotation)
		local var6, var7, _ = uiGroupHeadRotation:ToOrientation()
		local var8 = cFrame:ToObjectSpace(CFrame.new(uiGroupHeadRotation.Position) * CFrame.fromOrientation(var6, var7, 0))
		local var9 = if var4.uiType == spatialUIType.SpatialUI or var4.uiType == spatialUIType.SpatialUIRoact then var4.panelObject.Adornee elseif var4.uiType == spatialUIType.SpatialUIPartOnly then var4.panelObject else nil
		
		if var9 == nil then return end
		var9.CFrame = workspace.CurrentCamera.CFrame * var8
		var9.CFrame = var9.CFrame:ToWorldSpace(cameraFixedPanelProp.uiGroupElementOffset)
	end
end

function t:updatePanelsInUIGroupForCurHeadCFrame(p1)
	for i, v in pairs(self.uiElements) do
		if v.panelPositionProps and v.panelPositionProps.uiGroup == p1 then
			self:updatePanelForCurHeadCFrame(i)
		end
	end
end

function t:updatePanelsForCurHeadCFrame()
	for i, v in pairs(self.uiElements) do
		self:updatePanelForCurHeadCFrame(i)
	end
end

function t:dragUiGroupStart(p2)
	if self.uiGroups[p2].draggable == false then
		return
	end
	local dragBar = self.uiGroups[p2].dragBar
	dragBar:startDrag(dragBar:getCFrame():ToObjectSpace(workspace.CurrentCamera.CFrame:ToWorldSpace(self.uiGroups[p2].positionProps.uiGroupCameraOffSet)))
end

function t:dragUiGroupEnd(p2)
	if self.uiGroups[p2].draggable == false then
		return
	end
	self.uiGroups[p2].dragBar:dragEnd()
end

function t:dragUiGroupStep(p2)
	-- upvalues: VRService (ref)
	if self.uiGroups[p2].draggable == false then
		return
	end
	local dragBar = self.uiGroups[p2].dragBar
	local var4 = workspace.CurrentCamera.CFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)
	local cFrame = dragBar:getCFrame()
	local var5, var6, _ = (CFrame.lookAt(cFrame.Position, Vector3.new(var4.Position.X, var4.Position.Y - 0.666666666667, var4.Position.Z)) * CFrame.Angles(0, 3.14159265359, 0)):ToEulerAnglesXYZ()
	local _, _, var7 = cFrame:ToEulerAnglesXYZ()
	local var8 = CFrame.new(cFrame.Position) * CFrame.Angles(var5, var6, var7)
	local var9, var10, _ = var8:ToOrientation()
	dragBar:setCFrame(CFrame.new(var8.Position) * CFrame.fromOrientation(var9, var10, 0))
	self.uiGroups[p2].positionProps.uiGroupHeadRotation = var4:ToObjectSpace(dragBar:getCFrame():ToWorldSpace(dragBar.uiGroupOffSet))
	self:updateUIGroupForCurHeadCFrame(p2, true)
end

function t:setUpUiGroups(p2)
	-- upvalues: isInExperienceUIVREnabled (ref), constantsModule (ref), createUIGroupDragBarModule (ref), var2 (ref), VRService (ref), vector2 (ref), panelType (ref)
	if isInExperienceUIVREnabled then
		createUIGroup(self, constantsModule.SpatialUIGroupType.MainUIGroup, p2)
		createUIGroup(self, constantsModule.SpatialUIGroupType.MenuUIGroup, p2)
		createUIGroup(self, constantsModule.SpatialUIGroupType.ChatUIGroup, p2)
		createUIGroup(self, constantsModule.SpatialUIGroupType.ChromeSubMenuUIGroup, p2)
		self.uiGroupHelper:updateAllDragBar(self.uiElements, self.uiGroups)
		
		return
	end
	local var4 = createUIGroupDragBarModule({
		name = "MainUIGroup",
		dragFunction = function(_, _, _, _, _)
			-- upvalues: self (ref), constantsModule (copy)
			self:dragUiGroupStep(constantsModule.SpatialUIGroupType.MainUIGroup)
		end,
		dragStartFunction = function(_, _, _, _, _, _, _)
			-- upvalues: self (ref), constantsModule (copy)
			self:dragUiGroupStart(constantsModule.SpatialUIGroupType.MainUIGroup)
		end,
		dragEndFunction = function(_)
			-- upvalues: self (ref), constantsModule (copy)
			self:dragUiGroupEnd(constantsModule.SpatialUIGroupType.MainUIGroup)
		end
	})
	local t = { draggable = true, headScale = 1 }
	local t_1 = { uiGroupHeadRotation = var2 }
	local cFrame = workspace.CurrentCamera.CFrame
	local var5 = (cFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(var2)
	local var6, var7, _ = var5:ToOrientation()
	t_1.uiGroupCameraOffSet = cFrame:ToObjectSpace(CFrame.new(var5.Position) * CFrame.fromOrientation(var6, var7, 0))
	t_1.defaultGroupHeadRotation = var2
	t.positionProps = t_1
	t.uiContainerSize = vector2
	t.dragBar = var4
	t.dragBarOffset = CFrame.new(0, constantsModule.ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP[panelType.BottomBar].Y - 0.075 - 0.066666666667, 0)
	self.uiGroups[constantsModule.SpatialUIGroupType.MainUIGroup] = t
end

function t:step()
	-- upvalues: VRService (ref), spatialUIType (ref), panelType (ref), isInExperienceUIVREnabled (ref), spatialUIDisableBottomBarFading (ref), spatialUIEnablePanelsRefocusing (ref), fIntUIResetDelayInSec (ref)
	if not VRService.VREnabled then return end
	for i, v in pairs(self.uiElements) do
		if (v ~= nil and (v.panelObject ~= nil and v.uiType ~= spatialUIType.ScreenUI)) and i == panelType.RobloxGui then
			local var4, var5, _ = (if v.uiType == spatialUIType.SpatialUI then v.panelObject.Adornee else v.panelObject).CFrame:ToOrientation()
			local var6, var7, _ = (workspace.CurrentCamera.CFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToOrientation()
			
			if isInExperienceUIVREnabled and not spatialUIDisableBottomBarFading and self.uiGroupHelper then
				self.uiGroupHelper:animateBottomBarOnHeadMoveIfNeeded(self.uiElements, Vector2.new(var4, var5), Vector2.new(var6, var7))
			end
			if not isInExperienceUIVREnabled or not spatialUIEnablePanelsRefocusing or math.abs(var5 - var7) <= 1.745329251994 and math.abs(var4 - var6) <= 1.745329251994 then
				self.uiGroupsOutOfViewTimeStamp = nil
			elseif not self.uiGroupsOutOfViewTimeStamp then
				self.uiGroupsOutOfViewTimeStamp = os.clock()
			elseif fIntUIResetDelayInSec <= os.clock() - self.uiGroupsOutOfViewTimeStamp then
				self:updateUIGroupsForCurHeadCFrame()
				self.uiGroupsOutOfViewTimeStamp = nil
			end
		end
	end
end

function t:prepareGuiToggleAnimationState()
	if self.uiGroupHelper:isTopBarVisible() then
		self.uiGroupHelper:prepareGuiToggleAnimationState(self.uiElements)
	end
end

function t:onShowTopBarChanged()
	-- upvalues: isInExperienceUIVREnabled (ref), VRService (ref), var1 (write), spatialUIType (ref)
	if isInExperienceUIVREnabled then return end
	if not VRService.VREnabled then return end
	if var1 and var1.ShowTopBar then
		for i, v in pairs(self.uiGroups) do
			if v.draggable and v.dragBar then
				v.dragBar:show()
			end
		end
		for i, v_1 in pairs(self.uiElements) do
			if v_1.uiType == spatialUIType.SpatialUI or v_1.uiType == spatialUIType.SpatialUIRoact then
				local panelObject = v_1.panelObject
				panelObject.Enabled = true
				panelObject.Adornee.Parent = workspace
			elseif v_1.uiType == spatialUIType.SpatialUIPartOnly then
				v_1.panelObject.Parent = workspace
			end
		end
		return
	else
		for i, v_1 in pairs(self.uiGroups) do
			if v_1.draggable and v_1.dragBar then
				v_1.dragBar:hide()
			end
		end
		for i, v_1 in pairs(self.uiElements) do
			if v_1.uiType == spatialUIType.SpatialUI or v_1.uiType == spatialUIType.SpatialUIRoact then
				local panelObject = v_1.panelObject
				panelObject.Enabled = false
				panelObject.Adornee.Parent = nil
			elseif v_1.uiType == spatialUIType.SpatialUIPartOnly then
				v_1.panelObject.Parent = nil
			end
		end
	end
end

function t:updateUIGroupsForCurCamera(p2, p3)
	-- upvalues: VRService (ref), spatialUIType (ref), isInExperienceUIVREnabled (ref), inExperienceUIVRIXP (ref)
	if not VRService.VREnabled then return end
	for i, v in pairs(self.uiGroups) do
		if p2 == nil and v.draggable then
			v.dragBar:setCFrame((p3 or workspace.CurrentCamera.CFrame) * v.positionProps.uiGroupCameraOffSet:ToWorldSpace(v.dragBarOffset))
		end
	end
	for i_1, v_1 in pairs(self.uiElements) do
		if p2 == nil or p2 == i_1 then
			local var8 = v_1 ~= nil and (v_1.panelObject ~= nil and v_1.uiType ~= spatialUIType.ScreenUI)
			
			if var8 and v_1.panelPositionProps and v_1.panelPositionProps.cameraFixedPanelProp then
				var8 = v_1.panelPositionProps
				local cameraFixedPanelProp = var8.cameraFixedPanelProp
				local var9 = if v_1.uiType == spatialUIType.SpatialUI or v_1.uiType == spatialUIType.SpatialUIRoact then v_1.panelObject.Adornee elseif v_1.uiType == spatialUIType.SpatialUIPartOnly then v_1.panelObject else nil
				
				if var9 ~= nil then
					local var10 = p3 or workspace.CurrentCamera.CFrame
					
					if isInExperienceUIVREnabled and not inExperienceUIVRIXP:isSpatialUICameraTypeFixEnabled() then
						var10 = self.uiGroupHelper:getGroupCameraCFrameIfPossible(i_1, self.uiElements)
					end
					var9.CFrame = var10 * self.uiGroups[var8.uiGroup].positionProps.uiGroupCameraOffSet:ToWorldSpace(cameraFixedPanelProp.uiGroupElementOffset)
				end
				return
			end
		end
	end
end

function t:onMouseTargetChanged(p4)
	for i, v in pairs(self.uiGroups) do
		if v.draggable then
			if v.dragBar and v.dragBar.part == p4 then
				v.dragBar:startHover()
			elseif v.dragBar and v.dragBar.part ~= p4 then
				v.dragBar:hoverEnd()
			end
		end
	end
end

function t:resetDragAndDrop()
	for i, v in pairs(self.uiGroups) do
		if v.draggable and v.dragBar then
			v.dragBar:hide()
		end
	end
	self:setUpUiGroups(true)
	self:rescaleUIForCurrentHeadScale()
	self:updateUIGroupsForCurCamera()
end

function t.getAdditionalCameraScaleIfNeeded(_)
	-- upvalues: VRService (ref)
	return if VRService.VREnabled then workspace.CurrentCamera.HeadScale else 1
end

function t:rescaleUIForCurrentHeadScale(p5, p6)
	-- upvalues: isInExperienceUIVREnabled (ref), VRSpatialUIGuardNilHeadScale (ref), utilsModule (ref), spatialUIType (ref)
	local var11 = if isInExperienceUIVREnabled then self:getAdditionalCameraScaleIfNeeded() else workspace.CurrentCamera.HeadScale
	
	for i, v in pairs(self.uiGroups) do
		if p5 == nil then
			local var12 = var11 / (if VRSpatialUIGuardNilHeadScale then v.headScale or var11 else v.headScale)
			v.positionProps.uiGroupHeadRotation = utilsModule.rescaleCFramePosition(v.positionProps.uiGroupHeadRotation, var12)
			v.positionProps.uiGroupCameraOffSet = utilsModule.rescaleCFramePosition(v.positionProps.uiGroupCameraOffSet, var12)
			v.positionProps.defaultGroupHeadRotation = utilsModule.rescaleCFramePosition(v.positionProps.defaultGroupHeadRotation, var12)
			
			if v.draggable then
				v.dragBarOffset = utilsModule.rescaleCFramePosition(v.dragBarOffset, var12)
				v.dragBar:rescale(var12)
			end
			v.headScale = var11
			
			if isInExperienceUIVREnabled then
				v.lastCameraCFrame = workspace.CurrentCamera.CFrame
			end
		end
	end
	for i_1, v_1 in pairs(self.uiElements) do
		if p6 == nil or p6 == i_1 then
			local var13 = var11 / (if VRSpatialUIGuardNilHeadScale then v_1.headScale or var11 else v_1.headScale)
			
			if v_1.uiType ~= spatialUIType.SpatialUIRoact then
				local var14 = if v_1.uiType == spatialUIType.SpatialUI or v_1.uiType == spatialUIType.SpatialUIRoact then v_1.panelObject.Adornee elseif v_1.uiType == spatialUIType.SpatialUIPartOnly then v_1.panelObject else nil
				
				if var14 ~= nil then
					var14.Size *= var13
				end
			end
			local panelPositionProps = v_1.panelPositionProps
			
			if panelPositionProps and panelPositionProps.cameraFixedPanelProp then
				panelPositionProps.cameraFixedPanelProp.uiGroupElementOffset = utilsModule.rescaleCFramePosition(panelPositionProps.cameraFixedPanelProp.uiGroupElementOffset, var13)
			end
			v_1.headScale = var11
		end
	end
end

function t.new()
	-- upvalues: isInExperienceUIVREnabled (ref), UIGroupHelperModule (write), stableCameraCacheModule (write), t (ref), runService (ref), var1 (write), inExperienceUIVRIXP (ref), playersService (ref)
	local t_1 = {
		currentMouseTarget = nil,
		uiGroupsOutOfViewTimeStamp = nil,
		uiElements = {},
		uiGroups = {},
		uiGroupHelper = {},
		stableCameraCache = {}
	}
	
	if isInExperienceUIVREnabled then
		t_1.uiGroupHelper = UIGroupHelperModule.new(false)
		t_1.stableCameraCache = stableCameraCacheModule.new()
	end
	setmetatable(t_1, t)
	t_1:setUpUiGroups()
	t_1:rescaleUIForCurrentHeadScale()
	t_1:updateUIGroupsForCurCamera()
	runService:BindToRenderStep("UIManagerRenderStep", Enum.RenderPriority.Last.Value, function()
		-- upvalues: t_1 (ref)
		t_1:step()
	end)
	
	if not isInExperienceUIVREnabled and var1 then
		var1.ShowTopBarChanged.Event:connect(function()
			-- upvalues: t_1 (ref)
			t_1:onShowTopBarChanged()
		end)
	end
	local currentCamera = workspace.CurrentCamera
	currentCamera:GetPropertyChangedSignal("CFrame"):Connect(function()
		-- upvalues: isInExperienceUIVREnabled (copy), inExperienceUIVRIXP (copy), t_1 (ref)
		if isInExperienceUIVREnabled and inExperienceUIVRIXP:isSpatialUICameraTypeFixEnabled() then
			if t_1.stableCameraCache:updateAndCheckCameraMoved() then
				t_1:updateUIGroupsForCurCamera(nil, t_1.stableCameraCache:getCurrentStableCameraCFrame())
				
				return
			end
		else
			t_1:updateUIGroupsForCurCamera()
		end
	end)
	currentCamera:GetPropertyChangedSignal("HeadScale"):Connect(function()
		-- upvalues: t_1 (ref)
		t_1:rescaleUIForCurrentHeadScale()
		t_1:updateUIGroupsForCurHeadCFrame()
	end)
	local mouse = playersService.LocalPlayer:GetMouse()
	
	if mouse then
		mouse.Move:Connect(function()
			-- upvalues: playersService (copy), t_1 (ref)
			local mouse = playersService.LocalPlayer:GetMouse()
			
			if mouse.Target ~= t_1.currentMouseTarget then
				t_1:onMouseTargetChanged(mouse.Target)
				t_1.currentMouseTarget = mouse.Target
			end
		end)
	end
	return t_1
end

function t:getBottomBarVisibility()
	-- upvalues: spatialUIDisableBottomBarInteractionOnAnimating (ref)
	return if spatialUIDisableBottomBarInteractionOnAnimating then nil else self.uiGroupHelper:getBottomBarVisibility()
end

function t:isBottomBarInteractionOnAnimationSupported()
	-- upvalues: spatialUIDisableBottomBarInteractionOnAnimating (ref)
	return if spatialUIDisableBottomBarInteractionOnAnimating then false else self.uiGroupHelper:getBottomBarVisibility():get()
end

function t.getInstance()
	-- upvalues: var3 (write), t (ref)
	if var3 == nil then
		var3 = t.new()
	end
	return var3
end

return t