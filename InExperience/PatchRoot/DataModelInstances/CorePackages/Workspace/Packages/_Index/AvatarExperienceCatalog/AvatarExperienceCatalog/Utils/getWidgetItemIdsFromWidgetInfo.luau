local _ = require(script:FindFirstAncestor("AvatarExperienceCatalog").Components.ResultsList.WidgetListInfoViewModel)

return function(p1, p2)
	local t = {}
	
	if not p1 or not p1.content then
		return t
	end
	local content = p1.content
	
	for i = 1, math.min(#content, p2) do
		local var1 = content[i]
		
		if var1 ~= nil and var1.id ~= nil then
			table.insert(t, tostring(var1.id))
		end
	end
	return t
end