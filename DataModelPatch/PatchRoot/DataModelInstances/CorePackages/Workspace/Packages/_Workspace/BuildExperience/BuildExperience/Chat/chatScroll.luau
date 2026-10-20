local ChatConstantsModule = require(script.Parent.chatConstants)

return {
	getBottomCanvasPosition = function(ScrollFrame): number
		return (math.max(0, ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y))
	end,
	getDistanceFromBottom = function(ScrollFrame): number
		return (math.max(0, math.max(0, ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y) - ScrollFrame.CanvasPosition.Y))
	end,
	isScrolledToBottom = function(ScrollFrame): boolean
		-- upvalues: ChatConstantsModule (copy)
		return math.max(0, math.max(0, ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y) - ScrollFrame.CanvasPosition.Y) <= ChatConstantsModule.BOTTOM_SCROLL_THRESHOLD
	end,
	isScrolledToTop = function(ScrollFrame): boolean
		return ScrollFrame.CanvasPosition.Y <= 0
	end,
	scrollToBottom = function(ScrollFrame)
		ScrollFrame.CanvasPosition = Vector2.new(0, (math.max(0, ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y)))
	end,
	syncScrollFromBottom = function(ScrollFrame, p1: number)
		-- upvalues: ChatConstantsModule (copy)
		local Largest = math.max(0, ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y)
		
		if p1 <= ChatConstantsModule.BOTTOM_SCROLL_THRESHOLD then
			ScrollFrame.CanvasPosition = Vector2.new(0, Largest)
			
			return
		else
			ScrollFrame.CanvasPosition = Vector2.new(0, (math.max(0, Largest - p1)))
		end
	end
}