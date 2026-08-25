return function(p0, p1)
	assert(type(p0) == "string", "Bad argument #1: Expected a string name for the action creator")
	assert(type(p1) == "function", "Bad argument #2: Expected a function that creates action objects")
	
	return setmetatable({ name = p0 }, {
		__call = function(_, ...)
			-- upvalues: p1 (ref), p0 (ref)
			local var0 = p1(...)
			assert(type(var0) == "table", "Invalid action: An action creator must return a table")
			var0.type = p0
			
			return var0
		end
	})
end