return function(p0, p1)
	local var0 = false
	
	return function(...)
		-- upvalues: var0 (write), p0 (ref), p1 (ref)
		if var0 then
			return
		end
		var0 = true
		task.delay(p0, function()
			-- upvalues: var0 (copy)
			var0 = false
		end)
		
		return p1(...)
	end
end