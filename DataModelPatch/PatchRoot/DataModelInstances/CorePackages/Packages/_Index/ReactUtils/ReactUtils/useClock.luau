local ReactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function()
	-- upvalues: ReactModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	ReactModule.useEffect(function()
		-- upvalues: UseBindingResult2 (copy), UseBindingResult (copy)
		local SpawnedThread = task.spawn(function()
			-- upvalues: UseBindingResult2 (upval), UseBindingResult (upval)
			while true do
				UseBindingResult2(UseBindingResult:getValue() + task.wait())
			end
		end)
		
		return function()
			-- upvalues: SpawnedThread (copy)
			task.cancel(SpawnedThread)
		end
	end, {})
	
	return UseBindingResult
end