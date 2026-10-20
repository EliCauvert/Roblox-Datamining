local _ = require(script.Parent.types)

return function(p1)
	if typeof(p1) ~= "table" or typeof(p1.errors) ~= "table" then
		return nil
	end
	local Errors = {}
	
	for _, _error in p1.errors do
		if typeof(_error) == "table" and typeof(_error.code) == "number" and typeof(_error.message) == "string" then
			table.insert(Errors, {
				code = _error.code,
				message = _error.message,
				userFacingMessage = _error.userFacingMessage,
				field = _error.field
			})
		end
	end
	return if #Errors == 0 then nil else { errors = Errors }
end