local _ = require(script:FindFirstAncestor("ShareSheet").Recipients.Recipient)

return function(Tbl, List)
	local t = {}
	
	for _, value in Tbl do
		t[value.id] = true
	end
	local Copy = table.clone(Tbl)
	
	for _, value1 in List do
		if not t[value1.id] then
			table.insert(Copy, value1)
		end
	end
	return Copy
end