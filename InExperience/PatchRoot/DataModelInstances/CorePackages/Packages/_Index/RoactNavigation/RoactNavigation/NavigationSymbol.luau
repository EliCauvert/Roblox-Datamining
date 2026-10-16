return function(p1) --[[ Line: 4 ]]
	assert(type(p1) == "string", "Symbols must be created using a string name!")
	local Proxy = newproxy(true)
	
	getmetatable(Proxy).__tostring = function() --[[ Line: 10 ]]
		-- upvalues: p1 (copy)
		return p1
	end
	
	return Proxy
end