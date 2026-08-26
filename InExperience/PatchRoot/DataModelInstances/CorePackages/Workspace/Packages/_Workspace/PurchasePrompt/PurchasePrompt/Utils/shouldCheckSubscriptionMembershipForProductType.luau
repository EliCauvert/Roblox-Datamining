local priceChangedSubscriptionMembershipCheckProductTypes = game:DefineFastString("PriceChangedSubscriptionMembershipCheckProductTypes", "")

return function(p1)
	-- upvalues: priceChangedSubscriptionMembershipCheckProductTypes (ref)
	if p1 == nil or priceChangedSubscriptionMembershipCheckProductTypes == "" then
		return false
	end
	for i in string.gmatch(priceChangedSubscriptionMembershipCheckProductTypes, "[^,]+") do
		local var1 = i:gsub("^%s+", ""):gsub("%s+$", "")
		
		if var1 ~= "" and var1 == p1 then
			return true
		end
	end
	return false
end