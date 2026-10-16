local TweenService = game:GetService("TweenService")
local _ = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)

return function(p1, p2) --[[ Line: 13 | Named "scrollToItem" ]]
	-- upvalues: TweenService (copy)
	if not p1 or not p1.current or not p2 then return end
	local ScrollingFrame = p1.current:FindFirstChildWhichIsA("ScrollingFrame", true)
	
	if not ScrollingFrame then return end
	task.wait()
	local Current = p2.current
	
	if not Current then return end
	local Y = Current.AbsolutePosition.Y
	local NewY = Y + Current.AbsoluteSize.Y
	local Y1 = ScrollingFrame.AbsolutePosition.Y
	local NewY1 = Y1 + ScrollingFrame.AbsoluteWindowSize.Y
	
	if Y1 > Y or NewY > NewY1 then
		local NewY2 = Y - ScrollingFrame.AbsolutePosition.Y + ScrollingFrame.CanvasPosition.Y
		local NewNewY = NewY - ScrollingFrame.AbsolutePosition.Y + ScrollingFrame.CanvasPosition.Y
		TweenService:Create(ScrollingFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			CanvasPosition = Vector2.new(0, (math.max(0, (math.min(if Y < Y1 then NewY2 elseif NewY1 < NewY then NewNewY - ScrollingFrame.AbsoluteWindowSize.Y else ScrollingFrame.CanvasPosition.Y, ScrollingFrame.AbsoluteCanvasSize.Y - ScrollingFrame.AbsoluteWindowSize.Y)))))
		}):Play()
		
		return
	end
end