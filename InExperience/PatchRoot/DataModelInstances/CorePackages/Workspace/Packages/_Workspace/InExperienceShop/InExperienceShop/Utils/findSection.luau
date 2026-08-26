local _ = require(script:FindFirstAncestor("InExperienceShop").Types)

return function(p1, p2)
	for i, v in p1 do
		if v.id == p2 then
			return v
		end
	end
	return nil
end