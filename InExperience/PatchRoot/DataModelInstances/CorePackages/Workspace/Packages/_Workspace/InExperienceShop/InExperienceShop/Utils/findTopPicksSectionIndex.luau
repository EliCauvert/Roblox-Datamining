local _ = require(script:FindFirstAncestor("InExperienceShop").Types)

return function(p0) --[[ line: 11 | named "findTopPicksSectionIndex" ]]
	for i, v in p0 do
		if string.lower(v.name) == "top picks" then
			return i
		end
	end
	return nil
end