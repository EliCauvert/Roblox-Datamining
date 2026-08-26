local tweenService = game:GetService("TweenService")
local _ = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)

return function(p1, p2)
	-- upvalues: tweenService (ref)
	if not p1 or not p1.current or not p2 then return end
	local scrollingFrame = p1.current:FindFirstChildWhichIsA("ScrollingFrame", true)
	
	if not scrollingFrame then return end
	task.wait()
	local current = p2.current
	
	if not current then return end
	local y = current.AbsolutePosition.Y
	local var1 = y + current.AbsoluteSize.Y
	local y_1 = scrollingFrame.AbsolutePosition.Y
	local var2 = y_1 + scrollingFrame.AbsoluteWindowSize.Y
	
	if y_1 <= y and var1 <= var2 then return end
	local var3 = y - scrollingFrame.AbsolutePosition.Y + scrollingFrame.CanvasPosition.Y
	local var4 = var1 - scrollingFrame.AbsolutePosition.Y + scrollingFrame.CanvasPosition.Y
	local y_2 = scrollingFrame.CanvasPosition.Y
	
	if y < y_1 then
		y_2 = var3
	elseif var2 < var1 then
		y_2 = var4 - scrollingFrame.AbsoluteWindowSize.Y
	end
	tweenService:Create(scrollingFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		CanvasPosition = Vector2.new(0, math.max(0, math.min(y_2, scrollingFrame.AbsoluteCanvasSize.Y - scrollingFrame.AbsoluteWindowSize.Y)))
	}):Play()
end