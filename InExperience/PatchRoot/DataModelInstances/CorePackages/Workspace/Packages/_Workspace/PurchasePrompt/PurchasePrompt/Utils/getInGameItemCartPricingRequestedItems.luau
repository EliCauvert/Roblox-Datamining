local _ = require(script:FindFirstAncestor("PurchasePrompt").types)

return function(p0) --[[ line: 16 | named "getInGameItemCartPricingRequestedItems" ]]
	if type(p0) ~= "table" then
		return nil
	end
	local namespace = p0.namespace
	local targetIdentifier = p0.targetIdentifier
	
	return if not (type(namespace) ~= "string" or namespace == "") then if type(targetIdentifier) == "string" and targetIdentifier ~= "" then {
		{
			productIdentifier = {
				namespace = namespace,
				targetIdentifier = targetIdentifier
			}
		}
	} else nil else nil
end