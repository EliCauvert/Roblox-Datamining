local function populateDictionaryFromIds(p1, p2)
	-- upvalues: populateDictionaryFromIds (ref)
	local t = {}
	
	for i, v in pairs(p1) do
		if type(v) == "table" then
			t[i] = populateDictionaryFromIds(v, p2)
		else
			t[i] = p2[v]
		end
	end
	return t
end

return populateDictionaryFromIds