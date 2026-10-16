return function(Delay, Callback) --[[ Line: 1 ]]
	local Flag = false
	
	return function(...) --[[ Line: 3 ]]
		-- upvalues: Flag (ref), Delay (copy), Callback (copy)
		if Flag then return end
		Flag = true
		task.delay(Delay, function() --[[ Line: 8 ]]
			-- upvalues: Flag (upval)
			Flag = false
		end)
		
		return Callback(...)
	end
end