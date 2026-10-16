local _ = require(script:FindFirstAncestor("InExperienceShop").Types)

return function(List, Id) --[[ Line: 13 | Named "findSection" ]]
	for _, value in List do
		if value.id == Id then
			return value
		end
	end
	return nil
end