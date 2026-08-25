return {
	new = function(p0)
		local var0 = newproxy(true)
		local var1 = if p0 then ("Symbol(%s)"):format(p0) else "Symbol()"
		
		getmetatable(var0).__tostring = function()
			-- upvalues: var1 (write)
			return var1
		end
		
		return var0
	end
}