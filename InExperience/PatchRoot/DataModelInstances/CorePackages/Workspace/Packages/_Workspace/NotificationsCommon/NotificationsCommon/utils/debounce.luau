return function(p0, p1) --[[ line: 1 ]]
	local var0 = nil
	p1 = p1 or 0.5
	
	return function(...) --[[ line: 5 ]]
		-- upvalues: var0 (write), p1 (ref), p0 (ref)
		local list = { ... }
		
		if var0 then
			task.cancel(var0)
		end
		var0 = task.delay(p1, function() --[[ line: 12 ]]
			-- upvalues: p0 (copy), list (ref), var0 (copy)
			p0(unpack(list))
			var0 = nil
		end)
	end
end