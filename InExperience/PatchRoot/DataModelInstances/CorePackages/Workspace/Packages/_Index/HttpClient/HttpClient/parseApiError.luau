local _ = require(script.Parent.types)

return function(p1) --[[ Line: 6 | Named "parseApiError" ]]
	if typeof(p1) == "table" then
		local Code = p1.code
		local Message = p1.message
		
		return if typeof(Code) == "number" and typeof(Message) == "string" then { code = Code, message = Message, details = p1.details } else nil
	else
		return nil
	end
end