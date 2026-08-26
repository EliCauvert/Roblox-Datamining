return function(p1, p2)
	assert(type(p1) == "string", "Bad argument #1: Expected a string name for the action creator")
	assert(type(p2) == "function", "Bad argument #2: Expected a function that creates action objects")
	
	return setmetatable({ name = p1 }, {
		__call = function(_, ...)
			-- upvalues: p2 (ref), p1 (ref)
			local var1 = p2(...)
			assert(type(var1) == "table", "Invalid action: An action creator must return a table")
			var1.type = p1
			
			return var1
		end
	})
end