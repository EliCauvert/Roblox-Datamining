local chatConstantsModule = require(script.Parent.chatConstants)
local buildHistoryLoadTriggerViewportHeightPercent = game:DefineFastInt("BuildHistoryLoadTriggerViewportHeightPercent", 100)

return {
	getBottomCanvasPosition = function(p0) --[[ line: 6 ]]
		return math.max(0, p0.AbsoluteCanvasSize.Y - p0.AbsoluteWindowSize.Y)
	end,
	getDistanceFromBottom = function(p1) --[[ line: 10 ]]
		return math.max(0, math.max(0, p1.AbsoluteCanvasSize.Y - p1.AbsoluteWindowSize.Y) - p1.CanvasPosition.Y)
	end,
	isScrolledToBottom = function(p2) --[[ line: 14 ]]
		-- upvalues: chatConstantsModule (ref)
		return math.max(0, math.max(0, p2.AbsoluteCanvasSize.Y - p2.AbsoluteWindowSize.Y) - p2.CanvasPosition.Y) <= chatConstantsModule.BOTTOM_SCROLL_THRESHOLD
	end,
	isScrolledToTop = function(p3) --[[ line: 18 ]]
		return p3.CanvasPosition.Y <= 0
	end,
	isScrolledNearTop = function(p4) --[[ line: 22 ]]
		-- upvalues: buildHistoryLoadTriggerViewportHeightPercent (ref)
		return p4.CanvasPosition.Y / p4.AbsoluteWindowSize.Y <= buildHistoryLoadTriggerViewportHeightPercent / 100
	end,
	scrollToBottom = function(p5) --[[ line: 27 ]]
		p5.CanvasPosition = Vector2.new(0, math.max(0, p5.AbsoluteCanvasSize.Y - p5.AbsoluteWindowSize.Y))
	end,
	syncScrollFromBottom = function(p6, p7) --[[ line: 32 ]]
		-- upvalues: chatConstantsModule (ref)
		local maxValue = math.max(0, p6.AbsoluteCanvasSize.Y - p6.AbsoluteWindowSize.Y)
		
		if p7 <= chatConstantsModule.BOTTOM_SCROLL_THRESHOLD then
			p6.CanvasPosition = Vector2.new(0, maxValue)
			
			return
		end
		p6.CanvasPosition = Vector2.new(0, math.max(0, maxValue - p7))
	end
}