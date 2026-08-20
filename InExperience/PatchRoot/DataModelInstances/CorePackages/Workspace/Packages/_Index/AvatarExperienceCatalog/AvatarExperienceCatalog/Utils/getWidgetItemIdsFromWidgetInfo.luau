local _ = require(script:FindFirstAncestor("AvatarExperienceCatalog").Components.ResultsList.WidgetListInfoViewModel)

return function(p0, p1) --[[ line: 17 | named "getWidgetItemIdsFromWidgetInfo" ]]
	local t = {}
	
	if not p0 or not p0.content then
		return t
	end
	local content = p0.content
	
	for i = 1, math.min(#content, p1) do
		local var1 = content[i]
		
		if var1 ~= nil and var1.id ~= nil then
			table.insert(t, tostring(var1.id))
		end
	end
	return t
end