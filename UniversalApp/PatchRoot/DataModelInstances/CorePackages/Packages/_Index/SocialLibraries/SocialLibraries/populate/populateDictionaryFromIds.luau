local function populateDictionaryFromIds(List, p1) --[[ Line: 5 ]]
	-- upvalues: populateDictionaryFromIds (copy)
	local t = {}
	
	for i, value in pairs(List) do
		if type(value) == "table" then
			t[i] = populateDictionaryFromIds(value, p1)
		else
			t[i] = p1[value]
		end
	end
	return t
end

return populateDictionaryFromIds