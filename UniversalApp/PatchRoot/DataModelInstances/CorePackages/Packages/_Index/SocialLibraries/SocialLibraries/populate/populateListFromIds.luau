local function populateListFromIds(p0, p1) --[[ line: 5 ]]
	-- upvalues: populateListFromIds (ref)
	local t = {}
	
	for i, v in ipairs(p0) do
		if type(v) == "table" then
			table.insert(t, populateListFromIds(v, p1))
		else
			table.insert(t, p1[v])
		end
	end
	return t
end

return populateListFromIds