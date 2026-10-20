return function(Object, Name)
	local Descendants = Object:GetDescendants()
	table.insert(Descendants, Object)
	local List = {}
	
	for _, descendant in Descendants do
		if descendant.Name == Name then
			table.insert(List, descendant)
		end
	end
	return List
end