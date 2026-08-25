return {
	named = function(p0)
		assert(type(p0) == "string", "Symbols must be created using a string name!")
		local var0 = newproxy(true)
		local var1 = ("Symbol(%s)"):format(p0)
		
		getmetatable(var0).__tostring = function()
			-- upvalues: var1 (ref)
			return var1
		end
		
		return var0
	end
}