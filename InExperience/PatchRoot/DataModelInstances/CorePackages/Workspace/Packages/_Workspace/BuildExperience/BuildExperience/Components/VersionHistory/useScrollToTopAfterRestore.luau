local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)

return function()
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		local current = var1.current
		
		if current == nil then
			return
		end
		task.defer(function()
			-- upvalues: var1 (copy), current (ref)
			if var1.current == current then
				current.CanvasPosition = Vector2.new(0, 0)
				
				return
			end
		end)
	end, {})
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref), var2 (ref)
		return { scrollingFrameRef = var1, scrollToTopAfterRestore = var2 }
	end, { var1, var2 })
end