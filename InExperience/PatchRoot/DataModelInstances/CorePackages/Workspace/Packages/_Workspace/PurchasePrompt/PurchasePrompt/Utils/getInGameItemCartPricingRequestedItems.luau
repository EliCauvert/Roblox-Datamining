local _ = require(script:FindFirstAncestor("PurchasePrompt").types)

return function(p1)
	if type(p1) ~= "table" then
		return nil
	end
	local namespace = p1.namespace
	local targetIdentifier = p1.targetIdentifier
	
	return if not (type(namespace) ~= "string" or namespace == "") then if type(targetIdentifier) == "string" and targetIdentifier ~= "" then {
		{
			productIdentifier = {
				namespace = namespace,
				targetIdentifier = targetIdentifier
			}
		}
	} else nil else nil
end