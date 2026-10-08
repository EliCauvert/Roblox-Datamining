local var1 = nil

return {
	register = function(p1)
		-- upvalues: var1 (write)
		var1 = p1
		
		return function()
			-- upvalues: var1 (copy), p1 (ref)
			if var1 == p1 then
				var1 = nil
			end
		end
	end,
	get = function()
		-- upvalues: var1 (write)
		return var1
	end
}