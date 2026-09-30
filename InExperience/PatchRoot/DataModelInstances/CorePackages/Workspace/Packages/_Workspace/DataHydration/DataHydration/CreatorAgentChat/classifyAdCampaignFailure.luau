local errorCodes = require(script.Parent.Acp.AcpProtocol).ErrorCodes
local _ = require(script.Parent.Types.store)

return function(p1)
	-- upvalues: errorCodes (ref)
	local var1 = if type(p1) == "table" and type(p1.responseCode) == "number" then p1.responseCode else nil
	local var2 = if type(p1) == "table" and type(p1.errorMessage) == "string" then p1.errorMessage else tostring(p1)
	local var3 = "unknown"
	
	if var1 == errorCodes.OutOfCredits then
		var3 = "payment_required"
	elseif var1 == errorCodes.Forbidden or var1 == errorCodes.Unauthorized then
		var3 = "ineligible"
	elseif var1 == errorCodes.InvalidParams then
		var3 = "invalid_offer"
	end
	return { kind = var3, code = var1, message = var2 }
end