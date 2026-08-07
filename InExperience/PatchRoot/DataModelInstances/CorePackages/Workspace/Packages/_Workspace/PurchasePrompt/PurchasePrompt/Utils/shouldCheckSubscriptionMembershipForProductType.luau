local priceChangedSubscriptionMembershipCheckProductTypes = game:DefineFastString("PriceChangedSubscriptionMembershipCheckProductTypes", "")

return function(p0) --[[ line: 9 | named "shouldCheckSubscriptionMembershipForProductType" ]]
	-- upvalues: priceChangedSubscriptionMembershipCheckProductTypes (ref)
	if p0 == nil or priceChangedSubscriptionMembershipCheckProductTypes == "" then
		return false
	end
	for i in string.gmatch(priceChangedSubscriptionMembershipCheckProductTypes, "[^,]+") do
		local var1 = i:gsub("^%s+", ""):gsub("%s+$", "")
		
		if var1 ~= "" and var1 == p0 then
			return true
		end
	end
	return false
end