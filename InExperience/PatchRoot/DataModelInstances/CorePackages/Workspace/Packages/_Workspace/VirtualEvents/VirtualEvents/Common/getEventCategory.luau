local _ = require(script:FindFirstAncestor("VirtualEvents").Parent.GraphQLServer)

return function(p1)
	local EventCategories = p1.eventCategories
	
	if EventCategories == nil or #EventCategories == 0 then
		return nil
	end
	for _, eventCategory in ipairs(EventCategories) do
		if eventCategory ~= nil and eventCategory.rank == 0 then
			return eventCategory.category
		end
	end
	return nil
end