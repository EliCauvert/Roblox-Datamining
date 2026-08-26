local chatConstantsModule = require(script.Parent.chatConstants)
local buildHistoryLoadTriggerViewportHeightPercent = game:DefineFastInt("BuildHistoryLoadTriggerViewportHeightPercent", 100)

return {
	getBottomCanvasPosition = function(p1)
		return math.max(0, p1.AbsoluteCanvasSize.Y - p1.AbsoluteWindowSize.Y)
	end,
	getDistanceFromBottom = function(p1)
		return math.max(0, math.max(0, p1.AbsoluteCanvasSize.Y - p1.AbsoluteWindowSize.Y) - p1.CanvasPosition.Y)
	end,
	isScrolledToBottom = function(p1)
		-- upvalues: chatConstantsModule (ref)
		return math.max(0, math.max(0, p1.AbsoluteCanvasSize.Y - p1.AbsoluteWindowSize.Y) - p1.CanvasPosition.Y) <= chatConstantsModule.BOTTOM_SCROLL_THRESHOLD
	end,
	isScrolledToTop = function(p1)
		return p1.CanvasPosition.Y <= 0
	end,
	isScrolledNearTop = function(p1)
		-- upvalues: buildHistoryLoadTriggerViewportHeightPercent (ref)
		return p1.CanvasPosition.Y / p1.AbsoluteWindowSize.Y <= buildHistoryLoadTriggerViewportHeightPercent / 100
	end,
	scrollToBottom = function(p1)
		p1.CanvasPosition = Vector2.new(0, math.max(0, p1.AbsoluteCanvasSize.Y - p1.AbsoluteWindowSize.Y))
	end,
	syncScrollFromBottom = function(p1, p2)
		-- upvalues: chatConstantsModule (ref)
		local maxValue = math.max(0, p1.AbsoluteCanvasSize.Y - p1.AbsoluteWindowSize.Y)
		
		if p2 <= chatConstantsModule.BOTTOM_SCROLL_THRESHOLD then
			p1.CanvasPosition = Vector2.new(0, maxValue)
			
			return
		end
		p1.CanvasPosition = Vector2.new(0, math.max(0, maxValue - p2))
	end
}