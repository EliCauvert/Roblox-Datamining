return {
	named = function(p1) --[[ Line: 30 ]]
		assert(type(p1) == "string", "Symbols must be created using a string name!")
		local Proxy = newproxy(true)
		local Formatted = string.format("Symbol(%s)", p1)
		
		getmetatable(Proxy).__tostring = function() --[[ Line: 37 ]]
			-- upvalues: Formatted (copy)
			return Formatted
		end
		
		return Proxy
	end
}