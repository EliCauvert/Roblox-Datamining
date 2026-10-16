local ReactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)

return function() --[[ Line: 26 | Named "useTranscribedSamples" ]]
	-- upvalues: ReactModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding({})
	local UseRefResult = ReactModule.useRef(nil)
	
	return {
		binding = UseBindingResult,
		begin = function(p1) --[[ Line: 32 ]]
			-- upvalues: UseRefResult (copy)
			UseRefResult.current = UseRefResult.current or p1
		end,
		commit = function(EndIdx) --[[ Line: 38 ]]
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
		reset = function() --[[ Line: 49 ]]
			-- upvalues: UseRefResult (copy), UseBindingResult2 (copy)
			UseRefResult.current = nil
			UseBindingResult2({})
		end
	}
end