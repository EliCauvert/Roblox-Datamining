return {
	new = function(p1)
		local Proxy = newproxy(true)
		local SymbolName: string = if p1 then ("Symbol(%s)"):format(p1) else "Symbol()"
		
		getmetatable(Proxy).__tostring = function()
			-- upvalues: SymbolName (ref)
			return SymbolName
		end
		
		return Proxy
	end
}