return function(List)
	local v1 = nil
	local v2 = nil
	local List1 = {}
	local List2 = {}
	
	for _, value in ipairs(List) do
		if value.agreementType == "TermsOfService" then
			v1 = value
		elseif value.agreementType == "PrivacyPolicy" then
			v2 = value
		elseif string.find(value.agreementType, "Optional") then
			table.insert(List1, value)
		else
			table.insert(List2, value)
		end
	end
	local List3 = {}
	
	if v1 then
		table.insert(List3, v1)
	end
	if v2 then
		table.insert(List3, v2)
	end
	for _, value1 in ipairs(List2) do
		table.insert(List3, value1)
	end
	for _, value2 in ipairs(List1) do
		table.insert(List3, value2)
	end
	return List3
end