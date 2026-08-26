return function(p1, p2)
	local var1 = 0
	
	return function(...)
		-- upvalues: var1 (write), p2 (ref), p1 (ref)
		local list = { ... }
		local var2 = time()
		var1 = var2
		delay(p2, function()
			-- upvalues: var1 (copy), var2 (ref), p1 (copy), list (ref)
			if var1 == var2 then
				p1(unpack(list))
			end
		end)
	end
end