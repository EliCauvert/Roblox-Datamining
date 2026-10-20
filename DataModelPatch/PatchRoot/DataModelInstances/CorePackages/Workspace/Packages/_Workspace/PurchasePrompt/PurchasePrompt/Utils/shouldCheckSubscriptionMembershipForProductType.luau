local PriceChangedSubscriptionMembershipCheckProductTypes = game:DefineFastString("PriceChangedSubscriptionMembershipCheckProductTypes", "")

return function(S): boolean
	-- upvalues: PriceChangedSubscriptionMembershipCheckProductTypes (copy)
	if S == nil or PriceChangedSubscriptionMembershipCheckProductTypes == "" then
		return false
	end
	for Text in string.gmatch(PriceChangedSubscriptionMembershipCheckProductTypes, "[^,]+") do
		local S1 = Text:gsub("^%s+", ""):gsub("%s+$", "")
		
		if S1 ~= "" and S1 == S then
			return true
		end
	end
	return false
end