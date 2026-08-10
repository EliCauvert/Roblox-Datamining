local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)

return function() --[[ line: 6 | named "useScrollToTopAfterRestore" ]]
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useCallback(function() --[[ line: 9 ]]
		-- upvalues: var1 (ref)
		local current = var1.current
		
		if current == nil then
			return
		end
		task.defer(function() --[[ line: 15 ]]
			-- upvalues: var1 (copy), current (ref)
			if var1.current == current then
				current.CanvasPosition = Vector2.new(0, 0)
				
				return
			end
		end)
	end, {})
	
	return reactModule.useMemo(function() --[[ line: 24 ]]
		-- upvalues: var1 (ref), var2 (ref)
		return { scrollingFrameRef = var1, scrollToTopAfterRestore = var2 }
	end, { var1, var2 })
end