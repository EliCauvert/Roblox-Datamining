return function(Callback, Delay)
	local Flag = false
	
	return function(...)
		-- upvalues: Flag (ref), Callback (copy), Delay (copy)
		if not Flag then
			Flag = true
			Callback(...)
			task.delay(Delay, function()
				-- upvalues: Flag (upval)
				Flag = false
			end)
			
			return
		end
	end
end