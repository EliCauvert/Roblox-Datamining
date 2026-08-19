local vrSpatialUi = script:FindFirstAncestor("VrSpatialUi")
local parent = vrSpatialUi.Parent
local observableModule = require(parent.Observable)
local VRService = game:GetService("VRService")
local runService = game:GetService("RunService")
local isInExperienceUIVREnabled = require(parent.SharedExperimentDefinition).isInExperienceUIVREnabled
local inExperienceUIVRIXP = require(parent.SharedExperimentDefinition).InExperienceUIVRIXP
local var4 = if not isInExperienceUIVREnabled then require(parent.VrCommon).VRHub else nil
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
local var19 = (if isInExperienceUIVREnabled then CFrame.new(0, 0, math.min(math.max(spatialUIPanelDistance, 0), 500) / 100 * -1 * 3.333333333333) else CFrame.new(-0.466666666667, -0.8, -2.133333333333)) * (if isInExperienceUIVREnabled then CFrame.Angles(0, 0, 0) else CFrame.Angles(-0.314159265359, 0.174532925199, 0))

local function _(p0) --[[ line: 63 | named "getZAxisStablizedCFrame" ]]
	local var22, var23, _ = p0:ToOrientation()
	
	return CFrame.new(p0.Position) * CFrame.fromOrientation(var22, var23, 0)
end

local _ = function(value, p1) --[[ line: 68 | named "getCameraOffsetFromHeadRotationWithZAxisStabl" ]]
	-- upvalues: VRService (ref)
	p1 = p1 or workspace.CurrentCamera.CFrame
	local var25 = (p1 * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(value)
	local var26, var27, _ = var25:ToOrientation()
	
	return p1:ToObjectSpace(CFrame.new(var25.Position) * CFrame.fromOrientation(var26, var27, 0))
end

local _ = function(p2) --[[ line: 77 | named "getPanelPart" ]]
	-- upvalues: spatialUIType (ref)
	return if p2.uiType == spatialUIType.SpatialUI or p2.uiType == spatialUIType.SpatialUIRoact then p2.panelObject.Adornee elseif p2.uiType == spatialUIType.SpatialUIPartOnly then p2.panelObject else nil
end

local _ = function(p3) --[[ line: 88 | named "panelExistsInSpace" ]]
	-- upvalues: spatialUIType (ref)
	return p3 ~= nil and (p3.panelObject ~= nil and p3.uiType ~= spatialUIType.ScreenUI)
end

function createUIGroup(p4, p5, p6) --[[ line: 92 ]]
	-- upvalues: vector2 (ref), var19 (ref), VRService (ref)
	local uiGroupHelper = p4.uiGroupHelper
	local t = { uiGroupHeadRotation = var19 }
	local cFrame = workspace.CurrentCamera.CFrame
	local var29 = (cFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(var19)
	local var30, var31, _ = var29:ToOrientation()
	t.uiGroupCameraOffSet = cFrame:ToObjectSpace(CFrame.new(var29.Position) * CFrame.fromOrientation(var30, var31, 0))
	t.defaultGroupHeadRotation = var19
	p4.uiGroups[p5] = uiGroupHelper:createUIGroup(p4, p5, vector2, t, p4.uiElements, p6)
end

local t = {}
local var21 = nil
t.__index = t

function t:removeRoactPanel(p7) --[[ line: 126 ]]
	-- upvalues: isInExperienceUIVREnabled (ref)
	if isInExperienceUIVREnabled then
		self:disconnectPanelVisibility(p7)
	end
	self.uiElements[p7] = nil
end

function t:registerRoactPanel(p8, p9, p10) --[[ line: 133 ]]
	-- upvalues: isInExperienceUIVREnabled (ref), inExperienceUIVRIXP (ref), observableModule (ref)
	self.uiElements[p8] = p9
	
	if isInExperienceUIVREnabled then
		local var32 = self.uiGroupHelper:checkAndGetUIGroupTypeForTempPanel(p8, self.uiElements)
		
		if var32 == nil then
			self:rescaleUIForCurrentHeadScale()
			self:updateUIGroupsForCurHeadCFrame()
		else
			self:rescaleUIForCurrentHeadScale(var32, p8)
			
			if inExperienceUIVRIXP:isSpatialUICameraTypeFixEnabled() then
				self:updateUIGroupsForCurCamera(p8, self.stableCameraCache:getCurrentStableCameraCFrame())
			else
				self:updateUIGroupsForCurCamera(p8)
			end
		end
	else
		self:rescaleUIForCurrentHeadScale()
		self:updateUIGroupsForCurHeadCFrame()
	end
	if isInExperienceUIVREnabled then
		self:connectPanelVisibility(p8, p10 or observableModule.ObservableValue.new(true))
	end
end

function t:createUI(p11) --[[ line: 170 ]]
	-- upvalues: createCompatPanelModule (ref)
	local var33 = createCompatPanelModule(p11)
	
	if var33 == nil then
		return nil
	end
	self.uiElements[p11.panelType] = var33
	self:updatePanelForCurHeadCFrame(p11.panelType)
	
	return { type = var33.uiType, panelObject = var33.panelObject }
end

function t:getPanelObject(p12) --[[ line: 183 ]]
	local var34 = self.uiElements[p12]
	
	return if var34 then var34.panelObject else nil
end

function t:getPanelSizeInPixel(p13) --[[ line: 192 ]]
	-- upvalues: constantsModule (ref)
	return self:getScaledPartSizeInPixel(p13) * constantsModule.VR_PANEL_RESOLUTION_MULTIPLIER
end

function t.getScaledPartSizeInPixel(_, p14) --[[ line: 197 ]]
	-- upvalues: panelType (ref), constantsModule (ref)
	if p14 == panelType.BottomBar then
		return constantsModule.BOTTOM_BAR_SIZE
	end
	local spatialPanelProps = constantsModule.COMPAT_PANEL_PROPS_MAP[p14].spatialPanelProps
	
	if spatialPanelProps then
		local partSize = spatialPanelProps.partSize
		
		return Vector2.new(partSize.X, partSize.Y)
	end
	return Vector2.new(0, 0)
end

function t:connectTopBarVisibility(p15) --[[ line: 209 ]]
	self.uiGroupHelper:setTopBarVisible(p15, function() --[[ line: 210 ]]
		-- upvalues: self (ref)
		self.uiGroupHelper:updateAllElements(self.uiElements, self.uiGroups)
	end)
end

function t:connectPanelVisibility(p16, p17) --[[ line: 215 ]]
	self.uiGroupHelper:connectPanelVisibility(p16, p17, self.uiElements, self.uiGroups)
end

function t:disconnectPanelVisibility(p18) --[[ line: 223 ]]
	self.uiGroupHelper:disconnectPanelVisibility(p18, self.uiElements, self.uiGroups)
end

function t:updateUIGroupForCurHeadCFrame(p19, p20) --[[ line: 227 ]]
	-- upvalues: VRService (ref)
	local var35 = self.uiGroups[p19]
	local cFrame = workspace.CurrentCamera.CFrame
	local uiGroupHeadRotation = (cFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(var35.positionProps.uiGroupHeadRotation)
	local var37, var38, _ = uiGroupHeadRotation:ToOrientation()
	local var39 = cFrame:ToObjectSpace(CFrame.new(uiGroupHeadRotation.Position) * CFrame.fromOrientation(var37, var38, 0))
	var35.positionProps.uiGroupCameraOffSet = var39
	
	if var35.draggable and var35.dragBar and not (p20 or false) then
		var35.dragBar:setCFrame(workspace.CurrentCamera.CFrame * var39:ToWorldSpace(var35.dragBarOffset))
	end
	self:updatePanelsInUIGroupForCurHeadCFrame(p19)
end

function t:updateUIGroupsForCurHeadCFrame() --[[ line: 248 ]]
	for i, v in pairs(self.uiGroups) do
		self:updateUIGroupForCurHeadCFrame(i)
	end
end

function t:updatePanelForCurHeadCFrame(p21) --[[ line: 254 ]]
	-- upvalues: spatialUIType (ref), VRService (ref)
	local var40 = self.uiElements[p21]
	local var41 = var40 ~= nil and (var40.panelObject ~= nil and var40.uiType ~= spatialUIType.ScreenUI)
	
	if var41 and var40.panelPositionProps and var40.panelPositionProps.cameraFixedPanelProp then
		var41 = var40.panelPositionProps
		local cameraFixedPanelProp = var41.cameraFixedPanelProp
		local cFrame = workspace.CurrentCamera.CFrame
		local uiGroupHeadRotation = (cFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(self.uiGroups[var41.uiGroup].positionProps.uiGroupHeadRotation)
		local var43, var44, _ = uiGroupHeadRotation:ToOrientation()
		local var45 = cFrame:ToObjectSpace(CFrame.new(uiGroupHeadRotation.Position) * CFrame.fromOrientation(var43, var44, 0))
		local var46 = if var40.uiType == spatialUIType.SpatialUI or var40.uiType == spatialUIType.SpatialUIRoact then var40.panelObject.Adornee elseif var40.uiType == spatialUIType.SpatialUIPartOnly then var40.panelObject else nil
		
		if var46 == nil then return end
		var46.CFrame = workspace.CurrentCamera.CFrame * var45
		var46.CFrame = var46.CFrame:ToWorldSpace(cameraFixedPanelProp.uiGroupElementOffset)
	end
end

function t:updatePanelsInUIGroupForCurHeadCFrame(p22) --[[ line: 276 ]]
	for i, v in pairs(self.uiElements) do
		if v.panelPositionProps and v.panelPositionProps.uiGroup == p22 then
			self:updatePanelForCurHeadCFrame(i)
		end
	end
end

function t:updatePanelsForCurHeadCFrame() --[[ line: 290 ]]
	for i, v in pairs(self.uiElements) do
		self:updatePanelForCurHeadCFrame(i)
	end
end

function t:dragUiGroupStart(p23) --[[ line: 296 ]]
	if self.uiGroups[p23].draggable == false then
		return
	end
	local dragBar = self.uiGroups[p23].dragBar
	dragBar:startDrag(dragBar:getCFrame():ToObjectSpace(workspace.CurrentCamera.CFrame:ToWorldSpace(self.uiGroups[p23].positionProps.uiGroupCameraOffSet)))
end

function t:dragUiGroupEnd(p24) --[[ line: 308 ]]
	if self.uiGroups[p24].draggable == false then
		return
	end
	self.uiGroups[p24].dragBar:dragEnd()
end

function t:dragUiGroupStep(p25) --[[ line: 316 ]]
	-- upvalues: VRService (ref)
	if self.uiGroups[p25].draggable == false then
		return
	end
	local dragBar = self.uiGroups[p25].dragBar
	local var47 = workspace.CurrentCamera.CFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)
	local cFrame = dragBar:getCFrame()
	local var49, var50, _ = (CFrame.lookAt(cFrame.Position, Vector3.new(var47.Position.X, var47.Position.Y - 0.666666666667, var47.Position.Z)) * CFrame.Angles(0, 3.14159265359, 0)):ToEulerAnglesXYZ()
	local _, _, var51 = cFrame:ToEulerAnglesXYZ()
	local var52 = CFrame.new(cFrame.Position) * CFrame.Angles(var49, var50, var51)
	local var53, var54, _ = var52:ToOrientation()
	dragBar:setCFrame(CFrame.new(var52.Position) * CFrame.fromOrientation(var53, var54, 0))
	self.uiGroups[p25].positionProps.uiGroupHeadRotation = var47:ToObjectSpace(dragBar:getCFrame():ToWorldSpace(dragBar.uiGroupOffSet))
	self:updateUIGroupForCurHeadCFrame(p25, true)
end

function t:setUpUiGroups(p26) --[[ line: 348 ]]
	-- upvalues: isInExperienceUIVREnabled (ref), constantsModule (ref), createUIGroupDragBarModule (ref), var19 (ref), VRService (ref), vector2 (ref), panelType (ref)
	if isInExperienceUIVREnabled then
		createUIGroup(self, constantsModule.SpatialUIGroupType.MainUIGroup, p26)
		createUIGroup(self, constantsModule.SpatialUIGroupType.MenuUIGroup, p26)
		createUIGroup(self, constantsModule.SpatialUIGroupType.ChatUIGroup, p26)
		createUIGroup(self, constantsModule.SpatialUIGroupType.ChromeSubMenuUIGroup, p26)
		self.uiGroupHelper:updateAllDragBar(self.uiElements, self.uiGroups)
		
		return
	end
	local var55 = createUIGroupDragBarModule({
		name = "MainUIGroup",
		dragFunction = function(_, _, _, _, _) --[[ line: 360 ]]
			-- upvalues: self (ref), constantsModule (copy)
			self:dragUiGroupStep(constantsModule.SpatialUIGroupType.MainUIGroup)
		end,
		dragStartFunction = function(_, _, _, _, _, _, _) --[[ line: 363 ]]
			-- upvalues: self (ref), constantsModule (copy)
			self:dragUiGroupStart(constantsModule.SpatialUIGroupType.MainUIGroup)
		end,
		dragEndFunction = function(_) --[[ line: 366 ]]
			-- upvalues: self (ref), constantsModule (copy)
			self:dragUiGroupEnd(constantsModule.SpatialUIGroupType.MainUIGroup)
		end
	})
	local t = { draggable = true, headScale = 1 }
	local t_1 = { uiGroupHeadRotation = var19 }
	local cFrame = workspace.CurrentCamera.CFrame
	local var58 = (cFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(var19)
	local var59, var60, _ = var58:ToOrientation()
	t_1.uiGroupCameraOffSet = cFrame:ToObjectSpace(CFrame.new(var58.Position) * CFrame.fromOrientation(var59, var60, 0))
	t_1.defaultGroupHeadRotation = var19
	t.positionProps = t_1
	t.uiContainerSize = vector2
	t.dragBar = var55
	t.dragBarOffset = CFrame.new(0, constantsModule.ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP[panelType.BottomBar].Y - 0.075 - 0.066666666667, 0)
	self.uiGroups[constantsModule.SpatialUIGroupType.MainUIGroup] = t
end

function t:step() --[[ line: 391 ]]
	-- upvalues: VRService (ref), spatialUIType (ref), panelType (ref), isInExperienceUIVREnabled (ref), spatialUIDisableBottomBarFading (ref), spatialUIEnablePanelsRefocusing (ref), fIntUIResetDelayInSec (ref)
	if not VRService.VREnabled then return end
	for i, v in pairs(self.uiElements) do
		if (v ~= nil and (v.panelObject ~= nil and v.uiType ~= spatialUIType.ScreenUI)) and i == panelType.RobloxGui then
			local var61, var62, _ = (if v.uiType == spatialUIType.SpatialUI then v.panelObject.Adornee else v.panelObject).CFrame:ToOrientation()
			local var63, var64, _ = (workspace.CurrentCamera.CFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToOrientation()
			
			if isInExperienceUIVREnabled and not spatialUIDisableBottomBarFading and self.uiGroupHelper then
				self.uiGroupHelper:animateBottomBarOnHeadMoveIfNeeded(self.uiElements, Vector2.new(var61, var62), Vector2.new(var63, var64))
			end
			if not isInExperienceUIVREnabled or not spatialUIEnablePanelsRefocusing or math.abs(var62 - var64) <= 1.745329251994 and math.abs(var61 - var63) <= 1.745329251994 then
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

function t:prepareGuiToggleAnimationState() --[[ line: 442 ]]
	if self.uiGroupHelper:isTopBarVisible() then
		self.uiGroupHelper:prepareGuiToggleAnimationState(self.uiElements)
	end
end

function t:onShowTopBarChanged() --[[ line: 448 ]]
	-- upvalues: isInExperienceUIVREnabled (ref), VRService (ref), var4 (write), spatialUIType (ref)
	if isInExperienceUIVREnabled then return end
	if not VRService.VREnabled then return end
	if var4 and var4.ShowTopBar then
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

function t:updateUIGroupsForCurCamera(p27, p28) --[[ line: 492 ]]
	-- upvalues: VRService (ref), spatialUIType (ref), isInExperienceUIVREnabled (ref), inExperienceUIVRIXP (ref)
	if not VRService.VREnabled then return end
	for i, v in pairs(self.uiGroups) do
		if p27 == nil and v.draggable then
			v.dragBar:setCFrame((p28 or workspace.CurrentCamera.CFrame) * v.positionProps.uiGroupCameraOffSet:ToWorldSpace(v.dragBarOffset))
		end
	end
	for i_1, v_1 in pairs(self.uiElements) do
		if p27 == nil or p27 == i_1 then
			local var65 = v_1 ~= nil and (v_1.panelObject ~= nil and v_1.uiType ~= spatialUIType.ScreenUI)
			
			if var65 and v_1.panelPositionProps and v_1.panelPositionProps.cameraFixedPanelProp then
				var65 = v_1.panelPositionProps
				local cameraFixedPanelProp = var65.cameraFixedPanelProp
				local var66 = if v_1.uiType == spatialUIType.SpatialUI or v_1.uiType == spatialUIType.SpatialUIRoact then v_1.panelObject.Adornee elseif v_1.uiType == spatialUIType.SpatialUIPartOnly then v_1.panelObject else nil
				
				if var66 ~= nil then
					local var67 = p28 or workspace.CurrentCamera.CFrame
					
					if isInExperienceUIVREnabled and not inExperienceUIVRIXP:isSpatialUICameraTypeFixEnabled() then
						var67 = self.uiGroupHelper:getGroupCameraCFrameIfPossible(i_1, self.uiElements)
					end
					var66.CFrame = var67 * self.uiGroups[var65.uiGroup].positionProps.uiGroupCameraOffSet:ToWorldSpace(cameraFixedPanelProp.uiGroupElementOffset)
				end
				return
			end
		end
	end
end

function t:onMouseTargetChanged(p29) --[[ line: 540 ]]
	for i, v in pairs(self.uiGroups) do
		if v.draggable then
			if v.dragBar and v.dragBar.part == p29 then
				v.dragBar:startHover()
			elseif v.dragBar and v.dragBar.part ~= p29 then
				v.dragBar:hoverEnd()
			end
		end
	end
end

function t:resetDragAndDrop() --[[ line: 552 ]]
	for i, v in pairs(self.uiGroups) do
		if v.draggable and v.dragBar then
			v.dragBar:hide()
		end
	end
	self:setUpUiGroups(true)
	self:rescaleUIForCurrentHeadScale()
	self:updateUIGroupsForCurCamera()
end

function t.getAdditionalCameraScaleIfNeeded(_) --[[ line: 565 ]]
	-- upvalues: VRService (ref)
	return if VRService.VREnabled then workspace.CurrentCamera.HeadScale else 1
end

function t:rescaleUIForCurrentHeadScale(p30, p31) --[[ line: 569 ]]
	-- upvalues: isInExperienceUIVREnabled (ref), VRSpatialUIGuardNilHeadScale (ref), utilsModule (ref), spatialUIType (ref)
	local var68 = if isInExperienceUIVREnabled then self:getAdditionalCameraScaleIfNeeded() else workspace.CurrentCamera.HeadScale
	
	for i, v in pairs(self.uiGroups) do
		if p30 == nil then
			local var71 = var68 / (if VRSpatialUIGuardNilHeadScale then v.headScale or var68 else v.headScale)
			v.positionProps.uiGroupHeadRotation = utilsModule.rescaleCFramePosition(v.positionProps.uiGroupHeadRotation, var71)
			v.positionProps.uiGroupCameraOffSet = utilsModule.rescaleCFramePosition(v.positionProps.uiGroupCameraOffSet, var71)
			v.positionProps.defaultGroupHeadRotation = utilsModule.rescaleCFramePosition(v.positionProps.defaultGroupHeadRotation, var71)
			
			if v.draggable then
				v.dragBarOffset = utilsModule.rescaleCFramePosition(v.dragBarOffset, var71)
				v.dragBar:rescale(var71)
			end
			v.headScale = var68
			
			if isInExperienceUIVREnabled then
				v.lastCameraCFrame = workspace.CurrentCamera.CFrame
			end
		end
	end
	for i_1, v_1 in pairs(self.uiElements) do
		if p31 == nil or p31 == i_1 then
			local var69 = var68 / (if VRSpatialUIGuardNilHeadScale then v_1.headScale or var68 else v_1.headScale)
			
			if v_1.uiType ~= spatialUIType.SpatialUIRoact then
				local var70 = if v_1.uiType == spatialUIType.SpatialUI or v_1.uiType == spatialUIType.SpatialUIRoact then v_1.panelObject.Adornee elseif v_1.uiType == spatialUIType.SpatialUIPartOnly then v_1.panelObject else nil
				
				if var70 ~= nil then
					var70.Size *= var69
				end
			end
			local panelPositionProps = v_1.panelPositionProps
			
			if panelPositionProps and panelPositionProps.cameraFixedPanelProp then
				panelPositionProps.cameraFixedPanelProp.uiGroupElementOffset = utilsModule.rescaleCFramePosition(panelPositionProps.cameraFixedPanelProp.uiGroupElementOffset, var69)
			end
			v_1.headScale = var68
		end
	end
end

function t.new() --[[ line: 633 ]]
	-- upvalues: isInExperienceUIVREnabled (ref), UIGroupHelperModule (write), stableCameraCacheModule (write), t (ref), runService (ref), var4 (write), inExperienceUIVRIXP (ref), playersService (ref)
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
	runService:BindToRenderStep("UIManagerRenderStep", Enum.RenderPriority.Last.Value, function() --[[ line: 653 ]]
		-- upvalues: t_1 (ref)
		t_1:step()
	end)
	
	if not isInExperienceUIVREnabled and var4 then
		var4.ShowTopBarChanged.Event:connect(function() --[[ line: 659 ]]
			-- upvalues: t_1 (ref)
			t_1:onShowTopBarChanged()
		end)
	end
	local currentCamera = workspace.CurrentCamera
	currentCamera:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ line: 666 ]]
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
	currentCamera:GetPropertyChangedSignal("HeadScale"):Connect(function() --[[ line: 677 ]]
		-- upvalues: t_1 (ref)
		t_1:rescaleUIForCurrentHeadScale()
		t_1:updateUIGroupsForCurHeadCFrame()
	end)
	local mouse = playersService.LocalPlayer:GetMouse()
	
	if mouse then
		mouse.Move:Connect(function() --[[ line: 685 ]]
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

function t:getBottomBarVisibility() --[[ line: 698 ]]
	-- upvalues: spatialUIDisableBottomBarInteractionOnAnimating (ref)
	return if spatialUIDisableBottomBarInteractionOnAnimating then nil else self.uiGroupHelper:getBottomBarVisibility()
end

function t:isBottomBarInteractionOnAnimationSupported() --[[ line: 705 ]]
	-- upvalues: spatialUIDisableBottomBarInteractionOnAnimating (ref)
	return if spatialUIDisableBottomBarInteractionOnAnimating then false else self.uiGroupHelper:getBottomBarVisibility():get()
end

function t.getInstance() --[[ line: 712 ]]
	-- upvalues: var21 (write), t (ref)
	if var21 == nil then
		var21 = t.new()
	end
	return var21
end

return t