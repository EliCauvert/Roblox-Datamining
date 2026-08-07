return function(p0) --[[ line: 4 ]]
	assert(type(p0) == "string", "Symbols must be created using a string name!")
	local var0 = newproxy(true)
	
	getmetatable(var0).__tostring = function() --[[ line: 10 ]]
		-- upvalues: p0 (ref)
		return p0
	end
	
	return var0
end