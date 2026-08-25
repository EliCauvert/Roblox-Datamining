local _ = require(script.Parent.types)

return function(p0)
	if typeof(p0) ~= "table" then
		return nil
	end
	local code = p0.code
	local message = p0.message
	
	return if typeof(code) == "number" and typeof(message) == "string" then { code = code, message = message, details = p0.details } else nil
end