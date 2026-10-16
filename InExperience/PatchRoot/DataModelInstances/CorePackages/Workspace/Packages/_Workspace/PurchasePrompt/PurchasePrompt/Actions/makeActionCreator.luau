return function(Name, ...) --[[ Line: 11 | Named "makeActionCreator" ]]
	local list = { ... }
	assert(type(Name) == "string", "Bad argument #1 to makeActionCreator, expected string")
	
	for i = 1, select("#", ...) do
		assert(typeof(select(i, ...)) == "string", "Bad argument to makeActionCreator, all arguments must be of type string")
	end
	return (setmetatable({ name = Name }, {
		__call = function(_, ...) --[[ Line: 26 ]]
			-- upvalues: Name (copy), list (copy)
			local config = { type = Name }
			assert(select("#", ...) == #list, "Incorrect number of arguments provided to action creator " .. Name)
			
			for i, value in ipairs(list) do
				config[value] = select(i, ...)
			end
			return config
		end
	}))
end