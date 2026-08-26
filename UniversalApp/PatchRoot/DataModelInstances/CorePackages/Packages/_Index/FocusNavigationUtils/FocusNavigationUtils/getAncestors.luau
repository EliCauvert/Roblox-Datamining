return function(p1)
	local list = { p1 }
	local var1 = p1
	while var1.Parent do
		table.insert(list, var1.Parent)
		var1 = var1.Parent
	end
	return list
end