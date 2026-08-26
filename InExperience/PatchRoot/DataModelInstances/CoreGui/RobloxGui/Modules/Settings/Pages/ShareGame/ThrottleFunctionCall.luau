return function(p1, p2)
	local var1 = false
	
	return function(...)
		-- upvalues: var1 (write), p1 (ref), p2 (ref)
		if var1 then
			return
		end
		var1 = true
		task.delay(p1, function()
			-- upvalues: var1 (copy)
			var1 = false
		end)
		
		return p2(...)
	end
end