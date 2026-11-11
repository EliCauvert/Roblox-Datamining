local function populateListFromIds(List, p1)
	-- upvalues: populateListFromIds (copy)
	local List1 = {}
	
	for _, value in ipairs(List) do
		if type(value) == "table" then
			table.insert(List1, populateListFromIds(value, p1))
		else
			table.insert(List1, p1[value])
		end
	end
	return List1
end

return populateListFromIds