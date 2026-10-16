local ReactModule = require(script:FindFirstAncestor("ServerDrivenUi").Parent.React)

return function(p1) --[[ Line: 21 | Named "useUniformItemHeight" ]]
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(nil)
	local UseResult = ReactModule.useCallback(function(p2, Frame: Frame) --[[ Line: 29 ]]
		-- upvalues: p1 (copy), UseRefResult2 (copy), UseRefResult (copy), UseStateResult2 (copy), UseBindingResult2 (copy), UseRefResult1 (copy)
		if not p1 then return end
		local X = Frame.AbsoluteSize.X
		local Y: number = Frame.AbsoluteSize.Y
		
		if UseRefResult2.current > 0 and math.abs(X - UseRefResult2.current) > 1 then
			UseRefResult2.current = X
			UseRefResult.current = {}
			UseStateResult2(nil)
			UseBindingResult2(nil)
			
			return
		end
		UseRefResult2.current = X
		
		if Y <= 0 or UseRefResult.current[p2] == Y then return end
		UseRefResult.current[p2] = Y
		
		if not UseRefResult1.current then
			UseRefResult1.current = true
			task.defer(function() --[[ Line: 53 ]]
				-- upvalues: UseRefResult1 (upval), UseRefResult (upval), UseBindingResult2 (upval), UseStateResult2 (upval)
				UseRefResult1.current = false
				local Largest = 0
				
				for _, value in UseRefResult.current do
					Largest = math.max(Largest, value)
				end
				if Largest > 0 then
					UseBindingResult2(Largest)
					UseStateResult2(Largest)
				end
			end)
		end
	end, { p1 })
	
	return {
		measuredMaxHeight = if p1 then UseStateResult else nil,
		measuredMaxHeightBinding = if p1 then UseBindingResult else nil,
		onItemSizeChanged = if p1 then UseResult else nil
	}
end