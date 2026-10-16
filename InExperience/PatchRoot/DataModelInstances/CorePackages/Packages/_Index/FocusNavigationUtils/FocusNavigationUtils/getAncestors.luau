return function(Parent) --[[ Line: 1 | Named "getAncestors" ]]
	local List = { Parent }
	local Parent1 = Parent
	while Parent1.Parent do
		table.insert(List, Parent1.Parent)
		Parent1 = Parent1.Parent
	end
	return List
end