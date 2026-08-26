local parent = script.Parent.Parent.Parent.Parent
local _ = require(parent.LuauPolyfill)
local _ = require(parent.React)

return {
	default = {
		flashScrollIndicators = function(_)
			warn("flashScrollIndicators not implemented")
		end,
		scrollTo = function(p1, p2, p3, p4)
			if p4 then
				p1._nativeRef.animateScrollTo(p2, p3)
				
				return
			end
			p1._nativeRef.current.CanvasPosition = Vector2.new(p2, p3)
		end,
		scrollToEnd = function(p1, p2)
			local var1 = if p1._nativeRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then 0 else p1._nativeRef.current.AbsoluteCanvasSize.X
			local var2 = if p1._nativeRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then p1._nativeRef.current.AbsoluteCanvasSize.Y else 0
			
			if p2 then
				p1._nativeRef.animateScrollTo(var1, var2)
				
				return
			end
			p1._nativeRef.current.CanvasPosition = Vector2.new(var1, var2)
		end,
		zoomToRect = function(_, _, _)
			warn("zoomToRect not implemented")
		end
	}
}