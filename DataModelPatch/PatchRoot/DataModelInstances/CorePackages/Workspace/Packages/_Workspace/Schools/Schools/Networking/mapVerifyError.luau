local _ = require(script:FindFirstAncestor("Schools").Api.Types)

return function(p1, p2)
	local ResponseCode = if typeof(p1) == "table" then p1.responseCode else nil
	local ErrorMessage = if typeof(p1) == "table" then p1.errorMessage else nil
	
	return if ResponseCode == nil then { kind = "Network", message = ErrorMessage } elseif p2 and p2[ResponseCode] then { kind = p2[ResponseCode], message = ErrorMessage } else { kind = "Unknown", message = ErrorMessage }
end