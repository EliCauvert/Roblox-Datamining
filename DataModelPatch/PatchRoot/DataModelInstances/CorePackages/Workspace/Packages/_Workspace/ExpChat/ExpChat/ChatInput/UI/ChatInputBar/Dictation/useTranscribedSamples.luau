local ReactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)

return function()
	-- upvalues: ReactModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding({})
	local UseRefResult = ReactModule.useRef(nil)
	
	return {
		binding = UseBindingResult,
		begin = function(p1)
			-- upvalues: UseRefResult (copy)
			UseRefResult.current = UseRefResult.current or p1
		end,
		commit = function(EndIdx)
			-- upvalues: UseRefResult (copy), UseBindingResult (copy), UseBindingResult2 (copy)
			local Current = UseRefResult.current
			UseRefResult.current = nil
			
			if Current ~= nil and EndIdx >= Current then
				local Copy = table.clone(UseBindingResult:getValue())
				table.insert(Copy, { startIdx = Current, endIdx = EndIdx })
				UseBindingResult2(Copy)
				
				return
			end
		end,
		reset = function()
			-- upvalues: UseRefResult (copy), UseBindingResult2 (copy)
			UseRefResult.current = nil
			UseBindingResult2({})
		end
	}
end