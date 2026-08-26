local gamepadUtils = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.InputUi).Gamepad.GamepadUtils

return {
	SCROLL_INCREMENT = 300,
	STICK_MAX_SPEED = 1000,
	getScrollableAncestor = function(p1)
		return if p1 == nil then nil elseif p1:IsA("ScrollingFrame") then p1 else p1:FindFirstAncestorWhichIsA("ScrollingFrame")
	end,
	canScrollVertically = function(p1)
		return if p1.ScrollingEnabled then p1.AbsoluteWindowSize.Y < p1.AbsoluteCanvasSize.Y else false
	end,
	clampCanvasY = function(value, minValue)
		return math.clamp(minValue, 0, math.max(0, value.AbsoluteCanvasSize.Y - value.AbsoluteWindowSize.Y))
	end,
	scrollByIncrement = function(p1, p2)
		if p1 == nil then return end
		local var1 = p1.AbsoluteCanvasSize.Y - p1.AbsoluteWindowSize.Y
		
		if p2 > 0 and var1 - 350 <= p1.CanvasPosition.Y then
			p1.CanvasPosition = Vector2.new(0, var1)
			
			return
		elseif p2 < 0 and p1.CanvasPosition.Y <= 350 then
			p1.CanvasPosition = Vector2.new(0, 0)
			
			return
		end
		p1.CanvasPosition += Vector2.new(0, p2)
	end,
	scrollByAnalogInput = function(p1, p2, p3)
		-- upvalues: gamepadUtils (ref)
		if p1 == nil or not (if not p1.ScrollingEnabled then false else p1.AbsoluteWindowSize.Y < p1.AbsoluteCanvasSize.Y) then return end
		local var1 = gamepadUtils.normalizeStickByDeadzone(Vector2.new(p2.Position.X, p2.Position.Y))
		
		if var1.Y == 0 then
			return
		end
		p1.CanvasPosition = Vector2.new(p1.CanvasPosition.X, math.clamp(p1.CanvasPosition.Y + p3 * -var1.Y * 1000, 0, math.max(0, p1.AbsoluteCanvasSize.Y - p1.AbsoluteWindowSize.Y)))
	end,
	isInsideContainer = function(p1, p2)
		return if p1 == nil or p2 == nil then false elseif p1 ~= p2 then p1:IsDescendantOf(p2) else true
	end,
	resolveScrollTarget = function(p1, p2)
		if p2 == nil then
			return nil
		elseif not (if p1 == nil or p2 == nil then false elseif p1 ~= p2 then p1:IsDescendantOf(p2) else true) then
			return nil
		end
		local var1 = if p1 == nil then nil elseif p1:IsA("ScrollingFrame") then p1 else p1:FindFirstAncestorWhichIsA("ScrollingFrame")
		
		return if var1 == nil then nil elseif var1 == p2 or var1:IsDescendantOf(p2) then var1 else nil
	end
}