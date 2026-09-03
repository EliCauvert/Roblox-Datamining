local t = {}

return {
	register = function(p1)
		-- upvalues: t (ref)
		table.insert(t, p1)
		
		return function()
			-- upvalues: t (copy), p1 (ref)
			local index = table.find(t, p1)
			
			if index then
				table.remove(t, index)
			end
		end
	end,
	consume = function()
		-- upvalues: t (ref)
		local var1 = t[#t]
		
		if var1 then
			var1()
			
			return true
		end
		return false
	end
}