local _ = require(script.Parent.types)

return function(p0) --[[ line: 6 | named "parseLegacyError" ]]
	if typeof(p0) ~= "table" or typeof(p0.errors) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, v in p0.errors do
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