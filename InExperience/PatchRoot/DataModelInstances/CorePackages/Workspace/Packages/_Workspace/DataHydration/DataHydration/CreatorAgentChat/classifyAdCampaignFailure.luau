local ErrorCodes = require(script.Parent.Acp.AcpProtocol).ErrorCodes
local _ = require(script.Parent.Types.store)
local config = {
	[ErrorCodes.InsufficientFunds] = "payment_required",
	[ErrorCodes.Forbidden] = "ineligible",
	[ErrorCodes.MissingThumbnail] = "missing_thumbnail"
}

if require(script:FindFirstAncestor("DataHydration").Parent.SharedFlags).FFlagBuildAdsFundedNotCreatedError then
	config[ErrorCodes.AdCreditFundedNotCreated] = "funded_not_created"
end
return function(p1)
	-- upvalues: config (copy)
	local ResponseCode = if type(p1) == "table" and type(p1.responseCode) == "number" then p1.responseCode else nil
	
	return {
		kind = if ResponseCode == nil then "unknown" else config[ResponseCode] or "unknown",
		code = ResponseCode,
		message = if type(p1) == "table" and type(p1.errorMessage) == "string" then p1.errorMessage else tostring(p1)
	}
end