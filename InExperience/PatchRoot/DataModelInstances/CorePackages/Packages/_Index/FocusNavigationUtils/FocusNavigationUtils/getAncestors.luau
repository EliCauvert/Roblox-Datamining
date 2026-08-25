return function(p0)
	local list = { p0 }
	local var1 = p0
	while var1.Parent do
		table.insert(list, var1.Parent)
		var1 = var1.Parent
	end
	return list
end