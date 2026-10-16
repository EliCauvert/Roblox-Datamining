local ReactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function() --[[ Line: 7 | Named "useClock" ]]
	-- upvalues: ReactModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	ReactModule.useEffect(function() --[[ Line: 10 ]]
		-- upvalues: UseBindingResult2 (copy), UseBindingResult (copy)
		local SpawnedThread = task.spawn(function() --[[ Line: 11 ]]
			-- upvalues: UseBindingResult2 (upval), UseBindingResult (upval)
			while true do
				UseBindingResult2(UseBindingResult:getValue() + task.wait())
			end
		end)
		
		return function() --[[ Line: 18 ]]
			-- upvalues: SpawnedThread (copy)
			task.cancel(SpawnedThread)
		end
	end, {})
	
	return UseBindingResult
end