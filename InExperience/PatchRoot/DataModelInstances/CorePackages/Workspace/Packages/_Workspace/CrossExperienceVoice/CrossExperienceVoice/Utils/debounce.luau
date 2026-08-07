return function(p0, p1) --[[ line: 1 ]]
	local var0 = nil
	local var1 = p1 / 1000
	
	return {
		cancel = function() --[[ line: 5 ]]
			-- upvalues: var0 (write)
			if var0 then
				task.cancel(var0)
				var0 = nil
			end
		end,
		call = function(...) --[[ line: 11 ]]
			-- upvalues: var0 (write), var1 (ref), p0 (ref)
			local list = { ... }
			var0 = task.delay(var1, function() --[[ line: 13 ]]
				-- upvalues: p0 (copy), list (ref)
				p0(unpack(list))
			end)
		end
	}
end