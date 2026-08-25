local function populateDictionaryFromIds(p0, p1)
	-- upvalues: populateDictionaryFromIds (ref)
	local t = {}
	
	for i, v in pairs(p0) do
		if type(v) == "table" then
			t[i] = populateDictionaryFromIds(v, p1)
		else
			t[i] = p1[v]
		end
	end
	return t
end

return populateDictionaryFromIds