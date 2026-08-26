return function(p1, p2)
	local var1 = false
	
	return function(...)
		-- upvalues: var1 (write), p1 (ref), p2 (ref)
		if var1 then
			return
		end
		var1 = true
		p1(...)
		task.delay(p2, function()
			-- upvalues: var1 (copy)
			var1 = false
		end)
	end
end