local _ = require(script.Parent.types)

return function(p1)
	if typeof(p1) ~= "table" then
		return nil
	end
	local code = p1.code
	local message = p1.message
	
	return if typeof(code) == "number" and typeof(message) == "string" then { code = code, message = message, details = p1.details } else nil
end