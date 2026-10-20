local GamepadUtils = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.InputUi).Gamepad.GamepadUtils

return {
	SCROLL_INCREMENT = 300,
	STICK_MAX_SPEED = 1000,
	getScrollableAncestor = function(ScrollingFrame)
		return if ScrollingFrame == nil then nil elseif ScrollingFrame:IsA("ScrollingFrame") then ScrollingFrame else ScrollingFrame:FindFirstAncestorWhichIsA("ScrollingFrame")
	end,
	canScrollVertically = function(ScrollFrame): boolean
		return if ScrollFrame.ScrollingEnabled then ScrollFrame.AbsoluteWindowSize.Y < ScrollFrame.AbsoluteCanvasSize.Y else false
	end,
	clampCanvasY = function(ScrollFrame, Value: number): number
		return (math.clamp(Value, 0, (math.max(0, ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y))))
	end,
	scrollByIncrement = function(ScrollFrame, Y: number)
		if ScrollFrame == nil then return end
		local YDelta = ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y
		
		if Y > 0 and YDelta - 350 <= ScrollFrame.CanvasPosition.Y then
			ScrollFrame.CanvasPosition = Vector2.new(0, YDelta)
			
			return
		end
		if Y < 0 and ScrollFrame.CanvasPosition.Y <= 350 then
			ScrollFrame.CanvasPosition = Vector2.new(0, 0)
			
			return
		else
			ScrollFrame.CanvasPosition += Vector2.new(0, Y)
		end
	end,
	scrollByAnalogInput = function(ScrollFrame, p1, p2)
		-- upvalues: GamepadUtils (copy)
		if ScrollFrame == nil or not (if ScrollFrame.ScrollingEnabled then ScrollFrame.AbsoluteCanvasSize.Y > ScrollFrame.AbsoluteWindowSize.Y else false) then return end
		local NormalizeStickByDeadzoneResult = GamepadUtils.normalizeStickByDeadzone((Vector2.new(p1.Position.X, p1.Position.Y)))
		
		if NormalizeStickByDeadzoneResult.Y ~= 0 then
			ScrollFrame.CanvasPosition = Vector2.new(ScrollFrame.CanvasPosition.X, (math.clamp(ScrollFrame.CanvasPosition.Y + p2 * -NormalizeStickByDeadzoneResult.Y * 1000, 0, (math.max(0, ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y)))))
			
			return
		end
	end,
	isInsideContainer = function(Ancestor, Ancestor1)
		return Ancestor ~= nil and Ancestor1 ~= nil and (Ancestor == Ancestor1 or Ancestor:IsDescendantOf(Ancestor1))
	end,
	resolveScrollTarget = function(ScrollingFrame, Ancestor)
		if Ancestor == nil then
			return nil
		elseif ScrollingFrame ~= nil and Ancestor ~= nil and (ScrollingFrame == Ancestor or ScrollingFrame:IsDescendantOf(Ancestor)) then
			local ScrollingFrame1 = if ScrollingFrame == nil then nil elseif ScrollingFrame:IsA("ScrollingFrame") then ScrollingFrame else ScrollingFrame:FindFirstAncestorWhichIsA("ScrollingFrame")
			
			return if ScrollingFrame1 == nil then nil elseif ScrollingFrame1 == Ancestor or ScrollingFrame1:IsDescendantOf(Ancestor) then ScrollingFrame1 else nil
		else
			return nil
		end
	end
}