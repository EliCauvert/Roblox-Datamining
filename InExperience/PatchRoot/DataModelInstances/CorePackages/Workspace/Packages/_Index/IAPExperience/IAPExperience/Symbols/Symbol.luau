return {
	named = function(p1)
		assert(type(p1) == "string", "Symbols must be created using a string name!")
		local var1 = newproxy(true)
		local var2 = ("Symbol(%s)"):format(p1)
		
		getmetatable(var1).__tostring = function()
			-- upvalues: var2 (ref)
			return var2
		end
		
		return var1
	end
}