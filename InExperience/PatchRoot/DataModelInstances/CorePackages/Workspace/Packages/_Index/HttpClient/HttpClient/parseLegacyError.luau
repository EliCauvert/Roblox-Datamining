local _ = require(script.Parent.types)

return function(p1)
	if typeof(p1) ~= "table" or typeof(p1.errors) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, v in p1.errors do
		if typeof(v) == "table" and typeof(v.code) == "number" and typeof(v.message) == "string" then
			table.insert(t, {
				code = v.code,
				message = v.message,
				userFacingMessage = v.userFacingMessage,
				field = v.field
			})
		end
	end
	return if #t == 0 then nil else { errors = t }
end