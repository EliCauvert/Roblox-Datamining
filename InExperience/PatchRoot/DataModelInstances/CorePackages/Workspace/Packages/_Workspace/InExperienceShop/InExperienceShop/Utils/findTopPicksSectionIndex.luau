local _ = require(script:FindFirstAncestor("InExperienceShop").Types)

return function(p1)
	for i, v in p1 do
		if string.lower(v.name) == "top picks" then
			return i
		end
	end
	return nil
end