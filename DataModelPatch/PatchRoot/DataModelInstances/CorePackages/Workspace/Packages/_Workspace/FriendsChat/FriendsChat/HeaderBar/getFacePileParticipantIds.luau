return function(List, p1)
	if #List <= 1 then
		return { p1 }
	end
	local List1 = {}
	
	for _, value in List do
		if value ~= p1 then
			table.insert(List1, value)
		end
	end
	return if #List1 == 0 then { p1 } else List1
end