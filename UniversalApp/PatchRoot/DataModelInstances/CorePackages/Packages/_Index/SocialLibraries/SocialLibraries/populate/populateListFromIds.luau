local function populateListFromIds(p1, p2)
	-- upvalues: populateListFromIds (ref)
	local t = {}
	
	for i, v in ipairs(p1) do
		if type(v) == "table" then
			table.insert(t, populateListFromIds(v, p2))
		else
			table.insert(t, p2[v])
		end
	end
	return t
end

return populateListFromIds