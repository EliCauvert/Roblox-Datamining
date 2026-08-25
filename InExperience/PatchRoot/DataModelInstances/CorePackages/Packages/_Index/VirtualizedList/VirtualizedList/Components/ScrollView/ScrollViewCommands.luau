local parent = script.Parent.Parent.Parent.Parent
local _ = require(parent.LuauPolyfill)
local _ = require(parent.React)

return {
	default = {
		flashScrollIndicators = function(_)
			warn("flashScrollIndicators not implemented")
		end,
		scrollTo = function(p0, p1, p2, p3)
			if p3 then
				p0._nativeRef.animateScrollTo(p1, p2)
				
				return
			end
			p0._nativeRef.current.CanvasPosition = Vector2.new(p1, p2)
		end,
		scrollToEnd = function(p4, p5)
			local var0 = if p4._nativeRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then 0 else p4._nativeRef.current.AbsoluteCanvasSize.X
			local var1 = if p4._nativeRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then p4._nativeRef.current.AbsoluteCanvasSize.Y else 0
			
			if p5 then
				p4._nativeRef.animateScrollTo(var0, var1)
				
				return
			end
			p4._nativeRef.current.CanvasPosition = Vector2.new(var0, var1)
		end,
		zoomToRect = function(_, _, _)
			warn("zoomToRect not implemented")
		end
	}
}