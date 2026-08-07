return function(p0, ...) --[[ line: 11 | named "makeActionCreator" ]]
	local list = { ... }
	assert(type(p0) == "string", "Bad argument #1 to makeActionCreator, expected string")
	
	for i = 1, select("#", ...) do
		assert(typeof(select(i, ...)) == "string", "Bad argument to makeActionCreator, all arguments must be of type string")
	end
	return setmetatable({ name = p0 }, {
		__call = function(_, ...) --[[ line: 26 ]]
			-- upvalues: p0 (ref), list (ref)
			local t = { type = p0 }
			assert(select("#", ...) == #list, "Incorrect number of arguments provided to action creator " .. p0)
			
			for i, v in ipairs(list) do
				t[v] = select(i, ...)
			end
			return t
		end
	})
end