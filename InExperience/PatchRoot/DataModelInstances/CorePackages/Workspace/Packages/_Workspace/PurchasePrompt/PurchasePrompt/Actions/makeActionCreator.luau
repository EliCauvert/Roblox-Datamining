return function(p1, ...)
	local list = { ... }
	assert(type(p1) == "string", "Bad argument #1 to makeActionCreator, expected string")
	
	for i = 1, select("#", ...) do
		assert(typeof(select(i, ...)) == "string", "Bad argument to makeActionCreator, all arguments must be of type string")
	end
	return setmetatable({ name = p1 }, {
		__call = function(_, ...)
			-- upvalues: p1 (ref), list (ref)
			local t = { type = p1 }
			assert(select("#", ...) == #list, "Incorrect number of arguments provided to action creator " .. p0)
			
			for i, v in ipairs(list) do
				t[v] = select(i, ...)
			end
			return t
		end
	})
end