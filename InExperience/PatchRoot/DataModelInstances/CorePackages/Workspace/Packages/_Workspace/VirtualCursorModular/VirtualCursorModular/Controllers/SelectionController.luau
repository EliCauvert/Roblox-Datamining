local parent = script.Parent.Parent
local guiService = game:GetService("GuiService")
local gamepadService = game:GetService("GamepadService")
local playersService = game:GetService("Players")
local coreGuiService = game:GetService("CoreGui")
local sharedFlagsModule = require(script:FindFirstAncestor("VirtualCursorModular").Parent.SharedFlags)
local fFlagEnableVirtualCursorMoveAssist = sharedFlagsModule.FFlagEnableVirtualCursorMoveAssist
local fIntVirtualCursorMoveAssistLevel = sharedFlagsModule.FIntVirtualCursorMoveAssistLevel
local fIntVirtualCursorMoveAssistHoverSpeed = sharedFlagsModule.FIntVirtualCursorMoveAssistHoverSpeed
local propertiesModule = require(parent.Properties)
local utilModule = require(parent.Util)
local getMaxSpeed = utilModule.GetMaxSpeed
local isCircleContainedInGuiObject = utilModule.IsCircleContainedInGuiObject
local isSelectableGuiObject = utilModule.IsSelectableGuiObject
local isSinkingGuiObject = utilModule.IsSinkingGuiObject
local getPointRotatedAroundObject = utilModule.GetPointRotatedAroundObject
local cos = math.cos
local sin = math.sin
local abs = math.abs
local max = math.max
local min = math.min
local sign = math.sign
local t = {}
t.__index = t

function t.new(p1, p2, p3)
	-- upvalues: propertiesModule (ref), t (ref)
	return setmetatable({
		_isScrolling = false,
		_selectedObject = nil,
		_inputController = p1,
		_cursorController = p2,
		_moveAssistController = p3,
		_targetingRadius = propertiesModule.MoveAssistRadius,
		_selectionRadius = propertiesModule.SelectionRadius,
		_scrolled = {}
	}, t)
end

function t:processScrolling(p1, p2, p3)
	-- upvalues: propertiesModule (ref), abs (ref), cos (ref), sin (ref), max (ref), min (ref), sign (ref)
	if not p1:IsA("ScrollingFrame") then
		return false
	elseif not p1.ScrollingEnabled then
		return false
	elseif self._scrolled[p1] then
		return false
	end
	self._scrolled[p1] = true
	local scrollVector = self._inputController:GetScrollVector()
	local var1 = propertiesModule.ScrollingSpeed * p3
	local scrollingRadius = propertiesModule.ScrollingRadius
	local absoluteCanvasSize = p1.AbsoluteCanvasSize
	local absoluteSize = p1.AbsoluteSize
	local scrollingDirection = p1.ScrollingDirection
	local var2 = absoluteSize.X < absoluteCanvasSize.X and (if scrollingDirection ~= Enum.ScrollingDirection.XY then scrollingDirection == Enum.ScrollingDirection.X else true)
	local var3 = absoluteSize.Y < absoluteCanvasSize.Y and (if scrollingDirection ~= Enum.ScrollingDirection.XY then scrollingDirection == Enum.ScrollingDirection.Y else true)
	local absolutePosition = p1.AbsolutePosition
	local var4 = p1.Rotation / 180 * 3.14159265359
	
	if propertiesModule.ThumbstickDeadzone < abs(scrollVector.x) and var2 then
		p1.CanvasPosition += Vector2.new(scrollVector.x * var1, 0)
	end
	if propertiesModule.ThumbstickDeadzone < abs(scrollVector.y) and var3 then
		p1.CanvasPosition += Vector2.new(0, scrollVector.y * var1)
	end
	local vector2 = Vector2.new(cos(var4), sin(var4))
	local vector2_1 = Vector2.new(-sin(var4), cos(var4))
	local var5 = Vector2.new(p2.X, p2.Y) - absolutePosition
	local var6 = var5:Dot(vector2) - absoluteSize.X / 2
	local var7 = var5:Dot(vector2_1) - absoluteSize.Y / 2
	local var8 = Vector2.new(abs(var6), abs(var7)) - absoluteSize / 2
	
	if abs(min(max(var8.X, var8.Y), 0) + Vector2.new(max(var8.X, 0), max(var8.Y, 0)).Magnitude) < scrollingRadius then
		if abs(var8.X) < abs(var8.Y) and var2 then
			p1.CanvasPosition += Vector2.new(sign(var6) * var1, 0)
			self._cursorController:SetArrow(sign(var6), 0)
			
			return true
		elseif abs(var8.Y) <= abs(var8.X) and var3 then
			p1.CanvasPosition += Vector2.new(0, sign(var7) * var1)
			self._cursorController:SetArrow(0, sign(var7))
			
			return true
		end
	end
	return false
end

function t:getClosestCandidate(p1, p2, _, p3, p4)
	-- upvalues: isSelectableGuiObject (ref), getPointRotatedAroundObject (ref), isSinkingGuiObject (ref), isCircleContainedInGuiObject (ref), propertiesModule (ref)
	local var1 = nil
	local var2 = nil
	local var3 = 1e999
	
	if p4 then
		var1 = p4.closestCandidate
		var2 = p4.occludingCandidate
		var3 = p4.closestDistance
	end
	for i, v in ipairs(p1) do
		if not self:processScrolling(v, p2, p3) then
			if isSelectableGuiObject(v) then
				local absolutePosition = v.AbsolutePosition
				local var4 = v.AbsolutePosition + v.AbsoluteSize
				local var5 = 0
				local var6 = if v.AbsoluteRotation ~= 0 then p2 else getPointRotatedAroundObject(p2, v)
				
				if var6.X < absolutePosition.X or var6.Y < absolutePosition.Y or (var4.X < var6.X or var4.Y < var6.Y) then
					var5 = math.sqrt(math.pow(if var6.X < absolutePosition.X then absolutePosition.X - var6.X elseif var4.X < var6.X then var6.X - var4.X else 0, 2) + math.pow(if var6.Y < absolutePosition.Y then absolutePosition.Y - var6.Y elseif var4.Y < var6.Y then var6.Y - var4.Y else 0, 2))
				end
				if var5 < var3 or var1 == nil then
					var1 = v
					var3 = var5
				end
			end
			if isSinkingGuiObject(v) and isCircleContainedInGuiObject(p2, propertiesModule.CursorRadius * propertiesModule.OcclusionRadiusScale, v) then
				var2 = v
				
				return var1, var2, var3
			end
		end
		self._isScrolling = true
		
		return var1, var2, var3
	end
	return var1, var2, var3
end

function t:processMoving(p5)
	-- upvalues: guiService (ref), gamepadService (ref), fFlagEnableVirtualCursorMoveAssist (ref), fIntVirtualCursorMoveAssistLevel (ref), propertiesModule (ref), getMaxSpeed (ref), fIntVirtualCursorMoveAssistHoverSpeed (ref)
	local var7 = guiService:GetScreenResolution() + guiService:GetGuiInset()
	local moveVector = self._inputController:GetMoveVector()
	local gamepadCursorPosition = gamepadService:GetGamepadCursorPosition()
	
	if fFlagEnableVirtualCursorMoveAssist and not self._isScrolling and (fIntVirtualCursorMoveAssistLevel > 0 and propertiesModule.MoveAssistMinInputMagnitude <= moveVector.Magnitude) then
		moveVector = self._moveAssistController:applyMoveAssist(moveVector, {
			cursorPosition = gamepadCursorPosition + self._cursorController:GetCursorScreenGuiOffset(),
			strengthMultiplier = fIntVirtualCursorMoveAssistLevel / 100,
			candidates = self:getAssistCandidateList(gamepadCursorPosition, propertiesModule.MoveAssistRadius)
		})
	elseif fFlagEnableVirtualCursorMoveAssist then
		self._moveAssistController:clearDebugSnapshot()
	end
	local var8 = moveVector * getMaxSpeed() * (if self._selectedObject == nil then 1 elseif self._isScrolling then propertiesModule.ScrollingSlowDown elseif fFlagEnableVirtualCursorMoveAssist and fIntVirtualCursorMoveAssistLevel > 0 and fIntVirtualCursorMoveAssistHoverSpeed > 0 then fIntVirtualCursorMoveAssistHoverSpeed / 100 else propertiesModule.SpeedAdjustmentTarget)
	
	if var8.Magnitude > 0 then
		local var9 = gamepadCursorPosition + var8 * p5
		gamepadCursorPosition = Vector2.new(math.clamp(var9.X, 0, var7.X), math.clamp(var9.Y, 0, var7.Y))
	end
	self._cursorController:SetPosition(gamepadCursorPosition)
	gamepadService:SetGamepadCursorPosition(gamepadCursorPosition)
end

function t.getCandidates(_, p5, p6)
	-- upvalues: playersService (ref), coreGuiService (ref)
	local localPlayer = playersService.LocalPlayer
	local var7 = if localPlayer then localPlayer:FindFirstChildOfClass("PlayerGui") else nil
	
	return {
		{
			coreGuiService,
			coreGuiService:GetGuiObjectsInCircle(p5, p6)
		},
		{
			var7,
			if var7 then var7:GetGuiObjectsInCircle(p5, p6) else {}
		}
	}
end

function t:processAncestors(p5, p6, p7, p8)
	local parent = p5.Parent
	while parent and parent ~= p6 do
		if not self:processScrolling(parent, p7, p8) then
			parent = parent.Parent
			continue
		end
		self._isScrolling = true
		
		return
	end
end

function t:processCandidates(p9, p10, p11)
	-- upvalues: guiService (ref)
	p9 -= guiService:GetGuiInset()
	local var7 = self:getCandidates(p9, p10)
	local var8 = nil
	local var9 = nil
	local var10 = 1e999
	self._scrolled = {}
	self._isScrolling = false
	
	for i, v in ipairs(var7) do
		local var11 = v[1]
		local var12, var13, var14 = self:getClosestCandidate(v[2], p9, p10, p11, {
			closestCandidate = var8,
			occludingCandidate = var9,
			closestDistance = var10
		})
		var8 = var12
		var9 = var13
		var10 = var14
		
		if not self._isScrolling then
			if var8 then
				self:processAncestors(var8, var11, p9, p11)
			end
			if not self._isScrolling then
				if var9 and var9 ~= var8 then
					self:processAncestors(var9, var11, p9, p11)
				end
				if not self._isScrolling then
					if var9 then
						return var8, var10
					end
				end
				return nil, 1e999
			end
			return nil, 1e999
		end
		return nil, 1e999
	end
	return var8, var10
end

function t:getAssistCandidateList(p12, p13)
	-- upvalues: guiService (ref), isSelectableGuiObject (ref)
	local t = {}
	
	for i, v in self:getCandidates(p12 - guiService:GetGuiInset(), p13) do
		for i_1, v_1 in v[2] do
			if v_1:IsA("GuiObject") and isSelectableGuiObject(v_1) then
				table.insert(t, v_1)
			end
		end
	end
	return t
end

function t:onRenderStep(p14)
	-- upvalues: gamepadService (ref), playersService (ref), coreGuiService (ref), guiService (ref)
	self:processMoving(p14)
	local var15, var16 = self:processCandidates(gamepadService:GetGamepadCursorPosition(), self._targetingRadius, p14)
	
	if self._selectionRadius < var16 then
		var15 = nil
	end
	if var15 ~= self._selectedObject then
		local playerGui = playersService.LocalPlayer:FindFirstChildOfClass("PlayerGui")
		
		if var15 then
			self._cursorController:SetHighlight(true)
			
			if var15:IsDescendantOf(coreGuiService) then
				guiService.SelectedCoreObject = var15
				guiService.SelectedObject = nil
			elseif playerGui and var15:IsDescendantOf(playerGui) then
				guiService.SelectedObject = var15
				guiService.SelectedCoreObject = nil
			end
		else
			self._cursorController:SetHighlight(false)
			guiService.SelectedObject = nil
			guiService.SelectedCoreObject = nil
		end
		self._selectedObject = var15
	end
end

return t