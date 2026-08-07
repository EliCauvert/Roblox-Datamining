local tweenService = game:GetService("TweenService")
local _ = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)

return function(p0, p1) --[[ line: 13 | named "scrollToItem" ]]
	-- upvalues: tweenService (ref)
	if not p0 or not p0.current or not p1 then return end
	local scrollingFrame = p0.current:FindFirstChildWhichIsA("ScrollingFrame", true)
	
	if not scrollingFrame then return end
	task.wait()
	local current = p1.current
	
	if not current then return end
	local y = current.AbsolutePosition.Y
	local var2 = y + current.AbsoluteSize.Y
	local y_1 = scrollingFrame.AbsolutePosition.Y
	local var3 = y_1 + scrollingFrame.AbsoluteWindowSize.Y
	
	if y_1 <= y and var2 <= var3 then return end
	local var4 = y - scrollingFrame.AbsolutePosition.Y + scrollingFrame.CanvasPosition.Y
	local var5 = var2 - scrollingFrame.AbsolutePosition.Y + scrollingFrame.CanvasPosition.Y
	local y_2 = scrollingFrame.CanvasPosition.Y
	
	if y < y_1 then
		y_2 = var4
	elseif var3 < var2 then
		y_2 = var5 - scrollingFrame.AbsoluteWindowSize.Y
	end
	tweenService:Create(scrollingFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		CanvasPosition = Vector2.new(0, math.max(0, math.min(y_2, scrollingFrame.AbsoluteCanvasSize.Y - scrollingFrame.AbsoluteWindowSize.Y)))
	}):Play()
end