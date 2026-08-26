return function(p1, p2)
	assert(type(p1) == "string", "A name must be provided to create an Action")
	assert(type(p2) == "function", "A function must be provided to create an Action")
	
	return setmetatable({ name = p1 }, {
		__call = function(_, ...)
			-- upvalues: p2 (ref), p1 (ref)
			local var1 = p2(...)
			assert(type(var1) == "table", "An action must return a table")
			var1.type = p1
			
			return var1
		end
	})
end