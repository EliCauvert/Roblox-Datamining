return function(Object, ClassName) --[[ Line: 1 ]]
	local Success, _ = pcall(Instance.new, ClassName)
	assert(Success, `{ClassName} does not exist. Did you make a typo?`)
	local Descendants = Object:GetDescendants()
	table.insert(Descendants, Object)
	local List = {}
	
	for _, descendant in Descendants do
		if descendant:IsA(ClassName) then
			table.insert(List, descendant)
		end
	end
	return List
end