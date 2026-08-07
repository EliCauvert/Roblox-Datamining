local function alwaysTrue() --[[ line: 2 ]]
	return true
end

return function(p0, p1) --[[ line: 6 | named "count" ]]
	-- upvalues: alwaysTrue (ref)
	local var1 = type(p0)
	assert(var1 == "table", "expected a table for first argument, got " .. var1)
	local var2 = 0
	p1 = p1 or alwaysTrue
	
	for i, v in pairs(p0) do
		if p1(v, i) then
			var2 += 1
		end
	end
	return var2
end