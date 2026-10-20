local _ = require(script:FindFirstAncestor("InExperienceOffers").Types)

return function(p1, p2, OfferStatus)
	if p1 == nil then
		return nil
	end
	local v1 = p1[p2]
	
	if v1 == nil or OfferStatus == nil then
		return v1
	end
	local List = {}
	
	for _, value in v1 do
		if value.offerStatus == OfferStatus then
			table.insert(List, value)
		end
	end
	return if #List > 0 then List else nil
end