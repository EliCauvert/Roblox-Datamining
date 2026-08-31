local _ = require(script:FindFirstAncestor("InExperienceOffers").Types)

return function(p1, p2, p3)
	if p1 == nil then
		return nil
	end
	local var1 = p1[p2]
	
	if var1 == nil or p3 == nil then
		return var1
	end
	local t = {}
	
	for i, v in var1 do
		if v.offerStatus == p3 then
			table.insert(t, v)
		end
	end
	return if #t > 0 then t else nil
end