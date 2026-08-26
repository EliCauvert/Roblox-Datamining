local parent = script.Parent
local guiService = game:GetService("GuiService")
local playersService = game:GetService("Players")
local gamepadService = game:GetService("GamepadService")
local coreGuiService = game:GetService("CoreGui")
local var1 = nil
local inputModule = require(parent.Input)
local interfaceModule = require(parent.Interface)
local propertiesModule = require(parent.Properties)
local isCircleContainedInGuiObjectModule = require(parent.isCircleContainedInGuiObject)
local rotatePointAroundObjectModule = require(parent.RotatePointAroundObject)
local var2 = 1
local var3 = false
local sin = math.sin
local cos = math.cos
local _ = math.abs
local max = math.max
local min = math.min
local sign = math.sign
local abs = math.abs
local t = {}
local var4 = nil
local var5 = nil
local var6 = 1e999

local function _(p1)
	return not (not p1:IsA("GuiButton") and not p1:IsA("TextBox")) and (not (not p1.Active or not p1.Selectable) and p1.AbsoluteSize.Magnitude ~= 0)
end

local _ = function(p1, p2, p3)
	return p2.x <= p1.x and (p2.y <= p1.y and (p1.x <= p3.x and p1.y <= p3.y))
end

local function handleScrollingFrame(p1, p2, p3)
	-- upvalues: t (ref), inputModule (ref), propertiesModule (ref), abs (ref), cos (ref), sin (ref), max (ref), min (ref), sign (ref), interfaceModule (ref)
	if not p1:IsA("ScrollingFrame") then
		return false
	elseif not p1.ScrollingEnabled then
		return false
	elseif t[p1] then
		return false
	end
	t[p1] = true
	local thumbstick2Vector = inputModule:GetThumbstick2Vector()
	local var7 = propertiesModule.ScrollingSpeed * p3
	local scrollingRadius = propertiesModule.ScrollingRadius
	local absoluteCanvasSize = p1.AbsoluteCanvasSize
	local absoluteSize = p1.AbsoluteSize
	local scrollingDirection = p1.ScrollingDirection
	local var8 = absoluteSize.X < absoluteCanvasSize.X and (if scrollingDirection ~= Enum.ScrollingDirection.XY then scrollingDirection == Enum.ScrollingDirection.X else true)
	local var9 = absoluteSize.Y < absoluteCanvasSize.Y and (if scrollingDirection ~= Enum.ScrollingDirection.XY then scrollingDirection == Enum.ScrollingDirection.Y else true)
	local absoluteSize_1 = p1.AbsoluteSize
	local absolutePosition = p1.AbsolutePosition
	local var10 = p1.Rotation / 180 * 3.14159265359
	
	if propertiesModule.ThumbstickDeadzone < abs(thumbstick2Vector.x) and var8 then
		p1.CanvasPosition += Vector2.new(thumbstick2Vector.x * var7, 0)
	end
	if propertiesModule.ThumbstickDeadzone < abs(thumbstick2Vector.y) and var9 then
		p1.CanvasPosition += Vector2.new(0, thumbstick2Vector.y * var7)
	end
	local vector2 = Vector2.new(cos(var10), sin(var10))
	local vector2_1 = Vector2.new(-sin(var10), cos(var10))
	local var11 = Vector2.new(p2.X, p2.Y) - absolutePosition
	local var12 = var11:Dot(vector2) - absoluteSize_1.X / 2
	local var13 = var11:Dot(vector2_1) - absoluteSize_1.Y / 2
	local var14 = Vector2.new(abs(var12), abs(var13)) - absoluteSize_1 / 2
	
	if abs(min(max(var14.x, var14.y), 0) + Vector2.new(max(var14.x, 0), max(var14.y, 0)).Magnitude) < scrollingRadius then
		if abs(var14.x) < abs(var14.y) and var8 then
			p1.CanvasPosition += Vector2.new(sign(var12) * var7, 0)
			interfaceModule:SetArrow(sign(var12), 0)
			
			return true
		elseif abs(var14.y) <= abs(var14.x) and var9 then
			p1.CanvasPosition += Vector2.new(0, sign(var13) * var7)
			interfaceModule:SetArrow(0, sign(var13))
			
			return true
		end
	end
	return false
end

local function findClosestOrOccludingGuiObject(_, p1, p2, p3)
	-- upvalues: handleScrollingFrame (ref), var3 (write), var4 (write), rotatePointAroundObjectModule (ref), var6 (write), isCircleContainedInGuiObjectModule (ref), propertiesModule (ref), var5 (write)
	for i, v in ipairs(p1) do
		if not handleScrollingFrame(v, p2, p3) then
			local var7 = not v:IsA("GuiButton") and not v:IsA("TextBox") and (if v.Active and v.Selectable then v.AbsoluteSize.Magnitude ~= 0 else false)
			
			if var7 and not var4 then
				var4 = v
			end
			var7 = not v:IsA("GuiButton") and not v:IsA("TextBox") and (if v.Active and v.Selectable then v.AbsoluteSize.Magnitude ~= 0 else false)
			
			if var7 then
				var7 = v.AbsolutePosition
				local var8 = v.AbsolutePosition + v.AbsoluteSize
				local var9 = 0
				local var10 = if v.AbsoluteRotation ~= 0 then p2 else rotatePointAroundObjectModule(p2, v)
				
				if var10.x < var7.x or var10.y < var7.y or (var8.x < var10.x or var8.y < var10.y) then
					var9 = math.sqrt(math.pow(if var10.x < var7.x then var7.x - var10.x elseif var8.x < var10.x then var10.x - var8.x else 0, 2) + math.pow(if var10.y < var7.y then var7.y - var10.y elseif var8.y < var10.y then var10.y - var8.y else 0, 2))
				end
				if var9 < var6 then
					var4 = v
					var6 = var9
				end
			end
			if v.Visible and v.Active and (v.Interactable and isCircleContainedInGuiObjectModule(p2, propertiesModule.CursorRadius * propertiesModule.OcclusionRadiusScale, v)) then
				var5 = v
				
				return
			end
		end
		var3 = true
		
		return
	end
end

local function handleScrollingInAncestors(p4, p5, p6, p7)
	-- upvalues: handleScrollingFrame (ref), var3 (write)
	local parent = p4.Parent
	while parent and parent ~= p5 do
		if not handleScrollingFrame(parent, p6, p7) then
			parent = parent.Parent
			continue
		end
		var3 = true
		
		return
	end
end

local function processCursorPosition(p8, p9, p10)
	-- upvalues: t (ref), var4 (write), var5 (write), var6 (write), guiService (ref), var1 (write), playersService (ref), coreGuiService (ref), var3 (write), findClosestOrOccludingGuiObject (ref), handleScrollingInAncestors (ref)
	table.clear(t)
	var4 = nil
	var5 = nil
	var6 = 1e999
	p8 -= guiService:GetGuiInset()
	
	if var1 == nil then
		var1 = playersService.LocalPlayer:FindFirstChildOfClass("PlayerGui")
	end
	var3 = false
	
	for i, v in ipairs({
		{
			coreGuiService,
			coreGuiService:GetGuiObjectsInCircle(p8, p9)
		},
		{
			var1,
			if var1 then var1:GetGuiObjectsInCircle(p8, p9) else {}
		}
	}) do
		local var11 = v[1]
		findClosestOrOccludingGuiObject(var11, v[2], p8, p10)
	end
	return var4
end

local _ = function()
	-- upvalues: guiService (ref), propertiesModule (ref)
	return guiService:GetScreenResolution().Magnitude * propertiesModule.MaxSpeedRelative
end

return function(p11, p12)
	-- upvalues: guiService (ref), inputModule (ref), gamepadService (ref), var2 (write), interfaceModule (ref), var3 (write), propertiesModule (ref), processCursorPosition (ref), coreGuiService (ref), var1 (write)
	local var12 = guiService:GetScreenResolution() + guiService:GetGuiInset()
	local thumbstickVector = inputModule:GetThumbstickVector()
	local gamepadCursorPosition = gamepadService:GetGamepadCursorPosition()
	local _ = nil
	local _ = Vector2.new()
	
	if p11.SelectedObject == nil then
		var2 = 1
		interfaceModule:SetCursorHighlight(false)
	end
	if var3 then
		var2 = propertiesModule.ScrollingSlowDown
	end
	local var13 = thumbstickVector * (guiService:GetScreenResolution().Magnitude * propertiesModule.MaxSpeedRelative) * var2
	
	if var13.Magnitude > 0 then
		local var14 = gamepadCursorPosition + var13 * p12
		gamepadCursorPosition = Vector2.new(math.clamp(var14.x, 0, var12.x), math.clamp(var14.y, 0, var12.y))
	end
	interfaceModule:SetCursorPosition(gamepadCursorPosition)
	gamepadService:SetGamepadCursorPosition(gamepadCursorPosition)
	p11.CursorPosition = gamepadCursorPosition
	local var15 = processCursorPosition(gamepadCursorPosition, propertiesModule.SelectionRadius, p12)
	
	if var15 ~= p11.PreviouslySelectedObject then
		p11.PreviouslySelectedObject = var15
		interfaceModule:SetCursorHighlight(var15 ~= nil)
		
		if not var15 then
			p11.SelectedObject = nil
			var2 = 1
		elseif var15 ~= p11.SelectedObject then
			p11.SelectedObject = var15
			var2 = propertiesModule.SpeedAdjustmentTarget
		end
		if p11.SelectedObject == nil then
			guiService.SelectedObject = nil
			guiService.SelectedCoreObject = nil
			
			return
		elseif p11.SelectedObject:IsDescendantOf(coreGuiService) then
			guiService.SelectedCoreObject = p11.SelectedObject
			guiService.SelectedObject = nil
			
			return
		elseif p11.SelectedObject:IsDescendantOf(var1) then
			guiService.SelectedObject = p11.SelectedObject
			guiService.SelectedCoreObject = nil
		end
	end
end