local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p1)
	assert(p1 ~= nil, "cannot get entries from a nil value")
	local var1 = typeof(p1)
	local t = {}
	
	if var1 == "table" then
		for i, v in pairs(p1) do
			table.insert(t, { i, v })
		end
		return t
	elseif var1 == "string" then
		for i = 1, string.len(p1) do
			t[i] = { tostring(i), string.sub(p1, i, i) }
		end
	end
	return t
end