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
local vector2 = Vector2.new(2.666666666667, 1.866666666667)
local var18 = (if isInExperienceUIVREnabled then CFrame.new(0, 0, math.min(math.max(spatialUIPanelDistance, 0), 500) / 100 * -1 * 3.333333333333) else CFrame.new(-0.466666666667, -0.8, -2.133333333333)) * (if isInExperienceUIVREnabled then CFrame.Angles(0, 0, 0) else CFrame.Angles(-0.314159265359, 0.174532925199, 0))

local function _(p0) --[[ line: 62 | named "getZAxisStablizedCFrame" ]]
	local var21, var22, _ = p0:ToOrientation()
	
	return CFrame.new(p0.Position) * CFrame.fromOrientation(var21, var22, 0)
end

local _ = function(value, p1) --[[ line: 67 | named "getCameraOffsetFromHeadRotationWithZAxisStabl" ]]
	-- upvalues: VRService (ref)
	p1 = p1 or workspace.CurrentCamera.CFrame
	local var24 = (p1 * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(value)
	local var25, var26, _ = var24:ToOrientation()
	
	return p1:ToObjectSpace(CFrame.new(var24.Position) * CFrame.fromOrientation(var25, var26, 0))
end

local _ = function(p2) --[[ line: 76 | named "getPanelPart" ]]
	-- upvalues: spatialUIType (ref)
	return if p2.uiType == spatialUIType.SpatialUI or p2.uiType == spatialUIType.SpatialUIRoact then p2.panelObject.Adornee elseif p2.uiType == spatialUIType.SpatialUIPartOnly then p2.panelObject else nil
end

local _ = function(p3) --[[ line: 87 | named "panelExistsInSpace" ]]
	-- upvalues: spatialUIType (ref)
	return p3 ~= nil and (p3.panelObject ~= nil and p3.uiType ~= spatialUIType.ScreenUI)
end

function createUIGroup(p4, p5, p6) --[[ line: 91 ]]
	-- upvalues: vector2 (ref), var18 (ref), VRService (ref)
	local uiGroupHelper = p4.uiGroupHelper
	local t = { uiGroupHeadRotation = var18 }
	local cFrame = workspace.CurrentCamera.CFrame
	local var28 = (cFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(var18)
	local var29, var30, _ = var28:ToOrientation()
	t.uiGroupCameraOffSet = cFrame:ToObjectSpace(CFrame.new(var28.Position) * CFrame.fromOrientation(var29, var30, 0))
	t.defaultGroupHeadRotation = var18
	p4.uiGroups[p5] = uiGroupHelper:createUIGroup(p4, p5, vector2, t, p4.uiElements, p6)
end

local t = {}
local var20 = nil
t.__index = t

function t:removeRoactPanel(p7) --[[ line: 125 ]]
	-- upvalues: isInExperienceUIVREnabled (ref)
	if isInExperienceUIVREnabled then
		self:disconnectPanelVisibility(p7)
	end
	self.uiElements[p7] = nil
end

function t:registerRoactPanel(p8, p9, p10) --[[ line: 132 ]]
	-- upvalues: isInExperienceUIVREnabled (ref), inExperienceUIVRIXP (ref), observableModule (ref)
	self.uiElements[p8] = p9
	
	if isInExperienceUIVREnabled then
		local var31 = self.uiGroupHelper:checkAndGetUIGroupTypeForTempPanel(p8, self.uiElements)
		
		if var31 == nil then
			self:rescaleUIForCurrentHeadScale()
			self:updateUIGroupsForCurHeadCFrame()
		else
			self:rescaleUIForCurrentHeadScale(var31, p8)
			
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

function t:createUI(p11) --[[ line: 169 ]]
	-- upvalues: createCompatPanelModule (ref)
	local var32 = createCompatPanelModule(p11)
	
	if var32 == nil then
		return nil
	end
	self.uiElements[p11.panelType] = var32
	self:updatePanelForCurHeadCFrame(p11.panelType)
	
	return { type = var32.uiType, panelObject = var32.panelObject }
end

function t:getPanelObject(p12) --[[ line: 182 ]]
	local var33 = self.uiElements[p12]
	
	return if var33 then var33.panelObject else nil
end

function t:getPanelSizeInPixel(p13) --[[ line: 191 ]]
	-- upvalues: constantsModule (ref)
	return self:getScaledPartSizeInPixel(p13) * constantsModule.VR_PANEL_RESOLUTION_MULTIPLIER
end

function t.getScaledPartSizeInPixel(_, p14) --[[ line: 196 ]]
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

function t:connectTopBarVisibility(p15) --[[ line: 208 ]]
	self.uiGroupHelper:setTopBarVisible(p15, function() --[[ line: 209 ]]
		-- upvalues: self (ref)
		self.uiGroupHelper:updateAllElements(self.uiElements, self.uiGroups)
	end)
end

function t:connectPanelVisibility(p16, p17) --[[ line: 214 ]]
	self.uiGroupHelper:connectPanelVisibility(p16, p17, self.uiElements, self.uiGroups)
end

function t:disconnectPanelVisibility(p18) --[[ line: 222 ]]
	self.uiGroupHelper:disconnectPanelVisibility(p18, self.uiElements, self.uiGroups)
end

function t:updateUIGroupForCurHeadCFrame(p19, p20) --[[ line: 226 ]]
	-- upvalues: VRService (ref)
	local var34 = self.uiGroups[p19]
	local cFrame = workspace.CurrentCamera.CFrame
	local uiGroupHeadRotation = (cFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(var34.positionProps.uiGroupHeadRotation)
	local var36, var37, _ = uiGroupHeadRotation:ToOrientation()
	local var38 = cFrame:ToObjectSpace(CFrame.new(uiGroupHeadRotation.Position) * CFrame.fromOrientation(var36, var37, 0))
	var34.positionProps.uiGroupCameraOffSet = var38
	
	if var34.draggable and var34.dragBar and not (p20 or false) then
		var34.dragBar:setCFrame(workspace.CurrentCamera.CFrame * var38:ToWorldSpace(var34.dragBarOffset))
	end
	self:updatePanelsInUIGroupForCurHeadCFrame(p19)
end

function t:updateUIGroupsForCurHeadCFrame() --[[ line: 247 ]]
	for i, v in pairs(self.uiGroups) do
		self:updateUIGroupForCurHeadCFrame(i)
	end
end

function t:updatePanelForCurHeadCFrame(p21) --[[ line: 253 ]]
	-- upvalues: spatialUIType (ref), VRService (ref)
	local var39 = self.uiElements[p21]
	local var40 = var39 ~= nil and (var39.panelObject ~= nil and var39.uiType ~= spatialUIType.ScreenUI)
	
	if var40 and var39.panelPositionProps and var39.panelPositionProps.cameraFixedPanelProp then
		var40 = var39.panelPositionProps
		local cameraFixedPanelProp = var40.cameraFixedPanelProp
		local cFrame = workspace.CurrentCamera.CFrame
		local uiGroupHeadRotation = (cFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(self.uiGroups[var40.uiGroup].positionProps.uiGroupHeadRotation)
		local var42, var43, _ = uiGroupHeadRotation:ToOrientation()
		local var44 = cFrame:ToObjectSpace(CFrame.new(uiGroupHeadRotation.Position) * CFrame.fromOrientation(var42, var43, 0))
		local var45 = if var39.uiType == spatialUIType.SpatialUI or var39.uiType == spatialUIType.SpatialUIRoact then var39.panelObject.Adornee elseif var39.uiType == spatialUIType.SpatialUIPartOnly then var39.panelObject else nil
		
		if var45 == nil then return end
		var45.CFrame = workspace.CurrentCamera.CFrame * var44
		var45.CFrame = var45.CFrame:ToWorldSpace(cameraFixedPanelProp.uiGroupElementOffset)
	end
end

function t:updatePanelsInUIGroupForCurHeadCFrame(p22) --[[ line: 275 ]]
	for i, v in pairs(self.uiElements) do
		if v.panelPositionProps and v.panelPositionProps.uiGroup == p22 then
			self:updatePanelForCurHeadCFrame(i)
		end
	end
end

function t:updatePanelsForCurHeadCFrame() --[[ line: 289 ]]
	for i, v in pairs(self.uiElements) do
		self:updatePanelForCurHeadCFrame(i)
	end
end

function t:dragUiGroupStart(p23) --[[ line: 295 ]]
	if self.uiGroups[p23].draggable == false then
		return
	end
	local dragBar = self.uiGroups[p23].dragBar
	dragBar:startDrag(dragBar:getCFrame():ToObjectSpace(workspace.CurrentCamera.CFrame:ToWorldSpace(self.uiGroups[p23].positionProps.uiGroupCameraOffSet)))
end

function t:dragUiGroupEnd(p24) --[[ line: 307 ]]
	if self.uiGroups[p24].draggable == false then
		return
	end
	self.uiGroups[p24].dragBar:dragEnd()
end

function t:dragUiGroupStep(p25) --[[ line: 315 ]]
	-- upvalues: VRService (ref)
	if self.uiGroups[p25].draggable == false then
		return
	end
	local dragBar = self.uiGroups[p25].dragBar
	local var46 = workspace.CurrentCamera.CFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)
	local cFrame = dragBar:getCFrame()
	local var48, var49, _ = (CFrame.lookAt(cFrame.Position, Vector3.new(var46.Position.X, var46.Position.Y - 0.666666666667, var46.Position.Z)) * CFrame.Angles(0, 3.14159265359, 0)):ToEulerAnglesXYZ()
	local _, _, var50 = cFrame:ToEulerAnglesXYZ()
	local var51 = CFrame.new(cFrame.Position) * CFrame.Angles(var48, var49, var50)
	local var52, var53, _ = var51:ToOrientation()
	dragBar:setCFrame(CFrame.new(var51.Position) * CFrame.fromOrientation(var52, var53, 0))
	self.uiGroups[p25].positionProps.uiGroupHeadRotation = var46:ToObjectSpace(dragBar:getCFrame():ToWorldSpace(dragBar.uiGroupOffSet))
	self:updateUIGroupForCurHeadCFrame(p25, true)
end

function t:setUpUiGroups(p26) --[[ line: 347 ]]
	-- upvalues: isInExperienceUIVREnabled (ref), constantsModule (ref), createUIGroupDragBarModule (ref), var18 (ref), VRService (ref), vector2 (ref), panelType (ref)
	if isInExperienceUIVREnabled then
		createUIGroup(self, constantsModule.SpatialUIGroupType.MainUIGroup, p26)
		createUIGroup(self, constantsModule.SpatialUIGroupType.MenuUIGroup, p26)
		createUIGroup(self, constantsModule.SpatialUIGroupType.ChatUIGroup, p26)
		createUIGroup(self, constantsModule.SpatialUIGroupType.ChromeSubMenuUIGroup, p26)
		self.uiGroupHelper:updateAllDragBar(self.uiElements, self.uiGroups)
		
		return
	end
	local var54 = createUIGroupDragBarModule({
		name = "MainUIGroup",
		dragFunction = function(_, _, _, _, _) --[[ line: 359 ]]
			-- upvalues: self (ref), constantsModule (copy)
			self:dragUiGroupStep(constantsModule.SpatialUIGroupType.MainUIGroup)
		end,
		dragStartFunction = function(_, _, _, _, _, _, _) --[[ line: 362 ]]
			-- upvalues: self (ref), constantsModule (copy)
			self:dragUiGroupStart(constantsModule.SpatialUIGroupType.MainUIGroup)
		end,
		dragEndFunction = function(_) --[[ line: 365 ]]
			-- upvalues: self (ref), constantsModule (copy)
			self:dragUiGroupEnd(constantsModule.SpatialUIGroupType.MainUIGroup)
		end
	})
	local t = { draggable = true, headScale = 1 }
	local t_1 = { uiGroupHeadRotation = var18 }
	local cFrame = workspace.CurrentCamera.CFrame
	local var57 = (cFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(var18)
	local var58, var59, _ = var57:ToOrientation()
	t_1.uiGroupCameraOffSet = cFrame:ToObjectSpace(CFrame.new(var57.Position) * CFrame.fromOrientation(var58, var59, 0))
	t_1.defaultGroupHeadRotation = var18
	t.positionProps = t_1
	t.uiContainerSize = vector2
	t.dragBar = var54
	t.dragBarOffset = CFrame.new(0, constantsModule.ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP[panelType.BottomBar].Y - 0.075 - 0.066666666667, 0)
	self.uiGroups[constantsModule.SpatialUIGroupType.MainUIGroup] = t
end

function t:step() --[[ line: 390 ]]
	-- upvalues: VRService (ref), spatialUIType (ref), panelType (ref), isInExperienceUIVREnabled (ref), spatialUIDisableBottomBarFading (ref), spatialUIEnablePanelsRefocusing (ref), fIntUIResetDelayInSec (ref)
	if not VRService.VREnabled then return end
	for i, v in pairs(self.uiElements) do
		if (v ~= nil and (v.panelObject ~= nil and v.uiType ~= spatialUIType.ScreenUI)) and i == panelType.RobloxGui then
			local var60, var61, _ = (if v.uiType == spatialUIType.SpatialUI then v.panelObject.Adornee else v.panelObject).CFrame:ToOrientation()
			local var62, var63, _ = (workspace.CurrentCamera.CFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)):ToOrientation()
			
			if isInExperienceUIVREnabled and not spatialUIDisableBottomBarFading and self.uiGroupHelper then
				self.uiGroupHelper:animateBottomBarOnHeadMoveIfNeeded(self.uiElements, Vector2.new(var60, var61), Vector2.new(var62, var63))
			end
			if not isInExperienceUIVREnabled or not spatialUIEnablePanelsRefocusing or math.abs(var61 - var63) <= 1.745329251994 and math.abs(var60 - var62) <= 1.745329251994 then
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

function t:prepareGuiToggleAnimationState() --[[ line: 441 ]]
	if self.uiGroupHelper:isTopBarVisible() then
		self.uiGroupHelper:prepareGuiToggleAnimationState(self.uiElements)
	end
end

function t:onShowTopBarChanged() --[[ line: 447 ]]
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

function t:updateUIGroupsForCurCamera(p27, p28) --[[ line: 491 ]]
	-- upvalues: VRService (ref), spatialUIType (ref), isInExperienceUIVREnabled (ref), inExperienceUIVRIXP (ref)
	if not VRService.VREnabled then return end
	for i, v in pairs(self.uiGroups) do
		if p27 == nil and v.draggable then
			v.dragBar:setCFrame((p28 or workspace.CurrentCamera.CFrame) * v.positionProps.uiGroupCameraOffSet:ToWorldSpace(v.dragBarOffset))
		end
	end
	for i_1, v_1 in pairs(self.uiElements) do
		if p27 == nil or p27 == i_1 then
			local var64 = v_1 ~= nil and (v_1.panelObject ~= nil and v_1.uiType ~= spatialUIType.ScreenUI)
			
			if var64 and v_1.panelPositionProps and v_1.panelPositionProps.cameraFixedPanelProp then
				var64 = v_1.panelPositionProps
				local cameraFixedPanelProp = var64.cameraFixedPanelProp
				local var65 = if v_1.uiType == spatialUIType.SpatialUI or v_1.uiType == spatialUIType.SpatialUIRoact then v_1.panelObject.Adornee elseif v_1.uiType == spatialUIType.SpatialUIPartOnly then v_1.panelObject else nil
				
				if var65 ~= nil then
					local var66 = p28 or workspace.CurrentCamera.CFrame
					
					if isInExperienceUIVREnabled and not inExperienceUIVRIXP:isSpatialUICameraTypeFixEnabled() then
						var66 = self.uiGroupHelper:getGroupCameraCFrameIfPossible(i_1, self.uiElements)
					end
					var65.CFrame = var66 * self.uiGroups[var64.uiGroup].positionProps.uiGroupCameraOffSet:ToWorldSpace(cameraFixedPanelProp.uiGroupElementOffset)
				end
				return
			end
		end
	end
end

function t:onMouseTargetChanged(p29) --[[ line: 539 ]]
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

function t:resetDragAndDrop() --[[ line: 551 ]]
	for i, v in pairs(self.uiGroups) do
		if v.draggable and v.dragBar then
			v.dragBar:hide()
		end
	end
	self:setUpUiGroups(true)
	self:rescaleUIForCurrentHeadScale()
	self:updateUIGroupsForCurCamera()
end

function t.getAdditionalCameraScaleIfNeeded(_) --[[ line: 564 ]]
	-- upvalues: VRService (ref)
	return if VRService.VREnabled then workspace.CurrentCamera.HeadScale else 1
end

function t:rescaleUIForCurrentHeadScale(p30, p31) --[[ line: 568 ]]
	-- upvalues: isInExperienceUIVREnabled (ref), utilsModule (ref), spatialUIType (ref)
	local var67 = if isInExperienceUIVREnabled then self:getAdditionalCameraScaleIfNeeded() else workspace.CurrentCamera.HeadScale
	
	for i, v in pairs(self.uiGroups) do
		if p30 == nil then
			local var70 = var67 / v.headScale
			v.positionProps.uiGroupHeadRotation = utilsModule.rescaleCFramePosition(v.positionProps.uiGroupHeadRotation, var70)
			v.positionProps.uiGroupCameraOffSet = utilsModule.rescaleCFramePosition(v.positionProps.uiGroupCameraOffSet, var70)
			v.positionProps.defaultGroupHeadRotation = utilsModule.rescaleCFramePosition(v.positionProps.defaultGroupHeadRotation, var70)
			
			if v.draggable then
				v.dragBarOffset = utilsModule.rescaleCFramePosition(v.dragBarOffset, var70)
				v.dragBar:rescale(var70)
			end
			v.headScale = var67
			
			if isInExperienceUIVREnabled then
				v.lastCameraCFrame = workspace.CurrentCamera.CFrame
			end
		end
	end
	for i_1, v_1 in pairs(self.uiElements) do
		if p31 == nil or p31 == i_1 then
			local var68 = var67 / v_1.headScale
			
			if v_1.uiType ~= spatialUIType.SpatialUIRoact then
				local var69 = if v_1.uiType == spatialUIType.SpatialUI or v_1.uiType == spatialUIType.SpatialUIRoact then v_1.panelObject.Adornee elseif v_1.uiType == spatialUIType.SpatialUIPartOnly then v_1.panelObject else nil
				
				if var69 ~= nil then
					var69.Size *= var68
				end
			end
			local panelPositionProps = v_1.panelPositionProps
			
			if panelPositionProps and panelPositionProps.cameraFixedPanelProp then
				panelPositionProps.cameraFixedPanelProp.uiGroupElementOffset = utilsModule.rescaleCFramePosition(panelPositionProps.cameraFixedPanelProp.uiGroupElementOffset, var68)
			end
			v_1.headScale = var67
		end
	end
end

function t.new() --[[ line: 621 ]]
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
	runService:BindToRenderStep("UIManagerRenderStep", Enum.RenderPriority.Last.Value, function() --[[ line: 641 ]]
		-- upvalues: t_1 (ref)
		t_1:step()
	end)
	
	if not isInExperienceUIVREnabled and var4 then
		var4.ShowTopBarChanged.Event:connect(function() --[[ line: 647 ]]
			-- upvalues: t_1 (ref)
			t_1:onShowTopBarChanged()
		end)
	end
	local currentCamera = workspace.CurrentCamera
	currentCamera:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ line: 654 ]]
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
	currentCamera:GetPropertyChangedSignal("HeadScale"):Connect(function() --[[ line: 665 ]]
		-- upvalues: t_1 (ref)
		t_1:rescaleUIForCurrentHeadScale()
		t_1:updateUIGroupsForCurHeadCFrame()
	end)
	local mouse = playersService.LocalPlayer:GetMouse()
	
	if mouse then
		mouse.Move:Connect(function() --[[ line: 673 ]]
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

function t:getBottomBarVisibility() --[[ line: 686 ]]
	-- upvalues: spatialUIDisableBottomBarInteractionOnAnimating (ref)
	return if spatialUIDisableBottomBarInteractionOnAnimating then nil else self.uiGroupHelper:getBottomBarVisibility()
end

function t:isBottomBarInteractionOnAnimationSupported() --[[ line: 693 ]]
	-- upvalues: spatialUIDisableBottomBarInteractionOnAnimating (ref)
	return if spatialUIDisableBottomBarInteractionOnAnimating then false else self.uiGroupHelper:getBottomBarVisibility():get()
end

function t.getInstance() --[[ line: 700 ]]
	-- upvalues: var20 (write), t (ref)
	if var20 == nil then
		var20 = t.new()
	end
	return var20
end

return t