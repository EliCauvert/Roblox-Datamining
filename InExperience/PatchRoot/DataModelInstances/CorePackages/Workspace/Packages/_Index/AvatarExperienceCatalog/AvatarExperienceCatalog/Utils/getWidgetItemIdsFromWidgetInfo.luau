local _ = require(script:FindFirstAncestor("AvatarExperienceCatalog").Components.ResultsList.WidgetListInfoViewModel)

return function(p1, p2: number)
	local List = {}
	
	if not p1 or not p1.content then
		return List
	end
	local Content = p1.content
	
	for i = 1, math.min(#Content, p2) do
		local ContentEntry = Content[i]
		
		if ContentEntry ~= nil and ContentEntry.id ~= nil then
			table.insert(List, (tostring(ContentEntry.id)))
		end
	end
	return List
end