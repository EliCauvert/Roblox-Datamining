local ReactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(Callback, p1)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({ status = "loading" })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), Callback (copy)
		UseStateResult2({ status = "loading" })
		local SpawnedThread = task.spawn(function()
			-- upvalues: UseStateResult2 (upval), Callback (upval)
			xpcall(function()
				-- upvalues: UseStateResult2 (upval), Callback (upval)
				UseStateResult2({ status = "ok", value = Callback() })
			end, function(Err)
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2({ status = "error", problem = Err })
			end)
		end)
		
		return function()
			-- upvalues: SpawnedThread (copy)
			task.cancel(SpawnedThread)
		end
	end, p1)
	
	return UseStateResult
end