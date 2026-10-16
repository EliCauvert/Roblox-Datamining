local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)

return function() --[[ Line: 6 | Named "useScrollToTopAfterRestore" ]]
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 9 ]]
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			task.defer(function() --[[ Line: 15 ]]
				-- upvalues: UseRefResult (upval), Current (copy)
				if UseRefResult.current == Current then
					Current.CanvasPosition = Vector2.new(0, 0)
					
					return
				end
			end)
			
			return
		end
	end, {})
	
	return ReactModule.useMemo(function() --[[ Line: 24 ]]
		-- upvalues: UseRefResult (copy), UseResult (copy)
		return {
			scrollingFrameRef = UseRefResult,
			scrollToTopAfterRestore = UseResult
		}
	end, { UseRefResult, UseResult })
end