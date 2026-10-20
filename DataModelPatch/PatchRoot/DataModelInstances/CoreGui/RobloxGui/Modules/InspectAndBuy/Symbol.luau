return {
	named = function(p1)
		assert(type(p1) == "string", "Symbols must be created using a string name!")
		local Proxy = newproxy(true)
		local SymbolName: string = ("Symbol(%s)"):format(p1)
		
		getmetatable(Proxy).__tostring = function()
			-- upvalues: SymbolName (copy)
			return SymbolName
		end
		
		return Proxy
	end
}