local errorCodes = require(script.Parent.Acp.AcpProtocol).ErrorCodes
local _ = require(script.Parent.Types.store)
local t = {
	[errorCodes.InsufficientFunds] = "payment_required",
	[errorCodes.Forbidden] = "ineligible",
	[errorCodes.MissingThumbnail] = "missing_thumbnail"
}

return function(p1)
	-- upvalues: t (ref)
	local var1 = if type(p1) == "table" and type(p1.responseCode) == "number" then p1.responseCode else nil
	
	return {
		kind = if var1 ~= nil then "unknown" else t[var1] or "unknown",
		code = var1,
		message = if type(p1) == "table" and type(p1.errorMessage) == "string" then p1.errorMessage else tostring(p1)
	}
end