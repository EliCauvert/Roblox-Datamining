local vrSpatialUi = script:FindFirstAncestor("VrSpatialUi")
local parent = vrSpatialUi.Parent
local _ = require(parent.AppCommonLib)
local observableModule = require(parent.Observable)
local constantsModule = require(vrSpatialUi.Constants)
local createUIGroupDragBarModule = require(vrSpatialUi.createUIGroupDragBar)
local _ = require(vrSpatialUi.DragBar)
local UIGroupStateModule = require(vrSpatialUi.UIGroupState)
local panelManagedAnimatableModule = require(vrSpatialUi.PanelManagedAnimatable)
local fFlagEnableSpatialUIBottomBarFixPlaceFilterModule = require(vrSpatialUi.Flags.FFlagEnableSpatialUIBottomBarFixPlaceFilter)
local inExperienceUIVRIXP = require(parent.SharedExperimentDefinition).InExperienceUIVRIXP
local spatialUIEnableCameraCacheFix = game:DefineFastFlag("SpatialUIEnableCameraCacheFix", false)
local radians = math.rad(game:DefineFastInt("SpatialUIRepositionDeviationAngle", 10))

function getUIGroupTypeForPanel(p0, p1) --[[ line: 46 ]]
	local var10 = if p1 then p0[p1] else nil
	
	if var10 == nil then
		return nil
	end
	local panelPositionProps = var10.panelPositionProps
	
	return if panelPositionProps then panelPositionProps.uiGroup else nil
end

function getDragBarSafely(p2) --[[ line: 62 ]]
	return if p2 and p2.dragBar and p2.draggable then p2.dragBar else nil
end

function isTempPanel(p3) --[[ line: 70 ]]
	-- upvalues: constantsModule (ref)
	return p3 == constantsModule.PanelType.ToolTipsContainer
end

function visitAllPanels(p4, p5) --[[ line: 74 ]]
	for i, v in pairs(p4) do
		p5(i, v)
	end
end

function visitDraggablePanels(p6, p7, p8) --[[ line: 83 ]]
	visitAllPanels(p6, function(p9, p10) --[[ line: 91 ]]
		-- upvalues: p7 (ref), p8 (ref)
		local panelPositionProps = p10.panelPositionProps
		
		if panelPositionProps and not isTempPanel(p9) and (panelPositionProps.cameraFixedPanelProp and panelPositionProps.uiGroup == p7) then
			p8(p9, panelPositionProps.cameraFixedPanelProp)
		end
	end)
end

function connect(p11, p12) --[[ line: 104 ]]
	return { value = p11, connection = p11:connect(p12) }
end

function disconnect(p13) --[[ line: 112 ]]
	if p13.connection then
		p13.connection:disconnect()
		p13.connection = nil
	end
end

function setPanelParent(value, p14) --[[ line: 119 ]]
	-- upvalues: constantsModule (ref)
	local var11 = p14 ~= nil
	
	if value.uiType == constantsModule.SpatialUIType.SpatialUI or value.uiType == constantsModule.SpatialUIType.SpatialUIRoact then
		local panelObject = value.panelObject
		panelObject.Enabled = var11
		local adornee = panelObject.Adornee
		adornee.CanCollide = false
		adornee.CanTouch = false
		adornee.Anchored = true
		adornee.Parent = p14
		
		return
	elseif value.uiType == constantsModule.SpatialUIType.SpatialUIPartOnly then
		value.panelObject.Parent = p14
	end
end

function setPanelEnabledWithoutReparent(value, p15) --[[ line: 143 ]]
	-- upvalues: constantsModule (ref)
	if value.uiType == constantsModule.SpatialUIType.SpatialUI or value.uiType == constantsModule.SpatialUIType.SpatialUIRoact then
		local panelObject = value.panelObject
		panelObject.Enabled = p15
		local adornee = panelObject.Adornee
		adornee.CanCollide = false
		adornee.CanTouch = false
		adornee.Anchored = true
	end
end

local t = {}
t.__index = t

function t:setTopBarVisible(p16, p17) --[[ line: 174 ]]
	self.topBarVisibleValue = connect(p16, p17)
end

function t:isTopBarVisible() --[[ line: 178 ]]
	return self.topBarVisibleValue.value:get()
end

function t:prepareGuiToggleAnimationState(_) --[[ line: 182 ]]
	-- upvalues: UIGroupStateModule (ref)
	self:setUIGroupState(UIGroupStateModule.GuiToggleAnimation)
end

function t:setUIGroupState(p18) --[[ line: 189 ]]
	self.uiGroupState = p18
end

function t:animateBottomBarOnHeadMoveIfNeeded(_, p19, p20) --[[ line: 193 ]]
	-- upvalues: UIGroupStateModule (ref), radians (ref)
	if self.uiGroupState ~= UIGroupStateModule.GuiToggleAnimation or self.currentBottomBarAnimatable == nil then return end
	if if radians >= math.abs(p19.X - p20.X) then radians < math.abs(p19.Y - p20.Y) else true then
		self.currentBottomBarAnimatable:animateHideIfNeeded(false)
		
		return
	end
	self.currentBottomBarAnimatable:animateShowIfNeeded()
end

function t:updateAllElements(p21, p22) --[[ line: 214 ]]
	-- upvalues: UIGroupStateModule (ref), constantsModule (ref), fFlagEnableSpatialUIBottomBarFixPlaceFilterModule (ref), panelManagedAnimatableModule (ref)
	local var12 = self:isTopBarVisible()
	
	if var12 then
		self:setUIGroupState(UIGroupStateModule.Default)
		
		if self.currentBottomBarAnimatable then
			self.currentBottomBarAnimatable:reset()
			self.currentBottomBarAnimatable = nil
		end
	end
	self:updateAllDragBar(p21, p22)
	visitAllPanels(p21, function(p23, p24) --[[ line: 228 ]]
		-- upvalues: constantsModule (copy), var12 (ref), fFlagEnableSpatialUIBottomBarFixPlaceFilterModule (copy), self (ref), UIGroupStateModule (copy), panelManagedAnimatableModule (copy)
		local var13 = p23 == constantsModule.PanelType.BottomBar
		
		if var12 then
			if fFlagEnableSpatialUIBottomBarFixPlaceFilterModule and var13 then
				setPanelEnabledWithoutReparent(p24, true)
				
				return
			end
			setPanelParent(p24, workspace)
			
			return
		elseif self.uiGroupState ~= UIGroupStateModule.GuiToggleAnimation or not var13 then
			if fFlagEnableSpatialUIBottomBarFixPlaceFilterModule and var13 then
				setPanelEnabledWithoutReparent(p24, false)
				
				return
			end
			setPanelParent(p24, nil)
		elseif not self.currentBottomBarAnimatable then
			self.currentBottomBarAnimatable = panelManagedAnimatableModule.create(p24.panelObject, self.bottomBarVisibility)
			
			if self.currentBottomBarAnimatable then
				self.currentBottomBarAnimatable:hideAndBlockAnimationUntilLookBackAgain()
				
				return
			end
		end
	end)
end

function t:connectPanelVisibility(p25, p26, p27, p28) --[[ line: 254 ]]
	if isTempPanel(p25) then return end
	self:disconnectPanelVisibility(p25, p27, p28)
	local var14 = getUIGroupTypeForPanel(p27, p25)
	
	if var14 then
		self.uiGroupVisibilityMap[var14] = connect(p26, function() --[[ line: 269 ]]
			-- upvalues: self (ref), p25 (ref), p27 (ref), p28 (ref)
			self:updateDragBar(p25, p27, p28)
		end)
		self:updateDragBar(p25, p27, p28)
		
		return
	end
end

function t:disconnectPanelVisibility(p29, p30, p31) --[[ line: 275 ]]
	if isTempPanel(p29) then return end
	local var15 = getUIGroupTypeForPanel(p30, p29)
	local var16 = if var15 then self.uiGroupVisibilityMap[var15] else nil
	
	if var16 then
		disconnect(var16)
		self.uiGroupVisibilityMap[var15] = nil
		self:updateDragBar(p29, p30, p31)
	end
end

function t:updateDragBar(p32, p33, p34) --[[ line: 295 ]]
	local var17 = getUIGroupTypeForPanel(p33, p32)
	local var18 = if var17 then p34[var17] else nil
	
	if not var18 or not var18.dragBar or (not var18.draggable or isTempPanel(p32)) then return end
	local var19 = self:isTopBarVisible()
	local var20 = self.uiGroupVisibilityMap[var17]
	
	if if var20 then var19 and var20.value:get() else false then
		var18.dragBar:show()
		
		return
	end
	var18.dragBar:hide()
end

function t:updateAllDragBar(p35, p36) --[[ line: 320 ]]
	for i, v in pairs(p35) do
		self:updateDragBar(i, p35, p36)
	end
end

function t:createUIGroup(p37, p38, p39, p40, p41, p42) --[[ line: 330 ]]
	-- upvalues: constantsModule (ref), createUIGroupDragBarModule (ref), inExperienceUIVRIXP (ref)
	local var21 = constantsModule.UIGROUP_INITITIAL_ROTATION_MAP[p38]
	local var22 = self.uiGroups[p38]
	local var23 = getDragBarSafely(var22)
	
	if p42 and var21 and (var23 and var23:isEverDragged()) then
		visitDraggablePanels(p41, p38, function(_, p43) --[[ line: 346 ]]
			-- upvalues: var22 (ref), var21 (ref)
			var22.dragBarOffset *= var21
			p43.uiGroupElementOffset *= var21
		end)
	end
	local t = nil
	local var25 = nil
	var25 = createUIGroupDragBarModule({
		name = p38,
		dragFunction = function(_, _, _, _, _) --[[ line: 355 ]]
			-- upvalues: p37 (ref), p38 (ref)
			p37:dragUiGroupStep(p38)
		end,
		dragStartFunction = function(_, _, _, _, _, _, _) --[[ line: 358 ]]
			-- upvalues: var21 (ref), t (write), var25 (write), p41 (ref), p38 (ref), p37 (ref)
			if var21 and t and (var25 and not var25:isEverDragged()) then
				var25:setCFrame(var25:getCFrame() * var21:Inverse())
				t.dragBarOffset *= var21:Inverse()
				visitDraggablePanels(p41, p38, function(_, p44) --[[ line: 367 ]]
					-- upvalues: var21 (copy)
					p44.uiGroupElementOffset *= var21:Inverse()
				end)
			end
			p37:dragUiGroupStart(p38)
		end,
		dragEndFunction = function(_) --[[ line: 375 ]]
			-- upvalues: p37 (ref), p38 (ref)
			p37:dragUiGroupEnd(p38)
		end,
		dragBarPartSize = constantsModule.DRAG_BAR_SIZE
	})
	var25:hide()
	t = {
		headScale = 1,
		positionProps = p40,
		uiContainerSize = p39,
		draggable = inExperienceUIVRIXP:isDraggingAllowed(),
		dragBar = var25,
		dragBarOffset = constantsModule.UIGROUP_DRAGBAR_OFFSET_MAP[p38]
	}
	self.uiGroups[p38] = t
	
	return t
end

function t.checkAndGetUIGroupTypeForTempPanel(_, p45, p46) --[[ line: 393 ]]
	return if isTempPanel(p45) then getUIGroupTypeForPanel(p46, p45) else nil
end

function t:getGroupCameraCFrameIfPossible(p47, p48) --[[ line: 404 ]]
	-- upvalues: spatialUIEnableCameraCacheFix (ref)
	local cFrame = workspace.CurrentCamera.CFrame
	
	if spatialUIEnableCameraCacheFix and isTempPanel(p47) then
		local var26 = getUIGroupTypeForPanel(p48, p47)
		
		if var26 ~= nil and self.uiGroups[var26].lastCameraCFrame then
			cFrame = self.uiGroups[var26].lastCameraCFrame
		end
	end
	return cFrame
end

function t:getBottomBarVisibility() --[[ line: 420 ]]
	return self.bottomBarVisibility
end

function t.new(p49) --[[ line: 424 ]]
	-- upvalues: observableModule (ref), UIGroupStateModule (ref), t (ref)
	local t_1 = {
		currentBottomBarAnimatable = nil,
		uiGroupVisibilityMap = {},
		topBarVisibleValue = { value = observableModule.ObservableValue.new(p49) },
		uiGroups = {},
		uiGroupState = UIGroupStateModule.Default,
		bottomBarVisibility = observableModule.ObservableValue.new(true)
	}
	setmetatable(t_1, t)
	
	return t_1
end

return t