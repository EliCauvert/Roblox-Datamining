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

function getUIGroupTypeForPanel(p1, p2)
	local var1 = if p2 then p1[p2] else nil
	
	if var1 == nil then
		return nil
	end
	local panelPositionProps = var1.panelPositionProps
	
	return if panelPositionProps then panelPositionProps.uiGroup else nil
end

function getDragBarSafely(p1)
	return if p1 and p1.dragBar and p1.draggable then p1.dragBar else nil
end

function isTempPanel(p1)
	-- upvalues: constantsModule (ref)
	return p1 == constantsModule.PanelType.ToolTipsContainer
end

function visitAllPanels(p1, p2)
	for i, v in pairs(p1) do
		p2(i, v)
	end
end

function visitDraggablePanels(p3, p4, p5)
	visitAllPanels(p3, function(p6, p7)
		-- upvalues: p4 (ref), p5 (ref)
		local panelPositionProps = p7.panelPositionProps
		
		if panelPositionProps and not isTempPanel(p6) and (panelPositionProps.cameraFixedPanelProp and panelPositionProps.uiGroup == p4) then
			p5(p6, panelPositionProps.cameraFixedPanelProp)
		end
	end)
end

function connect(p3, p4)
	return { value = p3, connection = p3:connect(p4) }
end

function disconnect(p3)
	if p3.connection then
		p3.connection:disconnect()
		p3.connection = nil
	end
end

function setPanelParent(value, p3)
	-- upvalues: constantsModule (ref)
	local var1 = p3 ~= nil
	
	if value.uiType == constantsModule.SpatialUIType.SpatialUI or value.uiType == constantsModule.SpatialUIType.SpatialUIRoact then
		local panelObject = value.panelObject
		panelObject.Enabled = var1
		local adornee = panelObject.Adornee
		adornee.CanCollide = false
		adornee.CanTouch = false
		adornee.Anchored = true
		adornee.Parent = p3
		
		return
	elseif value.uiType == constantsModule.SpatialUIType.SpatialUIPartOnly then
		value.panelObject.Parent = p3
	end
end

function setPanelEnabledWithoutReparent(value, p3)
	-- upvalues: constantsModule (ref)
	if value.uiType == constantsModule.SpatialUIType.SpatialUI or value.uiType == constantsModule.SpatialUIType.SpatialUIRoact then
		local panelObject = value.panelObject
		panelObject.Enabled = p3
		local adornee = panelObject.Adornee
		adornee.CanCollide = false
		adornee.CanTouch = false
		adornee.Anchored = true
	end
end

local t = {}
t.__index = t

function t:setTopBarVisible(p3, p4)
	self.topBarVisibleValue = connect(p3, p4)
end

function t:isTopBarVisible()
	return self.topBarVisibleValue.value:get()
end

function t:prepareGuiToggleAnimationState(_)
	-- upvalues: UIGroupStateModule (ref)
	self:setUIGroupState(UIGroupStateModule.GuiToggleAnimation)
end

function t:setUIGroupState(p3)
	self.uiGroupState = p3
end

function t:animateBottomBarOnHeadMoveIfNeeded(_, p3, p4)
	-- upvalues: UIGroupStateModule (ref), radians (ref)
	if self.uiGroupState ~= UIGroupStateModule.GuiToggleAnimation or self.currentBottomBarAnimatable == nil then return end
	if if radians >= math.abs(p3.X - p4.X) then radians < math.abs(p3.Y - p4.Y) else true then
		self.currentBottomBarAnimatable:animateHideIfNeeded(false)
		
		return
	end
	self.currentBottomBarAnimatable:animateShowIfNeeded()
end

function t:updateAllElements(p3, p4)
	-- upvalues: UIGroupStateModule (ref), constantsModule (ref), fFlagEnableSpatialUIBottomBarFixPlaceFilterModule (ref), panelManagedAnimatableModule (ref)
	local var1 = self:isTopBarVisible()
	
	if var1 then
		self:setUIGroupState(UIGroupStateModule.Default)
		
		if self.currentBottomBarAnimatable then
			self.currentBottomBarAnimatable:reset()
			self.currentBottomBarAnimatable = nil
		end
	end
	self:updateAllDragBar(p3, p4)
	visitAllPanels(p3, function(p5, p6)
		-- upvalues: constantsModule (copy), var1 (ref), fFlagEnableSpatialUIBottomBarFixPlaceFilterModule (copy), self (ref), UIGroupStateModule (copy), panelManagedAnimatableModule (copy)
		local var2 = p5 == constantsModule.PanelType.BottomBar
		
		if var1 then
			if fFlagEnableSpatialUIBottomBarFixPlaceFilterModule and var2 then
				setPanelEnabledWithoutReparent(p6, true)
				
				return
			end
			setPanelParent(p6, workspace)
			
			return
		elseif self.uiGroupState ~= UIGroupStateModule.GuiToggleAnimation or not var2 then
			if fFlagEnableSpatialUIBottomBarFixPlaceFilterModule and var2 then
				setPanelEnabledWithoutReparent(p6, false)
				
				return
			end
			setPanelParent(p6, nil)
		elseif not self.currentBottomBarAnimatable then
			self.currentBottomBarAnimatable = panelManagedAnimatableModule.create(p6.panelObject, self.bottomBarVisibility)
			
			if self.currentBottomBarAnimatable then
				self.currentBottomBarAnimatable:hideAndBlockAnimationUntilLookBackAgain()
				
				return
			end
		end
	end)
end

function t:connectPanelVisibility(p3, p4, p5, p6)
	if isTempPanel(p3) then return end
	self:disconnectPanelVisibility(p3, p5, p6)
	local var1 = getUIGroupTypeForPanel(p5, p3)
	
	if var1 then
		self.uiGroupVisibilityMap[var1] = connect(p4, function()
			-- upvalues: self (ref), p3 (ref), p5 (ref), p6 (ref)
			self:updateDragBar(p3, p5, p6)
		end)
		self:updateDragBar(p3, p5, p6)
		
		return
	end
end

function t:disconnectPanelVisibility(p3, p4, p5)
	if isTempPanel(p3) then return end
	local var1 = getUIGroupTypeForPanel(p4, p3)
	local var2 = if var1 then self.uiGroupVisibilityMap[var1] else nil
	
	if var2 then
		disconnect(var2)
		self.uiGroupVisibilityMap[var1] = nil
		self:updateDragBar(p3, p4, p5)
	end
end

function t:updateDragBar(p3, p4, p5)
	local var1 = getUIGroupTypeForPanel(p4, p3)
	local var2 = if var1 then p5[var1] else nil
	
	if not var2 or not var2.dragBar or (not var2.draggable or isTempPanel(p3)) then return end
	local var3 = self:isTopBarVisible()
	local var4 = self.uiGroupVisibilityMap[var1]
	
	if if var4 then var3 and var4.value:get() else false then
		var2.dragBar:show()
		
		return
	end
	var2.dragBar:hide()
end

function t:updateAllDragBar(p3, p4)
	for i, v in pairs(p3) do
		self:updateDragBar(i, p3, p4)
	end
end

function t:createUIGroup(p5, p6, p7, p8, p9, p10)
	-- upvalues: constantsModule (ref), createUIGroupDragBarModule (ref), inExperienceUIVRIXP (ref)
	local var1 = constantsModule.UIGROUP_INITITIAL_ROTATION_MAP[p6]
	local var2 = self.uiGroups[p6]
	local var3 = getDragBarSafely(var2)
	
	if p10 and var1 and (var3 and var3:isEverDragged()) then
		visitDraggablePanels(p9, p6, function(_, p11)
			-- upvalues: var2 (ref), var1 (ref)
			var2.dragBarOffset *= var1
			p11.uiGroupElementOffset *= var1
		end)
	end
	local t = nil
	local var4 = nil
	var4 = createUIGroupDragBarModule({
		name = p6,
		dragFunction = function(_, _, _, _, _)
			-- upvalues: p5 (ref), p6 (ref)
			p5:dragUiGroupStep(p6)
		end,
		dragStartFunction = function(_, _, _, _, _, _, _)
			-- upvalues: var1 (ref), t (write), var4 (write), p9 (ref), p6 (ref), p5 (ref)
			if var1 and t and (var4 and not var4:isEverDragged()) then
				var4:setCFrame(var4:getCFrame() * var1:Inverse())
				t.dragBarOffset *= var1:Inverse()
				visitDraggablePanels(p9, p6, function(_, p11)
					-- upvalues: var1 (copy)
					p11.uiGroupElementOffset *= var1:Inverse()
				end)
			end
			p5:dragUiGroupStart(p6)
		end,
		dragEndFunction = function(_)
			-- upvalues: p5 (ref), p6 (ref)
			p5:dragUiGroupEnd(p6)
		end,
		dragBarPartSize = constantsModule.DRAG_BAR_SIZE
	})
	var4:hide()
	t = {
		headScale = 1,
		positionProps = p8,
		uiContainerSize = p7,
		draggable = inExperienceUIVRIXP:isDraggingAllowed(),
		dragBar = var4,
		dragBarOffset = constantsModule.UIGROUP_DRAGBAR_OFFSET_MAP[p6]
	}
	self.uiGroups[p6] = t
	
	return t
end

function t.checkAndGetUIGroupTypeForTempPanel(_, p5, p6)
	return if isTempPanel(p5) then getUIGroupTypeForPanel(p6, p5) else nil
end

function t:getGroupCameraCFrameIfPossible(p5, p6)
	-- upvalues: spatialUIEnableCameraCacheFix (ref)
	local cFrame = workspace.CurrentCamera.CFrame
	
	if spatialUIEnableCameraCacheFix and isTempPanel(p5) then
		local var1 = getUIGroupTypeForPanel(p6, p5)
		
		if var1 ~= nil and self.uiGroups[var1].lastCameraCFrame then
			cFrame = self.uiGroups[var1].lastCameraCFrame
		end
	end
	return cFrame
end

function t:getBottomBarVisibility()
	return self.bottomBarVisibility
end

function t.new(p5)
	-- upvalues: observableModule (ref), UIGroupStateModule (ref), t (ref)
	local t_1 = {
		currentBottomBarAnimatable = nil,
		uiGroupVisibilityMap = {},
		topBarVisibleValue = { value = observableModule.ObservableValue.new(p5) },
		uiGroups = {},
		uiGroupState = UIGroupStateModule.Default,
		bottomBarVisibility = observableModule.ObservableValue.new(true)
	}
	setmetatable(t_1, t)
	
	return t_1
end

return t