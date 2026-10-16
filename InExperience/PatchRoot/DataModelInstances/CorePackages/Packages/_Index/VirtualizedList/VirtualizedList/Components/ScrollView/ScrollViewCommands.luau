local Parent = script.Parent.Parent.Parent.Parent
local _ = require(Parent.LuauPolyfill)
local _ = require(Parent.React)

return {
	default = {
		flashScrollIndicators = function(_) --[[ Line: 59 ]]
			warn("flashScrollIndicators not implemented")
		end,
		scrollTo = function(p1, X, Y, p2) --[[ Line: 62 ]]
			if p2 then
				p1._nativeRef.animateScrollTo(X, Y)
				
				return
			else
				p1._nativeRef.current.CanvasPosition = Vector2.new(X, Y)
			end
		end,
		scrollToEnd = function(p1, p2) --[[ Line: 74 ]]
			local X = if p1._nativeRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then 0 else p1._nativeRef.current.AbsoluteCanvasSize.X
			local Y = if p1._nativeRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then p1._nativeRef.current.AbsoluteCanvasSize.Y else 0
			
			if p2 then
				p1._nativeRef.animateScrollTo(X, Y)
				
				return
			else
				p1._nativeRef.current.CanvasPosition = Vector2.new(X, Y)
			end
		end,
		zoomToRect = function(_, _, _) --[[ Line: 88 ]]
			warn("zoomToRect not implemented")
		end
	}
}