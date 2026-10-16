return function(Name, Callback) --[[ Line: 3 ]]
	assert(type(Name) == "string", "A name must be provided to create an Action")
	assert(type(Callback) == "function", "A function must be provided to create an Action")
	
	return (setmetatable({ name = Name }, {
		__call = function(_, ...) --[[ Line: 10 ]]
			-- upvalues: Callback (copy), Name (copy)
			local CallbackResult = Callback(...)
			assert(type(CallbackResult) == "table", "An action must return a table")
			CallbackResult.type = Name
			
			return CallbackResult
		end
	}))
end