return function(p1, p2)
	local var1 = nil
	local var2 = p2 / 1000
	
	return {
		cancel = function()
			-- upvalues: var1 (write)
			if var1 then
				task.cancel(var1)
				var1 = nil
			end
		end,
		call = function(...)
			-- upvalues: var1 (write), var2 (ref), p1 (ref)
			local list = { ... }
			var1 = task.delay(var2, function()
				-- upvalues: p1 (copy), list (ref)
				p1(unpack(list))
			end)
		end
	}
end