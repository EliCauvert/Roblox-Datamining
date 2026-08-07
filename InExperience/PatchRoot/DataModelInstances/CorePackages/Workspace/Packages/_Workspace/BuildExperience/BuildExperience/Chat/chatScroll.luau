local chatConstantsModule = require(script.Parent.chatConstants)

return {
	getBottomCanvasPosition = function(p0) --[[ line: 3 ]]
		return math.max(0, p0.AbsoluteCanvasSize.Y - p0.AbsoluteWindowSize.Y)
	end,
	getDistanceFromBottom = function(p1) --[[ line: 7 ]]
		return math.max(0, math.max(0, p1.AbsoluteCanvasSize.Y - p1.AbsoluteWindowSize.Y) - p1.CanvasPosition.Y)
	end,
	isScrolledToBottom = function(p2) --[[ line: 11 ]]
		-- upvalues: chatConstantsModule (ref)
		return math.max(0, math.max(0, p2.AbsoluteCanvasSize.Y - p2.AbsoluteWindowSize.Y) - p2.CanvasPosition.Y) <= chatConstantsModule.BOTTOM_SCROLL_THRESHOLD
	end,
	isScrolledToTop = function(p3) --[[ line: 15 ]]
		return p3.CanvasPosition.Y <= 0
	end,
	scrollToBottom = function(p4) --[[ line: 19 ]]
		p4.CanvasPosition = Vector2.new(0, math.max(0, p4.AbsoluteCanvasSize.Y - p4.AbsoluteWindowSize.Y))
	end,
	syncScrollFromBottom = function(p5, p6) --[[ line: 24 ]]
		-- upvalues: chatConstantsModule (ref)
		local maxValue = math.max(0, p5.AbsoluteCanvasSize.Y - p5.AbsoluteWindowSize.Y)
		
		if p6 <= chatConstantsModule.BOTTOM_SCROLL_THRESHOLD then
			p5.CanvasPosition = Vector2.new(0, maxValue)
			
			return
		end
		p5.CanvasPosition = Vector2.new(0, math.max(0, maxValue - p6))
	end
}