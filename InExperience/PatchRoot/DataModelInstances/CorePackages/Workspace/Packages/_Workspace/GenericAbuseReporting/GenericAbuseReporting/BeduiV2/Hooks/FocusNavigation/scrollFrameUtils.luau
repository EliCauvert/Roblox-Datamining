local gamepadUtils = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.InputUi).Gamepad.GamepadUtils

return {
	SCROLL_INCREMENT = 300,
	STICK_MAX_SPEED = 1000,
	getScrollableAncestor = function(p0)
		return if p0 == nil then nil elseif p0:IsA("ScrollingFrame") then p0 else p0:FindFirstAncestorWhichIsA("ScrollingFrame")
	end,
	canScrollVertically = function(p1)
		return if p1.ScrollingEnabled then p1.AbsoluteWindowSize.Y < p1.AbsoluteCanvasSize.Y else false
	end,
	clampCanvasY = function(value, minValue)
		return math.clamp(minValue, 0, math.max(0, value.AbsoluteCanvasSize.Y - value.AbsoluteWindowSize.Y))
	end,
	scrollByIncrement = function(p2, p3)
		if p2 == nil then return end
		local var0 = p2.AbsoluteCanvasSize.Y - p2.AbsoluteWindowSize.Y
		
		if p3 > 0 and var0 - 350 <= p2.CanvasPosition.Y then
			p2.CanvasPosition = Vector2.new(0, var0)
			
			return
		elseif p3 < 0 and p2.CanvasPosition.Y <= 350 then
			p2.CanvasPosition = Vector2.new(0, 0)
			
			return
		end
		p2.CanvasPosition += Vector2.new(0, p3)
	end,
	scrollByAnalogInput = function(p4, p5, p6)
		-- upvalues: gamepadUtils (ref)
		if p4 == nil or not (if not p4.ScrollingEnabled then false else p4.AbsoluteWindowSize.Y < p4.AbsoluteCanvasSize.Y) then return end
		local var1 = gamepadUtils.normalizeStickByDeadzone(Vector2.new(p5.Position.X, p5.Position.Y))
		
		if var1.Y == 0 then
			return
		end
		p4.CanvasPosition = Vector2.new(p4.CanvasPosition.X, math.clamp(p4.CanvasPosition.Y + p6 * -var1.Y * 1000, 0, math.max(0, p4.AbsoluteCanvasSize.Y - p4.AbsoluteWindowSize.Y)))
	end,
	isInsideContainer = function(p7, p8)
		return if p7 == nil or p8 == nil then false elseif p7 ~= p8 then p7:IsDescendantOf(p8) else true
	end,
	resolveScrollTarget = function(p9, p10)
		if p10 == nil then
			return nil
		elseif not (if p9 == nil or p10 == nil then false elseif p9 ~= p10 then p9:IsDescendantOf(p10) else true) then
			return nil
		end
		local var2 = if p9 == nil then nil elseif p9:IsA("ScrollingFrame") then p9 else p9:FindFirstAncestorWhichIsA("ScrollingFrame")
		
		return if var2 == nil then nil elseif var2 == p10 or var2:IsDescendantOf(p10) then var2 else nil
	end
}