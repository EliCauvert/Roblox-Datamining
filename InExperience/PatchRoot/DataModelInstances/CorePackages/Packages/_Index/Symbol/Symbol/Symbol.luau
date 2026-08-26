return {
	new = function(p1)
		local var1 = newproxy(true)
		local var2 = if p1 then ("Symbol(%s)"):format(p1) else "Symbol()"
		
		getmetatable(var1).__tostring = function()
			-- upvalues: var2 (write)
			return var2
		end
		
		return var1
	end
}