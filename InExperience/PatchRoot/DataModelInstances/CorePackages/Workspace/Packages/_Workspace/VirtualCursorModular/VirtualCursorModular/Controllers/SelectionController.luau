local parent = script.Parent.Parent
local guiService = game:GetService("GuiService")
local gamepadService = game:GetService("GamepadService")
local playersService = game:GetService("Players")
local coreGuiService = game:GetService("CoreGui")
local sharedFlagsModule = require(script:FindFirstAncestor("VirtualCursorModular").Parent.SharedFlags)
local fFlagEnableSnapInVirtualCursor = sharedFlagsModule.FFlagEnableSnapInVirtualCursor
local fFlagEnableMoveSnapInVirtualCursor = sharedFlagsModule.FFlagEnableMoveSnapInVirtualCursor
local fIntSnapLevelInVirtualCursor = sharedFlagsModule.FIntSnapLevelInVirtualCursor
local fFlagVirtualCursorSnapStopsWhenInputStops = sharedFlagsModule.FFlagVirtualCursorSnapStopsWhenInputStops
local fFlagVirtualCursorSnapLevelBasedOnDirection = sharedFlagsModule.FFlagVirtualCursorSnapLevelBasedOnDirection
local fFlagEnableVirtualCursorDebugging = sharedFlagsModule.FFlagEnableVirtualCursorDebugging
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

function t.new(p0, p1, p2)
	-- upvalues: propertiesModule (ref), t (ref)
	return setmetatable({
		_isScrolling = false,
		_selectedObject = nil,
		_inputController = p0,
		_cursorController = p1,
		_snapController = p2,
		_targetingRadius = propertiesModule.SnapRadius,
		_selectionRadius = propertiesModule.SelectionRadius,
		_scrolled = {}
	}, t)
end

function t:processScrolling(p3, p4, p5)
	-- upvalues: propertiesModule (ref), abs (ref), cos (ref), sin (ref), max (ref), min (ref), sign (ref)
	if not p3:IsA("ScrollingFrame") then
		return false
	elseif not p3.ScrollingEnabled then
		return false
	elseif self._scrolled[p3] then
		return false
	end
	self._scrolled[p3] = true
	local scrollVector = self._inputController:GetScrollVector()
	local var9 = propertiesModule.ScrollingSpeed * p5
	local scrollingRadius = propertiesModule.ScrollingRadius
	local absoluteCanvasSize = p3.AbsoluteCanvasSize
	local absoluteSize = p3.AbsoluteSize
	local scrollingDirection = p3.ScrollingDirection
	local var10 = absoluteSize.X < absoluteCanvasSize.X and (if scrollingDirection ~= Enum.ScrollingDirection.XY then scrollingDirection == Enum.ScrollingDirection.X else true)
	local var11 = absoluteSize.Y < absoluteCanvasSize.Y and (if scrollingDirection ~= Enum.ScrollingDirection.XY then scrollingDirection == Enum.ScrollingDirection.Y else true)
	local absolutePosition = p3.AbsolutePosition
	local var12 = p3.Rotation / 180 * 3.14159265359
	
	if propertiesModule.ThumbstickDeadzone < abs(scrollVector.x) and var10 then
		p3.CanvasPosition += Vector2.new(scrollVector.x * var9, 0)
	end
	if propertiesModule.ThumbstickDeadzone < abs(scrollVector.y) and var11 then
		p3.CanvasPosition += Vector2.new(0, scrollVector.y * var9)
	end
	local vector2 = Vector2.new(cos(var12), sin(var12))
	local vector2_1 = Vector2.new(-sin(var12), cos(var12))
	local var15 = Vector2.new(p4.X, p4.Y) - absolutePosition
	local var16 = var15:Dot(vector2) - absoluteSize.X / 2
	local var17 = var15:Dot(vector2_1) - absoluteSize.Y / 2
	local var18 = Vector2.new(abs(var16), abs(var17)) - absoluteSize / 2
	
	if abs(min(max(var18.X, var18.Y), 0) + Vector2.new(max(var18.X, 0), max(var18.Y, 0)).Magnitude) < scrollingRadius then
		if abs(var18.X) < abs(var18.Y) and var10 then
			p3.CanvasPosition += Vector2.new(sign(var16) * var9, 0)
			self._cursorController:SetArrow(sign(var16), 0)
			
			return true
		elseif abs(var18.Y) <= abs(var18.X) and var11 then
			p3.CanvasPosition += Vector2.new(0, sign(var17) * var9)
			self._cursorController:SetArrow(0, sign(var17))
			
			return true
		end
	end
	return false
end

function t:getClosestCandidate(p6, p7, _, p8, p9)
	-- upvalues: isSelectableGuiObject (ref), getPointRotatedAroundObject (ref), isSinkingGuiObject (ref), isCircleContainedInGuiObject (ref), propertiesModule (ref)
	local var19 = nil
	local var20 = nil
	local var21 = 1e999
	
	if p9 then
		var19 = p9.closestCandidate
		var20 = p9.occludingCandidate
		var21 = p9.closestDistance
	end
	for i, v in ipairs(p6) do
		if not self:processScrolling(v, p7, p8) then
			if isSelectableGuiObject(v) then
				local absolutePosition = v.AbsolutePosition
				local var22 = v.AbsolutePosition + v.AbsoluteSize
				local var23 = 0
				local var24 = if v.AbsoluteRotation ~= 0 then p7 else getPointRotatedAroundObject(p7, v)
				
				if var24.X < absolutePosition.X or var24.Y < absolutePosition.Y or (var22.X < var24.X or var22.Y < var24.Y) then
					var23 = math.sqrt(math.pow(if var24.X < absolutePosition.X then absolutePosition.X - var24.X elseif var22.X < var24.X then var24.X - var22.X else 0, 2) + math.pow(if var24.Y < absolutePosition.Y then absolutePosition.Y - var24.Y elseif var22.Y < var24.Y then var24.Y - var22.Y else 0, 2))
				end
				if var23 < var21 or var19 == nil then
					var19 = v
					var21 = var23
				end
			end
			if isSinkingGuiObject(v) and isCircleContainedInGuiObject(p7, propertiesModule.CursorRadius * propertiesModule.OcclusionRadiusScale, v) then
				var20 = v
				
				return var19, var20, var21
			end
		end
		self._isScrolling = true
		
		return var19, var20, var21
	end
	return var19, var20, var21
end

function t:processMoving(p10)
	-- upvalues: guiService (ref), gamepadService (ref), fFlagEnableMoveSnapInVirtualCursor (ref), fIntSnapLevelInVirtualCursor (ref), propertiesModule (ref), getMaxSpeed (ref)
	local var25 = guiService:GetScreenResolution() + guiService:GetGuiInset()
	local moveVector = self._inputController:GetMoveVector()
	local gamepadCursorPosition = gamepadService:GetGamepadCursorPosition()
	
	if fFlagEnableMoveSnapInVirtualCursor and not self._isScrolling then
		moveVector = self._snapController:adjustMove(moveVector, {
			cursorPosition = gamepadCursorPosition + self._cursorController:GetCursorScreenGuiOffset(),
			strengthMultiplier = fIntSnapLevelInVirtualCursor / 100,
			candidates = self:getSnapCandidateList(gamepadCursorPosition, propertiesModule.SnapRadius)
		})
	end
	local var28 = moveVector * getMaxSpeed() * (if self._selectedObject == nil then 1 elseif self._isScrolling then propertiesModule.ScrollingSlowDown else propertiesModule.SpeedAdjustmentTarget)
	
	if var28.Magnitude > 0 then
		local var29 = gamepadCursorPosition + var28 * p10
		gamepadCursorPosition = Vector2.new(math.clamp(var29.X, 0, var25.X), math.clamp(var29.Y, 0, var25.Y))
	end
	self._cursorController:SetPosition(gamepadCursorPosition)
	gamepadService:SetGamepadCursorPosition(gamepadCursorPosition)
end

function t:processSnapping(p11, p12, p13, p14)
	-- upvalues: fFlagEnableSnapInVirtualCursor (ref), fFlagVirtualCursorSnapStopsWhenInputStops (ref), fFlagEnableVirtualCursorDebugging (ref), fIntSnapLevelInVirtualCursor (ref), propertiesModule (ref), guiService (ref), fFlagVirtualCursorSnapLevelBasedOnDirection (ref), gamepadService (ref)
	if not fFlagEnableSnapInVirtualCursor then return end
	local var30 = (p12 - p13) / p11
	
	if var30.Magnitude <= 0 and fFlagVirtualCursorSnapStopsWhenInputStops then
		if fFlagEnableVirtualCursorDebugging then
			print("Cursor is not moving, skipping snap processing")
		end
		return
	else
		local cursorScreenGuiOffset = self._cursorController:GetCursorScreenGuiOffset()
		local var32 = self._snapController:adjustSnap({
			cursorPosition = p12 + cursorScreenGuiOffset,
			strengthMultiplier = fIntSnapLevelInVirtualCursor / 100,
			targetObject = p14,
			deltaTime = p11,
			expiredTime = propertiesModule.SnapExpireTime
		}) - cursorScreenGuiOffset
		local var33 = guiService:GetScreenResolution() + guiService:GetGuiInset()
		local vector2 = Vector2.new(math.clamp(var32.X, 0, var33.X), math.clamp(var32.Y, 0, var33.Y))
		
		if (vector2 - p12):Dot(var30) > 0 or not fFlagVirtualCursorSnapLevelBasedOnDirection then
			self._cursorController:SetPosition(vector2)
			gamepadService:SetGamepadCursorPosition(vector2)
			
			return
		elseif fFlagEnableVirtualCursorDebugging then
			print("Snap position is behind cursor movement, skipping snap")
		end
	end
end

function t.getCandidates(_, p15, p16)
	-- upvalues: playersService (ref), coreGuiService (ref)
	local playerGui = playersService.LocalPlayer:FindFirstChildOfClass("PlayerGui")
	
	return {
		{
			coreGuiService,
			coreGuiService:GetGuiObjectsInCircle(p15, p16)
		},
		{
			playerGui,
			if playerGui then playerGui:GetGuiObjectsInCircle(p15, p16) else {}
		}
	}
end

function t:processAncestors(p17, p18, p19, p20)
	local parent = p17.Parent
	while parent and parent ~= p18 do
		if not self:processScrolling(parent, p19, p20) then
			parent = parent.Parent
			continue
		end
		self._isScrolling = true
		
		return
	end
end

function t:processCandidates(p21, p22, p23)
	-- upvalues: guiService (ref)
	p21 -= guiService:GetGuiInset()
	local var36 = self:getCandidates(p21, p22)
	local var37 = nil
	local var38 = nil
	local var39 = 1e999
	self._scrolled = {}
	self._isScrolling = false
	
	for i, v in ipairs(var36) do
		local var40 = v[1]
		local var41, var42, var43 = self:getClosestCandidate(v[2], p21, p22, p23, {
			closestCandidate = var37,
			occludingCandidate = var38,
			closestDistance = var39
		})
		var37 = var41
		var38 = var42
		var39 = var43
		
		if not self._isScrolling then
			if var37 then
				self:processAncestors(var37, var40, p21, p23)
			end
			if not self._isScrolling then
				if var38 and var38 ~= var37 then
					self:processAncestors(var38, var40, p21, p23)
				end
				if not self._isScrolling then
					if var38 then
						return var37, var39
					end
				end
				return nil, 1e999
			end
			return nil, 1e999
		end
		return nil, 1e999
	end
	return var37, var39
end

function t:getSnapCandidateList(p24, p25)
	-- upvalues: guiService (ref), playersService (ref), coreGuiService (ref)
	local t = {}
	p24 -= guiService:GetGuiInset()
	local var45 = guiService:GetScreenResolution() + guiService:GetGuiInset()
	local localPlayer = playersService.LocalPlayer
	local var46 = if localPlayer then localPlayer:FindFirstChildOfClass("PlayerGui") else nil
	local var47 = coreGuiService:GetGuiObjectsInCircle(p24, p25)
	
	for i, v in if var46 then var46:GetGuiObjectsInCircle(p24, p25) else {} do
		if v:IsA("GuiObject") and self._snapController:isSnapCandidate(v, var45) then
			table.insert(t, v)
		end
	end
	for i, v_1 in var47 do
		if v_1:IsA("GuiObject") and self._snapController:isSnapCandidate(v_1, var45) then
			table.insert(t, v_1)
		end
	end
	return t
end

function t:onRenderStep(p26)
	-- upvalues: gamepadService (ref), fFlagEnableSnapInVirtualCursor (ref), fFlagEnableMoveSnapInVirtualCursor (ref), playersService (ref), coreGuiService (ref), guiService (ref)
	local gamepadCursorPosition = gamepadService:GetGamepadCursorPosition()
	self:processMoving(p26)
	local gamepadCursorPosition_1 = gamepadService:GetGamepadCursorPosition()
	local var50, var51 = self:processCandidates(gamepadCursorPosition_1, self._targetingRadius, p26)
	
	if self._selectionRadius < var51 then
		var50 = nil
	end
	if fFlagEnableSnapInVirtualCursor and not fFlagEnableMoveSnapInVirtualCursor then
		self:processSnapping(p26, gamepadCursorPosition_1, gamepadCursorPosition, var50)
	end
	if var50 ~= self._selectedObject then
		local playerGui = playersService.LocalPlayer:FindFirstChildOfClass("PlayerGui")
		
		if var50 then
			self._cursorController:SetHighlight(true)
			
			if var50:IsDescendantOf(coreGuiService) then
				guiService.SelectedCoreObject = var50
				guiService.SelectedObject = nil
			elseif playerGui and var50:IsDescendantOf(playerGui) then
				guiService.SelectedObject = var50
				guiService.SelectedCoreObject = nil
			end
		else
			self._cursorController:SetHighlight(false)
			guiService.SelectedObject = nil
			guiService.SelectedCoreObject = nil
		end
		self._selectedObject = var50
	end
end

return t