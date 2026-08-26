return function(p1, p2)
	local var1 = nil
	p2 = p2 or 0.5
	
	return function(...)
		-- upvalues: var1 (write), p2 (ref), p1 (ref)
		local list = { ... }
		
		if var1 then
			task.cancel(var1)
		end
		var1 = task.delay(p2, function()
			-- upvalues: p1 (copy), list (ref), var1 (copy)
			p1(unpack(list))
			var1 = nil
		end)
	end
end