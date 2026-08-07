return function(p0, p1) --[[ line: 1 ]]
	local var0 = false
	
	return function(...) --[[ line: 4 ]]
		-- upvalues: var0 (write), p0 (ref), p1 (ref)
		if var0 then
			return
		end
		var0 = true
		p0(...)
		task.delay(p1, function() --[[ line: 10 ]]
			-- upvalues: var0 (copy)
			var0 = false
		end)
	end
end