local _ = require(script:FindFirstAncestor("VirtualEvents").Parent.GraphQLServer)

return function(p0)
	local eventCategories = p0.eventCategories
	
	if eventCategories == nil or #eventCategories == 0 then
		return nil
	end
	for i, v in ipairs(eventCategories) do
		if v ~= nil and v.rank == 0 then
			return v.category
		end
	end
	return nil
end