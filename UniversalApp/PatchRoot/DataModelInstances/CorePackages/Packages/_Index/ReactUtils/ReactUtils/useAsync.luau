local ReactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(Callback, p1) --[[ Line: 17 | Named "useAsync" ]]
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({ status = "loading" })
	ReactModule.useEffect(function() --[[ Line: 22 ]]
		-- upvalues: UseStateResult2 (copy), Callback (copy)
		UseStateResult2({ status = "loading" })
		local SpawnedThread = task.spawn(function() --[[ Line: 27 ]]
			-- upvalues: UseStateResult2 (upval), Callback (upval)
			xpcall(function() --[[ Line: 28 ]]
				-- upvalues: UseStateResult2 (upval), Callback (upval)
				UseStateResult2({ status = "ok", value = Callback() })
			end, function(Err) --[[ Line: 33 ]]
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2({ status = "error", problem = Err })
			end)
		end)
		
		return function() --[[ Line: 41 ]]
			-- upvalues: SpawnedThread (copy)
			task.cancel(SpawnedThread)
		end
	end, p1)
	
	return UseStateResult
end