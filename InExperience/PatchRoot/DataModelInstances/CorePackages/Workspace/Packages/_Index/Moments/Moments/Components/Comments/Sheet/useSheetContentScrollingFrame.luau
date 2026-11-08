local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)

return function(p1)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(ScrollingFrame)
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		local Current = UseRefResult.current
		
		if ScrollingFrame ~= nil and (Current == nil or Current.scrollingFrame ~= ScrollingFrame) then
			UseRefResult.current = {
				scrollingFrame = ScrollingFrame,
				canvasSize = ScrollingFrame.CanvasSize
			}
		end
		UseStateResult2(ScrollingFrame)
	end, {})
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult (copy), p1 (copy), UseStateResult (copy)
		local Current = UseRefResult.current
		
		if not p1 and Current ~= nil and Current.scrollingFrame == UseStateResult then
			Current.scrollingFrame.CanvasSize = Current.canvasSize
		end
	end, { p1, UseStateResult })
	
	return UseStateResult, UseResult
end