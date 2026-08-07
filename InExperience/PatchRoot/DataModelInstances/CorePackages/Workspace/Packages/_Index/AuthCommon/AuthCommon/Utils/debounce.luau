return function(p0, p1) --[[ line: 1 ]]
	local var0 = 0
	
	return function(...) --[[ line: 3 ]]
		-- upvalues: var0 (write), p1 (ref), p0 (ref)
		local list = { ... }
		local var2 = time()
		var0 = var2
		task.delay(p1, function() --[[ line: 7 ]]
			-- upvalues: var0 (copy), var2 (ref), p0 (copy), list (ref)
			if var0 == var2 then
				p0(unpack(list))
			end
		end)
	end
end