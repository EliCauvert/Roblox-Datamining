return function(p0, p1)
	local var0 = false
	p1 = p1 or 1
	
	return function(...)
		-- upvalues: var0 (write), p0 (ref), p1 (ref)
		if var0 then
			return
		end
		var0 = true
		p0(...)
		task.delay(p1, function()
			-- upvalues: var0 (copy)
			var0 = false
		end)
	end
end