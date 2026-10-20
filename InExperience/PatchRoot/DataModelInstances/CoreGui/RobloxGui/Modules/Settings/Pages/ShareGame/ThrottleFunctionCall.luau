return function(Delay, Callback)
	local Flag = false
	
	return function(...)
		-- upvalues: Flag (ref), Delay (copy), Callback (copy)
		if Flag then return end
		Flag = true
		task.delay(Delay, function()
			-- upvalues: Flag (upval)
			Flag = false
		end)
		
		return Callback(...)
	end
end