return function(Object, Callback)
	local List = {}
	
	for _, descendant in ipairs(Object:GetDescendants()) do
		if Callback(descendant) then
			table.insert(List, descendant)
		end
	end
	return List
end