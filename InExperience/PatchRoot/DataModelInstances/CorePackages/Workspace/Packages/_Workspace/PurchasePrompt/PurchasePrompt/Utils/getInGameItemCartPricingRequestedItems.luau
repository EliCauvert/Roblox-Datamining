local _ = require(script:FindFirstAncestor("PurchasePrompt").types)

return function(p1)
	if type(p1) == "table" then
		local Namespace = p1.namespace
		local TargetIdentifier = p1.targetIdentifier
		
		return if type(Namespace) == "string" and Namespace ~= "" and (type(TargetIdentifier) == "string" and TargetIdentifier ~= "") then {
			{
				productIdentifier = {
					namespace = Namespace,
					targetIdentifier = TargetIdentifier
				}
			}
		} else nil
	else
		return nil
	end
end