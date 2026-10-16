return function(Callback, p1) --[[ Line: 1 ]]
	local Flag = false
	local Delay = p1 or 1
	
	return function(...) --[[ Line: 4 ]]
		-- upvalues: Flag (ref), Callback (copy), Delay (copy)
		if not Flag then
			Flag = true
			Callback(...)
			task.delay(Delay, function() --[[ Line: 10 ]]
				-- upvalues: Flag (upval)
				Flag = false
			end)
			
			return
		end
	end
end