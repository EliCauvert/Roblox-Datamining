local _ = require(script:FindFirstAncestor("InExperienceShop").Types)

return function(p0, p1)
	for i, v in p0 do
		if v.id == p1 then
			return v
		end
	end
	return nil
end