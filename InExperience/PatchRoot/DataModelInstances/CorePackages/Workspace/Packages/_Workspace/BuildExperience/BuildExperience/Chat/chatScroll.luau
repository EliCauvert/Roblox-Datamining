local ChatConstantsModule = require(script.Parent.chatConstants)
local BuildHistoryLoadTriggerViewportHeightPercent = game:DefineFastInt("BuildHistoryLoadTriggerViewportHeightPercent", 100)

return {
	getBottomCanvasPosition = function(ScrollFrame): number --[[ Line: 6 ]]
		return (math.max(0, ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y))
	end,
	getDistanceFromBottom = function(ScrollFrame): number --[[ Line: 10 ]]
		return (math.max(0, math.max(0, ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y) - ScrollFrame.CanvasPosition.Y))
	end,
	getOffsetInViewport = function(Frame, Frame1) --[[ Line: 27 ]]
		return Frame1.AbsolutePosition.Y - Frame.AbsolutePosition.Y
	end,
	isScrolledToBottom = function(ScrollFrame): boolean --[[ Line: 14 ]]
		-- upvalues: ChatConstantsModule (copy)
		return math.max(0, math.max(0, ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y) - ScrollFrame.CanvasPosition.Y) <= ChatConstantsModule.BOTTOM_SCROLL_THRESHOLD
	end,
	isScrolledToTop = function(ScrollFrame): boolean --[[ Line: 18 ]]
		return ScrollFrame.CanvasPosition.Y <= 0
	end,
	isScrolledNearTop = function(ScrollFrame): boolean --[[ Line: 22 ]]
		-- upvalues: BuildHistoryLoadTriggerViewportHeightPercent (copy)
		return ScrollFrame.CanvasPosition.Y / ScrollFrame.AbsoluteWindowSize.Y <= BuildHistoryLoadTriggerViewportHeightPercent / 100
	end,
	scrollToBottom = function(ScrollFrame) --[[ Line: 31 ]]
		ScrollFrame.CanvasPosition = Vector2.new(0, (math.max(0, ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y)))
	end,
	syncScrollFromBottom = function(ScrollFrame, p1: number) --[[ Line: 36 ]]
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