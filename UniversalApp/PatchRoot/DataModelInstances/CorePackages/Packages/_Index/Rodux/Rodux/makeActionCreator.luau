return function(Name, Callback) --[[ Line: 4 | Named "makeActionCreator" ]]
	assert(type(Name) == "string", "Bad argument #1: Expected a string name for the action creator")
	assert(type(Callback) == "function", "Bad argument #2: Expected a function that creates action objects")
	
	return (setmetatable({ name = Name }, {
		__call = function(_, ...) --[[ Line: 12 ]]
			-- upvalues: Callback (copy), Name (copy)
			local CallbackResult = Callback(...)
			assert(type(CallbackResult) == "table", "Invalid action: An action creator must return a table")
			CallbackResult.type = Name
			
			return CallbackResult
		end
	}))
end