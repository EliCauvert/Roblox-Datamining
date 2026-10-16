return {
	named = function(p1) --[[ Line: 15 ]]
		assert(type(p1) == "string", "Symbols must be created using a string name!")
		local Proxy = newproxy(true)
		local SymbolName: string = ("Symbol(%s)"):format(p1)
		
		getmetatable(Proxy).__tostring = function() --[[ Line: 22 ]]
			-- upvalues: SymbolName (copy)
			return SymbolName
		end
		
		return Proxy
	end,
	unnamed = function() --[[ Line: 33 ]]
		local Proxy = newproxy(true)
		
		getmetatable(Proxy).__tostring = function(): string --[[ Line: 36 ]]
			return "Unnamed Symbol"
		end
		
		return Proxy
	end
}