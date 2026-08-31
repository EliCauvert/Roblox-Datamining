local _ = require(script:FindFirstAncestor("PurchasePrompt").types)
local t = {
	[Enum.InfoType.GamePass] = "GamePass",
	[Enum.InfoType.Product] = "DeveloperProduct"
}

return function(p1, p2)
	-- upvalues: t (ref)
	local var1 = t[p1]
	
	if var1 == nil then
		return nil
	elseif p2 == nil then
		return nil
	end
	local var2 = tostring(p2)
	
	return if var2 == "" then nil else { namespace = var1, targetIdentifier = var2 }
end