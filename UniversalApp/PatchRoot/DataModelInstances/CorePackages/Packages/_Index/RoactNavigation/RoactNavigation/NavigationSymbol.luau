return function(p1)
	assert(type(p1) == "string", "Symbols must be created using a string name!")
	local var1 = newproxy(true)
	
	getmetatable(var1).__tostring = function()
		-- upvalues: p1 (ref)
		return p1
	end
	
	return var1
end