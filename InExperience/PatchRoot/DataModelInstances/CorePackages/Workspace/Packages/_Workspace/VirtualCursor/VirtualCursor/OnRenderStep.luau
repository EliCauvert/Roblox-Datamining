local parent = script.Parent
local guiService = game:GetService("GuiService")
local playersService = game:GetService("Players")
local gamepadService = game:GetService("GamepadService")
local coreGuiService = game:GetService("CoreGui")
local var4 = nil
local inputModule = require(parent.Input)
local interfaceModule = require(parent.Interface)
local propertiesModule = require(parent.Properties)
local isCircleContainedInGuiObjectModule = require(parent.isCircleContainedInGuiObject)
local rotatePointAroundObjectModule = require(parent.RotatePointAroundObject)
local var10 = 1
local var11 = false
local sin = math.sin
local cos = math.cos
local _ = math.abs
local max = math.max
local min = math.min
local sign = math.sign
local abs = math.abs
local t = {}
local var13 = nil
local var14 = nil
local var15 = 1e999

local function _(p0) --[[ line: 36 | named "isSelectableGuiObject" ]]
	return not (not p0:IsA("GuiButton") and not p0:IsA("TextBox")) and (not (not p0.Active or not p0.Selectable) and p0.AbsoluteSize.Magnitude ~= 0)
end

local _ = function(p1, p2, p3) --[[ line: 50 | named "contains" ]]
	return p2.x <= p1.x and (p2.y <= p1.y and (p1.x <= p3.x and p1.y <= p3.y))
end

local function handleScrollingFrame(p4, p5, p6) --[[ line: 54 ]]
	-- upvalues: t (ref), inputModule (ref), propertiesModule (ref), abs (ref), cos (ref), sin (ref), max (ref), min (ref), sign (ref), interfaceModule (ref)
	if not p4:IsA("ScrollingFrame") then
		return false
	elseif not p4.ScrollingEnabled then
		return false
	elseif t[p4] then
		return false
	end
	t[p4] = true
	local thumbstick2Vector = inputModule:GetThumbstick2Vector()
	local var21 = propertiesModule.ScrollingSpeed * p6
	local scrollingRadius = propertiesModule.ScrollingRadius
	local absoluteCanvasSize = p4.AbsoluteCanvasSize
	local absoluteSize = p4.AbsoluteSize
	local scrollingDirection = p4.ScrollingDirection
	local var22 = absoluteSize.X < absoluteCanvasSize.X and (if scrollingDirection ~= Enum.ScrollingDirection.XY then scrollingDirection == Enum.ScrollingDirection.X else true)
	local var23 = absoluteSize.Y < absoluteCanvasSize.Y and (if scrollingDirection ~= Enum.ScrollingDirection.XY then scrollingDirection == Enum.ScrollingDirection.Y else true)
	local absoluteSize_1 = p4.AbsoluteSize
	local absolutePosition = p4.AbsolutePosition
	local var24 = p4.Rotation / 180 * 3.14159265359
	
	if propertiesModule.ThumbstickDeadzone < abs(thumbstick2Vector.x) and var22 then
		p4.CanvasPosition += Vector2.new(thumbstick2Vector.x * var21, 0)
	end
	if propertiesModule.ThumbstickDeadzone < abs(thumbstick2Vector.y) and var23 then
		p4.CanvasPosition += Vector2.new(0, thumbstick2Vector.y * var21)
	end
	local vector2 = Vector2.new(cos(var24), sin(var24))
	local vector2_1 = Vector2.new(-sin(var24), cos(var24))
	local var27 = Vector2.new(p5.X, p5.Y) - absolutePosition
	local var28 = var27:Dot(vector2) - absoluteSize_1.X / 2
	local var29 = var27:Dot(vector2_1) - absoluteSize_1.Y / 2
	local var30 = Vector2.new(abs(var28), abs(var29)) - absoluteSize_1 / 2
	
	if abs(min(max(var30.x, var30.y), 0) + Vector2.new(max(var30.x, 0), max(var30.y, 0)).Magnitude) < scrollingRadius then
		if abs(var30.x) < abs(var30.y) and var22 then
			p4.CanvasPosition += Vector2.new(sign(var28) * var21, 0)
			interfaceModule:SetArrow(sign(var28), 0)
			
			return true
		elseif abs(var30.y) <= abs(var30.x) and var23 then
			p4.CanvasPosition += Vector2.new(0, sign(var29) * var21)
			interfaceModule:SetArrow(0, sign(var29))
			
			return true
		end
	end
	return false
end

local function findClosestOrOccludingGuiObject(_, p7, p8, p9) --[[ line: 119 ]]
	-- upvalues: handleScrollingFrame (ref), var11 (write), var13 (write), rotatePointAroundObjectModule (ref), var15 (write), isCircleContainedInGuiObjectModule (ref), propertiesModule (ref), var14 (write)
	for i, v in ipairs(p7) do
		if not handleScrollingFrame(v, p8, p9) then
			local var31 = not v:IsA("GuiButton") and not v:IsA("TextBox") and (if v.Active and v.Selectable then v.AbsoluteSize.Magnitude ~= 0 else false)
			
			if var31 and not var13 then
				var13 = v
			end
			var31 = not v:IsA("GuiButton") and not v:IsA("TextBox") and (if v.Active and v.Selectable then v.AbsoluteSize.Magnitude ~= 0 else false)
			
			if var31 then
				var31 = v.AbsolutePosition
				local var32 = v.AbsolutePosition + v.AbsoluteSize
				local var33 = 0
				local var34 = if v.AbsoluteRotation ~= 0 then p8 else rotatePointAroundObjectModule(p8, v)
				
				if var34.x < var31.x or var34.y < var31.y or (var32.x < var34.x or var32.y < var34.y) then
					var33 = math.sqrt(math.pow(if var34.x < var31.x then var31.x - var34.x elseif var32.x < var34.x then var34.x - var32.x else 0, 2) + math.pow(if var34.y < var31.y then var31.y - var34.y elseif var32.y < var34.y then var34.y - var32.y else 0, 2))
				end
				if var33 < var15 then
					var13 = v
					var15 = var33
				end
			end
			if v.Visible and v.Active and (v.Interactable and isCircleContainedInGuiObjectModule(p8, propertiesModule.CursorRadius * propertiesModule.OcclusionRadiusScale, v)) then
				var14 = v
				
				return
			end
		end
		var11 = true
		
		return
	end
end

local function handleScrollingInAncestors(p10, p11, p12, p13) --[[ line: 172 ]]
	-- upvalues: handleScrollingFrame (ref), var11 (write)
	local parent = p10.Parent
	while parent and parent ~= p11 do
		if not handleScrollingFrame(parent, p12, p13) then
			parent = parent.Parent
			continue
		end
		var11 = true
		
		return
	end
end

local function processCursorPosition(p14, p15, p16) --[[ line: 183 ]]
	-- upvalues: t (ref), var13 (write), var14 (write), var15 (write), guiService (ref), var4 (write), playersService (ref), coreGuiService (ref), var11 (write), findClosestOrOccludingGuiObject (ref), handleScrollingInAncestors (ref)
	table.clear(t)
	var13 = nil
	var14 = nil
	var15 = 1e999
	p14 -= guiService:GetGuiInset()
	
	if var4 == nil then
		var4 = playersService.LocalPlayer:FindFirstChildOfClass("PlayerGui")
	end
	var11 = false
	
	for i, v in ipairs({
		{
			coreGuiService,
			coreGuiService:GetGuiObjectsInCircle(p14, p15)
		},
		{
			var4,
			if var4 then var4:GetGuiObjectsInCircle(p14, p15) else {}
		}
	}) do
		local var35 = v[1]
		findClosestOrOccludingGuiObject(var35, v[2], p14, p16)
	end
	return var13
end

local _ = function() --[[ line: 248 | named "getMaxSpeed" ]]
	-- upvalues: guiService (ref), propertiesModule (ref)
	return guiService:GetScreenResolution().Magnitude * propertiesModule.MaxSpeedRelative
end

return function(p17, p18) --[[ line: 253 ]]
	-- upvalues: guiService (ref), inputModule (ref), gamepadService (ref), var10 (write), interfaceModule (ref), var11 (write), propertiesModule (ref), processCursorPosition (ref), coreGuiService (ref), var4 (write)
	local var36 = guiService:GetScreenResolution() + guiService:GetGuiInset()
	local thumbstickVector = inputModule:GetThumbstickVector()
	local gamepadCursorPosition = gamepadService:GetGamepadCursorPosition()
	local _ = nil
	local _ = Vector2.new()
	
	if p17.SelectedObject == nil then
		var10 = 1
		interfaceModule:SetCursorHighlight(false)
	end
	if var11 then
		var10 = propertiesModule.ScrollingSlowDown
	end
	local var39 = thumbstickVector * (guiService:GetScreenResolution().Magnitude * propertiesModule.MaxSpeedRelative) * var10
	
	if var39.Magnitude > 0 then
		local var40 = gamepadCursorPosition + var39 * p18
		gamepadCursorPosition = Vector2.new(math.clamp(var40.x, 0, var36.x), math.clamp(var40.y, 0, var36.y))
	end
	interfaceModule:SetCursorPosition(gamepadCursorPosition)
	gamepadService:SetGamepadCursorPosition(gamepadCursorPosition)
	p17.CursorPosition = gamepadCursorPosition
	local var41 = processCursorPosition(gamepadCursorPosition, propertiesModule.SelectionRadius, p18)
	
	if var41 ~= p17.PreviouslySelectedObject then
		p17.PreviouslySelectedObject = var41
		interfaceModule:SetCursorHighlight(var41 ~= nil)
		
		if not var41 then
			p17.SelectedObject = nil
			var10 = 1
		elseif var41 ~= p17.SelectedObject then
			p17.SelectedObject = var41
			var10 = propertiesModule.SpeedAdjustmentTarget
		end
		if p17.SelectedObject == nil then
			guiService.SelectedObject = nil
			guiService.SelectedCoreObject = nil
			
			return
		elseif p17.SelectedObject:IsDescendantOf(coreGuiService) then
			guiService.SelectedCoreObject = p17.SelectedObject
			guiService.SelectedObject = nil
			
			return
		elseif p17.SelectedObject:IsDescendantOf(var4) then
			guiService.SelectedObject = p17.SelectedObject
			guiService.SelectedCoreObject = nil
		end
	end
end