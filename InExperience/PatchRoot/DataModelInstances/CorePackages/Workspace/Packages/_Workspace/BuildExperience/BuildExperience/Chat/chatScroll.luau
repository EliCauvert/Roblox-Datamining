local chatConstantsModule = require(script.Parent.chatConstants)
local buildHistoryLoadTriggerViewportHeightPercent = game:DefineFastInt("BuildHistoryLoadTriggerViewportHeightPercent", 100)

return {
	getBottomCanvasPosition = function(p0)
		return math.max(0, p0.AbsoluteCanvasSize.Y - p0.AbsoluteWindowSize.Y)
	end,
	getDistanceFromBottom = function(p1)
		return math.max(0, math.max(0, p1.AbsoluteCanvasSize.Y - p1.AbsoluteWindowSize.Y) - p1.CanvasPosition.Y)
	end,
	isScrolledToBottom = function(p2)
		-- upvalues: chatConstantsModule (ref)
		return math.max(0, math.max(0, p2.AbsoluteCanvasSize.Y - p2.AbsoluteWindowSize.Y) - p2.CanvasPosition.Y) <= chatConstantsModule.BOTTOM_SCROLL_THRESHOLD
	end,
	isScrolledToTop = function(p3)
		return p3.CanvasPosition.Y <= 0
	end,
	isScrolledNearTop = function(p4)
		-- upvalues: buildHistoryLoadTriggerViewportHeightPercent (ref)
		return p4.CanvasPosition.Y / p4.AbsoluteWindowSize.Y <= buildHistoryLoadTriggerViewportHeightPercent / 100
	end,
	scrollToBottom = function(p5)
		p5.CanvasPosition = Vector2.new(0, math.max(0, p5.AbsoluteCanvasSize.Y - p5.AbsoluteWindowSize.Y))
	end,
	syncScrollFromBottom = function(p6, p7)
		-- upvalues: chatConstantsModule (ref)
		local maxValue = math.max(0, p6.AbsoluteCanvasSize.Y - p6.AbsoluteWindowSize.Y)
		
		if p7 <= chatConstantsModule.BOTTOM_SCROLL_THRESHOLD then
			p6.CanvasPosition = Vector2.new(0, maxValue)
			
			return
		end
		p6.CanvasPosition = Vector2.new(0, math.max(0, maxValue - p7))
	end
}