local _ = require(script:FindFirstAncestor("AvatarExperienceCatalog").Components.ResultsList.WidgetListInfoViewModel)

return function(List)
	local List1 = {}
	
	for i in List do
		local Number: number? = tonumber(i)
		
		if Number then
			table.insert(List1, Number)
		end
	end
	table.sort(List1)
	local List2 = {}
	
	for _, Position in List1 do
		local Entry = List[tostring(Position)]
		
		if Entry.content and #Entry.content > 0 then
			table.insert(List2, { position = Position, widget = Entry })
		end
	end
	return List2
end